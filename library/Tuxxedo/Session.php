<?php
	/**
	 * Tuxxedo Software Engine
	 * =============================================================================
	 *
	 * @author		Kalle Sommer Nielsen 	<kalle@tuxxedo.net>
	 * @author		Ross Masters 		<ross@tuxxedo.net>
	 * @version		1.0
	 * @copyright		Tuxxedo Software Development 2006+
	 * @license		Apache License, Version 2.0
	 * @package		Engine
	 * @subpackage		Library
	 *
	 * =============================================================================
	 */


	/**
	 * Core Tuxxedo library namespace. This namespace contains all the main 
	 * foundation components of Tuxxedo Engine, plus additional utilities 
	 * thats provided by default. Some of these default components have 
	 * sub namespaces if they provide child objects.
	 *
	 * @author		Kalle Sommer Nielsen	<kalle@tuxxedo.net>
	 * @author		Ross Masters 		<ross@tuxxedo.net>
	 * @version		1.0
	 * @package		Engine
	 * @subpackage		Library
	 */
	namespace Tuxxedo;


	/**
	 * Aliasing rules
	 */
	use Tuxxedo\Design;


	/**
	 * Include check
	 */
	\defined('\TUXXEDO_LIBRARY') or exit;


	/**
	 * Session interface, this class is designed to be attached to 
	 * classes that implements an interface based on sessions.
	 *
	 * @author		Kalle Sommer Nielsen <kalle@tuxxedo.net>
	 * @version		1.0
	 * @package		Engine
	 * @subpackage		Library
	 */
	class Session extends Design\InfoAccess implements Design\Invokable
	{
		/**
		 * Whether a session is started or not
		 *
		 * @var		boolean
		 */
		public static $started	= false;

		/**
		 * The session id
		 *
		 * @var		string
		 */
		public static $id	= '';

		/**
		 * The session options, such as prefix, path etc.
		 *
		 * @var		array
		 *
		 * @changelog	1.1.0			Added 'secure' for HTTPS enforcement
		 */
		protected static $options	= [
							'expires'	=> 1800, 
							'prefix'	=> '', 
							'domain'	=> '', 
							'path'		=> '', 
							'secure'	=> false
							];


		/**
		 * Magic method called when creating a new instance of the 
		 * object from the registry
		 *
		 * @param	\Tuxxedo\Registry	The Registry reference
		 * @param	array			The configuration array
		 * @return	object			Object instance
		 *
		 * @changelog	1.2.0			This method no longer requires the datastore to be loaded to function
		 */
		public static function invoke(Registry $registry, Array $configuration = NULL)
		{
			if(($options = $registry->options) !== false)
			{
				self::$options = [
							'expires'	=> $options->cookie_expires, 
							'prefix'	=> $options->cookie_prefix, 
							'domain'	=> $options->cookie_domain, 
							'path'		=> $options->cookie_path, 
							'secure'	=> $options->cookie_secure
							];
			}

			self::start();
		}

		/**
		 * Gets a session variable
		 *
		 * @param	string			Variable name
		 * @param	boolean			Whether to include the session prefix or not, defaults to true
		 * @return	mixed			Returns the session variable value on success, or null on failure
		 */
		public static function get($name, $prefix = true)
		{
			if($prefix)
			{
				$name = self::$options['prefix'] . $name;
			}

			if(!isset($_SESSION[$name]))
			{
				return;
			}

			return($_SESSION[$name]);
		}

		/**
		 * Sets a session variable
		 *
		 * @param	string			Variable name
		 * @param	mixed			Variable value
		 * @param	boolean			Whether to include the session prefix or not, defaults to true
		 * @return	void			No value is returned
		 */
		public static function set($name, $value, $prefix = true)
		{
			if($prefix)
			{
				$name = self::$options['prefix'] . $name;
			}

			$_SESSION[$name] = $value;
		}

		/**
		 * Starts a session
		 *
		 * @return	void			No value is returned
		 *
		 * @changelog	1.2.0			Removed the old CSRF code that was never fully implemented
		 */
		public static function start()
		{
			if(self::$started)
			{
				return;
			}

			$name = \session_name();

			if(isset($_COOKIE[$name]) && !empty($_COOKIE[$name]) && \preg_match('![^A-Za-z0-9_,-]!', $_COOKIE[$name]))
			{
				throw new Exception\Basic('Possible session hijacking detected');
			}

			\session_set_cookie_params(self::$options['expires'], self::$options['domain'], self::$options['path'], self::$options['secure'], true);
			\session_start();

			self::$started 	= true;
			self::$id	= \session_id();
		}

		/**
		 * Terminates a session
		 *
		 * @return	void			No value is returned
		 */
		public static function terminate()
		{
			if(!self::$started)
			{
				return;
			}

			if(\ini_get('session.use_cookies'))
			{
				\setcookie(\session_name(), '', \TIMENOW_UTC - 86400, self::$options['path'], self::$options['domain'], self::$options['secure'], true);
			}

			\session_unset();
			\session_destroy();

			self::$started 	= false;
			self::$id	= '';
		}

		/**
		 * Restarts a session
		 *
		 * This basically calls terminate and then start as a shorthand method 
		 * call.
		 *
	 	 * @return	void			No value is returned
		 *
		 * @since	1.2.0
		 */
		public static function restart()
		{
			self::terminate();
			self::start();
		}

		/**
		 * Regenerates a new session ID, note that APIs that utilizes the 
		 * session ID must be manually notified of this update to not cause 
		 * data mismatch
		 *
		 * @param	boolean			Whether or not to keep the old session data
		 * @return	void			No value is returned
		 *
		 * @since	1.1.0
		 */
		public static function regenerate($stayalive = false)
		{
			\session_regenerate_id(!$stayalive);

			self::$id = \session_id();
		}

		/**
		 * Checks whether a session variable is available 
		 *
		 * @param	scalar			The information row name to check
		 * @return	boolean			Returns true if the information is stored, otherwise false
		 */
		public function offsetExists($offset)
		{
			return(isset($_SESSION[self::$options['prefix'] . $offset]));
		}

		/**
		 * Gets a value from a session variable
		 * 
		 * @param	scalar			The information row name to get
		 * @return	mixed			Returns the information value, and NULL if the value wasn't found
		 */
		public function offsetGet($offset)
		{
			if(isset($_SESSION[self::$options['prefix'] . $offset]))
			{
				return($_SESSION[self::$options['prefix'] . $offset]);
			}
		}

		/**
		 * Sets a new session variable
		 *
		 * @param	scalar			The information row name to set
		 * @param	mixed			The new/update value for this row
		 * @return	void			No value is returned
		 */
		public function offsetSet($offset, $value)
		{
			$_SESSION[self::$options['prefix'] . $offset] = $value;
		}

		/**
		 * Deletes a session variable
		 *
		 * @param	scalar			The information row name to delete
		 * @return	void			No value is returned
		 */
		public function offsetUnset($offset)
		{
			if(isset($_SESSION[self::$options['prefix'] . $offset]))
			{
				unset($_SESSION[self::$options['prefix'] . $offset]);
			}
		}
	}
?>