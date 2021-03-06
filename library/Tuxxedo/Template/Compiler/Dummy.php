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
	 * Template compiler namespace, this contains all components that the 
	 * compiler utilizes when compiling or testing the generated template 
	 * code.
	 *
	 * @author		Kalle Sommer Nielsen	<kalle@tuxxedo.net>
	 * @author		Ross Masters 		<ross@tuxxedo.net>
	 * @version		1.0
	 * @package		Engine
	 * @subpackage		Library
	 */
	namespace Tuxxedo\Template\Compiler;


	/**
	 * Include check
	 */
	\defined('\TUXXEDO_LIBRARY') or exit;


	/**
	 * Dummy compiler class, this is used for emulation within the 
	 * test method to make sure object oriented features may be compiled.
	 *
	 * @author		Kalle Sommer Nielsen <kalle@tuxxedo.net>
	 * @version		1.0
	 * @package		Engine
	 * @subpackage		Library
	 */
	class Dummy
	{
		/**
		 * Dummy method to emulate method overloading 
		 * to make testing pass
		 *
		 * @param	string		The method name to call
		 * @param	array		The arguments to pass to the method
		 * @return	boolean		Always returns true
		 */
		public function __call($method, Array $arguments = NULL)
		{
			return(true);
		}

		/**
		 * Dummy method to emulate method overloading 
		 * to make testing pass (closures)
		 *
		 * @param	array		The arguments to pass to the method
		 * @return	boolean		Always returns true
		 */
		public function __invoke(Array $arguments = NULL)
		{
			return(true);
		}
	}
?>