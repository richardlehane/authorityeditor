<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:rda="http://www.records.nsw.gov.au/schemas/RDA"
                xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
                version="1.0">
    <xsl:output method="xml"
                indent="yes" />
    <xsl:include href="include/stocks.xsl" />
    <xsl:template match="rda:Authority">
        <w:hdr xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">
            <w:p>
                <w:pPr>
                    <w:pStyle w:val="Header" />
                </w:pPr>
                <w:r>
                    <w:t>
                        <xsl:text>Index - </xsl:text>
                        <xsl:value-of select="rda:AuthorityTitle" />
                        <xsl:text> (</xsl:text>
                        <xsl:value-of select="$RDANO" />
                        <xsl:text>)</xsl:text>
                    </w:t>
                </w:r>
            </w:p>
        </w:hdr>
    </xsl:template>
</xsl:stylesheet>