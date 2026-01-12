<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rda="http://www.records.nsw.gov.au/schemas/RDA"
    xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
    version="1.0">
    <xsl:template name="render_contents">
        <w:tbl>
            <w:tblPr>
                <w:tblStyle w:val="TableGrid" />
                <w:tblW w:w="5000"
                    w:type="pct" />
                <w:tblLook w:val="01E0"
                    w:firstRow="1"
                    w:lastRow="1"
                    w:firstColumn="1"
                    w:lastColumn="1"
                    w:noHBand="0"
                    w:noVBand="0" />
            </w:tblPr>
            <w:tblGrid>
                <w:gridCol w:w="3591" />
                <w:gridCol w:w="3410" />
                <w:gridCol w:w="1187" />
                <w:gridCol w:w="873" />
            </w:tblGrid>
            <w:tr>
                <w:trPr>
                    <w:tblHeader />
                </w:trPr>
                <w:tc>
                    <w:tcPr>
                        <w:tcW w:w="2000"
                            w:type="pct" />
                    </w:tcPr>
                    <w:p>
                        <w:pPr>
                            <w:rPr>
                                <w:b />
                            </w:rPr>
                        </w:pPr>
                        <w:r>
                            <w:rPr>

                                <w:b />
                            </w:rPr>
                            <w:t>Function</w:t>
                        </w:r>
                    </w:p>
                </w:tc>
                <w:tc>
                    <w:tcPr>
                        <w:tcW w:w="1900"
                            w:type="pct" />
                    </w:tcPr>
                    <w:p>
                        <w:pPr>
                            <w:rPr>

                                <w:b />
                            </w:rPr>
                        </w:pPr>
                        <w:r>
                            <w:rPr>

                                <w:b />
                            </w:rPr>
                            <w:t>Activity</w:t>
                        </w:r>
                    </w:p>
                </w:tc>
                <w:tc>
                    <w:tcPr>
                        <w:tcW w:w="600"
                            w:type="pct" />
                    </w:tcPr>
                    <w:p>
                        <w:pPr>
                            <w:rPr>

                                <w:b />
                            </w:rPr>
                        </w:pPr>
                        <w:r>
                            <w:rPr>

                                <w:b />
                            </w:rPr>
                            <w:t>Reference</w:t>
                        </w:r>
                    </w:p>
                </w:tc>
                <w:tc>
                    <w:tcPr>
                        <w:tcW w:w="500"
                            w:type="pct" />
                    </w:tcPr>
                    <w:p>
                        <w:pPr>
                            <w:rPr>

                                <w:b />
                            </w:rPr>
                        </w:pPr>
                        <w:r>
                            <w:rPr>
                                <w:b />
                            </w:rPr>
                            <w:t>Page</w:t>
                        </w:r>
                    </w:p>
                </w:tc>
            </w:tr>
            <xsl:for-each select="rda:Term">
                <w:tr>
                    <w:tc>
                        <w:tcPr>
                            <w:tcW w:w="2000"
                                w:type="pct" />
                        </w:tcPr>
                        <w:p>
                            <w:pPr>
                                <w:rPr>

                                </w:rPr>
                            </w:pPr>
                            <w:hyperlink w:anchor="{generate-id(.)}"
                                w:tooltip="{rda:TermTitle}"
                                w:history="1">
                                <w:r>
                                    <w:t>
                                        <xsl:value-of select="rda:TermTitle" />
                                    </w:t>
                                </w:r>
                            </w:hyperlink>
                        </w:p>
                    </w:tc>
                    <w:tc>
                        <w:tcPr>
                            <w:tcW w:w="1900"
                                w:type="pct" />
                        </w:tcPr>
                        <w:p />
                    </w:tc>
                    <w:tc>
                        <w:tcPr>
                            <w:tcW w:w="600"
                                w:type="pct" />
                        </w:tcPr>
                        <w:p>
                            <w:r>
                                <w:t>
                                    <xsl:if test="rda:ID">
                                        <xsl:variable name="id">
                                            <xsl:call-template name="local_id">
                                                <xsl:with-param name="node" select="." />
                                            </xsl:call-template>
                                        </xsl:variable>
                                        <xsl:if test="$id != $RDANO">
                                            <xsl:value-of select="concat($id, ' ')" />
                                        </xsl:if>
                                    </xsl:if>
                                    <xsl:value-of select="@itemno" />
                                </w:t>
                            </w:r>
                        </w:p>
                    </w:tc>
                    <w:tc>
                        <w:tcPr>
                            <w:tcW w:w="500"
                                w:type="pct" />
                        </w:tcPr>
                        <w:p>
                            <w:pPr>
                                <w:rPr>

                                </w:rPr>
                            </w:pPr>
                            <w:r>
                                <w:rPr>

                                </w:rPr>
                                <w:fldChar w:fldCharType="begin" />
                            </w:r>
                            <w:r>
                                <w:rPr>
                                </w:rPr>
                                <w:instrText>
                                    <xsl:text> PAGEREF  </xsl:text>
                                    <xsl:value-of select="generate-id(.)" />
                                    <xsl:text> \* MERGEFORMAT </xsl:text>
                                </w:instrText>
                            </w:r>
                            <w:r>
                                <w:rPr>
                                </w:rPr>
                                <w:fldChar w:fldCharType="separate" />
                            </w:r>
                            <w:r>
                                <w:rPr>
                                    <w:noProof />
                                </w:rPr>
                                <w:t>ctr-a, F9</w:t>
                            </w:r>
                            <w:r>
                                <w:rPr>

                                    <w:noProof />
                                </w:rPr>
                                <w:fldChar w:fldCharType="end" />
                            </w:r>
                        </w:p>
                    </w:tc>
                </w:tr>
                <xsl:for-each select="rda:Term">
                    <w:tr>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="2000"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:hyperlink w:anchor="{generate-id(.)}"
                                    w:tooltip="{rda:TermTitle}"
                                    w:history="1">
                                    <w:r>
                                        <w:t>
                                            <xsl:value-of select="rda:TermTitle" />
                                        </w:t>
                                    </w:r>
                                </w:hyperlink>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="1900"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p />
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="600"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p>
                                <w:r>
                                    <w:t>
                                        <xsl:if test="rda:ID">
                                            <xsl:variable name="id">
                                                <xsl:call-template name="local_id">
                                                    <xsl:with-param name="node" select="." />
                                                </xsl:call-template>
                                            </xsl:variable>
                                            <xsl:if test="$id != $RDANO">
                                                <xsl:value-of select="concat($id, ' ')" />
                                            </xsl:if>
                                        </xsl:if>
                                        <xsl:value-of select="@itemno" />
                                    </w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="500"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>

                                    </w:rPr>
                                    <w:fldChar w:fldCharType="begin" />
                                </w:r>
                                <w:r>
                                    <w:rPr>
                                    </w:rPr>
                                    <w:instrText>
                                        <xsl:text> PAGEREF  </xsl:text>
                                        <xsl:value-of select="generate-id(.)" />
                                        <xsl:text> \* MERGEFORMAT </xsl:text>
                                    </w:instrText>
                                </w:r>
                                <w:r>
                                    <w:rPr>
                                    </w:rPr>
                                    <w:fldChar w:fldCharType="separate" />
                                </w:r>
                                <w:r>
                                    <w:rPr>
                                        <w:noProof />
                                    </w:rPr>
                                    <w:t>ctr-a, F9</w:t>
                                </w:r>
                                <w:r>
                                    <w:rPr>

                                        <w:noProof />
                                    </w:rPr>
                                    <w:fldChar w:fldCharType="end" />
                                </w:r>
                            </w:p>
                        </w:tc>
                    </w:tr>
                </xsl:for-each>
            </xsl:for-each>
        </w:tbl>
    </xsl:template>
</xsl:stylesheet>