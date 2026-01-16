<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rda="http://www.records.nsw.gov.au/schemas/RDA"
    xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
    version="1.0">
    <xsl:include href="disposal_word.xsl" />
    <xsl:include href="render_word.xsl" />
    <xsl:template name="render_authority">
        <xsl:apply-templates select="rda:Term | rda:Class" />
    </xsl:template>
    <xsl:template match="rda:Term">
        <xsl:variable name="number">
            <xsl:number format="1"
                value="position()" />
        </xsl:variable>
        <w:p>
            <w:pPr>
                <xsl:choose>
                    <xsl:when test="parent::rda:Authority">
                        <w:pStyle w:val="Heading1" />
                        <w:pageBreakBefore />
                        <w:spacing w:after="0" />
                    </xsl:when>
                    <xsl:otherwise>
                        <w:pStyle w:val="Heading2" />
                        <w:spacing w:after="0" />
                    </xsl:otherwise>
                </xsl:choose>
            </w:pPr>
            <w:bookmarkStart w:id="{$number}"
                w:name="{generate-id(.)}" />
            <xsl:if test="$APPRAISALREPORT = 'false'">
                <xsl:if test="ancestor-or-self::rda:Term[rda:ID]">
                    <xsl:variable name="id">
                        <xsl:call-template name="local_id">
                            <xsl:with-param name="node"
                                select="." />
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:if test="$id != $RDANO">
                        <w:r>
                            <w:t xml:space="preserve"><xsl:value-of select="concat($id, ' ')" /></w:t>
                        </w:r>
                    </xsl:if>
                </xsl:if>
                <xsl:if test="@itemno">
                    <w:r>
                        <w:t xml:space="preserve"><xsl:value-of select="concat(@itemno, ' ')" /></w:t>
                    </w:r>
                </xsl:if>
            </xsl:if>
            <w:r>
                <w:t>
                    <xsl:value-of select="rda:TermTitle" />
                </w:t>
            </w:r>
            <w:bookmarkEnd w:id="{$number}" />
        </w:p>
        <xsl:for-each select="rda:TermDescription">
            <xsl:apply-templates />
        </xsl:for-each>
        <xsl:apply-templates select="rda:Term | rda:Class" />
    </xsl:template>
    <xsl:template match="rda:Class">
        <xsl:variable name="breadcrumb">
            <xsl:for-each select="ancestor::rda:Term">
                <xsl:if test="parent::rda:Term">
                    <xsl:text> - </xsl:text>
                </xsl:if>
                <xsl:value-of select="rda:TermTitle" />
            </xsl:for-each>
        </xsl:variable>
        <xsl:if test="not(preceding-sibling::rda:Class)">
            <w:p>
                <w:pPr>
                    <w:spacing w:before="0"
                        w:after="0" />
                </w:pPr>
            </w:p>
            <xsl:text disable-output-escaping="yes">&lt;w:tbl&gt;</xsl:text>
            <w:tblPr>
                <xsl:choose>
                    <xsl:when test="$APPRAISALREPORT = 'true'">
                        <w:tblW w:w="5000" w:type="pct" />
                    </xsl:when>
                    <xsl:otherwise>
                        <w:tblW w:w="9072"
                            w:type="dxa" />
                    </xsl:otherwise>
                </xsl:choose>
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
            <xsl:choose>
                <xsl:when test="$APPRAISALREPORT = 'true'">
                    <w:tblGrid>
                        <w:gridCol w:w="1115" />
                        <w:gridCol w:w="6527" />
                        <w:gridCol w:w="2547" />
                    </w:tblGrid>
                </xsl:when>
                <xsl:otherwise>
                    <w:tblGrid>
                        <w:gridCol w:w="992" />
                        <w:gridCol w:w="5812" />
                        <w:gridCol w:w="2268" />
                    </w:tblGrid>
                </xsl:otherwise>
            </xsl:choose>

        </xsl:if>
        <w:tr>
            <w:trPr>
                <w:jc w:val="center" />
            </w:trPr>
            <w:tc>
                <w:tcPr>
                    <w:tcW w:w="992"
                        w:type="dxa" />
                    <xsl:if test="$SHOWJUSTIFICATION='true'">
                        <w:shd w:val="clear"
                            w:color="auto"
                            w:fill="F2F2F2"
                            w:themeFill="background1"
                            w:themeFillShade="F2" />
                    </xsl:if>
                </w:tcPr>
                <w:p>
                    <w:pPr>
                        <w:spacing w:after="0" />
                    </w:pPr>
                    <w:r>
                        <w:t>
                            <xsl:choose>
                                <xsl:when test="$APPRAISALREPORT = 'true'">
                                    <xsl:number level="any" />
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:if
                                        test="ancestor::rda:Term[rda:ID] | rda:ID">
                                        <xsl:variable name="id">
                                            <xsl:call-template name="local_id">
                                                <xsl:with-param name="node"
                                                    select="." />
                                            </xsl:call-template>
                                        </xsl:variable>
                                        <xsl:if test="$id != $RDANO">
                                            <xsl:value-of select="concat($id, ' ')" />
                                        </xsl:if>
                                    </xsl:if>
                                    <xsl:value-of select="@itemno" />
                                </xsl:otherwise>
                            </xsl:choose>
                        </w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:spacing w:after="0" />
                    </w:pPr>
                    <w:r>
                        <w:rPr>
                            <w:rStyle w:val="HiddenChar" />
                        </w:rPr>
                        <w:t>
                            <xsl:value-of select="$breadcrumb" />
                        </w:t>
                    </w:r>
                </w:p>
            </w:tc>
            <w:tc>
                <w:tcPr>
                    <w:tcW w:w="5812"
                        w:type="dxa" />
                    <xsl:if test="$SHOWJUSTIFICATION='true'">
                        <w:shd w:val="clear"
                            w:color="auto"
                            w:fill="F2F2F2"
                            w:themeFill="background1"
                            w:themeFillShade="F2" />
                    </xsl:if>
                </w:tcPr>
                <xsl:if test="rda:ClassTitle">
                    <w:p>
                        <w:r>
                            <w:rPr>
                                <w:b />
                            </w:rPr>
                            <w:t>
                                <xsl:value-of select="rda:ClassTitle" />
                            </w:t>
                        </w:r>
                    </w:p>
                </xsl:if>
                <xsl:if test="not(rda:ClassDescription)">
                    <w:p />
                </xsl:if>
                <xsl:for-each select="rda:ClassDescription">
                    <xsl:apply-templates />
                </xsl:for-each>
            </w:tc>
            <w:tc>
                <w:tcPr>
                    <w:tcW w:w="2268"
                        w:type="dxa" />
                    <xsl:if test="$SHOWJUSTIFICATION='true'">
                        <w:shd w:val="clear"
                            w:color="auto"
                            w:fill="F2F2F2"
                            w:themeFill="background1"
                            w:themeFillShade="F2" />
                    </xsl:if>
                </w:tcPr>
                <xsl:if test="not(rda:Disposal[not(rda:DisposalCondition='Automated')])">
                    <w:p />
                </xsl:if>
                <xsl:call-template name="disposal_action">
                    <xsl:with-param name="disposals"
                        select="rda:Disposal" />
                </xsl:call-template>
            </w:tc>
        </w:tr>
        <xsl:if test="$SHOWJUSTIFICATION='true' and rda:Justification">
            <w:tr>
                <w:trPr>
                    <w:jc w:val="center" />
                </w:trPr>
                <w:tc>
                    <w:tcPr>
                        <w:tcW w:w="9072"
                            w:type="dxa" />
                        <w:gridSpan w:val="3" />
                    </w:tcPr>
                    <xsl:for-each select="rda:Justification">
                        <xsl:for-each select="rda:Paragraph">
                            <xsl:if test="position() = 1">
                                <w:p>
                                    <w:pPr>
                                        <w:spacing w:after="0" />
                                    </w:pPr>
                                    <w:r>
                                        <w:rPr>
                                            <w:b />
                                        </w:rPr>
                                        <w:t>Basis for decision</w:t>
                                    </w:r>
                                </w:p>
                            </xsl:if>
                            <w:p>
                                <xsl:apply-templates />
                            </w:p>
                        </xsl:for-each>
                    </xsl:for-each>
                </w:tc>
            </w:tr>
        </xsl:if>
        <xsl:if test="not(following-sibling::rda:Class)">
            <xsl:text disable-output-escaping="yes">&lt;/w:tbl&gt;</xsl:text>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>