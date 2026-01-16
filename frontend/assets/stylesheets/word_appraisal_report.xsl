<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:exslt="http://exslt.org/common"
    xmlns:rda="http://www.records.nsw.gov.au/schemas/RDA"
    xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
    version="1.0">
    <xsl:output method="xml"
        indent="yes" />
    <xsl:include href="include/stocks.xsl" />
    <xsl:include href="include/word_authority.xsl" />
    <xsl:include href="include/word_contents.xsl" />
    <xsl:variable name="APPRAISALREPORT">
        <xsl:value-of select="'true'" />
    </xsl:variable>
    <xsl:variable name="SHOWJUSTIFICATION">
        <xsl:value-of select="'true'" />
    </xsl:variable>
    <xsl:variable name="SHOWSEEREF">
        <xsl:value-of select="'false'" />
    </xsl:variable>
    <xsl:variable name="AUTHORITY_TITLE">
        <xsl:choose>
            <xsl:when test="rda:Authority/rda:AuthorityTitle">
                <xsl:value-of select="rda:Authority/rda:AuthorityTitle" />
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="camel_case">
                    <xsl:with-param name="string" select="$SCOPE" />
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:if test="//rda:Agency">
            <xsl:value-of select="concat(' (', $AGENCY_NAMES, ')')" />
        </xsl:if>
    </xsl:variable>
    <xsl:variable name="SHORT_TITLE">
        <xsl:choose>
            <xsl:when test="rda:Authority/rda:AuthorityTitle">
                <xsl:value-of select="rda:Authority/rda:AuthorityTitle" />
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="camel_case">
                    <xsl:with-param name="string" select="$SCOPE" />
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <xsl:template match="rda:Context">
        <xsl:if test="not(rda:ContextContent)">
            <w:p />
        </xsl:if>
        <xsl:for-each select="rda:ContextContent">
            <xsl:apply-templates select="rda:Paragraph" />
        </xsl:for-each>
    </xsl:template>
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
                        <w:keepNext w:val="0" />
                        <w:widowControl w:val="0" />
                        <w:rPr>
                            <w:rStyle w:val="ARSubtitleCaption" />
                        </w:rPr>
                    </w:pPr>
                    <w:r>
                        <w:rPr>
                            <w:rStyle w:val="ARTitle" />
                        </w:rPr>
                        <w:t xml:space="preserve">Appraisal Report – </w:t>
                    </w:r>
                    <xsl:if test="rda:Status/rda:Amended">
                        <w:r>
                            <w:rPr>
                                <w:rStyle w:val="ARTitle" />
                            </w:rPr>
                            <w:t xml:space="preserve">Amended </w:t>
                        </w:r>
                    </xsl:if>
                    <w:r>
                        <w:rPr>
                            <w:rStyle w:val="ARTitle" />
                        </w:rPr>
                        <w:t>Retention and Disposal Authority</w:t>
                    </w:r>
                    <w:r>
                        <w:rPr>
                            <w:rStyle w:val="ARTitle" />
                        </w:rPr>
                        <w:br />
                    </w:r>
                    <w:r>
                        <w:rPr>
                            <w:rStyle w:val="ARSubtitle" />
                        </w:rPr>
                        <w:t>
                            <xsl:value-of select="$ARNO" />
                        </w:t>
                    </w:r>
                    <w:r>
                        <w:rPr>
                            <w:rStyle w:val="ARSubtitle" />
                        </w:rPr>
                        <w:t xml:space="preserve"> </w:t>
                    </w:r>
                    <w:r>
                        <w:rPr>
                            <w:rStyle w:val="ARSubtitle" />
                        </w:rPr>
                        <w:t>
                            <xsl:value-of select="$AUTHORITY_TITLE" />
                        </w:t>
                    </w:r>
                    <w:r>
                        <w:rPr>
                            <w:rStyle w:val="ARSubtitleCaption" />
                        </w:rPr>
                        <w:br />
                        <w:t>Prepared by:</w:t>
                    </w:r>
                    <w:r>
                        <w:rPr>
                            <w:rStyle w:val="ARSubtitleCaption" />
                        </w:rPr>
                        <w:tab />
                    </w:r>
                    <w:r>
                        <w:rPr>
                            <w:rStyle w:val="ARSubtitleCaption" />
                        </w:rPr>
                        <w:tab />
                    </w:r>
                    <w:r>
                        <w:rPr>
                            <w:rStyle w:val="ARSubtitleCaption" />
                        </w:rPr>
                        <w:t xml:space="preserve">[NAME, TITLE], State Records NSW</w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:keepNext w:val="0" />
                        <w:widowControl w:val="0" />
                        <w:ind w:left="1701"
                            w:firstLine="567" />
                        <w:rPr>
                            <w:rStyle w:val="ARSubtitleCaption" />
                        </w:rPr>
                    </w:pPr>
                    <w:r>
                        <w:rPr>
                            <w:rStyle w:val="ARSubtitleCaption" />
                        </w:rPr>
                        <w:t xml:space="preserve">[NAME, TITLE], State Records NSW</w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:keepNext w:val="0" />
                        <w:widowControl w:val="0" />
                        <w:rPr>
                            <w:rStyle w:val="ARSubtitleCaption" />
                        </w:rPr>
                    </w:pPr>
                    <w:r>
                        <w:rPr>
                            <w:rStyle w:val="ARSubtitleCaption" />
                        </w:rPr>
                        <w:t xml:space="preserve">Approved by: </w:t>
                    </w:r>
                    <w:r>
                        <w:rPr>
                            <w:rStyle w:val="ARSubtitleCaption" />
                        </w:rPr>
                        <w:tab />
                    </w:r>
                    <w:r>
                        <w:rPr>
                            <w:rStyle w:val="ARSubtitleCaption" />
                        </w:rPr>
                        <w:tab />
                        <w:t xml:space="preserve">Laura Baldwin, Manager, Policy and Advice, State Records NSW</w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:keepNext w:val="0" />
                        <w:widowControl w:val="0" />
                        <w:ind w:left="1701"
                            w:firstLine="567" />
                        <w:rPr>
                            <w:rStyle w:val="ARSubtitleCaption" />
                        </w:rPr>
                    </w:pPr>
                    <w:r>
                        <w:rPr>
                            <w:rStyle w:val="ARSubtitleCaption" />
                        </w:rPr>
                        <w:t xml:space="preserve">Martyn Killion, Executive Director, State Records NSW</w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:keepNext w:val="0" />
                        <w:widowControl w:val="0" />
                        <w:ind w:left="1701"
                            w:firstLine="567" />
                        <w:rPr>
                            <w:rStyle w:val="ARSubtitleCaption" />
                        </w:rPr>
                    </w:pPr>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:keepNext w:val="0" />
                        <w:widowControl w:val="0" />
                    </w:pPr>
                    <w:r>
                        <w:rPr>
                            <w:rStyle w:val="ARSubtitleCaption" />
                        </w:rPr>
                        <w:t xml:space="preserve">Recommendation: For Approval</w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:pStyle w:val="ARItem" />
                        <w:keepNext w:val="0" />
                        <w:widowControl w:val="0" />
                        <w:tabs>
                            <w:tab w:val="right"
                                w:pos="10205" />
                        </w:tabs>
                        <w:jc w:val="left" />
                        <w:rPr>
                            <w:sz w:val="25" />
                            <w:szCs w:val="25" />
                        </w:rPr>
                    </w:pPr>
                    <w:r>
                        <w:rPr>
                            <w:sz w:val="25" />
                            <w:szCs w:val="25" />
                        </w:rPr>
                        <w:t xml:space="preserve">Folder: <xsl:value-of select="$SRFILENO" /></w:t>
                    </w:r>
                    <w:r>
                        <w:rPr>
                            <w:sz w:val="25" />
                            <w:szCs w:val="25" />
                        </w:rPr>
                        <w:tab />
                    </w:r>
                    <w:r>
                        <w:rPr>
                            <w:sz w:val="25" />
                            <w:szCs w:val="25" />
                        </w:rPr>
                        <w:t xml:space="preserve">Item [X.X]</w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:pStyle w:val="ARH1" />
                        <w:keepNext w:val="0" />
                        <w:widowControl w:val="0" />
                    </w:pPr>
                    <w:r>
                        <w:t>Background</w:t>
                    </w:r>
                </w:p>
                <xsl:apply-templates select="rda:Context[@type='background']" />
                <w:p>
                    <w:pPr>
                        <w:pStyle w:val="ARH1" />
                        <w:keepNext w:val="0" />
                        <w:widowControl w:val="0" />
                    </w:pPr>
                    <w:r>
                        <w:t>Submission</w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:keepNext w:val="0" />
                        <w:widowControl w:val="0" />
                    </w:pPr>
                    <w:r>
                        <w:t xml:space="preserve">Request for approval of </w:t>
                    </w:r>
                    <xsl:choose>
                        <xsl:when test="rda:Status/rda:Amended">
                            <w:r>
                                <w:t xml:space="preserve">amendments to </w:t>
                            </w:r>
                            <w:r>
                                <w:t xml:space="preserve"><xsl:value-of select="$RDANO"/> </w:t>
                            </w:r>
                        </xsl:when>
                        <xsl:otherwise>
                            <w:r>
                                <w:t xml:space="preserve">a retention and disposal authority </w:t>
                            </w:r>
                        </xsl:otherwise>
                    </xsl:choose>
                    <w:r>
                        <w:t xml:space="preserve">covering </w:t>
                    </w:r>
                    <w:r>
                        <w:t>
                            <xsl:value-of select="$AGENCY_NAMES" />
                        </w:t>
                    </w:r>
                    <w:r>
                        <w:t>.</w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:pStyle w:val="ARH1" />
                        <w:keepNext w:val="0" />
                        <w:widowControl w:val="0" />
                    </w:pPr>
                    <w:r>
                        <w:t>Issue</w:t>
                    </w:r>
                </w:p>
                <xsl:apply-templates select="rda:Context[@type='issue']" />
                <w:p>
                    <w:pPr>
                        <w:pStyle w:val="ARH1" />
                        <w:keepNext w:val="0" />
                        <w:widowControl w:val="0" />
                    </w:pPr>
                    <w:r>
                        <w:t>Recommendation</w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:keepNext w:val="0" />
                        <w:widowControl w:val="0" />
                    </w:pPr>
                    <w:r>
                        <w:t xml:space="preserve">The Board </w:t>
                    </w:r>
                    <w:r>
                        <w:rPr>
                            <w:b />
                        </w:rPr>
                        <w:t>approve</w:t>
                    </w:r>
                    <w:r>
                        <w:t xml:space="preserve"> this report with the corresponding attachment.</w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:pStyle w:val="ARH1" />
                        <w:keepNext w:val="0" />
                        <w:widowControl w:val="0" />
                    </w:pPr>
                    <w:r>
                        <w:t>Attachments</w:t>
                    </w:r>
                </w:p>
                <w:tbl>
                    <w:tblPr>
                        <w:tblW w:w="5000"
                            w:type="pct" />
                        <w:tblBorders>
                            <w:insideH w:val="single"
                                w:sz="6"
                                w:space="0"
                                w:color="BAECFF" />
                            <w:insideV w:val="single"
                                w:sz="6"
                                w:space="0"
                                w:color="BAECFF" />
                        </w:tblBorders>
                        <w:tblLook w:val="04A0"
                            w:firstRow="1"
                            w:lastRow="0"
                            w:firstColumn="1"
                            w:lastColumn="0"
                            w:noHBand="0"
                            w:noVBand="1" />
                    </w:tblPr>
                    <w:tblGrid>
                        <w:gridCol w:w="1612" />
                        <w:gridCol w:w="8593" />
                    </w:tblGrid>
                    <w:tr>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="790"
                                    w:type="pct" />
                                <w:tcBorders>
                                    <w:top w:val="nil" />
                                    <w:left w:val="nil" />
                                    <w:bottom w:val="single"
                                        w:sz="4"
                                        w:space="0"
                                        w:color="auto" />
                                    <w:right w:val="single"
                                        w:sz="4"
                                        w:space="0"
                                        w:color="auto" />
                                </w:tcBorders>
                                <w:shd w:val="clear"
                                    w:color="auto"
                                    w:fill="002060" />
                                <w:tcMar>
                                    <w:left w:w="108"
                                        w:type="dxa" />
                                </w:tcMar>
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:keepNext w:val="0" />
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="120"
                                        w:line="240"
                                        w:lineRule="atLeast" />
                                    <w:jc w:val="both" />
                                    <w:rPr>
                                        <w:rFonts w:cs="Arial" />
                                        <w:szCs w:val="22" />
                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>
                                        <w:rFonts w:cs="Arial" />
                                        <w:szCs w:val="22" />
                                    </w:rPr>
                                    <w:t>Attachment</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="4210"
                                    w:type="pct" />
                                <w:tcBorders>
                                    <w:top w:val="nil" />
                                    <w:left w:val="single"
                                        w:sz="4"
                                        w:space="0"
                                        w:color="auto" />
                                    <w:bottom w:val="single"
                                        w:sz="4"
                                        w:space="0"
                                        w:color="auto" />
                                    <w:right w:val="nil" />
                                </w:tcBorders>
                                <w:shd w:val="clear"
                                    w:color="auto"
                                    w:fill="002060" />
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:keepNext w:val="0" />
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="120"
                                        w:line="240"
                                        w:lineRule="atLeast" />
                                    <w:jc w:val="both" />
                                    <w:rPr>
                                        <w:rFonts w:cs="Arial" />
                                        <w:szCs w:val="22" />
                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>
                                        <w:rFonts w:cs="Arial" />
                                        <w:szCs w:val="22" />
                                    </w:rPr>
                                    <w:t>Title</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                    </w:tr>
                    <w:tr>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="790"
                                    w:type="pct" />
                                <w:tcBorders>
                                    <w:top w:val="single"
                                        w:sz="4"
                                        w:space="0"
                                        w:color="auto" />
                                    <w:bottom w:val="single"
                                        w:sz="4"
                                        w:space="0"
                                        w:color="auto" />
                                    <w:right w:val="single"
                                        w:sz="4"
                                        w:space="0"
                                        w:color="auto" />
                                </w:tcBorders>
                                <w:shd w:val="clear"
                                    w:color="auto"
                                    w:fill="auto" />
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:keepNext w:val="0" />
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="120"
                                        w:line="240"
                                        w:lineRule="atLeast" />
                                    <w:jc w:val="center" />
                                    <w:rPr>
                                        <w:rFonts w:cs="Arial" />
                                        <w:szCs w:val="22" />
                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>
                                        <w:rFonts w:cs="Arial" />
                                        <w:szCs w:val="22" />
                                    </w:rPr>
                                    <w:t>[X.X - A]</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="4210"
                                    w:type="pct" />
                                <w:tcBorders>
                                    <w:top w:val="single"
                                        w:sz="4"
                                        w:space="0"
                                        w:color="auto" />
                                    <w:left w:val="single"
                                        w:sz="4"
                                        w:space="0"
                                        w:color="auto" />
                                    <w:bottom w:val="single"
                                        w:sz="4"
                                        w:space="0"
                                        w:color="auto" />
                                </w:tcBorders>
                                <w:shd w:val="clear"
                                    w:color="auto"
                                    w:fill="auto" />
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:keepNext w:val="0" />
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="120"
                                        w:line="240"
                                        w:lineRule="atLeast" />
                                    <w:jc w:val="both" />
                                    <w:rPr>
                                        <w:rFonts w:cs="Arial" />
                                        <w:szCs w:val="22" />
                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>
                                        <w:rFonts
                                            w:cs="Arial" />
                                        <w:szCs w:val="22" />
                                    </w:rPr>
                                    <w:t xml:space="preserve">Appraisal Report </w:t>
                                </w:r>
                                <w:r>
                                    <w:rPr>
                                        <w:rFonts
                                            w:cs="Arial" />
                                        <w:szCs w:val="22" />
                                    </w:rPr>
                                    <w:t>
                                        <xsl:value-of select="(rda:ID/@control='AR')[last()]" />
                                    </w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                    </w:tr>
                </w:tbl>
                <w:p>
                    <w:pPr>
                        <w:keepNext w:val="0" />
                        <w:widowControl w:val="0" />
                        <w:rPr>
                            <w:b />
                        </w:rPr>
                        <w:sectPr>
                            <w:footerReference w:type="default"
                                r:id="rId12" />
                            <w:headerReference w:type="first"
                                r:id="rId13" />
                            <w:footerReference w:type="first"
                                r:id="rId14" />
                            <w:pgSz w:w="11907"
                                w:h="16840"
                                w:code="9" />
                            <w:pgMar w:top="851"
                                w:right="851"
                                w:bottom="1276"
                                w:left="851"
                                w:header="567"
                                w:footer="567"
                                w:gutter="0" />
                            <w:paperSrc w:first="7"
                                w:other="7" />
                            <w:cols w:space="720" />
                            <w:titlePg />
                        </w:sectPr>
                    </w:pPr>
                </w:p>
                <xsl:if
                    test="count(//rda:Term)&gt;5">
                    <xsl:call-template name="render_contents" />
                    <w:p>
                        <w:pPr>
                            <w:keepNext w:val="0" />
                            <w:widowControl w:val="0" />
                            <w:rPr>
                                <w:b />
                            </w:rPr>
                            <w:sectPr>
                                <w:footerReference w:type="default"
                                    r:id="rId16" />
                                <w:headerReference w:type="first"
                                    r:id="rId21" />
                                <w:headerReference w:type="default"
                                    r:id="rId22" />
                                <w:footerReference w:type="first"
                                    r:id="rId18" />
                                <w:pgSz w:w="11907"
                                    w:h="16840"
                                    w:code="9" />
                                <w:pgMar w:top="851"
                                    w:right="851"
                                    w:bottom="1276"
                                    w:left="851"
                                    w:header="567"
                                    w:footer="567"
                                    w:gutter="0" />
                                <w:paperSrc w:first="7"
                                    w:other="7" />
                                <w:cols w:space="720" />
                                <w:titlePg />
                            </w:sectPr>
                        </w:pPr>
                    </w:p>
                </xsl:if>
                <xsl:call-template name="render_authority" />
                <w:sectPr w:rsidR="008F6A94"
                    w:rsidSect="007B69F9">
                    <w:headerReference w:type="default"
                        r:id="rId15" />
                    <w:footerReference w:type="default"
                        r:id="rId16" />
                    <w:headerReference w:type="first"
                        r:id="rId17" />
                    <w:footerReference w:type="first"
                        r:id="rId18" />
                    <w:pgSz w:w="11907"
                        w:h="16840"
                        w:code="9" />
                    <w:pgMar w:top="851"
                        w:right="851"
                        w:bottom="1276"
                        w:left="851"
                        w:header="567"
                        w:footer="567"
                        w:gutter="0" />
                    <w:paperSrc w:first="7"
                        w:other="7" />
                    <w:cols w:space="720" />
                    <w:titlePg />
                </w:sectPr>
            </w:body>
        </w:document>
    </xsl:template>
</xsl:stylesheet>