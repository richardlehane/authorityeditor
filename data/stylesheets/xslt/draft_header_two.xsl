<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rda="http://www.records.nsw.gov.au/schemas/RDA"
    xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
    xmlns:w10="urn:schemas-microsoft-com:office:word"
    xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml"
    xmlns:v="urn:schemas-microsoft-com:vml"
    xmlns:o="urn:schemas-microsoft-com:office:office"
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
                    <w:rPr>
                        <w:i />
                    </w:rPr>
                </w:pPr>
                <w:r>
                    <w:fldChar w:fldCharType="begin" />
                </w:r>
                <w:r>
                    <w:rPr>
                        <w:i />
                    </w:rPr>
                    <w:instrText>STYLEREF "HIDDEN CHAR" \* MERGEFORMAT</w:instrText>
                </w:r>
                <w:r>
                    <w:fldChar w:fldCharType="separate" />
                </w:r>
                <w:r>
                    <w:rPr>
                        <w:i />
                        <w:noProof />
                    </w:rPr>
                    <w:t>This text is replaced</w:t>
                </w:r>
                <w:r>
                    <w:fldChar w:fldCharType="end" />
                </w:r>
            </w:p>
        </w:hdr>
    </xsl:template>
</xsl:stylesheet>