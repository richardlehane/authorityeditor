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
                    <w:pStyle w:val="Subtitle" />
                </w:pPr>
                <w:r>
                    <w:t>
                        <xsl:value-of select="concat('DRAFT - ', $AUTHORITY_TYPE)" />
                    </w:t>
                </w:r>
                <w:r>
                    <w:br />
                    <w:t>
                        <xsl:value-of select="$AGENCY_NAMES" />
                    </w:t>
                </w:r>
            </w:p>
            <w:p>
                <w:pPr>
                    <w:pStyle w:val="Heading4" />
                    <w:tabs>
                        <w:tab w:val="right"
                            w:pos="9072" />
                    </w:tabs>
                    <w:rPr>
                        <w:bCs />
                    </w:rPr>
                </w:pPr>
                <w:r>
                    <w:rPr>
                        <w:bCs />
                    </w:rPr>
                    <w:t xml:space="preserve">Authority number: </w:t>
                </w:r>
                <w:r>
                    <w:rPr>
                        <w:bCs />
                    </w:rPr>
                    <w:t>
                        <xsl:value-of select="$RDANO" />
                    </w:t>
                </w:r>
                <w:r>
                    <w:rPr>
                        <w:bCs />
                    </w:rPr>
                    <w:tab />
                    <w:t>
                        <xsl:value-of select="concat('Dates of coverage: ', $DATE_RANGE)" />
                    </w:t>
                </w:r>
            </w:p>
            <w:tbl>
                <w:tblPr>
                    <w:tblW w:w="9072"
                        w:type="dxa" />
                    <w:jc w:val="center" />
                    <w:tblBorders>
                        <w:top w:val="single"
                            w:sz="6"
                            w:space="0"
                            w:color="auto" />
                        <w:left w:val="single"
                            w:sz="6"
                            w:space="0"
                            w:color="auto" />
                        <w:bottom w:val="single"
                            w:sz="6"
                            w:space="0"
                            w:color="auto" />
                        <w:right w:val="single"
                            w:sz="6"
                            w:space="0"
                            w:color="auto" />
                        <w:insideH w:val="single"
                            w:sz="6"
                            w:space="0"
                            w:color="auto" />
                        <w:insideV w:val="single"
                            w:sz="6"
                            w:space="0"
                            w:color="auto" />
                    </w:tblBorders>
                    <w:tblLook w:val="0000"
                        w:firstRow="0"
                        w:lastRow="0"
                        w:firstColumn="0"
                        w:lastColumn="0"
                        w:noHBand="0"
                        w:noVBand="0" />
                </w:tblPr>
                <w:tblGrid>
                    <w:gridCol w:w="992" />
                    <w:gridCol w:w="5812" />
                    <w:gridCol w:w="2268" />
                </w:tblGrid>
                <w:tr>
                    <w:trPr>
                        <w:jc w:val="center" />
                    </w:trPr>
                    <w:tc>
                        <w:tcPr>
                            <w:tcW w:w="992"
                                w:type="dxa" />
                            <w:shd w:val="clear"
                                w:color="auto"
                                w:fill="auto" />
                        </w:tcPr>
                        <w:p>
                            <w:pPr>
                                <w:spacing w:before="100"
                                    w:beforeAutospacing="1"
                                    w:after="100"
                                    w:afterAutospacing="1" />
                                <w:rPr>
                                    <w:b />
                                    <w:szCs w:val="24" />
                                </w:rPr>
                            </w:pPr>
                            <w:r>
                                <w:rPr>
                                    <w:b />
                                    <w:szCs w:val="24" />
                                </w:rPr>
                                <w:t>No.</w:t>
                            </w:r>
                        </w:p>
                    </w:tc>
                    <w:tc>
                        <w:tcPr>
                            <w:tcW w:w="5812"
                                w:type="dxa" />
                            <w:shd w:val="clear"
                                w:color="auto"
                                w:fill="auto" />
                        </w:tcPr>
                        <w:p>
                            <w:pPr>
                                <w:spacing w:before="100"
                                    w:beforeAutospacing="1"
                                    w:after="100"
                                    w:afterAutospacing="1" />
                                <w:rPr>
                                    <w:b />
                                    <w:szCs w:val="24" />
                                </w:rPr>
                            </w:pPr>
                            <w:r>
                                <w:rPr>
                                    <w:b />
                                    <w:szCs w:val="24" />
                                </w:rPr>
                                <w:t>Description of records</w:t>
                            </w:r>
                        </w:p>
                    </w:tc>
                    <w:tc>
                        <w:tcPr>
                            <w:tcW w:w="2268"
                                w:type="dxa" />
                            <w:shd w:val="clear"
                                w:color="auto"
                                w:fill="auto" />
                        </w:tcPr>
                        <w:p>
                            <w:pPr>
                                <w:spacing w:before="100"
                                    w:beforeAutospacing="1"
                                    w:after="100"
                                    w:afterAutospacing="1" />
                                <w:rPr>
                                    <w:b />
                                    <w:szCs w:val="24" />
                                </w:rPr>
                            </w:pPr>
                            <w:r>
                                <w:rPr>
                                    <w:b />
                                    <w:szCs w:val="24" />
                                </w:rPr>
                                <w:t>Disposal action</w:t>
                            </w:r>
                        </w:p>
                    </w:tc>
                </w:tr>
            </w:tbl>
            <w:p>
                <w:pPr>
                    <w:spacing w:before="0"
                        w:after="0" />
                </w:pPr>
            </w:p>
        </w:hdr>
    </xsl:template>
</xsl:stylesheet>