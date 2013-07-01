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
	 * Debug namespace, this namespace contains debugging related routines that 
	 * is better suited to be encapsulated in an object.
	 *
	 * @author		Kalle Sommer Nielsen	<kalle@tuxxedo.net>
	 * @author		Ross Masters 		<ross@tuxxedo.net>
	 * @version		1.0
	 * @package		Engine
	 * @subpackage		Library
	 */
	namespace Tuxxedo\Debug;


	/**
	 * Aliasing rules
	 */
	use Tuxxedo\Design;


	/**
	 * Include check
	 */
	\defined('\TUXXEDO_LIBRARY') or exit;


	/**
	 * Debug backtrace class, this is a redesign of the old and infamous 
	 * tuxxedo_debug_backtrace() function. The class itself defines as an 
	 * iterator.
	 *
	 * This implementation implements some helper methods on each trace 
	 * instance to ease debugging even further.
	 *
	 * Example:
	 * <code>
	 * use Tuxxedo\Debug;
	 *
	 * foreach(new Debug\Backtrace as $trace)
	 * {
	 *         if(!$trace->isException())
	 *	   {
	 *	           continue;
	 *	   }
	 *
	 *         ...
	 * }
	 * </code>
	 *
	 * @author		Kalle Sommer Nielsen <kalle@tuxxedo.net>
	 * @version		1.0
	 * @package		Engine
	 * @subpackage		Library
	 */
	class Backtrace extends Design\Iteratable
	{
		/**
		 * Stack pointer position
		 *
		 * @var		integer
		 */
		protected $iterator_position	= 0;

		/**
		 * Number of frames for iteration
		 *
		 * @var		integer
		 */
		protected $framesnum		= 0;

		/**
		 * Stack frames
		 *
		 * @var		array
		 */
		protected $frames		= Array();

		/**
		 * Meta information - includes
		 *
		 * @var 	array
		 */
		protected static $includes	= Array(
							'require', 
							'require_once', 
							'include', 
							'include_once'
							);

		/**
		 * Meta information - callbacks
		 *
		 * @var		array
		 */
		protected static $callbacks	= Array(
							'array_map', 
							'call_user_func', 
							'call_user_func_array'
							);


		/**
		 * Constructor
		 *
		 * Once called, the constructor will generate all the backtrace frames 
		 * used prior to this call.
		 *
		 * @param	\Exception			If the current trace is combined with an exception, then pass the exception to get a better trace
		 */
		public function __construct(\Exception $e = NULL)
		{
			$this->frames 		= self::getTrace($e);
			$this->framesnum	= \sizeof($this->frames);
		}

		/**
		 * Compiles the trace structures into an iteratable array
		 *
		 * @param	\Exception			If the current trace is combined with an exception, then pass the exception to get a better trace
		 * @param	integer				Number of frames to skip, defaults to cutting off the last two trace frames
		 * @return	array				Returns an array with the backtrace information, and empty array on no information
		 */
		public function getTrace(\Exception $e = NULL, $skip_frames = 2)
		{
			static $debug_args;

			if(!$debug_args)
			{
				$debug_args =  (\defined('DEBUG_BACKTRACE_PROVIDE_OBJECT') ? \DEBUG_BACKTRACE_PROVIDE_OBJECT : true);
			}

			$exception_handler 	= \strtolower(\tuxxedo_handler('exception'));
			$handlers		= Array(
							$exception_handler				=> 'Exception handler', 
							\strtolower(\tuxxedo_handler('shutdown'))	=> 'Shutdown handler', 
							\strtolower(\tuxxedo_handler('error'))		=> 'Error handler', 
							\strtolower(\tuxxedo_handler('autoload'))	=> 'Auto loader'
							);

			$stack 	= Array();
			$bt	= \debug_backtrace($debug_args);

			if($e)
			{
				$bt = \array_merge($bt, $e->getTrace());
			}

			$x	= 0;
			$bts 	= \sizeof($bt);

			foreach($bt as $n => $t)
			{
				if($n < $skip_frames)
				{
					continue;
				}

				$flags		= 0;
				$call		= $callargs = $refcall = '';
				$notes 		= (isset($t['type']) && $t['type'] == '::' ? Array('Static call') : Array());
				$line		= 0;
				$file		= '';

				if(isset($t['function']))
				{
					$function = \strtolower($t['function']);
				}
				else
				{
					$call 		= $callargs = 'Main()';
					$notes[] 	= 'Called from main scope';
				}

				if(isset($t['line']))
				{
					$line = (integer) $t['line'];
				}

				if(isset($t['file']))
				{
					$file = $t['file'];
				}

				if(isset($function) && isset($handlers[$function]))
				{
					$notes[] = $handlers[$function];
				}

				$trace 			= new TraceFrame('REFLECTION_CLASS', 'FLAGS');			/* ? */
				$trace->frame		= $x;								/* ? */
				$trace->call		= $call;							/* ? */
				$trace->callargs	= $callargs;							/* ? */
				$trace->reflection_call	= $refcall;							/* ? */
				$trace->current		= (($n - $skip_frames - 1) == $x++);				/* ? */
				$trace->line		= $line;							/* ? */
				$trace->file		= $file; 							/* ? */
				$trace->notes		= \join(', ', $notes);						/* ? */

				$stack[] = $trace;

				unset($function);
			}

			return($stack);
		}

		/**
		 * Iterator method - current
		 * 
		 * @return	mixed				Returns the current frame
		 */
		public function current()
		{
			return($this->frames[$this->iterator_position]);
		}

		/**
		 * Iterator method - rewind
		 *
		 * @return	void				No value is returned
		 */
		public function rewind()
		{
			$this->iterator_position = 0;
		}

		/**
		 * Iterator method - key
		 *
		 * @return	integer				Returns the currrent frame id
		 */
		public function key()
		{
			return($this->iterator_position);
		}

		/**
		 * Iterator method - next
		 *
		 * @return	void				No value is returned
		 */
		public function next()
		{
			++$this->iterator_position;
		}

		/**
		 * Iterator method - valid
		 *
		 * @return	boolean				Returns true if its possible to continue iterating, otherwise false is returned
		 */
		public function valid()
		{
			return(isset($this->frames[$this->iterator_position]));
		}

		/**
		 * Iterator method - count
		 *
		 * @return	integer				Returns the number of frames in the stack
		 */
		public function count()
		{
			return($this->framesnum);
		}
	}
?>