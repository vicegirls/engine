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
	 * Upload API namespace, this contains routines, and patterns for various 
	 * upload related operations.
	 *
	 * @author		Kalle Sommer Nielsen	<kalle@tuxxedo.net>
	 * @version		1.0
	 * @package		Engine
	 * @subpackage		Library
	 */
	namespace Tuxxedo\Upload;


	/**
	 * Include check
	 */
	\defined('\TUXXEDO_LIBRARY') or exit;


	/**
	 * Upload backend interface
	 *
	 * This interface declares a structured design for how backends must be 
	 * implemented in order to be operational.
	 *
	 * @author		Kalle Sommer Nielsen <kalle@tuxxedo.net>
	 * @version		1.0
	 * @package		Engine
	 * @subpackage		Library
	 * @since		1.2.0
	 */
	interface Backend
	{
		/**
		 * Tells the backend to process this input and initiate the transfer 
		 *
		 * @param	string				The input specific to this backend
		 * @param	string				Optionally the file name the file should have, pass NULL to retain the original filename
		 * @param	string				Optionally the extension the file should have (for example: 'jpg'), pass NULL to retain the original extension
		 * @return	boolean				Returns true if the transfer was a success, otherwise false (failed hooks and the like)
		 */
		public function process($input, $filename = NULL, $extension = NULL);
	}
?>