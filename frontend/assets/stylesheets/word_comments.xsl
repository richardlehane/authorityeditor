<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:rda="http://www.records.nsw.gov.au/schemas/RDA"
                xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
                version="1.0">
    <xsl:output method="xml"
                indent="yes" />
    <xsl:include href="include/stocks.xsl" />
    <xsl:include href="include/render_word.xsl" />
    <xsl:template match="rda:Authority">
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
                <w:p>
                    <w:pPr>
                        <w:pStyle w:val="Heading2" />
                        <w:rPr>
                            <w:color w:val="002060" />
                            <w:sz w:val="24" />
                            <w:szCs w:val="22" />
                        </w:rPr>
                    </w:pPr>
                    <w:r>
                        <w:rPr>
                            <w:color w:val="002060" />
                            <w:sz w:val="24" />
                            <w:szCs w:val="22" />
                        </w:rPr>
                        <w:t>
                            <xsl:text>Comments on </xsl:text>
                            <xsl:value-of select="$DRAFT_AGENCIES" />
                            <xsl:text> draft</xsl:text>
                        </w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:pStyle w:val="Heading2" />
                        <w:rPr>
                            <w:color w:val="002060" />
                        </w:rPr>
                    </w:pPr>
                    <w:r>
                        <w:rPr>
                            <w:color w:val="002060" />
                        </w:rPr>
                        <w:t>
                            <xsl:text>Version </xsl:text>
                            <xsl:value-of select="$DRAFT_VERSION" />
                            <xsl:text> - submitted </xsl:text>
                            <xsl:value-of select="$DRAFT_DATE" />
                        </w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:r>
                        <w:t>
                            <xsl:text>This document outlines State Records NSW’s feedback on the draft functional retention and disposal authority developed by </xsl:text>
                            <xsl:value-of select="$DRAFT_AGENCIES" />
                            <xsl:text>. Please also see the suggested changes in the amended authority.</xsl:text>
                        </w:t>
                    </w:r>
                </w:p>
                <xsl:if test="rda:Comment[@author='SRNSW']">
                    <w:p>
                        <w:pPr>
                            <w:rPr>
                                <w:b />
                                <w:u w:val="single" />
                            </w:rPr>
                        </w:pPr>
                        <w:r>
                            <w:rPr>
                                <w:b />
                                <w:u w:val="single" />
                            </w:rPr>
                            <w:t>GENERAL COMMENTS</w:t>
                        </w:r>
                    </w:p>
                </xsl:if>
                <xsl:apply-templates select="rda:Comment[@author='SRNSW']" />
                <xsl:if test="//rda:Term/rda:Comment[@author='SRNSW'] or //rda:Class/rda:Comment[@author='SRNSW']">
                    <w:p>
                        <w:pPr>
                            <w:rPr>
                                <w:b />
                                <w:u w:val="single" />
                            </w:rPr>
                        </w:pPr>
                        <w:r>
                            <w:rPr>
                                <w:b />
                                <w:u w:val="single" />
                            </w:rPr>
                            <w:t>SPECIFIC COMMENTS – FUNCTIONS AND ACTIVITIES</w:t>
                        </w:r>
                    </w:p>
                </xsl:if>
                <xsl:apply-templates select="//rda:Term[rda:Comment/@author='SRNSW'] | //rda:Class[rda:Comment/@author='SRNSW']" />
                <w:sectPr>
                    <w:headerReference w:type="default"
                                       r:id="rId7" />
                    <w:footerReference w:type="even"
                                       r:id="rId8" />
                    <w:footerReference w:type="default"
                                       r:id="rId9" />
                    <w:headerReference w:type="first"
                                       r:id="rId10" />
                    <w:footerReference w:type="first"
                                       r:id="rId11" />
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
    <xsl:template match="rda:Term | rda:Class">
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
                <w:t>
                    <xsl:call-template name="build_address_with_itemno">
                        <xsl:with-param name="node"
                                        select="." />
                    </xsl:call-template>
                </w:t>
            </w:r>
        </w:p>
        <xsl:for-each select="rda:Comment[@author='SRNSW']">
            <xsl:apply-templates select="rda:Paragraph" />
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>