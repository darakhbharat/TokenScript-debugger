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
				<h3>Debug your TokenScript XML by refreshing the page</h3>
				<!--script src="ts-debugger.js" type="text/javascript" charset="utf-8">/* */</script-->
				<script type="text/javascript" charset="utf-8">
				<![CDATA[
				function loadIframe(){
					var iframes = document.getElementsByTagName("iframe");
					var div = document.getElementsByClassName("iframeContent");
					for(var i=0; i<iframes.length; i++){
						var iframe = iframes[i];
						/*var textContent = iframe.textContent;
						var wrapper = document.createElement('div');
						wrapper.innerHTML = textContent;
						
						iframeContentDocument = iframe.contentWindow.document;
						iframeContentDocument.write(wrapper.innerHTML);
						iframe.textContent = "";
						*/
						var doc = iframe.contentWindow.document;
						doc.open();
						doc.write(div[i].innerHTML);
						doc.close();
					}
				}

				function init(){
					var coll = document.getElementsByClassName("collapsible");

					for (var i = 0; i < coll.length; i++) {
					  coll[i].addEventListener("click", function() {
						this.classList.toggle("active");
						var content = this.nextElementSibling;
						if (content.style.display === "block") {
							content.style.display = "none";
						} else {
							content.style.display = "block";
						}
					  });
					}	
				}	
				]]>
				</script>
				<style>
					.collapsible {
					background-color: #777;
					color: white;
					cursor: pointer;
					padding: 10px;
					width: 90%;
					border: none;
					text-align: left;
					outline: none;
					font-size: 15px;
					}
					.cardContiner {
					border: solid #777;
					width: 90%;
					}
					.noContent {
					text-align: center;
					margin-top: 50;
					}
					.iframe {
					border: 1px solid darkolivegreen;
					}
				</style>

			</head>
			<body onload="init();loadIframe();">
				<xsl:apply-templates select="@*|node()"/>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="ts:card[ts:item-view or ts:view]">
		<!--h5>TS input details: <xsl:value-of select="concat(local-name(.), ' for ', local-name(..), ' having type as ', ../@type )"/></h5-->
		<button type="button" class="collapsible">
			Card Details:
			<xsl:for-each select="@*">
				<xsl:text>@</xsl:text><xsl:value-of select="local-name(.)"/>: <xsl:value-of select="."/>
				<xsl:text>  </xsl:text>
			</xsl:for-each>
		</button>
		<div class="cardContiner">
			<xsl:for-each select="ts:item-view | ts:view">
				<div class="iframeContent" style="display: none;">
					<xsl:for-each select="html:style">
						<style type="text/css">
							<xsl:value-of select="."/>
						</style>
					</xsl:for-each>
					<xsl:for-each select="html:script">
						<script type="text/javascript">
							<xsl:value-of select="."/>
						</script>
					</xsl:for-each>
					<xsl:choose>
						<xsl:when test="html:body">
							<xsl:for-each select="html:body">
								<xsl:copy-of select="."/>
							</xsl:for-each>
						</xsl:when>
						<xsl:otherwise>
							<h3 style="text-align: center;margin-top: 50;">No HTML Content</h3>
						</xsl:otherwise>
					</xsl:choose>
				</div>
				<xsl:choose>
					<xsl:when test="following-sibling::ts:item-view">
						<iframe src="about:blank" height="300" width="59%" title="Iframe" class="iframe"/>
					</xsl:when>
					<xsl:when test="self::ts:item-view">
						<iframe src="about:blank" height="300" width="39%" title="Iframe" class="iframe"/>
					</xsl:when>
					<xsl:otherwise>
						<iframe src="about:blank" height="300" width="98%" title="Iframe" class="iframe"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</div>
	</xsl:template>
</xsl:transform>
