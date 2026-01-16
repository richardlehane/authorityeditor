<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:exslt="http://exslt.org/common"
                xmlns:rda="http://www.records.nsw.gov.au/schemas/RDA"
                xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
                version="1.0">
    <xsl:output method="xml"
                indent="yes" />
    <xsl:include href="include/linking_table.xsl" />
    <!-- if you want to always link to the same previous authority set a default prefix (e.g. GDA10) on the variable below -->
    <!-- e.g. <xsl:variable name="DEFAULT_PREFIX" select="'GDA10'"/> -->
    <xsl:variable name="DEFAULT_PREFIX"
                  select="''" />
    <xsl:template match="rda:Authority">
        <!-- acquire a linking table from linking_table.xsl -->
        <xsl:variable name="linked_terms">
            <xsl:element name="links">
                <xsl:call-template name="linking_table">
                    <xsl:with-param name="terms"
                                    select="//rda:LinkedTo[@type='linking table']" />
                    <xsl:with-param name="default_prefix"
                                    select="$DEFAULT_PREFIX" />
                </xsl:call-template>
            </xsl:element>
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
                        <w:tblW w:w="0"
                                w:type="auto" />
                        <w:tblLook w:val="0480"
                                   w:firstRow="0"
                                   w:lastRow="0"
                                   w:firstColumn="1"
                                   w:lastColumn="0"
                                   w:noHBand="0"
                                   w:noVBand="1" />
                    </w:tblPr>
                    <w:tblGrid>
                        <w:gridCol w:w="1222" />
                        <w:gridCol w:w="2034" />
                        <w:gridCol w:w="3119" />
                        <w:gridCol w:w="4415" />
                    </w:tblGrid>
                    <w:tr>
                        <w:trPr>
                            <w:trHeight w:val="300" />
                            <w:tblHeader />
                        </w:trPr>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="1220"
                                       w:type="dxa" />
                                <w:shd w:val="clear"
                                       w:color="auto"
                                       w:fill="002060" />
                                <w:vAlign w:val="center" />
                                <w:hideMark />
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:jc w:val="center" />
                                    <w:rPr>
                                        <w:b />
                                        <w:bCs />
                                        <w:i />
                                        <w:iCs />
                                        <w:color w:val="FFFFFF"
                                                 w:themeColor="background1" />
                                        <w:sz w:val="22" />
                                        <w:szCs w:val="22" />
                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>
                                        <w:b />
                                        <w:bCs />
                                        <w:i />
                                        <w:iCs />
                                        <w:color w:val="FFFFFF"
                                                 w:themeColor="background1" />
                                        <w:sz w:val="22" />
                                        <w:szCs w:val="22" />
                                    </w:rPr>
                                    <w:t>Old reference</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="2034"
                                       w:type="dxa" />
                                <w:shd w:val="clear"
                                       w:color="auto"
                                       w:fill="002060" />
                                <w:vAlign w:val="center" />
                                <w:hideMark />
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:rPr>
                                        <w:b />
                                        <w:bCs />
                                        <w:i />
                                        <w:iCs />
                                        <w:color w:val="FFFFFF"
                                                 w:themeColor="background1" />
                                        <w:sz w:val="22" />
                                        <w:szCs w:val="22" />
                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>
                                        <w:b />
                                        <w:bCs />
                                        <w:i />
                                        <w:iCs />
                                        <w:color w:val="FFFFFF"
                                                 w:themeColor="background1" />
                                        <w:sz w:val="22" />
                                        <w:szCs w:val="22" />
                                    </w:rPr>
                                    <w:t>New reference</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="3120"
                                       w:type="dxa" />
                                <w:shd w:val="clear"
                                       w:color="auto"
                                       w:fill="002060" />
                                <w:vAlign w:val="center" />
                                <w:hideMark />
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:rPr>
                                        <w:b />
                                        <w:bCs />
                                        <w:i />
                                        <w:iCs />
                                        <w:color w:val="FFFFFF"
                                                 w:themeColor="background1" />
                                        <w:sz w:val="22" />
                                        <w:szCs w:val="22" />
                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>
                                        <w:b />
                                        <w:bCs />
                                        <w:i />
                                        <w:iCs />
                                        <w:color w:val="FFFFFF"
                                                 w:themeColor="background1" />
                                        <w:sz w:val="22" />
                                        <w:szCs w:val="22" />
                                    </w:rPr>
                                    <w:t>Function/Activity</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="4416"
                                       w:type="dxa" />
                                <w:shd w:val="clear"
                                       w:color="auto"
                                       w:fill="002060" />
                                <w:vAlign w:val="center" />
                                <w:hideMark />
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:rPr>
                                        <w:b />
                                        <w:bCs />
                                        <w:i />
                                        <w:iCs />
                                        <w:color w:val="FFFFFF"
                                                 w:themeColor="background1" />
                                        <w:sz w:val="22" />
                                        <w:szCs w:val="22" />
                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>
                                        <w:b />
                                        <w:bCs />
                                        <w:i />
                                        <w:iCs />
                                        <w:color w:val="FFFFFF"
                                                 w:themeColor="background1" />
                                        <w:sz w:val="22" />
                                        <w:szCs w:val="22" />
                                    </w:rPr>
                                    <w:t>Comments</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                    </w:tr>
                    <!-- Content starts here -->
                    <xsl:for-each select="exslt:node-set($linked_terms)/links">
                        <xsl:for-each select="link_term">
                            <xsl:sort select="old_ref/prefix"
                                      order="ascending" />
                            <xsl:sort select="old_ref/f"
                                      data-type="number"
                                      order="ascending" />
                            <xsl:sort select="old_ref/a"
                                      data-type="number"
                                      order="ascending" />
                            <xsl:sort select="old_ref/c"
                                      data-type="number"
                                      order="ascending" />
                            <w:tr>
                                <w:tc>
                                    <w:tcPr>
                                        <w:tcW w:w="1220"
                                               w:type="dxa" />
                                        <w:vAlign w:val="center" />
                                        <w:hideMark />
                                    </w:tcPr>
                                    <w:p>
                                        <w:pPr>
                                            <w:jc w:val="center" />
                                            <w:rPr>
                                                <w:rFonts w:ascii="Public Sans"
                                                          w:hAnsi="Public Sans" />
                                                <w:color w:val="000000" />
                                                <w:sz w:val="22" />
                                                <w:szCs w:val="22" />
                                            </w:rPr>
                                        </w:pPr>
                                        <w:r>
                                            <w:rPr>
                                                <w:rFonts w:ascii="Public Sans"
                                                          w:hAnsi="Public Sans" />
                                                <w:color w:val="000000" />
                                                <w:sz w:val="22" />
                                                <w:szCs w:val="22" />
                                            </w:rPr>
                                            <w:t>
                                                <xsl:choose>
                                                    <xsl:when test="old_ref/f">
                                                        <xsl:if test="old_ref/prefix">
                                                            <xsl:value-of select="concat(old_ref/prefix, ' ')" />
                                                        </xsl:if>
                                                        <xsl:value-of select="old_ref/f" />.<xsl:value-of select="old_ref/a" />.<xsl:value-of select="old_ref/c" />
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:value-of select="old_ref" />
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </w:t>
                                        </w:r>
                                    </w:p>
                                </w:tc>
                                <w:tc>
                                    <w:tcPr>
                                        <w:tcW w:w="2034"
                                               w:type="dxa" />
                                        <w:vAlign w:val="center" />
                                        <w:hideMark />
                                    </w:tcPr>
                                    <w:p>
                                        <w:pPr>
                                            <w:rPr>
                                                <w:rFonts w:ascii="Public Sans"
                                                          w:hAnsi="Public Sans" />
                                                <w:color w:val="000000" />
                                                <w:sz w:val="22" />
                                                <w:szCs w:val="22" />
                                            </w:rPr>
                                        </w:pPr>
                                        <w:r>
                                            <w:rPr>
                                                <w:rFonts w:ascii="Public Sans"
                                                          w:hAnsi="Public Sans" />
                                                <w:color w:val="000000" />
                                                <w:sz w:val="22" />
                                                <w:szCs w:val="22" />
                                            </w:rPr>
                                            <w:t>
                                                <xsl:value-of select="new_ref" />
                                            </w:t>
                                        </w:r>
                                    </w:p>
                                </w:tc>
                                <w:tc>
                                    <w:tcPr>
                                        <w:tcW w:w="3120"
                                               w:type="dxa" />
                                        <w:vAlign w:val="center" />
                                        <w:hideMark />
                                    </w:tcPr>
                                    <w:p>
                                        <w:pPr>
                                            <w:rPr>
                                                <w:rFonts w:ascii="Public Sans"
                                                          w:hAnsi="Public Sans" />
                                                <w:color w:val="000000" />
                                                <w:sz w:val="22" />
                                                <w:szCs w:val="22" />
                                            </w:rPr>
                                        </w:pPr>
                                        <w:r w:rsidRPr="00163291">
                                            <w:rPr>
                                                <w:rFonts w:ascii="Public Sans"
                                                          w:hAnsi="Public Sans" />
                                                <w:color w:val="000000" />
                                                <w:sz w:val="22" />
                                                <w:szCs w:val="22" />
                                            </w:rPr>
                                            <w:t>
                                                <xsl:value-of select="func_ac" />
                                            </w:t>
                                        </w:r>
                                    </w:p>
                                </w:tc>
                                <w:tc>
                                    <w:tcPr>
                                        <w:tcW w:w="4416"
                                               w:type="dxa" />
                                        <w:vAlign w:val="center" />
                                        <w:hideMark />
                                    </w:tcPr>
                                    <w:p w14:paraId="09BF73C2"
                                         w14:textId="77777777"
                                         w:rsidR="005F53F8"
                                         w:rsidRPr="00163291"
                                         w:rsidRDefault="005F53F8"
                                         w:rsidP="00272B44">
                                        <w:pPr>
                                            <w:rPr>
                                                <w:rFonts w:ascii="Public Sans"
                                                          w:hAnsi="Public Sans" />
                                                <w:color w:val="000000" />
                                                <w:sz w:val="22" />
                                                <w:szCs w:val="22" />
                                            </w:rPr>
                                        </w:pPr>
                                        <w:r w:rsidRPr="00163291">
                                            <w:rPr>
                                                <w:rFonts w:ascii="Public Sans"
                                                          w:hAnsi="Public Sans" />
                                                <w:color w:val="000000" />
                                                <w:sz w:val="22" />
                                                <w:szCs w:val="22" />
                                            </w:rPr>
                                            <w:t>
                                                <xsl:value-of select="comment" />
                                            </w:t>
                                        </w:r>
                                    </w:p>
                                </w:tc>
                            </w:tr>
                        </xsl:for-each>
                    </xsl:for-each>
                </w:tbl>
                <w:p w14:paraId="1A126AF8"
                     w14:textId="77777777"
                     w:rsidR="00FE0449"
                     w:rsidRPr="00163291"
                     w:rsidRDefault="00FE0449"
                     w:rsidP="005F53F8">
                    <w:pPr>
                        <w:rPr>
                            <w:rFonts w:ascii="Public Sans"
                                      w:hAnsi="Public Sans" />
                        </w:rPr>
                    </w:pPr>
                </w:p>
                <w:sectPr w:rsidR="00FE0449"
                          w:rsidRPr="00163291"
                          w:rsidSect="009E216D">
                    <w:headerReference w:type="default"
                                       r:id="rId10" />
                    <w:footerReference w:type="even"
                                       r:id="rId11" />
                    <w:footerReference w:type="default"
                                       r:id="rId12" />
                    <w:pgSz w:w="12240"
                            w:h="15840" />
                    <w:pgMar w:top="720"
                             w:right="720"
                             w:bottom="720"
                             w:left="720"
                             w:header="720"
                             w:footer="720"
                             w:gutter="0" />
                    <w:cols w:space="720" />
                    <w:docGrid w:linePitch="272" />
                </w:sectPr>
            </w:body>
        </w:document>
    </xsl:template>
</xsl:stylesheet>