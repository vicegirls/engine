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
	 *
	 * =============================================================================
	 */
	
	namespace Tuxxedo\Router;
	
	/**
	 * URI-based router
	 * Attempts to detect routing information from a uri input
	 */
	class Uri extends \Tuxxedo\Router
	{
		/**
		 * Parse the router information from a URI string
		 * @param	string	Input URI
		 */
		public function parse($uri) {
			// Explode the array into parts and clean it (remove empty values 
			// "//")
			$uri = ltrim($uri, "/");
			$uri = rtrim($uri, "/");
			$parts = explode("/", $uri);
			foreach ($parts as $key => $value) {
				if (empty($value)) {
					unset($parts[$key]);
				}
			}
		
			/**
			 * Route based on the rules above - on the number of parts
			 *
	 		 * The general pattern for the URI routing in this case is fairly common
			 * Assumed default names are Index and index for controller and action,
			 * though these can be changed using the methods.
			 * 
			 * Default routes:
			 * #1 / (default controller, default action, no params)
			 * #2 /<1> (<1> controller, default action, no params)
			 * #3 /<1>/<2> (<1> controller, <2> action, no params)
			 * #4 /<1>/<2>/<3> (<1> controller, default action, {<2>: <3>} params)
			 * #5 /<1>/<2>/<3>/<4> (<1> controller, <2> action, {<3>: <4>} params)
			 * Follows #4 and #5 based on whether number of pieces is even or odd (
			 * odd = #4, even = #5)
			 */
	
			$controller = self::$defaultController;
			$action = self::$defaultAction;
			$params = array();

			switch (count($parts)) {
				case 1:
					$controller = $parts[0];
					break;
				case 2:
					$controller = $parts[0];
					$action = $parts[1];
					break;
				default:	
					// Use defaults if we have no parts
					if (count($parts) == 0) {
						break;
					}
				
					// If the number of parts is even, use rule #5 otherwise rule #4
					if (count($parts) % 2 == 0) {
						$controller = array_shift($parts);
						$action = array_shift($parts);
					} else {
						$controller = array_shift($parts);
					}
				
					// Loop through the rest of the parts to collect parameters
					for ($i = 0; $i < count($parts); $i += 2) {
						$params[$parts[$i]] = $parts[$i+1]; 
					}
					break;
			}
		
			// Normalise and set the controller and action names
			$this->setController($controller);
			$this->setAction($action);
			$this->params = $params;
		}
	}