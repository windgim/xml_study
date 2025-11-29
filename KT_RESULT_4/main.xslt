<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="/ul">
        <items>
            <xsl:apply-templates select="li"/>
        </items>
    </xsl:template>

    <xsl:template match="li">
        <xsl:variable name="id" select="@data-id"/>
        <xsl:variable name="author" select="b"/>
        <xsl:variable name="message" select="span"/>
        <xsl:variable name="parent-id" select="../@data-id | '0'"/>

        <item id="{$id}" parentid="{$parent-id}" author="{normalize-space($author)}">
            <xsl:value-of select="normalize-space($message)"/>
        </item>

        <xsl:apply-templates select="ul/li"/>
    </xsl:template>

</xsl:stylesheet>
