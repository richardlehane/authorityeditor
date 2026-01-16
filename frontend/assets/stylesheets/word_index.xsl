<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:exslt="http://exslt.org/common"
                xmlns:rda="http://www.records.nsw.gov.au/schemas/RDA"
                xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
                version="1.0">
    <xsl:output method="xml"
                indent="yes" />
    <xsl:include href="include/stocks.xsl" />
    <xsl:include href="include/index.xsl" />
    <xsl:variable name="ANCHOR">
        <xsl:value-of select="'false'" />
    </xsl:variable>
    <xsl:template match="rda:Authority">
        <!-- acquire an index from index.xsl -->
        <xsl:variable name="index">
            <xsl:call-template name="index">
                <xsl:with-param name="authority"
                                select="." />
            </xsl:call-template>
        </xsl:variable>
        <!-- word document -->
        <w:document xmlns:wpc="http://schemas.microsoft.com/office/word/2010/wordprocessingCanvas"
                    xmlns:cx="http://schemas.microsoft.com/office/drawing/2014/chartex"
                    xmlns:cx1="http://schemas.microsoft.com/office/drawing/2015/9/8/chartex"
                    xmlns:cx2="http://schemas.microsoft.com/office/drawing/2015/10/21/chartex"
                    xmlns:cx3="http://schemas.microsoft.com/office/drawing/2016/5/9/chartex"
                    xmlns:cx4="http://schemas.microsoft.com/office/drawing/2016/5/10/chartex"
                    xmlns:cx5="http://schemas.microsoft.com/office/drawing/2016/5/11/chartex"
                    xmlns:cx6="http://schemas.microsoft.com/office/drawing/2016/5/12/chartex"
                    xmlns:cx7="http://schemas.microsoft.com/office/drawing/2016/5/13/chartex"
                    xmlns:cx8="http://schemas.microsoft.com/office/drawing/2016/5/14/chartex"
                    xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
                    xmlns:aink="http://schemas.microsoft.com/office/drawing/2016/ink"
                    xmlns:am3d="http://schemas.microsoft.com/office/drawing/2017/model3d"
                    xmlns:o="urn:schemas-microsoft-com:office:office"
                    xmlns:oel="http://schemas.microsoft.com/office/2019/extlst"
                    xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"
                    xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math"
                    xmlns:v="urn:schemas-microsoft-com:vml"
                    xmlns:wp14="http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing"
                    xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing"
                    xmlns:w10="urn:schemas-microsoft-com:office:word"
                    xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
                    xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml"
                    xmlns:w15="http://schemas.microsoft.com/office/word/2012/wordml"
                    xmlns:w16cex="http://schemas.microsoft.com/office/word/2018/wordml/cex"
                    xmlns:w16cid="http://schemas.microsoft.com/office/word/2016/wordml/cid"
                    xmlns:w16="http://schemas.microsoft.com/office/word/2018/wordml"
                    xmlns:w16du="http://schemas.microsoft.com/office/word/2023/wordml/word16du"
                    xmlns:w16sdtdh="http://schemas.microsoft.com/office/word/2020/wordml/sdtdatahash"
                    xmlns:w16sdtfl="http://schemas.microsoft.com/office/word/2024/wordml/sdtformatlock"
                    xmlns:w16se="http://schemas.microsoft.com/office/word/2015/wordml/symex"
                    xmlns:wpg="http://schemas.microsoft.com/office/word/2010/wordprocessingGroup"
                    xmlns:wpi="http://schemas.microsoft.com/office/word/2010/wordprocessingInk"
                    xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml"
                    xmlns:wps="http://schemas.microsoft.com/office/word/2010/wordprocessingShape"
                    mc:Ignorable="w14 w15 w16se w16cid w16 w16cex w16sdtdh w16sdtfl w16du wp14">
            <w:body>
                <w:tbl>
                    <w:tblPr>
                        <w:tblStyle w:val="TableGridLight" />
                        <w:tblW w:w="10090"
                                w:type="dxa" />
                        <w:tblLook w:val="0000"
                                   w:firstRow="0"
                                   w:lastRow="0"
                                   w:firstColumn="0"
                                   w:lastColumn="0"
                                   w:noHBand="0"
                                   w:noVBand="0" />
                    </w:tblPr>
                    <w:tblGrid>
                        <w:gridCol w:w="2870" />
                        <w:gridCol w:w="2938" />
                        <w:gridCol w:w="4282" />
                    </w:tblGrid>
                    <w:tr>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="2870"
                                       w:type="dxa" />
                                <w:shd w:val="clear"
                                       w:color="auto"
                                       w:fill="002060" />
                                <w:vAlign w:val="center" />
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:rPr>
                                        <w:rFonts w:ascii="Public Sans"
                                                  w:hAnsi="Public Sans" />
                                        <w:b />
                                        <w:i />
                                        <w:iCs />
                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>
                                        <w:rFonts w:ascii="Public Sans"
                                                  w:hAnsi="Public Sans" />
                                        <w:b />
                                        <w:i />
                                        <w:iCs />
                                        <w:sz w:val="22" />
                                        <w:szCs w:val="22" />
                                    </w:rPr>
                                    <w:t>Term</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="2938"
                                       w:type="dxa" />
                                <w:shd w:val="clear"
                                       w:color="auto"
                                       w:fill="002060" />
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:rPr>
                                        <w:rFonts w:ascii="Public Sans"
                                                  w:hAnsi="Public Sans" />
                                    </w:rPr>
                                </w:pPr>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="4282"
                                       w:type="dxa" />
                                <w:shd w:val="clear"
                                       w:color="auto"
                                       w:fill="002060" />
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:rPr>
                                        <w:rFonts w:ascii="Public Sans"
                                                  w:hAnsi="Public Sans" />
                                        <w:b />
                                        <w:bCs />
                                        <w:i />
                                        <w:iCs />
                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>
                                        <w:rFonts w:ascii="Public Sans"
                                                  w:hAnsi="Public Sans" />
                                        <w:b />
                                        <w:bCs />
                                        <w:i />
                                        <w:iCs />
                                        <w:sz w:val="22" />
                                        <w:szCs w:val="22" />
                                    </w:rPr>
                                    <w:t>Reference</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                    </w:tr>
                    <xsl:for-each select="exslt:node-set($index)/links">
                        <xsl:for-each select="broad_term">
                            <w:tr>
                                <w:tc>
                                    <w:tcPr>
                                        <w:tcW w:w="2870"
                                               w:type="dxa" />
                                        <w:vAlign w:val="center" />
                                    </w:tcPr>
                                    <w:p>
                                        <w:pPr>
                                            <w:rPr>
                                                <w:rFonts w:ascii="Public Sans"
                                                          w:hAnsi="Public Sans" />
                                                <w:b />
                                            </w:rPr>
                                        </w:pPr>
                                        <w:r>
                                            <w:rPr>
                                                <w:rFonts w:ascii="Public Sans"
                                                          w:hAnsi="Public Sans" />
                                                <w:b />
                                            </w:rPr>
                                            <w:t>
                                                <xsl:value-of select="broad_term_title" />
                                            </w:t>
                                        </w:r>
                                    </w:p>
                                </w:tc>
                                <w:tc>
                                    <w:tcPr>
                                        <w:tcW w:w="2938"
                                               w:type="dxa" />
                                    </w:tcPr>
                                    <w:p>
                                        <w:pPr>
                                            <w:rPr>
                                                <w:rFonts w:ascii="Public Sans"
                                                          w:hAnsi="Public Sans" />
                                            </w:rPr>
                                        </w:pPr>
                                    </w:p>
                                </w:tc>
                                <w:tc>
                                    <w:tcPr>
                                        <w:tcW w:w="4282"
                                               w:type="dxa" />
                                    </w:tcPr>
                                    <w:p>
                                        <w:pPr>
                                            <w:rPr>
                                                <w:rFonts w:ascii="Public Sans"
                                                          w:hAnsi="Public Sans" />
                                            </w:rPr>
                                        </w:pPr>
                                        <w:r>
                                            <w:rPr>
                                                <w:rFonts w:ascii="Public Sans"
                                                          w:hAnsi="Public Sans" />
                                            </w:rPr>
                                            <w:t>
                                                <xsl:for-each select="addresses">
                                                    <xsl:for-each select="address">
                                                        <xsl:sort select="."
                                                                  order="ascending" />
                                                        <xsl:if test="position() > 1">
                                                            <xsl:text>, </xsl:text>
                                                        </xsl:if>
                                                        <xsl:value-of select="." />
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                            </w:t>
                                        </w:r>
                                    </w:p>
                                </w:tc>
                            </w:tr>
                            <xsl:for-each select="narrow_terms/narrow_term">
                                <xsl:sort select="narrow_term_title" />
                                <w:tr>
                                    <w:tc>
                                        <w:tcPr>
                                            <w:tcW w:w="2870"
                                                   w:type="dxa" />
                                            <w:vAlign w:val="center" />
                                        </w:tcPr>
                                        <w:p>
                                            <w:pPr>
                                                <w:rPr>
                                                    <w:rFonts w:ascii="Public Sans"
                                                              w:hAnsi="Public Sans" />
                                                </w:rPr>
                                            </w:pPr>
                                        </w:p>
                                    </w:tc>
                                    <w:tc>
                                        <w:tcPr>
                                            <w:tcW w:w="2938"
                                                   w:type="dxa" />
                                        </w:tcPr>
                                        <w:p>
                                            <w:pPr>
                                                <w:rPr>
                                                    <w:rFonts w:ascii="Public Sans"
                                                              w:hAnsi="Public Sans" />
                                                    <w:b />
                                                </w:rPr>
                                            </w:pPr>
                                            <w:r>
                                                <w:rPr>
                                                    <w:rFonts w:ascii="Public Sans"
                                                              w:hAnsi="Public Sans" />
                                                    <w:b />
                                                </w:rPr>
                                                <w:t>
                                                    <xsl:value-of select="narrow_term_title" />
                                                </w:t>
                                            </w:r>
                                        </w:p>
                                        <w:p>
                                            <w:pPr>
                                                <w:rPr>
                                                    <w:rFonts w:ascii="Public Sans"
                                                              w:hAnsi="Public Sans" />
                                                </w:rPr>
                                            </w:pPr>
                                        </w:p>
                                    </w:tc>
                                    <w:tc>
                                        <w:tcPr>
                                            <w:tcW w:w="4282"
                                                   w:type="dxa" />
                                        </w:tcPr>
                                        <w:p>
                                            <w:pPr>
                                                <w:rPr>
                                                    <w:rFonts w:ascii="Public Sans"
                                                              w:hAnsi="Public Sans" />
                                                </w:rPr>
                                            </w:pPr>
                                            <w:r>
                                                <w:rPr>
                                                    <w:rFonts w:ascii="Public Sans"
                                                              w:hAnsi="Public Sans" />
                                                </w:rPr>
                                                <w:t>
                                                    <xsl:for-each select="addresses">
                                                        <xsl:sort select="address"
                                                                  order="ascending" />
                                                        <xsl:for-each select="address[not(. = preceding-sibling::address)]">
                                                            <xsl:if test="position() > 1">
                                                                <xsl:text>, </xsl:text>
                                                            </xsl:if>
                                                            <xsl:value-of select="." />
                                                        </xsl:for-each>
                                                    </xsl:for-each>
                                                </w:t>
                                            </w:r>
                                        </w:p>
                                    </w:tc>
                                </w:tr>
                            </xsl:for-each>
                        </xsl:for-each>
                    </xsl:for-each>
                </w:tbl>
                <w:p>
                    <w:pPr>
                        <w:spacing w:line="360"
                                   w:lineRule="auto" />
                        <w:rPr>
                            <w:rFonts w:ascii="Public Sans"
                                      w:hAnsi="Public Sans" />
                        </w:rPr>
                    </w:pPr>
                </w:p>
                <w:sectPr>
                    <w:headerReference w:type="default"
                                       r:id="rId10" />
                    <w:footerReference w:type="even"
                                       r:id="rId11" />
                    <w:footerReference w:type="default"
                                       r:id="rId12" />
                    <w:headerReference w:type="first"
                                       r:id="rId13" />
                    <w:footerReference w:type="first"
                                       r:id="rId14" />
                    <w:pgSz w:w="11906"
                            w:h="16838" />
                    <w:pgMar w:top="1440"
                             w:right="941"
                             w:bottom="1440"
                             w:left="941"
                             w:header="708"
                             w:footer="708"
                             w:gutter="0" />
                    <w:cols w:space="708" />
                    <w:docGrid w:linePitch="360" />
                </w:sectPr>
            </w:body>
        </w:document>
    </xsl:template>
</xsl:stylesheet>