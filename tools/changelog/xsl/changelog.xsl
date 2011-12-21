<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output	method="html" encoding="UTF-8" doctype-public="-//W3C//DTD HTML 4.01//EN" doctype-system="http://www.w3.org/TR/html4/strict.dtd" indent="yes" />
	<xsl:template match="changelogs">
		<html>
			<body>
				<xsl:apply-templates select="changelog" />
			</body>
		</html>
	</xsl:template>
	<xsl:template match="changelog">
		<h1><xsl:value-of select="@name" /></h1>
		<xsl:apply-templates select="lines" />
	</xsl:template>
	<xsl:template match="lines/line">
		<h1><xsl:value-of select="@name" /></h1>
		<xsl:value-of select="message" />
	</xsl:template>
</xsl:stylesheet>