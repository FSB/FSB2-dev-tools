<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gh="https://github.com/Grummfy/GitChangeLogManifier/issue" xmlns:fsb="http://www.fire-soft-board.com/" exclude-result-prefixes="fsb gh">
	<xsl:output	method="html" encoding="UTF-8" indent="yes" />
	<xsl:template match="changelogs">
		<html>
			<head>
				<title>Changelogs</title>
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
			</head>
			<body>
				<xsl:apply-templates select="changelog" />
			</body>
		</html>
	</xsl:template>
	<xsl:template match="changelog">
		<h1><xsl:value-of select="@name" /></h1>
		<xsl:apply-templates select="lines/line" />
	</xsl:template>
	<xsl:template match="line">
		<p>
			<xsl:for-each select="datas/data">
				[<xsl:apply-templates select="." />]
			</xsl:for-each>
			<xsl:value-of select="message" />
		</p>
	</xsl:template>
	<xsl:template match="data/gh:issue">
		<xsl:element name="a">
        	<xsl:attribute name="href">
        		<xsl:text>https://github.com/FSB/Fire-Soft-Board-2/issues/</xsl:text>
        		<xsl:value-of select="gh:id" />
        	</xsl:attribute>
        	<xsl:text>ticket-</xsl:text><xsl:value-of select="gh:id" />
       </xsl:element>
	</xsl:template>
	<xsl:template match="data/fsb:topic">
		<xsl:call-template name="printLinkFSB">
		   <xsl:with-param name="id" select="fsb:id" />
		   <xsl:with-param name="type" select="fsb:qualifier" />
		   <xsl:with-param name="page" select="fsb:page" />
		</xsl:call-template>
	</xsl:template>
	<xsl:template name="printLinkFSB">
		<xsl:param name="id" />
		<xsl:param name="type" />
		<xsl:param name="page" select="'0'" />
		<xsl:variable name="linkTo">
			<xsl:choose>
				<xsl:when test="$type = 'B'">
					<xsl:text>Bug</xsl:text>
				</xsl:when>
				<xsl:when test="$type = 'F'">
					<xsl:text>Amélioration</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>Sujet lié</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:element name="a">
        	<xsl:attribute name="href">
        		<xsl:text>http://www.fire-soft-board.com/fsb/sujet-</xsl:text>
        		<xsl:value-of select="$id" />
        		<xsl:text>-</xsl:text>
				<xsl:choose>
					<xsl:when test="$page = '0'"><xsl:text>1</xsl:text></xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$page" />
					</xsl:otherwise>
				</xsl:choose>
        		<xsl:text>.html</xsl:text>
        	</xsl:attribute>
        	<xsl:value-of select="$linkTo" />
        </xsl:element>
	</xsl:template>
</xsl:stylesheet>