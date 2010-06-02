<?php
	/**
	 * Tuxxedo Software Engine Development Tools
	 * =============================================================================
	 *
	 * @author		Kalle Sommer Nielsen <kalle@tuxxedo.net>
	 * @version		1.0
	 * @copyright		Tuxxedo Software Development 2006+
	 * @package		DevTools
	 *
	 * =============================================================================
	 */


	/**
	 * Emulation layer of the bootstrap.php in the includes 
	 * root, this is to prevent corrupt datastores from 
	 * stopping the execution.
	 *
	 * We must not use any sessions here, as it would cause 
	 * the development tools to interfere with the main site.
	 */

	define('CWD', 		'../..');
	define('TUXXEDO', 	1337);

	require(CWD . '/includes/configuration.php');
	require(CWD . '/includes/class_core.php');
	require(CWD . '/includes/functions.php');
	require(CWD . '/includes/functions_debug.php');

	require('./includes/functions.php');

	if(!defined('Tuxxedo::DEBUG') || !Tuxxedo::DEBUG)
	{
		throw new Tuxxedo_Basic_Exception('Debug mode must be enabled to load the development tools');
	}

	if(!defined('SCRIPT_NAME'))
	{
		throw new Tuxxedo_Basic_Exception('A script name must be defined prior to use');
	}

	if(defined('PHP_VERSION_ID'))
	{
		define('TUXXEDO_PHP_VERSION', PHP_VERSION_ID);
	}
	else
	{
		$version = PHP_VERSION;

		define('TUXXEDO_PHP_VERSION', ($version{0} * 10000 + $version{2} * 100 + $version{4}));

		unset($version);
	}

	Tuxxedo::globals('error_reporting', 	true);
	Tuxxedo::globals('errors', 		Array());

	set_error_handler('tuxxedo_error_handler');
	set_exception_handler('tuxxedo_exception_handler');
	register_shutdown_function('tuxxedo_shutdown_handler');
	spl_autoload_register('tuxxedo_autoload_handler');

	define('TUXXEDO_DEBUG', 	true);
	define('TUXXEDO_DIR', 		CWD);
	define('TUXXEDO_PREFIX', 	$configuration['database']['prefix']);

	require('./includes/class_template.php');

	$tuxxedo = Tuxxedo::init($configuration);

	$tuxxedo->register('db', 	'Tuxxedo_Database');
	$tuxxedo->register('cache', 	'Tuxxedo_Datastore');

	$tuxxedo->set('timezone', new DateTimeZone('UTC'));
	$tuxxedo->set('datetime', new DateTime('now', $timezone));
	$tuxxedo->set('style', new Tuxxedo_Dev_Style);

	define('TIMENOW', $datetime->getTimestamp());

	$cache_buffer		= Array();
	$default_templates 	= Array('header', 'footer', 'error', 'redirect');

	if(isset($action_templates) && isset($_REQUEST['do']) && array_key_exists((string) $_REQUEST['do'], $action_templates))
	{
		$default_templates = array_merge($default_templates, (array) $action_templates[(string) $_REQUEST['do']]);
	}

	$style->cache((!isset($templates) ? $default_templates : array_merge($default_templates, (array) $templates)), $cache_buffer) or tuxxedo_multi_error('Unable to load template \'%s\'', $cache_buffer);

	unset($cache_buffer);

	$engine_version = Tuxxedo::VERSION_STRING;

	eval('$header = "' . $style->fetch('header') . '";');
	eval('$footer = "' . $style->fetch('footer') . '";');
?>