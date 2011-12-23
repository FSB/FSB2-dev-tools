<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gh="https://github.com/Grummfy/GitChangeLogManifier/issue" xmlns:fsb="http://www.fire-soft-board.com/" exclude-result-prefixes="fsb gh">
	<xsl:output	method="html" encoding="UTF-8" indent="yes" />
	<xsl:template match="changelogs">
		[size=20]Changelogs[/size]
		<xsl:apply-templates select="changelog" />
	</xsl:template>
	<xsl:template match="changelog">
		[size=16]<xsl:value-of select="@name" />[/size]
		[list]<xsl:apply-templates select="lines/line" />[/list]
	</xsl:template>
	<xsl:template match="line">
		[*]<xsl:for-each select="datas/data"><xsl:apply-templates select="." /> </xsl:for-each><xsl:value-of select="message" />
	</xsl:template>
	<xsl:template match="data/gh:issue">[url=<xsl:text>https://github.com/FSB/Fire-Soft-Board-2/issues/</xsl:text><xsl:value-of select="gh:id" />]<xsl:text>Ticket-</xsl:text><xsl:value-of select="gh:id" />[/url]</xsl:template>
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
[url=<xsl:text>http://www.fire-soft-board.com/fsb/sujet-</xsl:text><xsl:value-of select="$id" />-<xsl:choose><xsl:when test="$page = '0'"><xsl:text>1</xsl:text></xsl:when><xsl:otherwise><xsl:value-of select="$page" /></xsl:otherwise></xsl:choose>.html]<xsl:value-of select="$linkTo" />[/url]
	</xsl:template>
</xsl:stylesheet>