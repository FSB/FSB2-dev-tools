#!/usr/bin/php <?php

/**
 * Copyright (C) 2011	Grummfy
 *
 * This program is free software: under GPLv3, see doc/LICENCE.txt
 * for more informations or go to http://www.gnu.org/licenses/
 */

$options = getopt('', array(
	'xml:',
	'type:'
));

if ($options === false)
{
	die('use this with --xml for the path to xml file; --type for the type of transformation (txt, fscode, html)');
}

$optXml = $options['xml'];
$optXsl = $options['type'];

//
//
//
$xslFile = './xsl/changelog-';
switch($optXsl)
{
	case 'fscode' :
		$xslFile .= 'fscode.xsl';
		break;
	case 'html' :
		$xslFile .= 'html.xsl';
		break;
	default :
	case 'txt' :
		$xslFile .= 'html.xsl';
		break;
}

$xslDoc = new DOMDocument();
$xslDoc->load($xslFile);

$xmlDoc = new DOMDocument();
$xmlDoc->load($optXml);

$proc = new XSLTProcessor();
$proc->importStylesheet($xslDoc);
echo $proc->transformToXML($xmlDoc);

# EOF
