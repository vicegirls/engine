<?php
	/**
	 * Tuxxedo Software Engine Development Tools
	 * =============================================================================
	 *
	 * @author		Kalle Sommer Nielsen 	<kalle@tuxxedo.net>
	 * @author		Ross Masters 		<ross@tuxxedo.net>
	 * @version		1.0
	 * @copyright		Tuxxedo Software Development 2006+
	 * @package		DevTools
	 *
	 * =============================================================================
	 */


	/**
	 * Global templates
	 */
	$templates 		= Array(
					'tools_index'
					);

	/**
	 * Action templates
	 */
	$action_templates	= Array(
					'statistics'	=> Array(
									'tools_statistics', 
									'tools_statistics_itembit'
									)
					);

	/**
	 * Set script name
	 */
	define('SCRIPT_NAME', 'tools');

	/**
	 * Require the bootstraper
	 */
	require('./includes/bootstrap.php');

	switch(strtolower($filter->get('do')))
	{
		case('statistics'):
		{
			$files = recursive_glob('../..');

			if(!$files || !sizeof($files))
			{
				tuxxedo_gui_error('No source files found in the root directory');
			}

			$statistics = Array(
						'lines'		=> Array(), 
						'size'		=> Array(), 
						'files'		=> Array(), 
						'total'		=> Array(
										'lines'		=> 0, 
										'size'		=> 0
										), 
						'extensions'	=> Array(
										'php'		=> Array(
														'tokens'	=> 0
													)
										)
						);

			foreach($files as $path)
			{
				$path		= '../../' . $path;
				$extension 	= pathinfo($path, PATHINFO_EXTENSION);

				if(!isset($statistics['lines'][$extension]))
				{
					$statistics['lines'][$extension] = 0;
				}

				if(!isset($statistics['size'][$extension]))
				{
					$statistics['size'][$extension] = 0;
				}

				if(!isset($statistics['files'][$extension]))
				{
					$statistics['files'][$extension] = 0;
				}

				if(stripos($extension, 'php') !== false)
				{
					$statistics['extensions']['php']['tokens'] += sizeof(token_get_all(file_get_contents($path)));
				}
				elseif(stripos($extension, 'png') !== false)
				{
					continue;
				}

				if(!isset($statistics['extensions'][$extension]))
				{
					$statistics['extensions'][$extension] 	= Array(
											'blanks'	=> 0
											);
				}

				foreach($l = file($path) as $line)
				{
					$line = trim($line);

					if(empty($line))
					{
						++$statistics['extensions'][$extension]['blanks'];
					}
				}

				$statistics['lines'][$extension] 	+= sizeof($l);
				$statistics['size'][$extension]		+= ($s = filesize($path));

				$statistics['total']['lines']		+= sizeof($l);
				$statistics['total']['size']		+= $s;

				++$statistics['files'][$extension];
			}

			ksort($statistics['lines']);

			$extensions = '';

			foreach($statistics['lines'] as $ext => $lines)
			{
				if(!$statistics['files'][$ext])
				{
					continue;
				}

				$name = strtoupper($ext);

				eval('$extensions .= "' . $style->fetch('tools_statistics_itembit') . '";');
			}

			$statistics['lines'] = sizeof($statistics['lines']);

			eval(page('tools_statistics'));

		}
		break;
		default:
		{
			eval(page('tools_index'));
		}
		break;
	}
?>