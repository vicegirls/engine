<?php
	/**
	 * Tuxxedo Software Engine
	 * =============================================================================
	 *
	 * @author		Kalle Sommer Nielsen <kalle@tuxxedo.net>
	 * @version		1.0
	 * @copyright		Tuxxedo Software Development 2006+
	 * @package		Engine
	 *
	 * =============================================================================
	 */

	defined('TUXXEDO') or exit;


	/**
	 * Styling API, this enables basic styling frontend for 
	 * caching templates and fetching them for execution.
	 *
	 * To compile templates thats loadable through this class 
	 * you should look at the {@link Tuxxedo_Template_Compiler} 
	 * class.
	 *
	 * @author		Kalle Sommer Nielsen <kalle@tuxxedo.net>
	 * @version		1.0
	 * @package		Engine
	 */
	class Tuxxedo_Style extends Tuxxedo_InfoAccess
	{
		/**
		 * Private instance to the Tuxxedo registry
		 *
		 * @var		Tuxxedo
		 */
		protected $tuxxedo;

		/**
		 * Holds the current loaded templates
		 *
		 * @var		array
		 */
		protected $templates;


		/**
		 * Constructs a new style object
		 *
		 * @param	array			The style data to use
		 */
		public function __construct(Array $styleinfo)
		{
			$this->tuxxedo		= $tuxxedo = Tuxxedo::init();
			$this->information 	= $styleinfo;
			$this->templates	= new stdClass;
			$this->storage		= Tuxxedo_Style_Storage::factory($tuxxedo, $tuxxedo->options->style_storage, $this->templates);
		}

		/**
		 * Magic method called when creating a new instance of the 
		 * object from the registry
		 *
		 * @param	Tuxxedo			The Tuxxedo object reference
		 * @param	array			The configuration array
		 * @param	array			The options array
		 * @return	object			Object instance
		 *
		 * @throws	Tuxxedo_Basic_Exception	Throws a basic exception if an invalid (or not cached) style id was used
		 */
		public static function invoke(Tuxxedo $tuxxedo, Array $configuration = NULL, Array $options = NULL)
		{
			$styledata 	= $tuxxedo->cache->styleinfo;
			$styleid	= ($options ? (!empty($tuxxedo->userinfo->id) && $tuxxedo->userinfo->style_id != $options['style_id'] ? $tuxxedo->userinfo->style_id : $options['style_id']) : 0);

			if($styleid && isset($styledata[$styleid]))
			{
				return(new self($styledata[$styleid]));
			}

			throw new Tuxxedo_Basic_Exception('Invalid style id, try rebuild the datastore or use the repair tools');
		}

		/**
		 * Caches a template, trying to cache an already loaded 
		 * template will recache it
		 *
		 * @param	array			A list of templates to load
		 * @param	array			An array passed by reference, if one or more elements should happen not to be loaded, then this array will contain the names of those elements
		 * @return	boolean			Returns true on success otherwise false
		 *
		 * @throws	Tuxxedo_Exception	Throws an exception if the query should fail
		 */
		public function cache(Array $templates, Array &$error_buffer = NULL)
		{
			return($this->storage->cache($templates, $error_buffer));
		}

		/**
		 * Fetches a cached template
		 *
		 * @param	string			The name of the template to fetch
		 * @return	string			Returns the compiled template code for execution, and boolean false on error
		 */
		public function fetch($template)
		{
			$template = strtolower($template);

			if(!isset($this->templates->{$template}))
			{
				return(false);
			}

			return($this->templates->{$template});
		}
	}

	/**
	 * Interface for template storage engines
	 *
	 * @author		Kalle Sommer Nielsen <kalle@tuxxedo.net>
	 * @version		1.0
	 * @package		Engine
	 */
	abstract class Tuxxedo_Style_Storage
	{
		/**
		 * Private instance to the Tuxxedo registry
		 *
		 * @var		Tuxxedo
		 */
		protected $tuxxedo;

		/**
		 * Reference to the template storage
		 *
		 * @var		object
		 */
		protected $templates;


		abstract protected function __construct(Tuxxedo $tuxxedo, stdClass $templates);

		/**
		 * Caches a template, trying to cache an already loaded 
		 * template will recache it
		 *
		 * @param	array			A list of templates to load
		 * @param	array			An array passed by reference, if one or more elements should happen not to be loaded, then this array will contain the names of those elements
		 * @return	boolean			Returns true on success otherwise false
		 *
		 * @throws	Tuxxedo_Exception	Throws an exception if the query should fail
		 */
		abstract public function cache(Array $templates, Array &$error_buffer = NULL);


		/**
		 * Factory method for creating a new storage engine instance
		 *
		 * @param	Tuxxedo			The Tuxxedo object reference
		 * @param	string			The storage engine to instanciate
		 * @param	object			Reference to the template storage object
		 * @return	object			Returns a style storage engine object reference
		 *
		 * @throws	Tuxxedo_Basic_Exception	Throws a basic exception on invalid style storage engines
		 */ 
		final public static function factory(Tuxxedo $tuxxedo, $engine, stdClass $templates)
		{
			$class = 'Tuxxedo_Style_Storage_' . $engine;

			if(!class_exists($class))
			{
				throw new Tuxxedo_Basic_Exception('Invalid style storage engine specified');
			}

			return(new $class($tuxxedo, $templates));
		}
	}

	/**
	 * Style storage engine for database based templates
	 *
	 * @author		Kalle Sommer Nielsen <kalle@tuxxedo.net>
	 * @version		1.0
	 * @package		Engine
	 */
	class Tuxxedo_Style_Storage_Database extends Tuxxedo_Style_Storage
	{
		protected function __construct(Tuxxedo $tuxxedo, stdClass $templates)
		{
			$this->tuxxedo 		= $tuxxedo;
			$this->templates	= $templates;
		}

		/**
		 * Caches a template, trying to cache an already loaded 
		 * template will recache it
		 *
		 * @param	array			A list of templates to load
		 * @param	array			An array passed by reference, if one or more elements should happen not to be loaded, then this array will contain the names of those elements
		 * @param	array			An array passed by reference, this contains all the elements that where loaded if referenced
		 * @return	boolean			Returns true on success otherwise false
		 *
		 * @throws	Tuxxedo_Exception	Throws an exception if the query should fail
		 */
		public function cache(Array $templates, Array &$error_buffer = NULL)
		{
			if(!sizeof($templates))
			{
				return(false);
			}

			$result = $this->tuxxedo->db->query('
								SELECT 
									`title`, 
									`compiledsource` 
								FROM 
									`' . TUXXEDO_PREFIX . 'templates` 
								WHERE 
										`styleid` = %d 
									AND 
										`title` IN (
											\'%s\'
										);', 
								$this->tuxxedo->style['id'], join('\', \'', array_map(Array($this->tuxxedo->db, 'escape'), $templates)));

			if($result === false || !$result->getNumRows())
			{
				if(!is_null($error_buffer))
				{
					$error_buffer = $templates;
				}

				return(false);
			}

			while($row = $result->fetchAssoc())
			{
				$this->templates->{$row['title']} = $row['compiledsource'];
			}

			return(true);
		}
	}

	/**
	 * Style storage engine for file system based templates
	 *
	 * @author		Kalle Sommer Nielsen <kalle@tuxxedo.net>
	 * @version		1.0
	 * @package		Engine
	 */
	class Tuxxedo_Style_Storage_FileSystem extends Tuxxedo_Style_Storage
	{
		protected function __construct(Tuxxedo $tuxxedo, stdClass $templates)
		{
			$this->tuxxedo 		= $tuxxedo;
			$this->template		= $templates;
		}

		/**
		 * Caches a template, trying to cache an already loaded 
		 * template will recache it
		 *
		 * @param	array			A list of templates to load
		 * @param	array			An array passed by reference, if one or more elements should happen not to be loaded, then this array will contain the names of those elements
		 * @param	array			An array passed by reference, this contains all the elements that where loaded if referenced
		 * @return	boolean			Returns true on success otherwise false
		 *
		 * @throws	Tuxxedo_Exception	Throws an exception if the query should fail
		 */
		public function cache(Array $templates, Array &$error_buffer = NULL)
		{
			foreach($templates as $template)
			{
				printf('attempting to load \'%s\'<br />', $template);
			}
		}
	}
?>