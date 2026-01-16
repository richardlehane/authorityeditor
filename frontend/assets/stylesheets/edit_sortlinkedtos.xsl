<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rda="http://www.records.nsw.gov.au/schemas/RDA" version="1.0">
    <xsl:output method="xml" indent="yes" />
    <xsl:template match="rda:Authority | rda:Term | rda:Class">
        <xsl:copy>
            <xsl:apply-templates select="@*" />
            <xsl:apply-templates select="rda:ID" />
            <xsl:apply-templates select="rda:AuthorityTitle" />
            <xsl:apply-templates select="rda:TermTitle" />
            <xsl:apply-templates select="rda:ClassTitle" />
            <xsl:apply-templates select="rda:Scope" />
            <xsl:apply-templates select="rda:TermDescription" />
            <xsl:apply-templates select="rda:ClassDescription" />
            <xsl:apply-templates select="rda:Disposal" />
            <xsl:apply-templates select="rda:Justification" />
            <xsl:apply-templates select="rda:DateRange" />
            <xsl:apply-templates select="rda:Status" />
            <xsl:for-each select="rda:LinkedTo">
                <xsl:sort select="@type" />
                <xsl:sort select="." />
                <xsl:copy>
                    <xsl:apply-templates select="text()|@*" />
                </xsl:copy>
            </xsl:for-each>
            <xsl:apply-templates select="rda:Comment" />
            <xsl:apply-templates select="rda:Context" />
            <xsl:apply-templates select="rda:Term | rda:Class" />
        </xsl:copy>
    </xsl:template>
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()" />
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>