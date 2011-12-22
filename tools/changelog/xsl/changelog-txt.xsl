<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gh="https://github.com/Grummfy/GitChangeLogManifier/issue" xmlns:fsb="http://www.fire-soft-board.com/" exclude-result-prefixes="fsb gh">
	<xsl:output	method="html" encoding="UTF-8" indent="yes" />
	<xsl:template match="changelogs">
<xsl:text>Changelogs
==========</xsl:text>
<xsl:apply-templates select="changelog" />
	</xsl:template>
	<xsl:template match="changelog">
<xsl:value-of select="@name" />
 
 
<xsl:apply-templates select="lines/line" />
</xsl:template>
	<xsl:template match="line"><xsl:for-each select="datas/data"><xsl:apply-templates select="." /></xsl:for-each><xsl:value-of select="message" /></xsl:template>
	<xsl:template match="data/gh:issue"><xsl:text>Ticket-</xsl:text><xsl:value-of select="gh:id" /></xsl:template>
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
					<xsl:text></xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
<xsl:value-of select="$linkTo" /><xsl:if test="$linkTo != ''">-</xsl:if><xsl:value-of select="$id" />
	</xsl:template>
</xsl:stylesheet>