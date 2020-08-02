<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform version="1.0"
					xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
					xmlns:ts="http://tokenscript.org/2020/06/tokenscript"
					xmlns:ethereum="urn:ethereum:constantinople"
					xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
					xmlns:html="http://www.w3.org/1999/xhtml"
					exclude-result-prefixes="xsl ts ethereum xsi">

	<xsl:output method="html" encoding="UTF-8" indent="yes"/>
	<xsl:strip-space elements="*"/>

	<xsl:template match="/|@*|node()">
		<xsl:apply-templates select="@*|node()"/>
	</xsl:template>
	<xsl:template match="/ts:token">
		<html>
			<head>
				<title>TokenScript Debugger</title>
				<script src="jquery.min.js" type="text/javascript" charset="utf-8">/* */</script>
				<script src="ts-debugger.js" type="text/javascript" charset="utf-8">/* */</script>
			</head>
			<body onload="loadIframe()">
				<xsl:apply-templates select="@*|node()"/>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="ts:item-view|ts:view">
		<iframe height="300" width="90%" title="Iframe">
			<body>
				<div class="container">
					<xsl:for-each select="html:style">
						<div class="css">
							<xsl:value-of select="."/>
						</div>
					</xsl:for-each>
					<xsl:for-each select="html:script">
						<div class="script">
							<xsl:value-of select="."/>
						</div>
					</xsl:for-each>
					<xsl:for-each select="html:body">
						<div class="body">
							<xsl:copy-of select="."/>
						</div>
					</xsl:for-each>
				</div>
			</body>
		</iframe>
	</xsl:template>
</xsl:transform>