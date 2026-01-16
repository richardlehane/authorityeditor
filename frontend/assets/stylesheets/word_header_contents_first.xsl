<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rda="http://www.records.nsw.gov.au/schemas/RDA"
    xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
    version="1.0">
    <xsl:output method="xml"
        indent="yes" />
    <xsl:param name="atype" select="'authority'" />
    <xsl:include href="include/stocks.xsl" />
    <xsl:template match="rda:Authority">
        <w:hdr xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
            xmlns:w10="urn:schemas-microsoft-com:office:word"
            xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml"
            xmlns:v="urn:schemas-microsoft-com:vml"
            xmlns:o="urn:schemas-microsoft-com:office:office">
            <w:p>
                <w:pPr>
                    <w:pStyle w:val="Subtitle" />
                </w:pPr>
                <xsl:if test="$atype = 'draft'">
                    <w:sdt>
                        <w:sdtPr>
                            <w:rPr />
                            <w:id w:val="-643580690" />
                            <w:docPartObj>
                                <w:docPartGallery w:val="Watermarks" />
                                <w:docPartUnique />
                            </w:docPartObj>
                        </w:sdtPr>
                        <w:sdtContent>
                            <w:r>
                                <w:rPr>
                                    <w:noProof />
                                </w:rPr>
                                <w:pict w14:anchorId="2457E4FB">
                                    <v:shapetype id="_x0000_t136"
                                        coordsize="21600,21600"
                                        o:spt="136"
                                        adj="10800"
                                        path="m@7,l@8,m@5,21600l@6,21600e">
                                        <v:formulas>
                                            <v:f eqn="sum #0 0 10800" />
                                            <v:f eqn="prod #0 2 1" />
                                            <v:f eqn="sum 21600 0 @1" />
                                            <v:f eqn="sum 0 0 @2" />
                                            <v:f eqn="sum 21600 0 @3" />
                                            <v:f eqn="if @0 @3 0" />
                                            <v:f eqn="if @0 21600 @1" />
                                            <v:f eqn="if @0 0 @2" />
                                            <v:f eqn="if @0 @4 21600" />
                                            <v:f eqn="mid @5 @6" />
                                            <v:f eqn="mid @8 @5" />
                                            <v:f eqn="mid @7 @8" />
                                            <v:f eqn="mid @6 @7" />
                                            <v:f eqn="sum @6 0 @5" />
                                        </v:formulas>
                                        <v:path textpathok="t"
                                            o:connecttype="custom"
                                            o:connectlocs="@9,0;@10,10800;@11,21600;@12,10800"
                                            o:connectangles="270,180,90,0" />
                                        <v:textpath on="t"
                                            fitshape="t" />
                                        <v:handles>
                                            <v:h position="#0,bottomRight"
                                                xrange="6629,14971" />
                                        </v:handles>
                                        <o:lock v:ext="edit"
                                            text="t"
                                            shapetype="t" />
                                    </v:shapetype>
                                    <v:shape id="PowerPlusWaterMarkObject9897877"
                                        o:spid="_x0000_s1026"
                                        type="#_x0000_t136"
                                        style="position:absolute;left:0;text-align:left;margin-left:0;margin-top:0;width:456.75pt;height:182.7pt;rotation:315;z-index:-251658752;mso-position-horizontal:center;mso-position-horizontal-relative:margin;mso-position-vertical:center;mso-position-vertical-relative:margin"
                                        o:allowincell="f"
                                        fillcolor="silver"
                                        stroked="f">
                                        <v:fill opacity=".5" />
                                        <v:textpath
                                            style="font-family:&quot;Public Sans&quot;;font-size:1pt"
                                            string="DRAFT" />
                                        <w10:wrap anchorx="margin"
                                            anchory="margin" />
                                    </v:shape>
                                </w:pict>
                            </w:r>
                        </w:sdtContent>
                    </w:sdt>
                    <w:r>
                        <w:t xml:space="preserve">DRAFT - </w:t>
                    </w:r>
                </xsl:if>
                <w:r>
                    <xsl:choose>
                        <xsl:when test="$atype = 'ar'">
                            <w:t xml:space="preserve">Appraisal Report</w:t>
                        </xsl:when>
                        <xsl:otherwise>
                            <w:t>
                                <xsl:value-of select="$AUTHORITY_TYPE" />
                            </w:t>
                        </xsl:otherwise>
                    </xsl:choose>
                </w:r>
                <w:r>
                    <w:br />
                    <w:t>
                        <xsl:choose>
                            <xsl:when test="$atype = 'authority'">
                                <xsl:choose>
                                    <xsl:when test="//rda:Agency">
                                        <xsl:value-of
                                            select="concat(rda:AuthorityTitle, ' (', $AGENCY_NAMES, ')')" />
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="rda:AuthorityTitle" />
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="$AGENCY_NAMES" />
                            </xsl:otherwise>
                        </xsl:choose>
                    </w:t>
                </w:r>
            </w:p>
            <w:p>
                <w:pPr>
                    <w:pStyle w:val="Heading4" />
                    <xsl:choose>
                        <xsl:when test="$atype = 'ar'">
                            <w:tab w:val="right"
                                w:pos="10205" />
                        </xsl:when>
                        <xsl:otherwise>
                            <w:tab w:val="right"
                                w:pos="9072" />
                        </xsl:otherwise>
                    </xsl:choose>
                    <w:rPr>
                        <w:bCs />
                    </w:rPr>
                </w:pPr>
                <xsl:choose>
                    <xsl:when test="$atype = 'ar'">
                        <w:r>
                            <w:rPr>
                                <w:bCs />
                            </w:rPr>
                            <w:t xml:space="preserve">AR No: </w:t>
                        </w:r>
                        <w:r>
                            <w:rPr>
                                <w:bCs />
                            </w:rPr>
                            <w:t>
                                <xsl:value-of select="$ARNO" />
                            </w:t>
                        </w:r>
                    </xsl:when>
                    <xsl:otherwise>
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
                    </xsl:otherwise>
                </xsl:choose>
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
                    <w:tblW w:w="5000" w:type="pct" />
                    <w:tblBorders>
                        <w:top w:val="single" w:sz="4" w:space="0" w:color="auto" />
                        <w:left w:val="single" w:sz="4" w:space="0" w:color="auto" />
                        <w:bottom w:val="single" w:sz="4" w:space="0" w:color="auto" />
                        <w:right w:val="single" w:sz="4" w:space="0" w:color="auto" />
                        <w:insideH w:val="single" w:sz="6" w:space="0" w:color="auto" />
                        <w:insideV w:val="single" w:sz="6" w:space="0" w:color="auto" />
                    </w:tblBorders>
                    <w:tblLayout w:type="fixed" />
                    <w:tblCellMar>
                        <w:left w:w="107" w:type="dxa" />
                        <w:right w:w="107" w:type="dxa" />
                    </w:tblCellMar>
                    <w:tblLook w:val="0000" w:firstRow="0" w:lastRow="0" w:firstColumn="0"
                        w:lastColumn="0"
                        w:noHBand="0" w:noVBand="0" />
                </w:tblPr>
                <w:tblGrid>
                    <w:gridCol w:w="9061" />
                </w:tblGrid>
                <w:tr>
                    <w:trPr>
                        <w:cantSplit />
                    </w:trPr>
                    <w:tc>
                        <w:tcPr>
                            <w:tcW w:w="5000" w:type="pct" />
                        </w:tcPr>
                        <w:p>
                            <w:pPr>
                                <w:spacing w:before="60" w:after="60" />
                                <w:rPr>
                                    <w:b />
                                    <w:sz w:val="16" />
                                </w:rPr>
                            </w:pPr>
                            <w:r>
                                <w:rPr>
                                    <w:b />
                                    <w:sz w:val="16" />
                                </w:rPr>
                                <w:t>List of Functions and Activities covered</w:t>
                            </w:r>
                        </w:p>
                    </w:tc>
                </w:tr>
            </w:tbl>
            <w:p>
                <w:pPr>
                    <w:spacing w:before="0" w:after="0" />
                </w:pPr>
            </w:p>
        </w:hdr>
    </xsl:template>
</xsl:stylesheet>