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
	use Tuxxedo\Exception;


	/**
	 * Include check
	 */
	\defined('\TUXXEDO_LIBRARY') or exit;


	/**
	 * Abstract database class
	 *
	 * Every main driver class must extend this class in order to be loadable 
	 * and to comply with the database access layer interface. This also contains 
	 * the factory method used to instanciate a new database driver instance.
	 *
	 * @author		Kalle Sommer Nielsen <kalle@tuxxedo.net>
	 * @version		1.0
	 * @package		Engine
	 * @subpackage		Library
	 */
	abstract class Database implements Database\Driver, Design\Invokable
	{
		/**
		 * Private instance to the Tuxxedo registry
		 *
		 * @var		\Tuxxedo\Registry
		 * @since	1.2.0
		 */
		protected $registry;

		/**
		 * Link pointer, this contains the internal link 
		 * to the database from the driver
		 *
		 * @var		mixed
		 */
		protected $link;

		/**
		 * Affected rows by last successful query that changed 
		 * data in the database
		 * 
		 * @var		integer
		 * @since	1.1.0
		 */
		protected $affected_rows		= 0;

		/**
		 * Whether or not debug mode is enabled
		 *
		 * @var		boolean
		 * @since	1.2.0
		 */
		protected $debug			= false;

		/**
		 * Whether the database connection still is delayed
		 * or not
		 *
		 * @var		boolean
		 */
		protected $delayed			= true;

		/**
		 * List of executed queries during execution
		 *
		 * @var		array
		 */
		protected $queries			= [];

		/**
		 * Database specific configuration array
		 *
		 * @var		array
		 */
		protected $configuration		= [];

		/**
		 * List of shutdown queries that will be executed 
		 * when then destructor is called
		 *
		 * @var		array
		 */
		protected $shutdown_queries		= [];

		/**
		 * List of loaded drivers used for caching in the 
		 * special required cases where more than one driver 
		 * have to be loaded
		 *
		 * @var		array
		 */
		protected static $loaded_drivers 	= [];


		/**
		 * Default constructor for a new database instance
		 *
		 * @param	array				Configuration array, containing the 'application' and 'database' indices
		 *
		 * @throws	\Tuxxedo\Exception\Basic	If the database connection fails, a basic exception will be thrown
		 */
		public function __construct(Array $configuration)
		{
			if(\get_class($this) == __CLASS__)
			{
				throw new Exception\Basic('Cannot call base constructor directly from a non-initalized instance');
			}

			$this->configuration 	= $configuration['database'];
			$this->debug		= $configuration['application']['debug'];
			$this->delayed		= $configuration['database']['delay'];
			$this->registry		= Registry::init();

			if(!$this->isDriverSupported())
			{
				throw new Exception\Basic('Unable to load database driver, one or more dependencies is missing');
			}

			if(!$configuration['database']['delay'])
			{
				$this->connect();
			}
		}

		/**
		 * Default destructor, this simply closes a database connection 
		 * and executes any registered shutdown queries there might be
		 */
		public function __destruct()
		{
			if(!$this->isConnected() || !$this->shutdown_queries)
			{
				return;
			}

			foreach($this->shutdown_queries as $sql)
			{
				try
				{
					$this->query($sql);
				}
				catch(Exception\SQL $e)
				{
					\tuxxedo_basic_error($e);
				}
			}
		}

		/**
		 * Magic method called when creating a new instance of the 
		 * object from the registry
		 *
		 * @param	\Tuxxedo\Registry		The Registry reference
		 * @param	array				The configuration array
		 * @return	object				Object instance
		 *
		 * @throws	\Tuxxedo\Exception\Basic	Only thrown on poorly a configured database section in the configuration file
		 */
		final public static function invoke(Registry $registry, Array $configuration)
		{
			if(!isset($configuration['database']) || !isset($configuration['database']['driver']))
			{
				throw new Exception\Basic('No database configuration found or no driver defined');
			}

			return(self::factory(\ucfirst(\strtolower($configuration['database']['driver'])), $configuration, false));
		}

		/**
		 * Constructs a new database instance
		 *
		 * @param	string				Driver name
		 * @param	array				Database specific configuration array
		 * @return	\Tuxxedo\Database		Returns a new database instance
		 *
		 * @throws	\Tuxxedo\Exception\Basic	Throws a basic exception if loading of a driver should fail for some reason
		 */
		public static function factory($driver, Array $configuration)
		{
			$class = (\strpos($driver, '\\') === false ? '\Tuxxedo\Database\Driver\\' : '') . $driver;

			if(\in_array($driver, self::$loaded_drivers))
			{
				return(new $class($configuration));
			}

			$instance = new $class($configuration);

			if(!\is_subclass_of($class, __CLASS__))
			{
				throw new Exception\Basic('Corrupt database driver, driver class does not follow the driver specification');
			}

			self::$loaded_drivers[] = $driver;

			return($instance);
		}

		/**
		 * Returns a configuration value
		 *
		 * @param	string			The value from the configuration array to fetch
		 * @return	string			Returns the value from the database configuration array, and false on error
		 *
		 * @since	1.1.0
		 */
		public function cfg($value)
		{
			if(!isset($this->configuration[$value]))
			{
				return(false);
			}

			return($this->configuration[$value]);
		}

		/**
		 * Escape all arguments set to the query, prior to formatting
		 *
		 * @param	string			SQL to execute
		 * @param	mixed			Genetic parameter for formatting, if two or more parameters are passed to the method, the sql will be formatted using sprintf
		 * @return	boolean|object		Returns a result object on SELECT statements, and boolean true otherwise if the statement was executed
		 *
		 * @throws	\Tuxxedo\Exception\SQL	If the SQL should fail for whatever reason, an exception is thrown
		 */
		public function equery($sql)
		{
			if(\func_num_args() > 1)
			{
				$args = \func_get_args();
				\array_shift($args);

				$args = \array_map([$this, 'escape'], $args);
				\array_unshift($args, $sql);

				$sql = \call_user_func_array('\sprintf', $args);
			}

			return($this->query($sql));
		}

		/**
		 * Gets the affected rows by last successful query that changed 
		 * data in the database
		 *
		 * @return	integer			Returns the affected rows
		 *
		 * @since	1.1.0
		 *
		 * @changelog	1.1.0			This method is no longer a part of the driver interface
		 */
		public function getAffectedRows()
		{
			return($this->affected_rows);
		}

		/**
		 * Sets a new query to execute at shutdown
		 *
		 * @param	string			The SQL string to execute
		 * @param	mixed			Genetic parameter for formatting, if two or more parameters are passed to the method, the sql will be formatted using sprintf
		 * @return	void			No value is returned
		 */
		public function setShutdownQuery($sql)
		{
			if(\func_num_args() > 1)
			{
				$sql = \call_user_func_array('\sprintf', \func_get_args());
			}

			$this->shutdown_queries[] = (string) $sql;
		}

		/**
		 * Gets the number of queries executed during this request
		 *
		 * @return	integer			Number of queries executed
		 */
		public function getNumQueries()
		{
			return(\sizeof($this->queries));
		}

		/**
		 * Gets the executed queries during this request
		 *
		 * @return	array			A list of executed SQL queries
		 */
		public function getQueries()
		{
			return($this->queries);
		}
	}
?>