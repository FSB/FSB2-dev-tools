#!/usr/bin/php
<?php

/**
 * Copyright (C) 2011	Grummfy
 *
 * This program is free software: under GPLv3, see doc/LICENCE.txt
 * for more informations or go to http://www.gnu.org/licenses/
 */

$options = getopt('', array(
	'xml:',
	'type:',
	'export-dir::'
));

if ($options === false)
{
	die('use this with --xml for the path to xml file; --type for the type of transformation (txt, fscode, html, all); --export-dir path to export dir if type is all');
}

$optXml = $options['xml'];
$optXsl = $options['type'];
if ($optXsl == 'all' && empty($options['export-dir']))
{
	die ('with --type=all --export-dir must be defined!');
}

//
//
//
define('XSL_FILE_PREFIX', __DIR__ . '/xsl/changelog-');

function getXslFilePath($optXsl)
{
	$xslFile = XSL_FILE_PREFIX;
	if (file_exists($xslFile . $optXsl . '.xsl'))
	{
		$xslFile .= $optXsl . '.xsl';
	}
	else
	{
		$xslFile .= 'txt.xsl';
	}

	return $xslFile;
}

function process($xmlDoc, $xslFile)
{
	$xslDoc = new DOMDocument();
	$proc = new XSLTProcessor();
	$xslDoc->load($xslFile);
	$proc->importStylesheet($xslDoc);
	return $proc->transformToXML($xmlDoc);
}

$xmlDoc = new DOMDocument();
$xmlDoc->load($optXml);

if ($optXsl != 'all')
{
	echo process($xmlDoc, getXslFilePath($optXsl));
}
else
{
	foreach (glob(XSL_FILE_PREFIX . '*.xsl') as $filename)
	{
	    $content = process($xmlDoc, $filename);
		$fileinfo = substr($filename, strripos($filename, DIRECTORY_SEPARATOR));
		$fileinfo = explode('-', $fileinfo);
		$fileinfo = explode('.', $fileinfo[ count($fileinfo) - 1 ]);
		$file = $options['export-dir'] . DIRECTORY_SEPARATOR . 'changelog.' . $fileinfo[0];
		file_put_contents($file, $content);
	}
}

# EOF
