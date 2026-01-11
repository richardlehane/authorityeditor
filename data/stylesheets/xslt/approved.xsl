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
    <xsl:variable name="SHOWSEEREF">
        <xsl:value-of select="'true'" />
    </xsl:variable>
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
                        <w:keepLines />
                        <w:widowControl w:val="0" />
                        <w:tabs>
                            <w:tab w:val="left"
                                w:pos="1020" />
                        </w:tabs>
                        <w:spacing w:before="0"
                            w:after="80" />
                        <w:outlineLvl w:val="0" />
                        <w:rPr>
                            <w:color w:val="001C4A" />
                            <w:sz w:val="56" />
                            <w:szCs w:val="56" />
                        </w:rPr>
                    </w:pPr>
                    <w:r>
                        <w:rPr>
                            <w:noProof />
                        </w:rPr>
                        <w:drawing>
                            <wp:anchor distT="0"
                                distB="0"
                                distL="114300"
                                distR="114300"
                                simplePos="0"
                                relativeHeight="251660288"
                                behindDoc="0"
                                locked="0"
                                layoutInCell="1"
                                allowOverlap="1"
                                wp14:anchorId="00A7D822"
                                wp14:editId="421B301F">
                                <wp:simplePos x="0"
                                    y="0" />
                                <wp:positionH relativeFrom="margin">
                                    <wp:align>right</wp:align>
                                </wp:positionH>
                                <wp:positionV relativeFrom="page">
                                    <wp:posOffset>809625</wp:posOffset>
                                </wp:positionV>
                                <wp:extent cx="856615"
                                    cy="930846" />
                                <wp:effectExtent l="0"
                                    t="0"
                                    r="635"
                                    b="3175" />
                                <wp:wrapNone />
                                <wp:docPr id="5"
                                    name="Picture 2"
                                    descr="NSW Government Logo" />
                                <wp:cNvGraphicFramePr>
                                    <a:graphicFrameLocks
                                        xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main"
                                        noChangeAspect="1" />
                                </wp:cNvGraphicFramePr>
                                <a:graphic
                                    xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main">
                                    <a:graphicData
                                        uri="http://schemas.openxmlformats.org/drawingml/2006/picture">
                                        <pic:pic
                                            xmlns:pic="http://schemas.openxmlformats.org/drawingml/2006/picture">
                                            <pic:nvPicPr>
                                                <pic:cNvPr id="0"
                                                    name="Picture 2"
                                                    descr="NSW Government Logo" />
                                                <pic:cNvPicPr>
                                                    <a:picLocks noChangeAspect="1"
                                                        noChangeArrowheads="1" />
                                                </pic:cNvPicPr>
                                            </pic:nvPicPr>
                                            <pic:blipFill>
                                                <a:blip r:embed="rId11"
                                                    cstate="print">
                                                    <a:extLst>
                                                        <a:ext
                                                            uri="{28A0092B-C50C-407E-A947-70E740481C1C}">
                                                            <a14:useLocalDpi
                                                                xmlns:a14="http://schemas.microsoft.com/office/drawing/2010/main"
                                                                val="0" />
                                                        </a:ext>
                                                    </a:extLst>
                                                </a:blip>
                                                <a:srcRect />
                                                <a:stretch>
                                                    <a:fillRect />
                                                </a:stretch>
                                            </pic:blipFill>
                                            <pic:spPr bwMode="auto">
                                                <a:xfrm>
                                                    <a:off x="0"
                                                        y="0" />
                                                    <a:ext cx="856615"
                                                        cy="930846" />
                                                </a:xfrm>
                                                <a:prstGeom prst="rect">
                                                    <a:avLst />
                                                </a:prstGeom>
                                                <a:noFill />
                                                <a:ln>
                                                    <a:noFill />
                                                </a:ln>
                                            </pic:spPr>
                                        </pic:pic>
                                    </a:graphicData>
                                </a:graphic>
                                <wp14:sizeRelH relativeFrom="page">
                                    <wp14:pctWidth>0</wp14:pctWidth>
                                </wp14:sizeRelH>
                                <wp14:sizeRelV relativeFrom="page">
                                    <wp14:pctHeight>0</wp14:pctHeight>
                                </wp14:sizeRelV>
                            </wp:anchor>
                        </w:drawing>
                    </w:r>
                    <w:r>
                        <w:rPr>
                            <w:color w:val="001C4A" />
                            <w:sz w:val="56" />
                            <w:szCs w:val="56" />
                        </w:rPr>
                        <w:tab />
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:keepLines />
                        <w:widowControl w:val="0" />
                        <w:tabs>
                            <w:tab w:val="left"
                                w:pos="1020" />
                        </w:tabs>
                        <w:spacing w:before="0"
                            w:after="80" />
                        <w:outlineLvl w:val="0" />
                        <w:rPr>
                            <w:color w:val="001C4A" />
                            <w:sz w:val="56" />
                            <w:szCs w:val="56" />
                        </w:rPr>
                    </w:pPr>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0" />
                        <w:rPr>
                            <w:sz w:val="32" />
                            <w:szCs w:val="32" />
                        </w:rPr>
                    </w:pPr>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0" />
                        <w:rPr>
                            <w:b />
                            <w:sz w:val="40" />
                        </w:rPr>
                    </w:pPr>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:tabs>
                            <w:tab w:val="left"
                                w:pos="2970" />
                        </w:tabs>
                        <w:spacing w:before="0" />
                        <w:rPr>
                            <w:b />
                            <w:sz w:val="40" />
                        </w:rPr>
                    </w:pPr>
                    <w:r>
                        <w:rPr>
                            <w:b />
                            <w:sz w:val="40" />
                        </w:rPr>
                        <w:tab />
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0" />
                        <w:rPr>
                            <w:b />
                            <w:sz w:val="40" />
                        </w:rPr>
                    </w:pPr>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0" />
                        <w:rPr>
                            <w:b />
                            <w:sz w:val="40" />
                        </w:rPr>
                    </w:pPr>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0" />
                        <w:rPr>
                            <w:b />
                            <w:sz w:val="40" />
                        </w:rPr>
                    </w:pPr>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0" />
                        <w:rPr>
                            <w:bCs />
                            <w:color w:val="002060" />
                            <w:sz w:val="44" />
                            <w:szCs w:val="22" />
                        </w:rPr>
                    </w:pPr>
                    <w:r>
                        <w:rPr>
                            <w:bCs />
                            <w:noProof />
                            <w:color w:val="002060" />
                            <w:sz w:val="44" />
                            <w:szCs w:val="22" />
                        </w:rPr>
                        <mc:AlternateContent>
                            <mc:Choice Requires="wpg">
                                <w:drawing>
                                    <wp:anchor distT="0"
                                        distB="0"
                                        distL="114300"
                                        distR="114300"
                                        simplePos="0"
                                        relativeHeight="251661312"
                                        behindDoc="1"
                                        locked="0"
                                        layoutInCell="1"
                                        allowOverlap="1"
                                        wp14:anchorId="2811EFB4"
                                        wp14:editId="5325948C">
                                        <wp:simplePos x="0"
                                            y="0" />
                                        <wp:positionH relativeFrom="column">
                                            <wp:posOffset>-188049</wp:posOffset>
                                        </wp:positionH>
                                        <wp:positionV relativeFrom="paragraph">
                                            <wp:posOffset>280286</wp:posOffset>
                                        </wp:positionV>
                                        <wp:extent cx="6276178"
                                            cy="980898" />
                                        <wp:effectExtent l="0"
                                            t="0"
                                            r="29845"
                                            b="29210" />
                                        <wp:wrapNone />
                                        <wp:docPr id="46629071"
                                            name="Group 1" />
                                        <wp:cNvGraphicFramePr />
                                        <a:graphic
                                            xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main">
                                            <a:graphicData
                                                uri="http://schemas.microsoft.com/office/word/2010/wordprocessingGroup">
                                                <wpg:wgp>
                                                    <wpg:cNvGrpSpPr />
                                                    <wpg:grpSpPr>
                                                        <a:xfrm>
                                                            <a:off x="0"
                                                                y="0" />
                                                            <a:ext cx="6276178"
                                                                cy="980898" />
                                                            <a:chOff x="0"
                                                                y="0" />
                                                            <a:chExt cx="6276178"
                                                                cy="980898" />
                                                        </a:xfrm>
                                                    </wpg:grpSpPr>
                                                    <wps:wsp>
                                                        <wps:cNvPr id="510851205"
                                                            name="Straight Connector 2" />
                                                        <wps:cNvCnPr>
                                                            <a:cxnSpLocks />
                                                        </wps:cNvCnPr>
                                                        <wps:spPr>
                                                            <a:xfrm flipV="1">
                                                                <a:off x="10633"
                                                                    y="0" />
                                                                <a:ext cx="6265545"
                                                                    cy="13335" />
                                                            </a:xfrm>
                                                            <a:prstGeom prst="line">
                                                                <a:avLst />
                                                            </a:prstGeom>
                                                            <a:noFill />
                                                            <a:ln w="9525"
                                                                cap="flat"
                                                                cmpd="sng"
                                                                algn="ctr">
                                                                <a:solidFill>
                                                                    <a:srgbClr val="002664" />
                                                                </a:solidFill>
                                                                <a:prstDash val="solid" />
                                                            </a:ln>
                                                            <a:effectLst />
                                                        </wps:spPr>
                                                        <wps:bodyPr />
                                                    </wps:wsp>
                                                    <wps:wsp>
                                                        <wps:cNvPr id="1348298074"
                                                            name="Straight Connector 2" />
                                                        <wps:cNvCnPr>
                                                            <a:cxnSpLocks />
                                                        </wps:cNvCnPr>
                                                        <wps:spPr>
                                                            <a:xfrm flipV="1">
                                                                <a:off x="0"
                                                                    y="967563" />
                                                                <a:ext cx="6266180"
                                                                    cy="13335" />
                                                            </a:xfrm>
                                                            <a:prstGeom prst="line">
                                                                <a:avLst />
                                                            </a:prstGeom>
                                                            <a:noFill />
                                                            <a:ln w="9525"
                                                                cap="flat"
                                                                cmpd="sng"
                                                                algn="ctr">
                                                                <a:solidFill>
                                                                    <a:srgbClr val="002664" />
                                                                </a:solidFill>
                                                                <a:prstDash val="solid" />
                                                            </a:ln>
                                                            <a:effectLst />
                                                        </wps:spPr>
                                                        <wps:bodyPr />
                                                    </wps:wsp>
                                                </wpg:wgp>
                                            </a:graphicData>
                                        </a:graphic>
                                    </wp:anchor>
                                </w:drawing>
                            </mc:Choice>
                            <mc:Fallback>
                                <w:pict>
                                    <v:group w14:anchorId="76DB0E4F"
                                        id="Group 1"
                                        o:spid="_x0000_s1026"
                                        style="position:absolute;margin-left:-14.8pt;margin-top:22.05pt;width:494.2pt;height:77.25pt;z-index:-251655168"
                                        coordsize="62761,9808"
                                        o:gfxdata="UEsDBBQABgAIAAAAIQC2gziS/gAAAOEBAAATAAAAW0NvbnRlbnRfVHlwZXNdLnhtbJSRQU7DMBBF&#xA;90jcwfIWJU67QAgl6YK0S0CoHGBkTxKLZGx5TGhvj5O2G0SRWNoz/78nu9wcxkFMGNg6quQqL6RA&#xA;0s5Y6ir5vt9lD1JwBDIwOMJKHpHlpr69KfdHjyxSmriSfYz+USnWPY7AufNIadK6MEJMx9ApD/oD&#xA;OlTrorhX2lFEilmcO2RdNtjC5xDF9pCuTyYBB5bi6bQ4syoJ3g9WQ0ymaiLzg5KdCXlKLjvcW893&#xA;SUOqXwnz5DrgnHtJTxOsQfEKIT7DmDSUCaxw7Rqn8787ZsmRM9e2VmPeBN4uqYvTtW7jvijg9N/y&#xA;JsXecLq0q+WD6m8AAAD//wMAUEsDBBQABgAIAAAAIQA4/SH/1gAAAJQBAAALAAAAX3JlbHMvLnJl&#xA;bHOkkMFqwzAMhu+DvYPRfXGawxijTi+j0GvpHsDYimMaW0Yy2fr2M4PBMnrbUb/Q94l/f/hMi1qR&#xA;JVI2sOt6UJgd+ZiDgffL8ekFlFSbvV0oo4EbChzGx4f9GRdb25HMsYhqlCwG5lrLq9biZkxWOiqY&#xA;22YiTra2kYMu1l1tQD30/bPm3wwYN0x18gb45AdQl1tp5j/sFB2T0FQ7R0nTNEV3j6o9feQzro1i&#xA;OWA14Fm+Q8a1a8+Bvu/d/dMb2JY5uiPbhG/ktn4cqGU/er3pcvwCAAD//wMAUEsDBBQABgAIAAAA&#xA;IQATXja3VgIAAKQGAAAOAAAAZHJzL2Uyb0RvYy54bWzslUuP2yAQgO+V+h8Q98av2PFacfaQdHNZ&#xA;tStl2zvB2EbFgICNk3/fgbz2UfWwVXvqBQMzzONjBs9v94NAO2YsV7LGySTGiEmqGi67Gn97vPtU&#xA;YmQdkQ0RSrIaH5jFt4uPH+ajrliqeiUaZhAYkbYadY1753QVRZb2bCB2ojSTIGyVGYiDpemixpAR&#xA;rA8iSuO4iEZlGm0UZdbC7uooxItgv20ZdV/b1jKHRI0hNhdGE8atH6PFnFSdIbrn9BQGeUcUA+ES&#xA;nF5MrYgj6MnwN6YGTo2yqnUTqoZItS2nLOQA2STxq2zWRj3pkEtXjZ2+YAK0rzi92yz9slsbvdEP&#xA;BkiMugMWYeVz2bdm8F+IEu0DssMFGds7RGGzSGdFMoNLpiC7KePypjwypT2Af3OM9p9/fzA6u41e&#xA;BDNqKA97JWD/jMCmJ5oFsLYCAg8G8abGeRKXeZLGOUaSDFCsG2cI73qHlkpKKCVlUOqz89HAsaV8&#xA;MJ4P3cuNvlf0hwUZxP1M6BcW4J5xolZw/R0aBZxfwCZxkWUY/QpukedTCMfDTbIsy733CyJSaWPd&#xA;mqkB+UmNBZc+K1KR3b11R9Wzit+W6o4LAfukEhKNcGF56q0TaLxWEAfTQQMIKzuMiOigo6kzwaJV&#xA;gjf+tD9sTbddCoN2xHdVnBbF9BTYCzXvekVsf9QLopOakN4MC/15ivRKys+2qjmEkgw44eaP0P96&#xA;CSTZtEyhjGfTf1wD8Db5BipmeZF5SEDn0ihFkZQg/18EobvCUxi64PRs+7f2+TpoXX8ui58AAAD/&#xA;/wMAUEsDBBQABgAIAAAAIQCT4F/o4QAAAAoBAAAPAAAAZHJzL2Rvd25yZXYueG1sTI9Ba4NAEIXv&#xA;hf6HZQq9JatpImpcQwhtT6HQpFBy2+hEJe6suBs1/77TU3sc5uO972WbybRiwN41lhSE8wAEUmHL&#xA;hioFX8e3WQzCeU2lbi2hgjs62OSPD5lOSzvSJw4HXwkOIZdqBbX3XSqlK2o02s1th8S/i+2N9nz2&#xA;lSx7PXK4aeUiCCJpdEPcUOsOdzUW18PNKHgf9bh9CV+H/fWyu5+Oq4/vfYhKPT9N2zUIj5P/g+FX&#xA;n9UhZ6ezvVHpRKtgtkgiRhUslyEIBpJVzFvOTCZxBDLP5P8J+Q8AAAD//wMAUEsBAi0AFAAGAAgA&#xA;AAAhALaDOJL+AAAA4QEAABMAAAAAAAAAAAAAAAAAAAAAAFtDb250ZW50X1R5cGVzXS54bWxQSwEC&#xA;LQAUAAYACAAAACEAOP0h/9YAAACUAQAACwAAAAAAAAAAAAAAAAAvAQAAX3JlbHMvLnJlbHNQSwEC&#xA;LQAUAAYACAAAACEAE142t1YCAACkBgAADgAAAAAAAAAAAAAAAAAuAgAAZHJzL2Uyb0RvYy54bWxQ&#xA;SwECLQAUAAYACAAAACEAk+Bf6OEAAAAKAQAADwAAAAAAAAAAAAAAAACwBAAAZHJzL2Rvd25yZXYu&#xA;eG1sUEsFBgAAAAAEAAQA8wAAAL4FAAAAAA==&#xA;">
                                        <v:line id="Straight Connector 2"
                                            o:spid="_x0000_s1027"
                                            style="position:absolute;flip:y;visibility:visible;mso-wrap-style:square"
                                            from="106,0"
                                            to="62761,133"
                                            o:connectortype="straight"
                                            o:gfxdata="UEsDBBQABgAIAAAAIQDb4fbL7gAAAIUBAAATAAAAW0NvbnRlbnRfVHlwZXNdLnhtbHyQz07DMAyH&#xA;70i8Q+QralM4IITa7kDhCAiNB7ASt43WOlEcyvb2pNu4IODoPz9/n1xv9vOkForiPDdwXVagiI23&#xA;jocG3rdPxR0oScgWJ8/UwIEENu3lRb09BBKV0ywNjCmFe63FjDSjlD4Q50nv44wpl3HQAc0OB9I3&#xA;VXWrjedEnIq03oC27qjHjympx31un0wiTQLq4bS4shrAECZnMGVTvbD9QSnOhDInjzsyuiBXWQP0&#xA;r4R18jfgnHvJr4nOknrFmJ5xzhraRtHWf3Kkpfz/yGo5S+H73hkquyhdjr3R8m2lj09svwAAAP//&#xA;AwBQSwMEFAAGAAgAAAAhAFr0LFu/AAAAFQEAAAsAAABfcmVscy8ucmVsc2zPwWrDMAwG4Ptg72B0&#xA;X5TuUMaI01uh19I+gLGVxCy2jGSy9e1nemrHjpL4P0nD4SetZiPRyNnCruvBUPYcYp4tXC/Htw8w&#xA;Wl0ObuVMFm6kcBhfX4Yzra62kC6xqGlKVgtLreUTUf1CyWnHhXKbTCzJ1VbKjMX5LzcTvvf9HuXR&#xA;gPHJNKdgQU5hB+ZyK23zHztFL6w81c5zQp6m6P9TMfB3PtPWFCczVQtB9N4U2rp2HOA44NMz4y8A&#xA;AAD//wMAUEsDBBQABgAIAAAAIQCSh4FeyQAAAOIAAAAPAAAAZHJzL2Rvd25yZXYueG1sRI9Ba8JA&#xA;FITvQv/D8gq96W6EiERXEYtQehGtwesz+0yC2bchu43RX98tFHocZuYbZrkebCN66nztWEMyUSCI&#xA;C2dqLjWcvnbjOQgfkA02jknDgzysVy+jJWbG3flA/TGUIkLYZ6ihCqHNpPRFRRb9xLXE0bu6zmKI&#xA;siul6fAe4baRU6Vm0mLNcaHClrYVFbfjt9VwyfNePWf7cPL7x3mXfj43h/xd67fXYbMAEWgI/+G/&#xA;9ofRkCZqniZTlcLvpXgH5OoHAAD//wMAUEsBAi0AFAAGAAgAAAAhANvh9svuAAAAhQEAABMAAAAA&#xA;AAAAAAAAAAAAAAAAAFtDb250ZW50X1R5cGVzXS54bWxQSwECLQAUAAYACAAAACEAWvQsW78AAAAV&#xA;AQAACwAAAAAAAAAAAAAAAAAfAQAAX3JlbHMvLnJlbHNQSwECLQAUAAYACAAAACEAkoeBXskAAADi&#xA;AAAADwAAAAAAAAAAAAAAAAAHAgAAZHJzL2Rvd25yZXYueG1sUEsFBgAAAAADAAMAtwAAAP0CAAAA&#xA;AA==&#xA;"
                                            strokecolor="#002664">
                                            <o:lock v:ext="edit"
                                                shapetype="f" />
                                        </v:line>
                                        <v:line id="Straight Connector 2"
                                            o:spid="_x0000_s1028"
                                            style="position:absolute;flip:y;visibility:visible;mso-wrap-style:square"
                                            from="0,9675"
                                            to="62661,9808"
                                            o:connectortype="straight"
                                            o:gfxdata="UEsDBBQABgAIAAAAIQDb4fbL7gAAAIUBAAATAAAAW0NvbnRlbnRfVHlwZXNdLnhtbHyQz07DMAyH&#xA;70i8Q+QralM4IITa7kDhCAiNB7ASt43WOlEcyvb2pNu4IODoPz9/n1xv9vOkForiPDdwXVagiI23&#xA;jocG3rdPxR0oScgWJ8/UwIEENu3lRb09BBKV0ywNjCmFe63FjDSjlD4Q50nv44wpl3HQAc0OB9I3&#xA;VXWrjedEnIq03oC27qjHjympx31un0wiTQLq4bS4shrAECZnMGVTvbD9QSnOhDInjzsyuiBXWQP0&#xA;r4R18jfgnHvJr4nOknrFmJ5xzhraRtHWf3Kkpfz/yGo5S+H73hkquyhdjr3R8m2lj09svwAAAP//&#xA;AwBQSwMEFAAGAAgAAAAhAFr0LFu/AAAAFQEAAAsAAABfcmVscy8ucmVsc2zPwWrDMAwG4Ptg72B0&#xA;X5TuUMaI01uh19I+gLGVxCy2jGSy9e1nemrHjpL4P0nD4SetZiPRyNnCruvBUPYcYp4tXC/Htw8w&#xA;Wl0ObuVMFm6kcBhfX4Yzra62kC6xqGlKVgtLreUTUf1CyWnHhXKbTCzJ1VbKjMX5LzcTvvf9HuXR&#xA;gPHJNKdgQU5hB+ZyK23zHztFL6w81c5zQp6m6P9TMfB3PtPWFCczVQtB9N4U2rp2HOA44NMz4y8A&#xA;AAD//wMAUEsDBBQABgAIAAAAIQCvhO/6yQAAAOMAAAAPAAAAZHJzL2Rvd25yZXYueG1sRE9fa8Iw&#xA;EH8X9h3CDfamyZxztTOKOISxF9FZfL01t7bYXEqT1eqnX4TBHu/3/+bL3taio9ZXjjU8jhQI4tyZ&#xA;igsNh8/NMAHhA7LB2jFpuJCH5eJuMMfUuDPvqNuHQsQQ9ilqKENoUil9XpJFP3INceS+XWsxxLMt&#xA;pGnxHMNtLcdKTaXFimNDiQ2tS8pP+x+r4SvLOnWdbsPBby/HzfPHdbXL3rR+uO9XryAC9eFf/Od+&#xA;N3H+0yQZzxL1MoHbTxEAufgFAAD//wMAUEsBAi0AFAAGAAgAAAAhANvh9svuAAAAhQEAABMAAAAA&#xA;AAAAAAAAAAAAAAAAAFtDb250ZW50X1R5cGVzXS54bWxQSwECLQAUAAYACAAAACEAWvQsW78AAAAV&#xA;AQAACwAAAAAAAAAAAAAAAAAfAQAAX3JlbHMvLnJlbHNQSwECLQAUAAYACAAAACEAr4Tv+skAAADj&#xA;AAAADwAAAAAAAAAAAAAAAAAHAgAAZHJzL2Rvd25yZXYueG1sUEsFBgAAAAADAAMAtwAAAP0CAAAA&#xA;AA==&#xA;"
                                            strokecolor="#002664">
                                            <o:lock v:ext="edit"
                                                shapetype="f" />
                                        </v:line>
                                    </v:group>
                                </w:pict>
                            </mc:Fallback>
                        </mc:AlternateContent>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0" />
                        <w:rPr>
                            <w:bCs />
                            <w:color w:val="002060" />
                            <w:sz w:val="44" />
                            <w:szCs w:val="22" />
                        </w:rPr>
                    </w:pPr>
                    <w:sdt>
                        <w:sdtPr>
                            <w:rPr>
                                <w:rFonts w:ascii="Public Sans"
                                    w:hAnsi="Public Sans"
                                    w:cs="Arial" />
                                <w:bCs />
                                <w:color w:val="002060" />
                                <w:sz w:val="44" />
                                <w:szCs w:val="22" />
                            </w:rPr>
                            <w:alias w:val="Update to Functional/General" />
                            <w:tag w:val="Update to Functional/General" />
                            <w:id w:val="341130631" />
                            <w:placeholder>
                                <w:docPart w:val="8A45A49016D145DC9E38854241888BBE" />
                            </w:placeholder>
                            <w:temporary />
                            <w15:color w:val="00CCFF" />
                        </w:sdtPr>
                        <w:sdtEndPr />
                        <w:sdtContent>
                            <w:r>
                                <w:rPr>
                                    <w:bCs />
                                    <w:color w:val="002060" />
                                    <w:sz w:val="44" />
                                    <w:szCs w:val="22" />
                                </w:rPr>
                                <w:t xml:space="preserve">Functional Retention and Disposal Authority </w:t>
                            </w:r>
                        </w:sdtContent>
                    </w:sdt>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0" />
                        <w:rPr>
                            <w:bCs />
                            <w:color w:val="002060" />
                            <w:sz w:val="44" />
                            <w:szCs w:val="22" />
                        </w:rPr>
                    </w:pPr>
                    <w:r>
                        <w:rPr>
                            <w:bCs />
                            <w:color w:val="002060" />
                            <w:sz w:val="44" />
                            <w:szCs w:val="22" />
                        </w:rPr>
                        <w:t>FA399</w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0" />
                        <w:rPr>
                            <w:bCs />
                            <w:color w:val="002060" />
                            <w:sz w:val="24" />
                            <w:szCs w:val="24" />
                        </w:rPr>
                    </w:pPr>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0" />
                        <w:rPr>
                            <w:bCs />
                            <w:color w:val="002060" />
                            <w:sz w:val="24" />
                            <w:szCs w:val="24" />
                        </w:rPr>
                    </w:pPr>
                    <w:r>
                        <w:rPr>
                            <w:bCs />
                            <w:color w:val="002060" />
                            <w:sz w:val="24" />
                            <w:szCs w:val="24" />
                        </w:rPr>
                        <w:t xml:space="preserve">This authority covers records documenting the function of </w:t>
                    </w:r>
                    <w:r>
                        <w:rPr>
                            <w:b />
                            <w:color w:val="002060" />
                            <w:sz w:val="24" />
                            <w:szCs w:val="24" />
                        </w:rPr>
                        <w:t>provision of local land programs and services</w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0" />
                        <w:rPr>
                            <w:color w:val="002060" />
                            <w:sz w:val="32" />
                            <w:szCs w:val="32" />
                        </w:rPr>
                    </w:pPr>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0" />
                        <w:rPr>
                            <w:color w:val="002060" />
                            <w:sz w:val="32" />
                            <w:szCs w:val="32" />
                        </w:rPr>
                    </w:pPr>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0" />
                        <w:rPr>
                            <w:color w:val="002060" />
                        </w:rPr>
                    </w:pPr>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0" />
                        <w:rPr>
                            <w:color w:val="002060" />
                            <w:sz w:val="28" />
                            <w:szCs w:val="28" />
                        </w:rPr>
                    </w:pPr>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0" />
                        <w:rPr>
                            <w:color w:val="002060" />
                            <w:sz w:val="28" />
                            <w:szCs w:val="28" />
                        </w:rPr>
                    </w:pPr>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0" />
                        <w:rPr>
                            <w:color w:val="002060" />
                            <w:sz w:val="28" />
                            <w:szCs w:val="28" />
                        </w:rPr>
                    </w:pPr>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0" />
                        <w:rPr>
                            <w:color w:val="002060" />
                            <w:sz w:val="28" />
                            <w:szCs w:val="28" />
                        </w:rPr>
                    </w:pPr>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0" />
                        <w:rPr>
                            <w:color w:val="002060" />
                            <w:sz w:val="24" />
                            <w:szCs w:val="24" />
                        </w:rPr>
                    </w:pPr>
                    <w:r>
                        <w:rPr>
                            <w:b />
                            <w:bCs />
                            <w:color w:val="002060" />
                            <w:sz w:val="24" />
                            <w:szCs w:val="24" />
                        </w:rPr>
                        <w:t>Version 2.0</w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0" />
                        <w:rPr>
                            <w:b />
                            <w:bCs />
                            <w:color w:val="002060" />
                            <w:sz w:val="24" />
                            <w:szCs w:val="24" />
                        </w:rPr>
                    </w:pPr>
                    <w:r>
                        <w:rPr>
                            <w:b />
                            <w:bCs />
                            <w:color w:val="002060" />
                            <w:sz w:val="24" />
                            <w:szCs w:val="24" />
                        </w:rPr>
                        <w:t>29 June 2018</w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0" />
                        <w:rPr>
                            <w:color w:val="002060" />
                            <w:sz w:val="28" />
                            <w:szCs w:val="28" />
                        </w:rPr>
                    </w:pPr>
                    <w:r>
                        <w:rPr>
                            <w:noProof />
                            <w:color w:val="002060" />
                        </w:rPr>
                        <mc:AlternateContent>
                            <mc:Choice Requires="wps">
                                <w:drawing>
                                    <wp:anchor distT="0"
                                        distB="0"
                                        distL="114299"
                                        distR="114299"
                                        simplePos="0"
                                        relativeHeight="251659264"
                                        behindDoc="0"
                                        locked="0"
                                        layoutInCell="1"
                                        allowOverlap="1"
                                        wp14:anchorId="63C095A0"
                                        wp14:editId="6E390200">
                                        <wp:simplePos x="0"
                                            y="0" />
                                        <wp:positionH relativeFrom="column">
                                            <wp:posOffset>-81281</wp:posOffset>
                                        </wp:positionH>
                                        <wp:positionV relativeFrom="paragraph">
                                            <wp:posOffset>240030</wp:posOffset>
                                        </wp:positionV>
                                        <wp:extent cx="0"
                                            cy="666750" />
                                        <wp:effectExtent l="0"
                                            t="0"
                                            r="38100"
                                            b="19050" />
                                        <wp:wrapNone />
                                        <wp:docPr id="2066033619"
                                            name="Straight Connector 2" />
                                        <wp:cNvGraphicFramePr>
                                            <a:graphicFrameLocks
                                                xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" />
                                        </wp:cNvGraphicFramePr>
                                        <a:graphic
                                            xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main">
                                            <a:graphicData
                                                uri="http://schemas.microsoft.com/office/word/2010/wordprocessingShape">
                                                <wps:wsp>
                                                    <wps:cNvCnPr>
                                                        <a:cxnSpLocks />
                                                    </wps:cNvCnPr>
                                                    <wps:spPr>
                                                        <a:xfrm>
                                                            <a:off x="0"
                                                                y="0" />
                                                            <a:ext cx="0"
                                                                cy="666750" />
                                                        </a:xfrm>
                                                        <a:prstGeom prst="line">
                                                            <a:avLst />
                                                        </a:prstGeom>
                                                        <a:noFill />
                                                        <a:ln w="19050"
                                                            cap="flat"
                                                            cmpd="sng"
                                                            algn="ctr">
                                                            <a:solidFill>
                                                                <a:srgbClr val="C00000" />
                                                            </a:solidFill>
                                                            <a:prstDash val="solid" />
                                                        </a:ln>
                                                        <a:effectLst />
                                                    </wps:spPr>
                                                    <wps:bodyPr />
                                                </wps:wsp>
                                            </a:graphicData>
                                        </a:graphic>
                                        <wp14:sizeRelH relativeFrom="page">
                                            <wp14:pctWidth>0</wp14:pctWidth>
                                        </wp14:sizeRelH>
                                        <wp14:sizeRelV relativeFrom="margin">
                                            <wp14:pctHeight>0</wp14:pctHeight>
                                        </wp14:sizeRelV>
                                    </wp:anchor>
                                </w:drawing>
                            </mc:Choice>
                            <mc:Fallback>
                                <w:pict>
                                    <v:line w14:anchorId="2204A184"
                                        id="Straight Connector 2"
                                        o:spid="_x0000_s1026"
                                        style="position:absolute;z-index:251659264;visibility:visible;mso-wrap-style:square;mso-width-percent:0;mso-height-percent:0;mso-wrap-distance-left:3.17497mm;mso-wrap-distance-top:0;mso-wrap-distance-right:3.17497mm;mso-wrap-distance-bottom:0;mso-position-horizontal:absolute;mso-position-horizontal-relative:text;mso-position-vertical:absolute;mso-position-vertical-relative:text;mso-width-percent:0;mso-height-percent:0;mso-width-relative:page;mso-height-relative:margin"
                                        from="-6.4pt,18.9pt"
                                        to="-6.4pt,71.4pt"
                                        o:gfxdata="UEsDBBQABgAIAAAAIQC2gziS/gAAAOEBAAATAAAAW0NvbnRlbnRfVHlwZXNdLnhtbJSRQU7DMBBF&#xA;90jcwfIWJU67QAgl6YK0S0CoHGBkTxKLZGx5TGhvj5O2G0SRWNoz/78nu9wcxkFMGNg6quQqL6RA&#xA;0s5Y6ir5vt9lD1JwBDIwOMJKHpHlpr69KfdHjyxSmriSfYz+USnWPY7AufNIadK6MEJMx9ApD/oD&#xA;OlTrorhX2lFEilmcO2RdNtjC5xDF9pCuTyYBB5bi6bQ4syoJ3g9WQ0ymaiLzg5KdCXlKLjvcW893&#xA;SUOqXwnz5DrgnHtJTxOsQfEKIT7DmDSUCaxw7Rqn8787ZsmRM9e2VmPeBN4uqYvTtW7jvijg9N/y&#xA;JsXecLq0q+WD6m8AAAD//wMAUEsDBBQABgAIAAAAIQA4/SH/1gAAAJQBAAALAAAAX3JlbHMvLnJl&#xA;bHOkkMFqwzAMhu+DvYPRfXGawxijTi+j0GvpHsDYimMaW0Yy2fr2M4PBMnrbUb/Q94l/f/hMi1qR&#xA;JVI2sOt6UJgd+ZiDgffL8ekFlFSbvV0oo4EbChzGx4f9GRdb25HMsYhqlCwG5lrLq9biZkxWOiqY&#xA;22YiTra2kYMu1l1tQD30/bPm3wwYN0x18gb45AdQl1tp5j/sFB2T0FQ7R0nTNEV3j6o9feQzro1i&#xA;OWA14Fm+Q8a1a8+Bvu/d/dMb2JY5uiPbhG/ktn4cqGU/er3pcvwCAAD//wMAUEsDBBQABgAIAAAA&#xA;IQCsIEvrqQEAAEoDAAAOAAAAZHJzL2Uyb0RvYy54bWysU01v2zAMvQ/ofxB0b+QWaLYZcXpI0F6K&#xA;rUC3H8DIki1UXxDV2Pn3o5SPtdttmA8ERVKP5NPz6n52lu1VQhN8x28WDWfKy9AbP3T854+H6y+c&#xA;YQbfgw1edfygkN+vrz6tptiq2zAG26vECMRjO8WOjznHVgiUo3KAixCVp6QOyUGmYxpEn2AidGfF&#xA;bdMsxRRSH1OQCpGi22OSryu+1krm71qjysx2nGbL1aZqd8WK9QraIUEcjTyNAf8whQPjqekFagsZ&#xA;2Fsyf0E5I1PAoPNCBieC1kaqugNtc9P8sc3LCFHVXYgcjBea8P/Bym/7jX9OZXQ5+5f4FOQrEili&#xA;ithekuWA8Vg26+RKOc3O5krk4UKkmjOTx6Ck6HK5/HxXORbQnu/FhPlRBceK03FrfFkRWtg/YS6d&#xA;oT2XlLAPD8ba+kzWs4k09rUhTCaB1KItZHJd7DuOfuAM7EAylDlVSAzW9OV6AcI07DY2sT2QFDZN&#xA;+crrU7sPZaX3FnA81tXUqcz6AqOqqE6j/ualeLvQH57TmTx6sIp+EldRxPsz+e9/gfUvAAAA//8D&#xA;AFBLAwQUAAYACAAAACEA6WHCst0AAAAKAQAADwAAAGRycy9kb3ducmV2LnhtbEyPQUvDQBCF74L/&#xA;YRnBW7vbKLbEbEoRLHq0FcTbNDtNgtnZkN020V/viAc9DTPv8eZ7xXrynTrTENvAFhZzA4q4Cq7l&#xA;2sLr/nG2AhUTssMuMFn4pAjr8vKiwNyFkV/ovEu1khCOOVpoUupzrWPVkMc4Dz2xaMcweEyyDrV2&#xA;A44S7judGXOnPbYsHxrs6aGh6mN38hbMc1Z/Lbfjm1lt8NjqvY9P71trr6+mzT2oRFP6M8MPvqBD&#xA;KUyHcGIXVWdhtsgEPVm4WcoUw+/hIM5bUXRZ6P8Vym8AAAD//wMAUEsBAi0AFAAGAAgAAAAhALaD&#xA;OJL+AAAA4QEAABMAAAAAAAAAAAAAAAAAAAAAAFtDb250ZW50X1R5cGVzXS54bWxQSwECLQAUAAYA&#xA;CAAAACEAOP0h/9YAAACUAQAACwAAAAAAAAAAAAAAAAAvAQAAX3JlbHMvLnJlbHNQSwECLQAUAAYA&#xA;CAAAACEArCBL66kBAABKAwAADgAAAAAAAAAAAAAAAAAuAgAAZHJzL2Uyb0RvYy54bWxQSwECLQAU&#xA;AAYACAAAACEA6WHCst0AAAAKAQAADwAAAAAAAAAAAAAAAAADBAAAZHJzL2Rvd25yZXYueG1sUEsF&#xA;BgAAAAAEAAQA8wAAAA0FAAAAAA==&#xA;"
                                        strokecolor="#c00000"
                                        strokeweight="1.5pt">
                                        <o:lock v:ext="edit"
                                            shapetype="f" />
                                    </v:line>
                                </w:pict>
                            </mc:Fallback>
                        </mc:AlternateContent>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0" />
                        <w:rPr>
                            <w:color w:val="002060" />
                            <w:sz w:val="24" />
                            <w:szCs w:val="24" />
                        </w:rPr>
                    </w:pPr>
                    <w:r>
                        <w:rPr>
                            <w:color w:val="002060" />
                            <w:sz w:val="24" />
                            <w:szCs w:val="24" />
                        </w:rPr>
                        <w:t>This retention and disposal authority is approved under section 21(2)c
                            of the</w:t>
                    </w:r>
                    <w:r>
                        <w:rPr>
                            <w:i />
                            <w:color w:val="002060" />
                            <w:sz w:val="24" />
                            <w:szCs w:val="24" />
                        </w:rPr>
                        <w:t xml:space="preserve"> State Records Act 1998 </w:t>
                    </w:r>
                    <w:r>
                        <w:rPr>
                            <w:color w:val="002060" />
                            <w:sz w:val="24" />
                            <w:szCs w:val="24" />
                        </w:rPr>
                        <w:t xml:space="preserve">following prior approval by the Board of the State Records Authority NSW in accordance with section 21(3) of the Act.</w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0" />
                        <w:rPr>
                            <w:color w:val="002060" />
                            <w:sz w:val="24" />
                            <w:szCs w:val="24" />
                        </w:rPr>
                    </w:pPr>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0" />
                        <w:rPr>
                            <w:b />
                            <w:bCs />
                            <w:color w:val="002060" />
                            <w:sz w:val="24" />
                            <w:szCs w:val="24" />

                        </w:rPr>
                    </w:pPr>
                    <w:r>
                        <w:rPr>
                            <w:b />
                            <w:bCs />
                            <w:color w:val="002060" />
                            <w:sz w:val="24" />
                            <w:szCs w:val="24" />
                        </w:rPr>
                        <w:t>State Records Authority NSW</w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0" />
                        <w:rPr>
                            <w:sz w:val="28" />
                            <w:szCs w:val="28" />
                        </w:rPr>
                    </w:pPr>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:tabs>
                            <w:tab w:val="right"
                                w:pos="9072" />
                        </w:tabs>
                        <w:spacing w:before="0"
                            w:after="60"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:rPr>
                            <w:sz w:val="22" />
                            <w:szCs w:val="22" />
                        </w:rPr>
                    </w:pPr>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:tabs>
                            <w:tab w:val="right"
                                w:pos="9072" />
                        </w:tabs>
                        <w:spacing w:before="0"
                            w:after="60"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:rPr>
                            <w:sz w:val="22" />
                            <w:szCs w:val="22" />
                        </w:rPr>
                    </w:pPr>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:tabs>
                            <w:tab w:val="right"
                                w:pos="9072" />
                        </w:tabs>
                        <w:spacing w:before="0"
                            w:after="60"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:rPr>
                            <w:sz w:val="22" />
                            <w:szCs w:val="22" />
                        </w:rPr>
                    </w:pPr>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:tabs>
                            <w:tab w:val="right"
                                w:pos="9072" />
                        </w:tabs>
                        <w:spacing w:before="0"
                            w:after="60"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:rPr>
                            <w:sz w:val="22" />
                            <w:szCs w:val="22" />
                        </w:rPr>
                    </w:pPr>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:tabs>
                            <w:tab w:val="right"
                                w:pos="9072" />
                        </w:tabs>
                        <w:spacing w:before="0"
                            w:after="60"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:rPr>
                            <w:sz w:val="22" />
                            <w:szCs w:val="22" />
                        </w:rPr>
                    </w:pPr>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:tabs>
                            <w:tab w:val="right"
                                w:pos="9072" />
                        </w:tabs>
                        <w:spacing w:before="0"
                            w:after="60"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:rPr>
                            <w:sz w:val="22" />
                            <w:szCs w:val="22" />
                        </w:rPr>
                    </w:pPr>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:tabs>
                            <w:tab w:val="right"
                                w:pos="9072" />
                        </w:tabs>
                        <w:spacing w:before="0"
                            w:after="60"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:rPr>
                            <w:sz w:val="22" />
                            <w:szCs w:val="22" />
                        </w:rPr>
                    </w:pPr>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:tabs>
                            <w:tab w:val="right"
                                w:pos="9072" />
                        </w:tabs>
                        <w:spacing w:before="0"
                            w:after="60"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:rPr>
                            <w:sz w:val="22" />
                            <w:szCs w:val="22" />
                        </w:rPr>
                    </w:pPr>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:tabs>
                            <w:tab w:val="right"
                                w:pos="9072" />
                        </w:tabs>
                        <w:spacing w:before="0"
                            w:after="60"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:rPr>
                            <w:sz w:val="22" />
                            <w:szCs w:val="22" />
                        </w:rPr>
                    </w:pPr>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:tabs>
                            <w:tab w:val="right"
                                w:pos="9072" />
                        </w:tabs>
                        <w:spacing w:before="0"
                            w:after="60"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:rPr>
                            <w:sz w:val="22" />
                            <w:szCs w:val="22" />
                        </w:rPr>
                    </w:pPr>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:tabs>
                            <w:tab w:val="right"
                                w:pos="9072" />
                        </w:tabs>
                        <w:spacing w:before="0"
                            w:after="60"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:rPr>
                            <w:sz w:val="22" />
                            <w:szCs w:val="22" />
                        </w:rPr>
                    </w:pPr>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:tabs>
                            <w:tab w:val="right"
                                w:pos="9072" />
                        </w:tabs>
                        <w:spacing w:before="0"
                            w:after="60"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:rPr>
                            <w:sz w:val="22" />
                            <w:szCs w:val="22" />
                        </w:rPr>
                    </w:pPr>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:tabs>
                            <w:tab w:val="right"
                                w:pos="9072" />
                        </w:tabs>
                        <w:spacing w:before="0"
                            w:after="60"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:rPr>
                            <w:sz w:val="22" />
                            <w:szCs w:val="22" />
                        </w:rPr>
                    </w:pPr>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:tabs>
                            <w:tab w:val="right"
                                w:pos="9072" />
                        </w:tabs>
                        <w:spacing w:before="0"
                            w:after="60"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:rPr>
                            <w:sz w:val="22" />
                            <w:szCs w:val="22" />
                        </w:rPr>
                    </w:pPr>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:tabs>
                            <w:tab w:val="right"
                                w:pos="9072" />
                        </w:tabs>
                        <w:spacing w:before="0"
                            w:after="60"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:rPr>
                            <w:sz w:val="22" />
                            <w:szCs w:val="22" />
                        </w:rPr>
                    </w:pPr>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:tabs>
                            <w:tab w:val="right"
                                w:pos="9072" />
                        </w:tabs>
                        <w:spacing w:before="0"
                            w:after="60"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:rPr>
                            <w:sz w:val="22" />
                            <w:szCs w:val="22" />
                        </w:rPr>
                    </w:pPr>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:tabs>
                            <w:tab w:val="right"
                                w:pos="9072" />
                        </w:tabs>
                        <w:spacing w:before="0"
                            w:after="60"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:rPr>
                            <w:sz w:val="22" />
                            <w:szCs w:val="22" />
                        </w:rPr>
                    </w:pPr>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:tabs>
                            <w:tab w:val="right"
                                w:pos="9072" />
                        </w:tabs>
                        <w:spacing w:before="0"
                            w:after="60"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:rPr>
                            <w:sz w:val="22" />
                            <w:szCs w:val="22" />
                        </w:rPr>
                    </w:pPr>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:tabs>
                            <w:tab w:val="right"
                                w:pos="9072" />
                        </w:tabs>
                        <w:spacing w:before="0"
                            w:after="60"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:rPr>
                            <w:sz w:val="22" />
                            <w:szCs w:val="22" />
                        </w:rPr>
                    </w:pPr>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:tabs>
                            <w:tab w:val="right"
                                w:pos="9072" />
                        </w:tabs>
                        <w:spacing w:before="0"
                            w:after="60"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:rPr>
                            <w:sz w:val="22" />
                            <w:szCs w:val="22" />
                        </w:rPr>
                    </w:pPr>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:tabs>
                            <w:tab w:val="right"
                                w:pos="9072" />
                        </w:tabs>
                        <w:spacing w:before="0"
                            w:after="60"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:rPr>
                            <w:sz w:val="22" />
                            <w:szCs w:val="22" />
                        </w:rPr>
                    </w:pPr>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:tabs>
                            <w:tab w:val="right"
                                w:pos="9072" />
                        </w:tabs>
                        <w:spacing w:before="0"
                            w:after="60"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:rPr>
                            <w:sz w:val="22" />
                            <w:szCs w:val="22" />
                        </w:rPr>
                    </w:pPr>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:tabs>
                            <w:tab w:val="right"
                                w:pos="9072" />
                        </w:tabs>
                        <w:spacing w:before="0"
                            w:after="60"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:rPr>
                            <w:sz w:val="22" />
                            <w:szCs w:val="22" />
                        </w:rPr>
                    </w:pPr>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:tabs>
                            <w:tab w:val="right"
                                w:pos="9072" />
                        </w:tabs>
                        <w:spacing w:before="0"
                            w:after="60"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:rPr>
                            <w:sz w:val="22" />
                            <w:szCs w:val="22" />
                        </w:rPr>
                    </w:pPr>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:tabs>
                            <w:tab w:val="right"
                                w:pos="9072" />
                        </w:tabs>
                        <w:spacing w:before="0"
                            w:after="60"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:rPr>
                            <w:sz w:val="22" />
                            <w:szCs w:val="22" />
                        </w:rPr>
                    </w:pPr>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:tabs>
                            <w:tab w:val="right"
                                w:pos="9072" />
                        </w:tabs>
                        <w:spacing w:before="0"
                            w:after="60"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:rPr>
                            <w:sz w:val="22" />
                            <w:szCs w:val="22" />
                        </w:rPr>
                    </w:pPr>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:tabs>
                            <w:tab w:val="right"
                                w:pos="9072" />
                        </w:tabs>
                        <w:spacing w:before="0"
                            w:after="60"
                            w:line="276"
                            w:lineRule="auto" />
                    </w:pPr>
                    <w:r>
                        <w:t xml:space="preserve">© State of New South Wales through State Records Authority NSW 2025. </w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:tabs>
                            <w:tab w:val="right"
                                w:pos="9072" />
                        </w:tabs>
                        <w:spacing w:before="0"
                            w:after="60"
                            w:line="276"
                            w:lineRule="auto" />
                    </w:pPr>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:tabs>
                            <w:tab w:val="right"
                                w:pos="9072" />
                        </w:tabs>
                        <w:spacing w:before="0"
                            w:after="60"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:rPr>
                            <w:b />
                            <w:bCs />
                        </w:rPr>
                    </w:pPr>
                    <w:r>
                        <w:rPr>
                            <w:b />
                            <w:bCs />
                        </w:rPr>
                        <w:t>Copyright &amp; Attribution</w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:tabs>
                            <w:tab w:val="right"
                                w:pos="9072" />
                        </w:tabs>
                        <w:spacing w:before="0"
                            w:after="60"
                            w:line="276"
                            w:lineRule="auto" />
                    </w:pPr>
                    <w:r>
                        <w:t xml:space="preserve">This work may be freely reproduced for personal, educational or government purposes. Permission must be received from State Records Authority NSW for all other uses.</w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:tabs>
                            <w:tab w:val="right"
                                w:pos="9072" />
                        </w:tabs>
                        <w:spacing w:before="0"
                            w:after="60"
                            w:line="276"
                            w:lineRule="auto" />
                    </w:pPr>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:rPr>
                            <w:b />
                            <w:bCs />
                        </w:rPr>
                    </w:pPr>
                    <w:r>
                        <w:rPr>
                            <w:b />
                            <w:bCs />
                        </w:rPr>
                        <w:t>Contact Information</w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:rPr>
                            <w:sz w:val="22" />
                            <w:szCs w:val="22" />
                        </w:rPr>
                        <!-- first section -->
                        <w:sectPr>
                            <w:footerReference w:type="default"
                                r:id="rId12" /> <!--footer1-->
                            <w:headerReference w:type="first"
                                r:id="rId13" /> <!--header1-->
                            <w:pgSz w:w="11907"
                                w:h="16840"
                                w:code="9" />
                            <w:pgMar w:top="1418"
                                w:right="1418"
                                w:bottom="1418"
                                w:left="1418"
                                w:header="567"
                                w:footer="567"
                                w:gutter="0" />
                            <w:paperSrc w:first="7"
                                w:other="7" />
                            <w:pgNumType w:start="1" />
                            <w:cols w:space="720" />
                            <w:titlePg />
                        </w:sectPr>
                    </w:pPr>
                    <w:r>
                        <w:t>State Records Authority NSW</w:t>
                    </w:r>
                    <w:r>
                        <w:br />
                        <w:t>PO Box 516 Kingswood NSW 2747</w:t>
                    </w:r>
                    <w:r>
                        <w:br />
                        <w:t xml:space="preserve">Telephone: (02) 9714 3080    E-mail: </w:t>
                    </w:r>
                    <w:r>
                        <w:rPr>
                            <w:color w:val="0000FF" />
                            <w:u w:val="single" />
                        </w:rPr>
                        <w:t>govrec@staterecords.nsw.gov.au</w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:keepLines />
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0"
                            w:after="0"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:outlineLvl w:val="0" />
                        <w:rPr>
                            <w:color w:val="001C4A" />
                            <w:sz w:val="40" />
                            <w:szCs w:val="40" />
                        </w:rPr>
                    </w:pPr>
                    <w:r>
                        <w:rPr>
                            <w:color w:val="001C4A" />
                            <w:sz w:val="40" />
                            <w:szCs w:val="40" />
                        </w:rPr>
                        <w:t>State Records Authority NSW</w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:keepLines />
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0"
                            w:after="80"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:outlineLvl w:val="0" />
                        <w:rPr>
                            <w:color w:val="001C4A" />
                            <w:sz w:val="40" />
                            <w:szCs w:val="40" />
                        </w:rPr>
                    </w:pPr>
                    <w:r>
                        <w:rPr>
                            <w:color w:val="001C4A" />
                            <w:sz w:val="40" />
                            <w:szCs w:val="40" />
                        </w:rPr>
                        <w:t>Functional Retention and Disposal Authority</w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0"
                            w:line="276"
                            w:lineRule="auto" />
                    </w:pPr>
                </w:p>
                <w:tbl>
                    <w:tblPr>
                        <w:tblW w:w="4997"
                            w:type="pct" />
                        <w:tblBorders>
                            <w:right w:val="single"
                                w:sz="4"
                                w:space="0"
                                w:color="auto" />
                            <w:insideH w:val="single"
                                w:sz="4"
                                w:space="0"
                                w:color="auto" />
                        </w:tblBorders>
                        <w:tblCellMar>
                            <w:top w:w="85"
                                w:type="dxa" />
                            <w:left w:w="170"
                                w:type="dxa" />
                            <w:bottom w:w="85"
                                w:type="dxa" />
                            <w:right w:w="56"
                                w:type="dxa" />
                        </w:tblCellMar>
                        <w:tblLook w:val="0000"
                            w:firstRow="0"
                            w:lastRow="0"
                            w:firstColumn="0"
                            w:lastColumn="0"
                            w:noHBand="0"
                            w:noVBand="0" />
                    </w:tblPr>
                    <w:tblGrid>
                        <w:gridCol w:w="2551" />
                        <w:gridCol w:w="6515" />
                    </w:tblGrid>
                    <w:tr>
                        <w:trPr>
                            <w:cantSplit />
                        </w:trPr>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="1407"
                                    w:type="pct" />
                                <w:shd w:val="pct5"
                                    w:color="auto"
                                    w:fill="FFFFFF" />
                                <w:vAlign w:val="center" />
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                    <w:ind w:left="142" />
                                    <w:jc w:val="right" />
                                    <w:rPr>
                                        <w:b />
                                        <w:bCs />
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>
                                        <w:b />
                                        <w:bCs />
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                    <w:t>Authority Number</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="3593"
                                    w:type="pct" />
                                <w:tcBorders>
                                    <w:right w:val="nil" />
                                </w:tcBorders>
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                    <w:rPr>
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                    <w:t>FA399</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                    </w:tr>
                    <w:tr>
                        <w:trPr>
                            <w:cantSplit />
                        </w:trPr>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="1407"
                                    w:type="pct" />
                                <w:shd w:val="pct5"
                                    w:color="auto"
                                    w:fill="FFFFFF" />
                                <w:vAlign w:val="center" />
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                    <w:ind w:left="142" />
                                    <w:jc w:val="right" />
                                    <w:rPr>
                                        <w:b />
                                        <w:bCs />
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>
                                        <w:b />
                                        <w:bCs />
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                    <w:t>SR file number</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="3593"
                                    w:type="pct" />
                                <w:tcBorders>
                                    <w:right w:val="nil" />
                                </w:tcBorders>
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                    <w:rPr>
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                    <w:t>18/0231</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                    </w:tr>
                    <w:tr>
                        <w:trPr>
                            <w:cantSplit />
                        </w:trPr>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="1407"
                                    w:type="pct" />
                                <w:shd w:val="pct5"
                                    w:color="auto"
                                    w:fill="FFFFFF" />
                                <w:vAlign w:val="center" />
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                    <w:ind w:left="142" />
                                    <w:jc w:val="right" />
                                    <w:rPr>
                                        <w:b />
                                        <w:bCs />
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>
                                        <w:b />
                                        <w:bCs />
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                    <w:t>Scope</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="3593"
                                    w:type="pct" />
                                <w:tcBorders>
                                    <w:right w:val="nil" />
                                </w:tcBorders>
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                    <w:rPr>
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                    <w:t xml:space="preserve">This retention and disposal authority covers records documenting the function of local land programs and advisory services.</w:t>
                                </w:r>
                                <w:r>
                                    <w:rPr>
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                    <w:t xml:space="preserve">
                            </w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                    </w:tr>
                    <w:tr>
                        <w:trPr>
                            <w:cantSplit />
                        </w:trPr>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="1407"
                                    w:type="pct" />
                                <w:shd w:val="pct5"
                                    w:color="auto"
                                    w:fill="FFFFFF" />
                                <w:vAlign w:val="center" />
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                    <w:ind w:left="142" />
                                    <w:jc w:val="right" />
                                    <w:rPr>
                                        <w:b />
                                        <w:bCs />
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>
                                        <w:b />
                                        <w:bCs />
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                    <w:t>Public office</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="3593"
                                    w:type="pct" />
                                <w:tcBorders>
                                    <w:right w:val="nil" />
                                </w:tcBorders>
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                    <w:rPr>
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                    <w:t xml:space="preserve">This authority applies to Statewide and regional local land boards and services.</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                    </w:tr>
                    <w:tr>
                        <w:trPr>
                            <w:cantSplit />
                        </w:trPr>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="1407"
                                    w:type="pct" />
                                <w:shd w:val="pct5"
                                    w:color="auto"
                                    w:fill="FFFFFF" />
                                <w:vAlign w:val="center" />
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                    <w:ind w:left="142" />
                                    <w:jc w:val="right" />
                                    <w:rPr>
                                        <w:b />
                                        <w:bCs />
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>
                                        <w:b />
                                        <w:bCs />
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                    <w:t xml:space="preserve">Issued date  </w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="3593"
                                    w:type="pct" />
                                <w:tcBorders>
                                    <w:right w:val="nil" />
                                </w:tcBorders>
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                    <w:rPr>
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                    <w:t>29 June 2018</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                    </w:tr>
                    <w:tr>
                        <w:trPr>
                            <w:cantSplit />
                        </w:trPr>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="1407"
                                    w:type="pct" />
                                <w:shd w:val="pct5"
                                    w:color="auto"
                                    w:fill="FFFFFF" />
                                <w:vAlign w:val="center" />
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                    <w:ind w:left="142" />
                                    <w:jc w:val="right" />
                                    <w:rPr>
                                        <w:b />
                                        <w:bCs />
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>
                                        <w:b />
                                        <w:bCs />
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                    <w:t>Version</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="3593"
                                    w:type="pct" />
                                <w:tcBorders>
                                    <w:right w:val="nil" />
                                </w:tcBorders>
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                    <w:rPr>
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                    <w:t>1.0</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                    </w:tr>
                    <w:tr>
                        <w:trPr>
                            <w:cantSplit />
                        </w:trPr>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="1407"
                                    w:type="pct" />
                                <w:shd w:val="pct5"
                                    w:color="auto"
                                    w:fill="FFFFFF" />
                                <w:vAlign w:val="center" />
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                    <w:ind w:left="142" />
                                    <w:jc w:val="right" />
                                    <w:rPr>
                                        <w:b />
                                        <w:bCs />
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>
                                        <w:b />
                                        <w:bCs />
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                    <w:t xml:space="preserve">Supersedes  </w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="3593"
                                    w:type="pct" />
                                <w:tcBorders>
                                    <w:right w:val="nil" />
                                </w:tcBorders>
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                    <w:rPr>
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                    <w:t>GDA20 Rural Lands Protection Board &amp; State Council</w:t>
                                </w:r>
                            </w:p>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                    <w:rPr>
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                    <w:t>GA29 Catchment Management Authorities</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                    </w:tr>
                </w:tbl>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0"
                            w:line="276"
                            w:lineRule="auto" />
                    </w:pPr>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:keepLines />
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0"
                            w:after="80"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:outlineLvl w:val="1" />
                        <w:rPr>
                            <w:color w:val="001C4A" />
                            <w:sz w:val="32" />
                            <w:szCs w:val="32" />
                        </w:rPr>
                    </w:pPr>
                    <w:r>
                        <w:rPr>
                            <w:color w:val="001C4A" />
                            <w:sz w:val="32" />
                            <w:szCs w:val="32" />
                        </w:rPr>
                        <w:t>Amendments</w:t>
                    </w:r>
                </w:p>
                <w:tbl>
                    <w:tblPr>
                        <w:tblStyle w:val="TableGrid1" />
                        <w:tblW w:w="9016"
                            w:type="dxa" />
                        <w:tblBorders>
                            <w:top w:val="none"
                                w:sz="0"
                                w:space="0"
                                w:color="auto" />
                            <w:left w:val="none"
                                w:sz="0"
                                w:space="0"
                                w:color="auto" />
                            <w:bottom w:val="none"
                                w:sz="0"
                                w:space="0"
                                w:color="auto" />
                            <w:right w:val="none"
                                w:sz="0"
                                w:space="0"
                                w:color="auto" />
                            <w:insideV w:val="none"
                                w:sz="0"
                                w:space="0"
                                w:color="auto" />
                        </w:tblBorders>
                        <w:tblCellMar>
                            <w:top w:w="113"
                                w:type="dxa" />
                        </w:tblCellMar>
                        <w:tblLook w:val="04A0"
                            w:firstRow="1"
                            w:lastRow="0"
                            w:firstColumn="1"
                            w:lastColumn="0"
                            w:noHBand="0"
                            w:noVBand="1" />
                    </w:tblPr>
                    <w:tblGrid>
                        <w:gridCol w:w="990" />
                        <w:gridCol w:w="2040" />
                        <w:gridCol w:w="5986" />
                    </w:tblGrid>
                    <w:tr>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="990"
                                    w:type="dxa" />
                                <w:shd w:val="clear"
                                    w:color="auto"
                                    w:fill="F2F2F2" />
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                    <w:rPr>
                                        <w:b />
                                        <w:bCs />
                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>
                                        <w:b />
                                        <w:bCs />
                                    </w:rPr>
                                    <w:t>Version</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="2040"
                                    w:type="dxa" />
                                <w:shd w:val="clear"
                                    w:color="auto"
                                    w:fill="F2F2F2" />
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                    <w:rPr>
                                        <w:b />
                                        <w:bCs />
                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>
                                        <w:b />
                                        <w:bCs />
                                    </w:rPr>
                                    <w:t>Date</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="5986"
                                    w:type="dxa" />
                                <w:shd w:val="clear"
                                    w:color="auto"
                                    w:fill="F2F2F2" />
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                    <w:rPr>
                                        <w:b />
                                        <w:bCs />
                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>
                                        <w:b />
                                        <w:bCs />
                                    </w:rPr>
                                    <w:t>Comments</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                    </w:tr>
                    <w:tr>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="990"
                                    w:type="dxa" />
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                    <w:rPr>
                                        <w:sz w:val="20" />
                                        <w:szCs w:val="20" />
                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>
                                        <w:sz w:val="20" />
                                        <w:szCs w:val="20" />
                                    </w:rPr>
                                    <w:t>1.0</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="2040"
                                    w:type="dxa" />
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                    <w:rPr>
                                        <w:sz w:val="20" />
                                        <w:szCs w:val="20" />
                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>
                                        <w:sz w:val="20" />
                                        <w:szCs w:val="20" />
                                    </w:rPr>
                                    <w:t>28 June 2018</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="5986"
                                    w:type="dxa" />
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                    <w:rPr>
                                        <w:sz w:val="20" />
                                        <w:szCs w:val="20" />
                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>
                                        <w:sz w:val="20" />
                                        <w:szCs w:val="20" />
                                    </w:rPr>
                                    <w:t>Issued.</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                    </w:tr>
                    <w:tr>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="990"
                                    w:type="dxa" />
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                    <w:rPr>
                                        <w:sz w:val="20" />
                                        <w:szCs w:val="20" />
                                    </w:rPr>
                                </w:pPr>
                                <w:r />
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="2040"
                                    w:type="dxa" />
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                    <w:rPr>
                                        <w:sz w:val="20" />
                                        <w:szCs w:val="20" />
                                    </w:rPr>
                                </w:pPr>
                                <w:r />
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="5986"
                                    w:type="dxa" />
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                    <w:rPr>
                                        <w:sz w:val="20" />
                                        <w:szCs w:val="20" />
                                    </w:rPr>
                                </w:pPr>
                                <w:r />
                            </w:p>
                        </w:tc>
                    </w:tr>
                </w:tbl>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0"
                            w:line="276"
                            w:lineRule="auto" />
                    </w:pPr>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:keepLines />
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0"
                            w:after="80"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:outlineLvl w:val="0" />
                        <w:rPr>
                            <w:color w:val="001C4A" />
                            <w:sz w:val="40" />
                            <w:szCs w:val="40" />
                        </w:rPr>
                    </w:pPr>
                    <w:r>
                        <w:rPr>
                            <w:color w:val="001C4A" />
                            <w:sz w:val="40" />
                            <w:szCs w:val="40" />
                        </w:rPr>
                        <w:br w:type="page" />
                    </w:r>
                    <w:r>
                        <w:rPr>
                            <w:color w:val="001C4A" />
                            <w:sz w:val="40" />
                            <w:szCs w:val="40" />
                        </w:rPr>
                        <w:t>About Retention and Disposal Authorities</w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:keepLines />
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0"
                            w:after="80"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:outlineLvl w:val="1" />
                        <w:rPr>
                            <w:color w:val="001C4A" />
                            <w:sz w:val="32" />
                            <w:szCs w:val="32" />
                        </w:rPr>
                    </w:pPr>
                    <w:r>
                        <w:rPr>
                            <w:color w:val="001C4A" />
                            <w:sz w:val="32" />
                            <w:szCs w:val="32" />
                        </w:rPr>
                        <w:t>Purpose of the authority</w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0"
                            w:line="276"
                            w:lineRule="auto" />
                    </w:pPr>
                    <w:bookmarkStart w:id="0"
                        w:name="_Hlk175559595" />
                    <w:r>
                        <w:t xml:space="preserve">The purpose of this retention and disposal authority is to identify those records (all formats) created and received by NSW public offices which are required as State archives and to provide approval for the destruction of certain other records created and received by NSW public offices, after minimum retention periods have been met. </w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0"
                            w:line="276"
                            w:lineRule="auto" />
                    </w:pPr>
                    <w:r>
                        <w:t xml:space="preserve">The approval for disposal is given under the provisions of the </w:t>
                    </w:r>
                    <w:r>
                        <w:rPr>
                            <w:i />
                            <w:iCs />
                        </w:rPr>
                        <w:t>State Records Act 1998</w:t>
                    </w:r>
                    <w:r>
                        <w:t xml:space="preserve"> only and does not override any other obligations of a public office to retain records.</w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0"
                            w:line="276"
                            w:lineRule="auto" />
                    </w:pPr>
                    <w:r>
                        <w:t xml:space="preserve">The records retention and disposal practices outlined in this authority are approved under section 21(2)(c) of the </w:t>
                    </w:r>
                    <w:r>
                        <w:rPr>
                            <w:i />
                        </w:rPr>
                        <w:t>State Records Act 1998 (NSW).</w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:rPr>
                            <w:sz w:val="12" />
                            <w:szCs w:val="12" />
                        </w:rPr>
                    </w:pPr>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:keepLines />
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0"
                            w:after="80"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:outlineLvl w:val="1" />
                        <w:rPr>
                            <w:color w:val="001C4A" />
                            <w:sz w:val="32" />
                            <w:szCs w:val="32" />
                        </w:rPr>
                    </w:pPr>
                    <w:r>
                        <w:rPr>
                            <w:color w:val="001C4A" />
                            <w:sz w:val="32" />
                            <w:szCs w:val="32" />
                        </w:rPr>
                        <w:t>The retention and disposal of State records</w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:contextualSpacing />
                    </w:pPr>
                    <w:r>
                        <w:t xml:space="preserve">Part 3 (Protection of State Records) of the Act provides that records are not to be disposed of without the consent of the State Records Authority NSW (State Records NSW) with certain defined exceptions. These exceptions include:</w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:numPr>
                            <w:ilvl w:val="1" />
                            <w:numId w:val="3" />
                        </w:numPr>
                        <w:spacing w:before="0"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:ind w:left="786" />
                        <w:contextualSpacing />
                    </w:pPr>
                    <w:r>
                        <w:t xml:space="preserve">an action of disposal which is positively required by law. This includes records retention and disposal authorities issued by State Records NSW and other legislation that requires the destruction of records. The </w:t>
                    </w:r>
                    <w:r>
                        <w:rPr>
                            <w:i />
                            <w:iCs />
                        </w:rPr>
                        <w:t>State Records Regulation 2024</w:t>
                    </w:r>
                    <w:r>
                        <w:t xml:space="preserve"> Schedule 1 lists some of the legislation that authorises the destruction of records.</w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:numPr>
                            <w:ilvl w:val="1" />
                            <w:numId w:val="3" />
                        </w:numPr>
                        <w:spacing w:before="0"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:ind w:left="786" />
                        <w:contextualSpacing />
                    </w:pPr>
                    <w:r>
                        <w:t xml:space="preserve">an action of disposal which takes place in accordance with a normal administrative practice (NAP) of the State Records Regulation of which State Records NSW does not disapprove.</w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:contextualSpacing />
                    </w:pPr>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:contextualSpacing />
                    </w:pPr>
                    <w:r>
                        <w:rPr>
                            <w:noProof />
                        </w:rPr>
                        <mc:AlternateContent>
                            <mc:Choice Requires="wps">
                                <w:drawing>
                                    <wp:anchor distT="45720"
                                        distB="45720"
                                        distL="114300"
                                        distR="114300"
                                        simplePos="0"
                                        relativeHeight="251662336"
                                        behindDoc="1"
                                        locked="0"
                                        layoutInCell="1"
                                        allowOverlap="1"
                                        wp14:anchorId="1C0EA2E7"
                                        wp14:editId="7C925A0E">
                                        <wp:simplePos x="0"
                                            y="0" />
                                        <wp:positionH relativeFrom="margin">
                                            <wp:align>right</wp:align>
                                        </wp:positionH>
                                        <wp:positionV relativeFrom="paragraph">
                                            <wp:posOffset>625475</wp:posOffset>
                                        </wp:positionV>
                                        <wp:extent cx="5749290"
                                            cy="2524125" />
                                        <wp:effectExtent l="0"
                                            t="0"
                                            r="3810"
                                            b="9525" />
                                        <wp:wrapTight wrapText="bothSides">
                                            <wp:wrapPolygon edited="0">
                                                <wp:start x="0"
                                                    y="0" />
                                                <wp:lineTo x="0"
                                                    y="21518" />
                                                <wp:lineTo x="21543"
                                                    y="21518" />
                                                <wp:lineTo x="21543"
                                                    y="0" />
                                                <wp:lineTo x="0"
                                                    y="0" />
                                            </wp:wrapPolygon>
                                        </wp:wrapTight>
                                        <wp:docPr id="217"
                                            name="Text Box 2" />
                                        <wp:cNvGraphicFramePr>
                                            <a:graphicFrameLocks
                                                xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" />
                                        </wp:cNvGraphicFramePr>
                                        <a:graphic
                                            xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main">
                                            <a:graphicData
                                                uri="http://schemas.microsoft.com/office/word/2010/wordprocessingShape">
                                                <wps:wsp>
                                                    <wps:cNvSpPr txBox="1">
                                                        <a:spLocks noChangeArrowheads="1" />
                                                    </wps:cNvSpPr>
                                                    <wps:spPr bwMode="auto">
                                                        <a:xfrm>
                                                            <a:off x="0"
                                                                y="0" />
                                                            <a:ext cx="5749290"
                                                                cy="2524125" />
                                                        </a:xfrm>
                                                        <a:prstGeom prst="rect">
                                                            <a:avLst />
                                                        </a:prstGeom>
                                                        <a:solidFill>
                                                            <a:srgbClr val="FFFFFF">
                                                                <a:lumMod val="95000" />
                                                            </a:srgbClr>
                                                        </a:solidFill>
                                                        <a:ln w="12700"
                                                            cap="flat"
                                                            cmpd="sng"
                                                            algn="ctr">
                                                            <a:noFill />
                                                            <a:prstDash val="solid" />
                                                            <a:headEnd />
                                                            <a:tailEnd />
                                                        </a:ln>
                                                        <a:effectLst />
                                                    </wps:spPr>
                                                    <wps:txbx>
                                                        <w:txbxContent>
                                                            <w:p>
                                                                <w:pPr>
                                                                    <w:widowControl w:val="0" />
                                                                    <w:spacing w:before="0"
                                                                        w:line="276"
                                                                        w:lineRule="auto" />
                                                                    <w:contextualSpacing />
                                                                    <w:rPr>
                                                                        <w:b />
                                                                        <w:bCs />
                                                                    </w:rPr>
                                                                </w:pPr>
                                                                <w:r>
                                                                    <w:rPr>
                                                                        <w:b />
                                                                        <w:bCs />
                                                                    </w:rPr>
                                                                    <w:t>Note:</w:t>
                                                                </w:r>
                                                            </w:p>
                                                            <w:p>
                                                                <w:pPr>
                                                                    <w:pStyle w:val="ListParagraph" />
                                                                    <w:widowControl w:val="0" />
                                                                    <w:numPr>
                                                                        <w:ilvl w:val="0" />
                                                                        <w:numId w:val="7" />
                                                                    </w:numPr>
                                                                    <w:spacing w:before="0"
                                                                        w:line="276"
                                                                        w:lineRule="auto" />
                                                                </w:pPr>
                                                                <w:r>
                                                                    <w:t xml:space="preserve">While State Records NSW gives approval for the destruction of certain records after minimum retention periods have been met in this retention and disposal authority, </w:t>
                                                                </w:r>
                                                                <w:r>
                                                                    <w:rPr>
                                                                        <w:u w:val="single" />
                                                                    </w:rPr>
                                                                    <w:t xml:space="preserve">it does not compel destruction of records.</w:t>
                                                                </w:r>
                                                                <w:r>
                                                                    <w:t xml:space="preserve"> Public offices are responsible for determining whether there are business or other needs for retaining records beyond the minimum retention periods set out in this authority.</w:t>
                                                                </w:r>
                                                            </w:p>
                                                            <w:p>
                                                                <w:pPr>
                                                                    <w:pStyle w:val="ListParagraph" />
                                                                    <w:widowControl w:val="0" />
                                                                    <w:spacing w:before="0"
                                                                        w:line="276"
                                                                        w:lineRule="auto" />
                                                                    <w:ind w:left="360" />
                                                                    <w:rPr>
                                                                        <w:sz w:val="10" />
                                                                        <w:szCs w:val="10" />
                                                                    </w:rPr>
                                                                </w:pPr>
                                                            </w:p>
                                                            <w:p>
                                                                <w:pPr>
                                                                    <w:pStyle w:val="ListParagraph" />
                                                                    <w:widowControl w:val="0" />
                                                                    <w:numPr>
                                                                        <w:ilvl w:val="0" />
                                                                        <w:numId w:val="7" />
                                                                    </w:numPr>
                                                                    <w:spacing w:line="276"
                                                                        w:lineRule="auto" />
                                                                </w:pPr>
                                                                <w:r>
                                                                    <w:t xml:space="preserve">A public office </w:t>
                                                                </w:r>
                                                                <w:r>
                                                                    <w:rPr>
                                                                        <w:u w:val="single" />
                                                                    </w:rPr>
                                                                    <w:t xml:space="preserve">must not dispose of any records where the public office is aware of possible legal action</w:t>
                                                                </w:r>
                                                                <w:r>
                                                                    <w:t xml:space="preserve"> (including legal discovery, court cases, formal applications for access (GIPA)) where the records may be required as evidence.</w:t>
                                                                </w:r>
                                                            </w:p>
                                                            <w:p>
                                                                <w:pPr>
                                                                    <w:widowControl w:val="0" />
                                                                    <w:spacing w:before="0"
                                                                        w:after="0"
                                                                        w:line="276"
                                                                        w:lineRule="auto" />
                                                                    <w:rPr>
                                                                        <w:sz w:val="8" />
                                                                        <w:szCs w:val="8" />
                                                                    </w:rPr>
                                                                </w:pPr>
                                                            </w:p>
                                                            <w:p>
                                                                <w:pPr>
                                                                    <w:pStyle w:val="ListParagraph" />
                                                                    <w:widowControl w:val="0" />
                                                                    <w:numPr>
                                                                        <w:ilvl w:val="0" />
                                                                        <w:numId w:val="7" />
                                                                    </w:numPr>
                                                                    <w:spacing w:before="0"
                                                                        w:line="276"
                                                                        w:lineRule="auto" />
                                                                </w:pPr>
                                                                <w:r>
                                                                    <w:t xml:space="preserve">For </w:t>
                                                                </w:r>
                                                                <w:r>
                                                                    <w:rPr>
                                                                        <w:u w:val="single" />
                                                                    </w:rPr>
                                                                    <w:t>records that are severely
                                                                        damaged</w:t>
                                                                </w:r>
                                                                <w:r>
                                                                    <w:t xml:space="preserve"> by fire, flood, mould, neglect etc. or for digital records that are unreadable or inaccessible, contact State Records NSW immediately when identified.</w:t>
                                                                </w:r>
                                                            </w:p>
                                                        </w:txbxContent>
                                                    </wps:txbx>
                                                    <wps:bodyPr rot="0"
                                                        vert="horz"
                                                        wrap="square"
                                                        lIns="91440"
                                                        tIns="45720"
                                                        rIns="91440"
                                                        bIns="45720"
                                                        anchor="t"
                                                        anchorCtr="0">
                                                        <a:noAutofit />
                                                    </wps:bodyPr>
                                                </wps:wsp>
                                            </a:graphicData>
                                        </a:graphic>
                                        <wp14:sizeRelH relativeFrom="margin">
                                            <wp14:pctWidth>0</wp14:pctWidth>
                                        </wp14:sizeRelH>
                                        <wp14:sizeRelV relativeFrom="margin">
                                            <wp14:pctHeight>0</wp14:pctHeight>
                                        </wp14:sizeRelV>
                                    </wp:anchor>
                                </w:drawing>
                            </mc:Choice>
                            <mc:Fallback>
                                <w:pict>
                                    <v:shapetype w14:anchorId="1C0EA2E7"
                                        id="_x0000_t202"
                                        coordsize="21600,21600"
                                        o:spt="202"
                                        path="m,l,21600r21600,l21600,xe">
                                        <v:stroke joinstyle="miter" />
                                        <v:path gradientshapeok="t"
                                            o:connecttype="rect" />
                                    </v:shapetype>
                                    <v:shape id="Text Box 2"
                                        o:spid="_x0000_s1026"
                                        type="#_x0000_t202"
                                        style="position:absolute;margin-left:401.5pt;margin-top:49.25pt;width:452.7pt;height:198.75pt;z-index:-251654144;visibility:visible;mso-wrap-style:square;mso-width-percent:0;mso-height-percent:0;mso-wrap-distance-left:9pt;mso-wrap-distance-top:3.6pt;mso-wrap-distance-right:9pt;mso-wrap-distance-bottom:3.6pt;mso-position-horizontal:right;mso-position-horizontal-relative:margin;mso-position-vertical:absolute;mso-position-vertical-relative:text;mso-width-percent:0;mso-height-percent:0;mso-width-relative:margin;mso-height-relative:margin;v-text-anchor:top"
                                        o:gfxdata="UEsDBBQABgAIAAAAIQC2gziS/gAAAOEBAAATAAAAW0NvbnRlbnRfVHlwZXNdLnhtbJSRQU7DMBBF&#xA;90jcwfIWJU67QAgl6YK0S0CoHGBkTxKLZGx5TGhvj5O2G0SRWNoz/78nu9wcxkFMGNg6quQqL6RA&#xA;0s5Y6ir5vt9lD1JwBDIwOMJKHpHlpr69KfdHjyxSmriSfYz+USnWPY7AufNIadK6MEJMx9ApD/oD&#xA;OlTrorhX2lFEilmcO2RdNtjC5xDF9pCuTyYBB5bi6bQ4syoJ3g9WQ0ymaiLzg5KdCXlKLjvcW893&#xA;SUOqXwnz5DrgnHtJTxOsQfEKIT7DmDSUCaxw7Rqn8787ZsmRM9e2VmPeBN4uqYvTtW7jvijg9N/y&#xA;JsXecLq0q+WD6m8AAAD//wMAUEsDBBQABgAIAAAAIQA4/SH/1gAAAJQBAAALAAAAX3JlbHMvLnJl&#xA;bHOkkMFqwzAMhu+DvYPRfXGawxijTi+j0GvpHsDYimMaW0Yy2fr2M4PBMnrbUb/Q94l/f/hMi1qR&#xA;JVI2sOt6UJgd+ZiDgffL8ekFlFSbvV0oo4EbChzGx4f9GRdb25HMsYhqlCwG5lrLq9biZkxWOiqY&#xA;22YiTra2kYMu1l1tQD30/bPm3wwYN0x18gb45AdQl1tp5j/sFB2T0FQ7R0nTNEV3j6o9feQzro1i&#xA;OWA14Fm+Q8a1a8+Bvu/d/dMb2JY5uiPbhG/ktn4cqGU/er3pcvwCAAD//wMAUEsDBBQABgAIAAAA&#xA;IQCxMRUMNQIAAEsEAAAOAAAAZHJzL2Uyb0RvYy54bWysVNuO0zAQfUfiHyy/06RRS2nUdLW0FCEt&#xA;F2nhAyaOcxGOx9huk/L1jJ22u8AbIg+Wx2OfOXNmJpu7sVfsJK3rUBd8Pks5k1pg1emm4N++Hl69&#xA;4cx50BUo1LLgZ+n43fbli81gcplhi6qSlhGIdvlgCt56b/IkcaKVPbgZGqnJWaPtwZNpm6SyMBB6&#xA;r5IsTV8nA9rKWBTSOTrdT06+jfh1LYX/XNdOeqYKTtx8XG1cy7Am2w3kjQXTduJCA/6BRQ+dpqA3&#xA;qD14YEfb/QXVd8Kiw9rPBPYJ1nUnZMyBspmnf2Tz2IKRMRcSx5mbTO7/wYpPp0fzxTI/vsWRChiT&#xA;cOYBxXfHNO5a0I28txaHVkJFgedBsmQwLr88DVK73AWQcviIFRUZjh4j0FjbPqhCeTJCpwKcb6LL&#xA;0TNBh8vVYp2tySXIly2zxTxbxhiQX58b6/x7iT0Lm4JbqmqEh9OD84EO5NcrIZpD1VWHTqlo2Kbc&#xA;KctOQB1wiF98q449kZ2O18s0ja1AQG66H0F/A1KaDZR+tqKrTAD1aq3A07Y3VcGdbjgD1dAQCG9j&#xA;BI2BQ2ywwG4Prp3CRdip84Ko73QVL3no1LQnGkoH8jJ28CXJq8yT4H4sR3oWDkuszqS+xam7aRpp&#xA;06L9ydlAnU3kfhzBSs7UB00VXM8XizAK0VgsVxkZ9rmnfO4BLQiq4JTptN35OD6BnsZ7qnTdxRo8&#xA;Mbn0B3VsVPEyXWEkntvx1tM/YPsLAAD//wMAUEsDBBQABgAIAAAAIQDUqsQO3gAAAAcBAAAPAAAA&#xA;ZHJzL2Rvd25yZXYueG1sTI9BS8NAFITvgv9heYI3u6umJUnzUkqhF0HBKvS6zb4mqdm3aXbTxn/v&#xA;etLjMMPMN8Vqsp240OBbxwiPMwWCuHKm5Rrh82P7kILwQbPRnWNC+CYPq/L2ptC5cVd+p8su1CKW&#xA;sM81QhNCn0vpq4as9jPXE0fv6AarQ5RDLc2gr7HcdvJJqYW0uuW40OieNg1VX7vRIpj962b7vD6d&#xA;5PSWnId0f0778QXx/m5aL0EEmsJfGH7xIzqUkengRjZedAjxSEDI0jmI6GZqnoA4ICTZQoEsC/mf&#xA;v/wBAAD//wMAUEsBAi0AFAAGAAgAAAAhALaDOJL+AAAA4QEAABMAAAAAAAAAAAAAAAAAAAAAAFtD&#xA;b250ZW50X1R5cGVzXS54bWxQSwECLQAUAAYACAAAACEAOP0h/9YAAACUAQAACwAAAAAAAAAAAAAA&#xA;AAAvAQAAX3JlbHMvLnJlbHNQSwECLQAUAAYACAAAACEAsTEVDDUCAABLBAAADgAAAAAAAAAAAAAA&#xA;AAAuAgAAZHJzL2Uyb0RvYy54bWxQSwECLQAUAAYACAAAACEA1KrEDt4AAAAHAQAADwAAAAAAAAAA&#xA;AAAAAACPBAAAZHJzL2Rvd25yZXYueG1sUEsFBgAAAAAEAAQA8wAAAJoFAAAAAA==&#xA;"
                                        fillcolor="#f2f2f2"
                                        stroked="f"
                                        strokeweight="1pt">
                                        <v:textbox>
                                            <w:txbxContent>
                                                <w:p>
                                                    <w:pPr>
                                                        <w:widowControl w:val="0" />
                                                        <w:spacing w:before="0"
                                                            w:line="276"
                                                            w:lineRule="auto" />
                                                        <w:contextualSpacing />
                                                        <w:rPr>
                                                            <w:b />
                                                            <w:bCs />
                                                        </w:rPr>
                                                    </w:pPr>
                                                    <w:r>
                                                        <w:rPr>
                                                            <w:b />
                                                            <w:bCs />
                                                        </w:rPr>
                                                        <w:t>Note:</w:t>
                                                    </w:r>
                                                </w:p>
                                                <w:p>
                                                    <w:pPr>
                                                        <w:pStyle w:val="ListParagraph" />
                                                        <w:widowControl w:val="0" />
                                                        <w:numPr>
                                                            <w:ilvl w:val="0" />
                                                            <w:numId w:val="7" />
                                                        </w:numPr>
                                                        <w:spacing w:before="0"
                                                            w:line="276"
                                                            w:lineRule="auto" />
                                                        <w:rPr>
                                                            <w:rFonts w:cs="Arial" />
                                                        </w:rPr>
                                                    </w:pPr>
                                                    <w:r>
                                                        <w:t xml:space="preserve">While State Records NSW gives approval for the destruction of certain records after minimum retention periods have been met in this retention and disposal authority, </w:t>
                                                    </w:r>
                                                    <w:r>
                                                        <w:rPr>
                                                            <w:u w:val="single" />
                                                        </w:rPr>
                                                        <w:t xml:space="preserve">it does not compel destruction of records.</w:t>
                                                    </w:r>
                                                    <w:r>
                                                        <w:t xml:space="preserve"> Public offices are responsible for determining whether there are business or other needs for retaining records beyond the minimum retention periods set out in this authority.</w:t>
                                                    </w:r>
                                                </w:p>
                                                <w:p>
                                                    <w:pPr>
                                                        <w:pStyle w:val="ListParagraph" />
                                                        <w:widowControl w:val="0" />
                                                        <w:spacing w:before="0"
                                                            w:line="276"
                                                            w:lineRule="auto" />
                                                        <w:ind w:left="360" />
                                                        <w:rPr>
                                                            <w:sz w:val="10" />
                                                            <w:szCs w:val="10" />
                                                        </w:rPr>
                                                    </w:pPr>
                                                </w:p>
                                                <w:p>
                                                    <w:pPr>
                                                        <w:pStyle w:val="ListParagraph" />
                                                        <w:widowControl w:val="0" />
                                                        <w:numPr>
                                                            <w:ilvl w:val="0" />
                                                            <w:numId w:val="7" />
                                                        </w:numPr>
                                                        <w:spacing w:line="276"
                                                            w:lineRule="auto" />
                                                    </w:pPr>
                                                    <w:r>
                                                        <w:t xml:space="preserve">A public office </w:t>
                                                    </w:r>
                                                    <w:r>
                                                        <w:rPr>
                                                            <w:u w:val="single" />
                                                        </w:rPr>
                                                        <w:t xml:space="preserve">must not dispose of any records where the public office is aware of possible legal action</w:t>
                                                    </w:r>
                                                    <w:r>
                                                        <w:t xml:space="preserve"> (including legal discovery, court cases, formal applications for access (GIPA)) where the records may be required as evidence.</w:t>
                                                    </w:r>
                                                </w:p>
                                                <w:p>
                                                    <w:pPr>
                                                        <w:widowControl w:val="0" />
                                                        <w:spacing w:before="0"
                                                            w:after="0"
                                                            w:line="276"
                                                            w:lineRule="auto" />
                                                        <w:rPr>
                                                            <w:sz w:val="8" />
                                                            <w:szCs w:val="8" />
                                                        </w:rPr>
                                                    </w:pPr>
                                                </w:p>
                                                <w:p>
                                                    <w:pPr>
                                                        <w:pStyle w:val="ListParagraph" />
                                                        <w:widowControl w:val="0" />
                                                        <w:numPr>
                                                            <w:ilvl w:val="0" />
                                                            <w:numId w:val="7" />
                                                        </w:numPr>
                                                        <w:spacing w:before="0"
                                                            w:line="276"
                                                            w:lineRule="auto" />
                                                    </w:pPr>
                                                    <w:r>
                                                        <w:t xml:space="preserve">For </w:t>
                                                    </w:r>
                                                    <w:r>
                                                        <w:rPr>
                                                            <w:u w:val="single" />
                                                        </w:rPr>
                                                        <w:t>records that are severely damaged</w:t>
                                                    </w:r>
                                                    <w:r>
                                                        <w:t xml:space="preserve"> by fire, flood, mould, neglect etc. or for digital records that are unreadable or inaccessible, contact State Records NSW immediately when identified.</w:t>
                                                    </w:r>
                                                </w:p>
                                            </w:txbxContent>
                                        </v:textbox>
                                        <w10:wrap type="tight"
                                            anchorx="margin" />
                                    </v:shape>
                                </w:pict>
                            </mc:Fallback>
                        </mc:AlternateContent>
                    </w:r>
                    <w:r>
                        <w:t xml:space="preserve">The authority establishes how long different classes of records generated by a public office must be kept to meet its legal, operational and other requirements, and whether the records are required as State archives.</w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0"
                            w:line="276"
                            w:lineRule="auto" />
                    </w:pPr>
                    <w:r>
                        <w:t xml:space="preserve">State Records NSW reviews and approves public offices' retention and disposal authorities under the State Records Act. State Records NSW’s decisions consider both the administrative requirements of public offices in discharging their functional responsibilities and the potential future use of the records by the NSW Government and the public.</w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0"
                            w:line="276"
                            w:lineRule="auto" />
                    </w:pPr>
                    <w:r>
                        <w:t xml:space="preserve">It is the duty of a public office, in submitting a draft retention and disposal authority for approval, to disclose to State Records NSW any information which affects the retention of the records covered by the authority.</w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0"
                            w:line="276"
                            w:lineRule="auto" />
                    </w:pPr>
                    <w:r>
                        <w:t xml:space="preserve">Retention and disposal authorities identify some records as State archives. These are records which document the authority and functions of Government, its decision-making processes and the implementation and outcomes of those decisions, including the nature of their influence and effect on communities, environment and individual lives. Criteria for the identification of State archives are listed in the </w:t>
                    </w:r>
                    <w:r>
                        <w:rPr>
                            <w:i />
                        </w:rPr>
                        <w:t>Building the Archives Policy</w:t>
                    </w:r>
                    <w:r>
                        <w:t xml:space="preserve">. The Policy also explains the roles and responsibilities of State Records NSW and of public offices in undertaking appraisal processes and disposal activities.</w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0"
                            w:line="276"
                            w:lineRule="auto" />
                    </w:pPr>
                    <w:r>
                        <w:t xml:space="preserve">Retention and disposal authorities have been designed to link records to the functions they document rather than to organisational structure (i.e. departments or clusters). </w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:contextualSpacing />
                    </w:pPr>
                    <w:r>
                        <w:t xml:space="preserve">Public offices must ensure when outsourcing that service providers are aware of their recordkeeping obligations to apply relevant retention and disposal authorities. </w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0"
                            w:after="0"
                            w:line="276"
                            w:lineRule="auto" />
                    </w:pPr>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:rPr>
                            <w:b />
                            <w:bCs />
                        </w:rPr>
                    </w:pPr>
                    <w:r>
                        <w:rPr>
                            <w:b />
                            <w:bCs />
                        </w:rPr>
                        <w:t>Normal administrative practice (NAP)</w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0"
                            w:line="276"
                            w:lineRule="auto" />
                    </w:pPr>
                    <w:r>
                        <w:t xml:space="preserve">Another means to lawfully dispose of State records is in accordance with the normal administrative practice provisions (NAP) of the State Records Act which allow for the disposal of certain types of facilitative and duplicate records.</w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:rPr>
                            <w:i />
                            <w:iCs />
                        </w:rPr>
                    </w:pPr>
                    <w:r>
                        <w:t xml:space="preserve">Public offices should produce internal policies and procedures to further define what is meant by and what are acceptable NAP for their own organisation. Examples of NAP include duplicates of records, some drafts, working papers, unused stationary. </w:t>
                    </w:r>
                    <w:r>
                        <w:rPr>
                            <w:i />
                            <w:iCs />
                        </w:rPr>
                        <w:t xml:space="preserve">See State Records Act 1998, section 22 and State Records Regulation 2024, Schedule 2.</w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0"
                            w:line="276"
                            w:lineRule="auto" />
                    </w:pPr>
                    <w:r>
                        <w:t xml:space="preserve">Records covered by the normal administrative practice provisions of the Act are not included in records retention and disposal authorities.</w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:rPr>
                            <w:i />
                            <w:iCs />
                        </w:rPr>
                    </w:pPr>
                </w:p>
                <w:bookmarkEnd w:id="0" />
                <w:p>
                    <w:pPr>
                        <w:keepLines />
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0"
                            w:after="80"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:outlineLvl w:val="1" />
                        <w:rPr>
                            <w:color w:val="001C4A" />
                            <w:sz w:val="32" />
                            <w:szCs w:val="32" />
                        </w:rPr>
                    </w:pPr>
                    <w:r>
                        <w:rPr>
                            <w:color w:val="001C4A" />
                            <w:sz w:val="32" />
                            <w:szCs w:val="32" />
                        </w:rPr>
                        <w:t>Implementing the authority</w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0"
                            w:line="276"
                            w:lineRule="auto" />
                    </w:pPr>
                    <w:bookmarkStart w:id="1"
                        w:name="_Hlk175559668" />
                    <w:r>
                        <w:t xml:space="preserve">This retention and disposal authority covers records controlled by the public office and applies only to the records or classes of records described in the authority. The authority should be implemented as part of the records management program of the public office. </w:t>
                    </w:r>
                    <w:bookmarkStart w:id="2"
                        w:name="_Hlk174020171" />
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0"
                            w:line="276"
                            w:lineRule="auto" />
                    </w:pPr>
                    <w:r>
                        <w:t>Two primary objectives of a records management program are to:</w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:numPr>
                            <w:ilvl w:val="0" />
                            <w:numId w:val="4" />
                        </w:numPr>
                        <w:spacing w:before="0"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:contextualSpacing />
                    </w:pPr>
                    <w:r>
                        <w:t xml:space="preserve">ensure that records are kept for as long as they are of value to the public office and its stakeholders</w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:numPr>
                            <w:ilvl w:val="0" />
                            <w:numId w:val="4" />
                        </w:numPr>
                        <w:spacing w:before="0"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:contextualSpacing />
                    </w:pPr>
                    <w:r>
                        <w:t xml:space="preserve">enable the destruction of records or transfer of State archives once they are no longer required for business or operational purposes.</w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:ind w:left="720" />
                        <w:contextualSpacing />
                    </w:pPr>
                    <w:r />
                </w:p>
                <w:bookmarkEnd w:id="1" />
                <w:bookmarkEnd w:id="2" />
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:ind w:left="720" />
                        <w:contextualSpacing />
                        <w:rPr>
                            <w:sz w:val="10" />
                            <w:szCs w:val="10" />
                        </w:rPr>
                    </w:pPr>
                </w:p>
                <w:tbl>
                    <w:tblPr>
                        <w:tblW w:w="5157"
                            w:type="pct" />
                        <w:tblInd w:w="-284"
                            w:type="dxa" />
                        <w:tblBorders>
                            <w:right w:val="single"
                                w:sz="4"
                                w:space="0"
                                w:color="auto" />
                            <w:insideH w:val="single"
                                w:sz="4"
                                w:space="0"
                                w:color="auto" />
                        </w:tblBorders>
                        <w:tblCellMar>
                            <w:top w:w="57"
                                w:type="dxa" />
                            <w:left w:w="113"
                                w:type="dxa" />
                            <w:right w:w="56"
                                w:type="dxa" />
                        </w:tblCellMar>
                        <w:tblLook w:val="0000"
                            w:firstRow="0"
                            w:lastRow="0"
                            w:firstColumn="0"
                            w:lastColumn="0"
                            w:noHBand="0"
                            w:noVBand="0" />
                    </w:tblPr>
                    <w:tblGrid>
                        <w:gridCol w:w="1418" />
                        <w:gridCol w:w="7938" />
                    </w:tblGrid>
                    <w:tr>
                        <w:trPr>
                            <w:cantSplit />
                        </w:trPr>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="758"
                                    w:type="pct" />
                                <w:shd w:val="clear"
                                    w:color="auto"
                                    w:fill="FFFFFF" />
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                    <w:rPr>
                                        <w:b />
                                        <w:bCs />
                                    </w:rPr>
                                </w:pPr>
                                <w:bookmarkStart w:id="3"
                                    w:name="_Hlk175559690" />
                                <w:r>
                                    <w:rPr>
                                        <w:b />
                                        <w:bCs />
                                    </w:rPr>
                                    <w:t>Sentencing records</w:t>
                                </w:r>
                            </w:p>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                    <w:ind w:left="360" />
                                    <w:rPr>
                                        <w:b />
                                        <w:iCs />
                                    </w:rPr>
                                </w:pPr>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="4242"
                                    w:type="pct" />
                                <w:tcBorders>
                                    <w:right w:val="nil" />
                                </w:tcBorders>
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                </w:pPr>
                                <w:r>
                                    <w:t xml:space="preserve">Sentencing is the examination of records to identify the disposal class in the authority to which they belong. This process enables the public office to determine the appropriate retention period and disposal action for the records. </w:t>
                                </w:r>
                            </w:p>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                </w:pPr>
                                <w:r>
                                    <w:t xml:space="preserve">It is recommended that this process be undertaken when a record is created.</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                    </w:tr>
                    <w:tr>
                        <w:trPr>
                            <w:cantSplit />
                        </w:trPr>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="758"
                                    w:type="pct" />
                                <w:shd w:val="clear"
                                    w:color="auto"
                                    w:fill="FFFFFF" />
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                    <w:rPr>
                                        <w:b />
                                        <w:bCs />
                                    </w:rPr>
                                </w:pPr>
                                <w:bookmarkStart w:id="4"
                                    w:name="_Hlk175559701" />
                                <w:bookmarkEnd w:id="3" />
                                <w:r>
                                    <w:rPr>
                                        <w:b />
                                        <w:bCs />
                                    </w:rPr>
                                    <w:t>Digitised records</w:t>
                                </w:r>
                            </w:p>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                    <w:ind w:left="360" />
                                    <w:rPr>
                                        <w:b />
                                        <w:bCs />
                                    </w:rPr>
                                </w:pPr>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="4242"
                                    w:type="pct" />
                                <w:tcBorders>
                                    <w:right w:val="nil" />
                                </w:tcBorders>
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                </w:pPr>
                                <w:r>
                                    <w:t xml:space="preserve">Where the format of records has changed (for example, from paper-based to digital) disposal actions in the authority still apply to the records. The digitised versions of records are to be retained for the minimum retention periods in a retention and disposal authority or managed as State archives.</w:t>
                                </w:r>
                            </w:p>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                </w:pPr>
                                <w:r>
                                    <w:t xml:space="preserve">Where a record is copied (for example, digitally imaged or microfilmed) the original should only be disposed of with authorisation under the </w:t>
                                </w:r>
                                <w:r>
                                    <w:rPr>
                                        <w:i />
                                    </w:rPr>
                                    <w:t xml:space="preserve">General retention and disposal authority – original or source records that have been copied</w:t>
                                </w:r>
                                <w:r>
                                    <w:t xml:space="preserve">. </w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                    </w:tr>
                    <w:tr>
                        <w:trPr>
                            <w:cantSplit />
                        </w:trPr>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="758"
                                    w:type="pct" />
                                <w:shd w:val="clear"
                                    w:color="auto"
                                    w:fill="FFFFFF" />
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                    <w:rPr>
                                        <w:b />
                                        <w:bCs />
                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>
                                        <w:b />
                                        <w:bCs />
                                    </w:rPr>
                                    <w:t>Born digital records</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="4242"
                                    w:type="pct" />
                                <w:tcBorders>
                                    <w:right w:val="nil" />
                                </w:tcBorders>
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                </w:pPr>
                                <w:r>
                                    <w:t xml:space="preserve">For records natively created in a digital format such as emails, Word documents, database records or created by artificial intelligence (AI) disposal actions in the authority still apply.</w:t>
                                </w:r>
                            </w:p>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                </w:pPr>
                                <w:r>
                                    <w:t xml:space="preserve">Born digital records and digitised records must be authentic, usable and accessible over the whole of their existence. The information contained in technology dependant records must be accessible for the period specified in the classes. Public offices will need to ensure that any software, hardware or documentation required for continuing access to technology dependent records is available for the retention period of the record. See the </w:t>
                                </w:r>
                                <w:r>
                                    <w:rPr>
                                        <w:i />
                                        <w:iCs />
                                    </w:rPr>
                                    <w:t>Digital records preservation policy.</w:t>
                                </w:r>
                                <w:r />
                            </w:p>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                </w:pPr>
                                <w:r>
                                    <w:t xml:space="preserve">Ensure metadata of the record clearly identifies and contextualises the information contained within to make searching and sentencing easy now and into the future. </w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                    </w:tr>
                    <w:bookmarkEnd w:id="4" />
                    <w:tr>
                        <w:trPr>
                            <w:cantSplit />
                        </w:trPr>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="758"
                                    w:type="pct" />
                                <w:shd w:val="clear"
                                    w:color="auto"
                                    w:fill="FFFFFF" />
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                    <w:rPr>
                                        <w:b />
                                        <w:iCs />
                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>
                                        <w:b />
                                        <w:iCs />
                                    </w:rPr>
                                    <w:t>Records required as State archives</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="4242"
                                    w:type="pct" />
                                <w:tcBorders>
                                    <w:right w:val="nil" />
                                </w:tcBorders>
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                </w:pPr>
                                <w:bookmarkStart w:id="5"
                                    w:name="_Hlk175559718" />
                                <w:r>
                                    <w:t xml:space="preserve">Records which are to be retained as State archives are identified with the disposal action 'Required as State archives'. These records should be stored in controlled environmental conditions. See the </w:t>
                                </w:r>
                                <w:r>
                                    <w:rPr>
                                        <w:i />
                                        <w:iCs />
                                    </w:rPr>
                                    <w:t>Standard on the physical storage of State records.</w:t>
                                </w:r>
                            </w:p>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                </w:pPr>
                                <w:r>
                                    <w:t xml:space="preserve">Transferring records identified as State archives and no longer in use for official purposes to Museums of History NSW should be a routine part of a public office's records management program.</w:t>
                                </w:r>
                                <w:bookmarkEnd w:id="5" />
                            </w:p>
                        </w:tc>
                    </w:tr>
                    <w:tr>
                        <w:trPr>
                            <w:trHeight w:val="4085" />
                        </w:trPr>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="758"
                                    w:type="pct" />
                                <w:shd w:val="clear"
                                    w:color="auto"
                                    w:fill="FFFFFF" />
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                    <w:rPr>
                                        <w:b />
                                        <w:iCs />
                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>
                                        <w:b />
                                        <w:iCs />
                                    </w:rPr>
                                    <w:t>Records approved for destruction</w:t>
                                </w:r>
                            </w:p>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                    <w:rPr>
                                        <w:b />
                                        <w:iCs />
                                    </w:rPr>
                                </w:pPr>
                            </w:p>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                    <w:rPr>
                                        <w:b />
                                        <w:iCs />
                                    </w:rPr>
                                </w:pPr>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="4242"
                                    w:type="pct" />
                                <w:tcBorders>
                                    <w:right w:val="nil" />
                                </w:tcBorders>
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                </w:pPr>
                                <w:bookmarkStart w:id="6"
                                    w:name="_Hlk175559732" />
                                <w:r>
                                    <w:t xml:space="preserve">Records that have been identified as being approved for destruction may only be destroyed once a public office has ensured that all other requirements for retaining the records are met. </w:t>
                                </w:r>
                            </w:p>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                </w:pPr>
                                <w:r>
                                    <w:t xml:space="preserve">Retention periods set down in this authority are </w:t>
                                </w:r>
                                <w:r>
                                    <w:rPr>
                                        <w:i />
                                    </w:rPr>
                                    <w:t>minimum</w:t>
                                </w:r>
                                <w:r>
                                    <w:t xml:space="preserve"> periods only and a public office should keep records for a longer period if necessary. Reasons for longer retention can include legal requirements, administrative need, government directives and changing social or community expectations. </w:t>
                                </w:r>
                            </w:p>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                </w:pPr>
                                <w:r>
                                    <w:t xml:space="preserve">State Records NSW does not compel destruction. A public office </w:t>
                                </w:r>
                                <w:r>
                                    <w:rPr>
                                        <w:b />
                                        <w:i />
                                    </w:rPr>
                                    <w:t>must not</w:t>
                                </w:r>
                                <w:r>
                                    <w:t xml:space="preserve"> dispose of any records where the public office is aware of possible legal action (including legal discovery, court cases, formal applications for access (GIPA)) where the records may be required as evidence.</w:t>
                                </w:r>
                            </w:p>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                </w:pPr>
                                <w:r>
                                    <w:t xml:space="preserve">Once all requirements for retention have been met, destruction of records should be carried out securely and in an environmentally sound way. Relevant details of the destruction should be recorded. </w:t>
                                </w:r>
                                <w:bookmarkEnd w:id="6" />
                            </w:p>
                        </w:tc>
                    </w:tr>
                </w:tbl>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:rPr>
                            <w:sz w:val="10" />
                            <w:szCs w:val="10" />
                        </w:rPr>
                    </w:pPr>
                    <w:bookmarkStart w:id="7"
                        w:name="_Hlk175559739" />
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0"
                            w:line="276"
                            w:lineRule="auto" />
                    </w:pPr>
                    <w:r>
                        <w:t xml:space="preserve">Regardless of whether a record has been approved for destruction or is required as a State archive, a public office or an officer of a public office </w:t>
                    </w:r>
                    <w:r>
                        <w:rPr>
                            <w:b />
                            <w:i />
                        </w:rPr>
                        <w:t>must not</w:t>
                    </w:r>
                    <w:r>
                        <w:t xml:space="preserve"> permanently transfer possession or ownership of a State record to any person or public office without the explicit approval of State Records NSW.</w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0"
                            w:line="276"
                            w:lineRule="auto" />
                    </w:pPr>
                </w:p>
                <w:bookmarkEnd w:id="7" />
                <w:p>
                    <w:pPr>
                        <w:keepLines />
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0"
                            w:after="80"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:outlineLvl w:val="1" />
                        <w:rPr>
                            <w:color w:val="001C4A" />
                            <w:sz w:val="32" />
                            <w:szCs w:val="32" />
                        </w:rPr>
                    </w:pPr>
                    <w:r>
                        <w:rPr>
                            <w:color w:val="001C4A" />
                            <w:sz w:val="32" />
                            <w:szCs w:val="32" />
                        </w:rPr>
                        <w:t>Amendment and review of this authority</w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0"
                            w:line="276"
                            w:lineRule="auto" />
                    </w:pPr>
                    <w:bookmarkStart w:id="8"
                        w:name="_Hlk175559774" />
                    <w:r>
                        <w:t xml:space="preserve">The State Records NSW Board must approve any amendment to this authority. Public offices that use the authority should advise State Records NSW of any proposed changes or amendments to the authority. </w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0"
                            w:after="0"
                            w:line="276"
                            w:lineRule="auto" />
                    </w:pPr>
                    <w:r>
                        <w:t xml:space="preserve">State Records NSW recommends that public offices check retention and disposal authorities </w:t>
                    </w:r>
                    <w:r>
                        <w:rPr>
                            <w:bCs />
                        </w:rPr>
                        <w:t>more than 10 years old</w:t>
                    </w:r>
                    <w:r>
                        <w:t xml:space="preserve"> to ensure that they are an appropriate mechanism for disposal of records.</w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0"
                            w:after="0"
                            w:line="276"
                            w:lineRule="auto" />
                    </w:pPr>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0"
                            w:after="0"
                            w:line="276"
                            w:lineRule="auto" />
                    </w:pPr>
                    <w:r>
                        <w:t>Retention requirements may change over time. This can occur when:</w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:numPr>
                            <w:ilvl w:val="0" />
                            <w:numId w:val="6" />
                        </w:numPr>
                        <w:spacing w:before="0"
                            w:after="0"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:contextualSpacing />
                    </w:pPr>
                    <w:r>
                        <w:t>business needs or practices change</w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:numPr>
                            <w:ilvl w:val="0" />
                            <w:numId w:val="6" />
                        </w:numPr>
                        <w:spacing w:before="0"
                            w:after="0"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:contextualSpacing />
                    </w:pPr>
                    <w:r>
                        <w:t>new Government functions are introduced</w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:numPr>
                            <w:ilvl w:val="0" />
                            <w:numId w:val="6" />
                        </w:numPr>
                        <w:spacing w:before="0"
                            w:after="0"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:contextualSpacing />
                    </w:pPr>
                    <w:r>
                        <w:t xml:space="preserve">new laws, regulations or standards are introduced</w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:numPr>
                            <w:ilvl w:val="0" />
                            <w:numId w:val="6" />
                        </w:numPr>
                        <w:spacing w:before="0"
                            w:after="0"
                            w:line="276"
                            w:lineRule="auto" />
                    </w:pPr>
                    <w:r>
                        <w:t>new technology is implemented</w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:numPr>
                            <w:ilvl w:val="0" />
                            <w:numId w:val="6" />
                        </w:numPr>
                        <w:spacing w:before="0"
                            w:after="0"
                            w:line="276"
                            w:lineRule="auto" />
                    </w:pPr>
                    <w:r>
                        <w:t xml:space="preserve">government administration is restructured and functions are moved between entities, or</w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:numPr>
                            <w:ilvl w:val="0" />
                            <w:numId w:val="6" />
                        </w:numPr>
                        <w:spacing w:before="0"
                            w:after="0"
                            w:line="276"
                            w:lineRule="auto" />
                    </w:pPr>
                    <w:r>
                        <w:t>unforeseen or new community expectations become apparent.</w:t>
                    </w:r>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0"
                            w:after="0"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:ind w:left="720" />
                    </w:pPr>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0"
                            w:line="276"
                            w:lineRule="auto" />
                    </w:pPr>
                    <w:r>
                        <w:t xml:space="preserve">The movement of specified functions between branches or units within the public office does not require the authority to be resubmitted to State Records NSW for approval. However, when functions move from one public office to another, the public office that inherits the new function should contact State Records NSW to discuss use of any existing retention and disposal authority approved for use by a predecessor public office.</w:t>
                    </w:r>
                    <w:bookmarkEnd w:id="8" />
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:ind w:firstLine="567" />
                        <w:rPr>
                            <w:color w:val="001C4A" />
                            <w:sz w:val="28" />
                            <w:szCs w:val="28" />
                        </w:rPr>
                    </w:pPr>
                </w:p>
                <w:p>
                    <w:pPr>
                        <w:widowControl w:val="0" />
                        <w:spacing w:before="0"
                            w:line="276"
                            w:lineRule="auto" />
                        <w:rPr>
                            <w:color w:val="001C4A" />
                            <w:sz w:val="32" />
                            <w:szCs w:val="32" />
                        </w:rPr>
                    </w:pPr>
                    <w:r>
                        <w:rPr>
                            <w:color w:val="001C4A" />
                            <w:sz w:val="32" />
                            <w:szCs w:val="32" />
                        </w:rPr>
                        <w:t>Glossary</w:t>
                    </w:r>
                </w:p>
                <w:tbl>
                    <w:tblPr>
                        <w:tblW w:w="5000"
                            w:type="pct" />
                        <w:tblInd w:w="-56"
                            w:type="dxa" />
                        <w:tblBorders>
                            <w:right w:val="single"
                                w:sz="4"
                                w:space="0"
                                w:color="auto" />
                            <w:insideH w:val="single"
                                w:sz="4"
                                w:space="0"
                                w:color="auto" />
                        </w:tblBorders>
                        <w:tblCellMar>
                            <w:top w:w="57"
                                w:type="dxa" />
                            <w:left w:w="57"
                                w:type="dxa" />
                            <w:right w:w="56"
                                w:type="dxa" />
                        </w:tblCellMar>
                        <w:tblLook w:val="0000"
                            w:firstRow="0"
                            w:lastRow="0"
                            w:firstColumn="0"
                            w:lastColumn="0"
                            w:noHBand="0"
                            w:noVBand="0" />
                    </w:tblPr>
                    <w:tblGrid>
                        <w:gridCol w:w="56" />
                        <w:gridCol w:w="1702" />
                        <w:gridCol w:w="7313" />
                    </w:tblGrid>
                    <w:tr>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="968"
                                    w:type="pct" />
                                <w:gridSpan w:val="2" />
                                <w:shd w:val="clear"
                                    w:color="auto"
                                    w:fill="FFFFFF" />
                                <w:vAlign w:val="center" />
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                    <w:rPr>
                                        <w:b />
                                        <w:bCs />
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                </w:pPr>
                                <w:bookmarkStart w:id="9"
                                    w:name="_Hlk175559817" />
                                <w:r>
                                    <w:rPr>
                                        <w:b />
                                        <w:bCs />
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                    <w:t>Activities / Functions</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="4032"
                                    w:type="pct" />
                                <w:tcBorders>
                                    <w:right w:val="nil" />
                                </w:tcBorders>
                                <w:vAlign w:val="center" />
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                    <w:rPr>
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                    <w:t xml:space="preserve">The authority identifies core business functions and/or activities. Each will have a definition to clarify the records that may be covered. </w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                    </w:tr>
                    <w:tr>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="968"
                                    w:type="pct" />
                                <w:gridSpan w:val="2" />
                                <w:shd w:val="clear"
                                    w:color="auto"
                                    w:fill="FFFFFF" />
                                <w:vAlign w:val="center" />
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                    <w:rPr>
                                        <w:b />
                                        <w:bCs />
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>
                                        <w:b />
                                        <w:bCs />
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                    <w:t>Destruction</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="4032"
                                    w:type="pct" />
                                <w:tcBorders>
                                    <w:right w:val="nil" />
                                </w:tcBorders>
                                <w:vAlign w:val="center" />
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                    <w:rPr>
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                    <w:t xml:space="preserve">Process of eliminating or deleting a record, beyond any possible reconstruction. The process includes destroying all copies of the record. Destruction of State records must be documented.</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                    </w:tr>
                    <w:tr>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="968"
                                    w:type="pct" />
                                <w:gridSpan w:val="2" />
                                <w:shd w:val="clear"
                                    w:color="auto"
                                    w:fill="FFFFFF" />
                                <w:vAlign w:val="center" />
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                    <w:rPr>
                                        <w:b />
                                        <w:bCs />
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>
                                        <w:b />
                                        <w:bCs />
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                    <w:t>Disposal action</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="4032"
                                    w:type="pct" />
                                <w:tcBorders>
                                    <w:right w:val="nil" />
                                </w:tcBorders>
                                <w:vAlign w:val="center" />
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                    <w:rPr>
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                    <w:t xml:space="preserve">The authority identifies how long a record needs to be retained and what should happen to it after this period of time, whether it be destroyed or transferred as a State archive.</w:t>
                                </w:r>
                                <w:r>
                                    <w:rPr>
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                    <w:br />
                                    <w:t xml:space="preserve">Disposal can also include transfer of records to another jurisdiction or the private successor of a public office.</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                    </w:tr>
                    <w:tr>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="968"
                                    w:type="pct" />
                                <w:gridSpan w:val="2" />
                                <w:shd w:val="clear"
                                    w:color="auto"
                                    w:fill="FFFFFF" />
                                <w:vAlign w:val="center" />
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                    <w:rPr>
                                        <w:b />
                                        <w:bCs />
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>
                                        <w:b />
                                        <w:bCs />
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                    <w:t>Disposal class</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="4032"
                                    w:type="pct" />
                                <w:tcBorders>
                                    <w:right w:val="nil" />
                                </w:tcBorders>
                                <w:vAlign w:val="center" />
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                    <w:rPr>
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                    <w:t xml:space="preserve">Provides a description of a type of record and given a unique entry number for reference. For each disposal class there is an approved disposal action. </w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                    </w:tr>
                    <w:tr>
                        <w:trPr>
                            <w:gridBefore w:val="1" />
                            <w:wBefore w:w="31"
                                w:type="pct" />
                        </w:trPr>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="938"
                                    w:type="pct" />
                                <w:shd w:val="clear"
                                    w:color="auto"
                                    w:fill="FFFFFF" />
                                <w:vAlign w:val="center" />
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                    <w:rPr>
                                        <w:b />
                                        <w:bCs />
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>
                                        <w:b />
                                        <w:bCs />
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                    <w:t>Normal Administrative Practice (NAP)</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="4032"
                                    w:type="pct" />
                                <w:tcBorders>
                                    <w:right w:val="nil" />
                                </w:tcBorders>
                                <w:vAlign w:val="center" />
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                </w:pPr>
                                <w:r>
                                    <w:t xml:space="preserve">The disposal of ephemeral or facilitative records under the </w:t>
                                </w:r>
                                <w:r>
                                    <w:rPr>
                                        <w:i />
                                        <w:iCs />
                                    </w:rPr>
                                    <w:t>State Records Regulation</w:t>
                                </w:r>
                                <w:r>
                                    <w:t>.</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                    </w:tr>
                    <w:tr>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="968"
                                    w:type="pct" />
                                <w:gridSpan w:val="2" />
                                <w:shd w:val="clear"
                                    w:color="auto"
                                    w:fill="FFFFFF" />
                                <w:vAlign w:val="center" />
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                    <w:rPr>
                                        <w:b />
                                        <w:bCs />
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>
                                        <w:b />
                                        <w:bCs />
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                    <w:t>Public office</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="4032"
                                    w:type="pct" />
                                <w:tcBorders>
                                    <w:right w:val="nil" />
                                </w:tcBorders>
                                <w:vAlign w:val="center" />
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                    <w:rPr>
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                    <w:t xml:space="preserve">A public office is a department, office, commission, board, corporation, agency, service or instrumentality exercising a function of a branch of the Government of the State, a body, whether incorporated or not, established for a public purpose, a council, the Cabinet and the Executive Council, the office and official establishment of the Governor, a House of Parliament, a court or tribunal, a State collecting institution, a Royal Commission or Commission of Inquiry, a State owned corporation, the holder of an office under the Crown, a political office holder, a body, office or institution that exercises a public function and is declared to be a public office. </w:t>
                                </w:r>
                            </w:p>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                    <w:rPr>
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                    <w:t xml:space="preserve">See the </w:t>
                                </w:r>
                                <w:r>
                                    <w:rPr>
                                        <w:i />
                                        <w:iCs />
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                    <w:t>State Records Act 1998</w:t>
                                </w:r>
                                <w:r>
                                    <w:rPr>
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                    <w:t xml:space="preserve"> for the complete definition and the </w:t>
                                </w:r>
                                <w:r>
                                    <w:rPr>
                                        <w:i />
                                        <w:iCs />
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                    <w:t>State Records NSW website</w:t>
                                </w:r>
                                <w:r>
                                    <w:rPr>
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                    <w:t xml:space="preserve"> for a listing of identified public offices.</w:t>
                                </w:r>
                            </w:p>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                    <w:rPr>
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                    <w:t xml:space="preserve">A public office does not include a private organisation unless it is a successor of a public office and is holding State records.</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                    </w:tr>
                    <w:tr>
                        <w:trPr>
                            <w:gridBefore w:val="1" />
                            <w:wBefore w:w="31"
                                w:type="pct" />
                            <w:trHeight w:val="2440" />
                        </w:trPr>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="938"
                                    w:type="pct" />
                                <w:shd w:val="clear"
                                    w:color="auto"
                                    w:fill="FFFFFF" />
                                <w:vAlign w:val="center" />
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                    <w:rPr>
                                        <w:b />
                                        <w:bCs />
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>
                                        <w:b />
                                        <w:bCs />
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                    <w:t>Retention and Disposal Authority</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="4032"
                                    w:type="pct" />
                                <w:tcBorders>
                                    <w:right w:val="nil" />
                                </w:tcBorders>
                                <w:vAlign w:val="center" />
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:after="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                    <w:rPr>
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                    <w:t xml:space="preserve">Documents authorised by the Board of the State Records Authority NSW that set out appropriate retention periods for classes of records. There are two main types:</w:t>
                                </w:r>
                            </w:p>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:numPr>
                                        <w:ilvl w:val="0" />
                                        <w:numId w:val="5" />
                                    </w:numPr>
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                    <w:contextualSpacing />
                                    <w:rPr>
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                    <w:t xml:space="preserve">Functional retention and disposal authorities are unique to a specific business role, function, or legislated responsibility.</w:t>
                                </w:r>
                            </w:p>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:numPr>
                                        <w:ilvl w:val="0" />
                                        <w:numId w:val="5" />
                                    </w:numPr>
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                    <w:contextualSpacing />
                                    <w:rPr>
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                    <w:t xml:space="preserve">General retention and disposal authorities are used by all  public offices and cover common administrative records, records that have been copied, source records from a migration project and the transfer of records outside of the state.</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                    </w:tr>
                    <w:bookmarkEnd w:id="9" />
                    <w:tr>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="968"
                                    w:type="pct" />
                                <w:gridSpan w:val="2" />
                                <w:shd w:val="clear"
                                    w:color="auto"
                                    w:fill="FFFFFF" />
                                <w:vAlign w:val="center" />
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                    <w:rPr>
                                        <w:b />
                                        <w:bCs />
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>
                                        <w:b />
                                        <w:bCs />
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                    <w:t>Retention period</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="4032"
                                    w:type="pct" />
                                <w:tcBorders>
                                    <w:right w:val="nil" />
                                </w:tcBorders>
                                <w:vAlign w:val="center" />
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                    <w:rPr>
                                        <w:i />
                                        <w:iCs />
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                    <w:t xml:space="preserve">The minimum amount of time for which records should be kept to meet regulatory, business and community requirements before they can be destroyed. </w:t>
                                </w:r>
                                <w:r>
                                    <w:rPr>
                                        <w:i />
                                        <w:iCs />
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                    <w:t> ie. Retain minimum 1 year after action completed, then
                                        destroy</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                    </w:tr>
                    <w:tr>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="968"
                                    w:type="pct" />
                                <w:gridSpan w:val="2" />
                                <w:shd w:val="clear"
                                    w:color="auto"
                                    w:fill="FFFFFF" />
                                <w:vAlign w:val="center" />
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                    <w:rPr>
                                        <w:b />
                                        <w:bCs />
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>
                                        <w:b />
                                        <w:bCs />
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                    <w:t>State archive</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="4032"
                                    w:type="pct" />
                                <w:tcBorders>
                                    <w:right w:val="nil" />
                                </w:tcBorders>
                                <w:vAlign w:val="center" />
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                    <w:rPr>
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                </w:pPr>
                                <w:bookmarkStart w:id="10"
                                    w:name="_Hlk174021746" />
                                <w:r>
                                    <w:rPr>
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                    <w:t xml:space="preserve">A State record that has been identified to be kept in perpetuity and may not be disposed of. Once a State archive is no longer being used for business purposes, it should be transferred to Museums of History NSW.</w:t>
                                </w:r>
                                <w:bookmarkEnd w:id="10" />
                            </w:p>
                        </w:tc>
                    </w:tr>
                    <w:tr>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="968"
                                    w:type="pct" />
                                <w:gridSpan w:val="2" />
                                <w:shd w:val="clear"
                                    w:color="auto"
                                    w:fill="FFFFFF" />
                                <w:vAlign w:val="center" />
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                    <w:rPr>
                                        <w:b />
                                        <w:bCs />
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>
                                        <w:b />
                                        <w:bCs />
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                    <w:t>State record</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="4032"
                                    w:type="pct" />
                                <w:tcBorders>
                                    <w:right w:val="nil" />
                                </w:tcBorders>
                                <w:vAlign w:val="center" />
                            </w:tcPr>
                            <w:p>
                                <w:pPr>
                                    <w:widowControl w:val="0" />
                                    <w:spacing w:before="0"
                                        w:line="276"
                                        w:lineRule="auto" />
                                    <w:rPr>
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                </w:pPr>
                                <w:r>
                                    <w:rPr>
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                    <w:t xml:space="preserve">State record means a record made or received by a person in the course of exercising official functions in a public office, or for a purpose of a public office, or for the use of a public office. See</w:t>
                                </w:r>
                                <w:r>
                                    <w:rPr>
                                        <w:i />
                                        <w:iCs />
                                        <w:szCs w:val="16" />
                                    </w:rPr>
                                    <w:t xml:space="preserve"> State Records Act 1998 s.3.</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                    </w:tr>
                </w:tbl>
                <w:p />
                <w:p>
                    <w:pPr>
                        <!-- second section -->
                        <w:sectPr>
                            <w:footerReference w:type="default"
                                r:id="rId14" /> <!--footer2-->
                            <w:footerReference w:type="first"
                                r:id="rId15" /> <!--footer3-->
                            <w:pgSz w:w="11907"
                                w:h="16840"
                                w:code="9" />
                            <w:pgMar w:top="1418"
                                w:right="1418"
                                w:bottom="1418"
                                w:left="1418"
                                w:header="567"
                                w:footer="567"
                                w:gutter="0" />
                            <w:paperSrc w:first="7"
                                w:other="7" />
                            <w:pgNumType w:start="1" />
                            <w:cols w:space="720" />
                            <w:titlePg />
                        </w:sectPr>
                    </w:pPr>
                </w:p>
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
                    <w:tr w:rsidR="004654AF"
                        w:rsidRPr="00235B4E"
                        w14:paraId="5F2161F0"
                        w14:textId="77777777">
                        <w:trPr>
                            <w:tblHeader />
                        </w:trPr>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="2000"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="3F3BB491"
                                w14:textId="77777777"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00FA072E">
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
                            <w:p w14:paraId="708AFCDC"
                                w14:textId="77777777"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00FA072E">
                                <w:pPr>
                                    <w:rPr>

                                        <w:b />
                                    </w:rPr>
                                </w:pPr>
                                <w:r w:rsidRPr="00235B4E">
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
                            <w:p w14:paraId="1F136A20"
                                w14:textId="77777777"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00FA072E">
                                <w:pPr>
                                    <w:rPr>

                                        <w:b />
                                    </w:rPr>
                                </w:pPr>
                                <w:r w:rsidRPr="00235B4E">
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
                            <w:p w14:paraId="46DB1E2C"
                                w14:textId="77777777"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00FA072E">
                                <w:pPr>
                                    <w:rPr>

                                        <w:b />
                                    </w:rPr>
                                </w:pPr>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                        <w:b />
                                    </w:rPr>
                                    <w:t>Page</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                    </w:tr>
                    <w:tr w:rsidR="004654AF"
                        w:rsidRPr="00235B4E"
                        w14:paraId="5E135F95"
                        w14:textId="77777777">
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="2000"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="1EB719DE"
                                w14:textId="3C505B77"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00FA072E">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:hyperlink w:anchor="id2958839"
                                    w:tooltip="LOCAL LAND SERVICES"
                                    w:history="1">
                                    <w:r w:rsidRPr="00235B4E">
                                        <w:rPr>
                                            <w:rFonts w:ascii="Public Sans"
                                                w:hAnsi="Public Sans" />
                                        </w:rPr>
                                        <w:t>LOCAL LAND SERVICES</w:t>
                                    </w:r>
                                </w:hyperlink>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="1900"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="71681FC7"
                                w14:textId="77777777"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="004654AF">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="600"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="42981618"
                                w14:textId="77777777"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00FA072E">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:t>1.0.0</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="500"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="5F9479D9"
                                w14:textId="1819FCFF"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00792162">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:fldChar w:fldCharType="begin" />
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:instrText xml:space="preserve"> PAGEREF  id2958839  \* MERGEFORMAT </w:instrText>
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:fldChar w:fldCharType="separate" />
                                </w:r>
                                <w:r w:rsidR="0086301E">
                                    <w:rPr>

                                        <w:noProof />
                                    </w:rPr>
                                    <w:t>8</w:t>
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                        <w:noProof />
                                    </w:rPr>
                                    <w:fldChar w:fldCharType="end" />
                                </w:r>
                            </w:p>
                        </w:tc>
                    </w:tr>
                    <w:tr w:rsidR="004654AF"
                        w:rsidRPr="00235B4E"
                        w14:paraId="291E495D"
                        w14:textId="77777777">
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="2000"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="2846CA98"
                                w14:textId="77777777"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="004654AF">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="1900"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="3ED6FF89"
                                w14:textId="37A9C60C"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00FA072E">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:hyperlink w:anchor="id1777034"
                                    w:tooltip="Advisory &amp; Extension"
                                    w:history="1">
                                    <w:r w:rsidRPr="00235B4E">
                                        <w:rPr>
                                            <w:rFonts w:ascii="Public Sans"
                                                w:hAnsi="Public Sans" />
                                        </w:rPr>
                                        <w:t>Advisory &amp; Extension</w:t>
                                    </w:r>
                                </w:hyperlink>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="600"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="59160E33"
                                w14:textId="77777777"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00FA072E">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:t>1.1.0</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="500"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="3E2B95CA"
                                w14:textId="2CCD108B"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00792162">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:fldChar w:fldCharType="begin" />
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:instrText xml:space="preserve"> PAGEREF  id1777034  \* MERGEFORMAT </w:instrText>
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:fldChar w:fldCharType="separate" />
                                </w:r>
                                <w:r w:rsidR="0086301E">
                                    <w:rPr>

                                        <w:noProof />
                                    </w:rPr>
                                    <w:t>9</w:t>
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                        <w:noProof />
                                    </w:rPr>
                                    <w:fldChar w:fldCharType="end" />
                                </w:r>
                            </w:p>
                        </w:tc>
                    </w:tr>
                    <w:tr w:rsidR="004654AF"
                        w:rsidRPr="00235B4E"
                        w14:paraId="4601286F"
                        w14:textId="77777777">
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="2000"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="09F14C9B"
                                w14:textId="77777777"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="004654AF">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="1900"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="0914854B"
                                w14:textId="05B28F33"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00FA072E">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:hyperlink w:anchor="id2951505"
                                    w:tooltip="Agreements"
                                    w:history="1">
                                    <w:r w:rsidRPr="00235B4E">
                                        <w:rPr>
                                            <w:rFonts w:ascii="Public Sans"
                                                w:hAnsi="Public Sans" />
                                        </w:rPr>
                                        <w:t>Agreements</w:t>
                                    </w:r>
                                </w:hyperlink>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="600"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="734A3D73"
                                w14:textId="77777777"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00FA072E">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:t>1.2.0</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="500"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="02244F41"
                                w14:textId="74218745"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00792162">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:fldChar w:fldCharType="begin" />
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:instrText xml:space="preserve"> PAGEREF  id2951505  \* MERGEFORMAT </w:instrText>
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:fldChar w:fldCharType="separate" />
                                </w:r>
                                <w:r w:rsidR="0086301E">
                                    <w:rPr>

                                        <w:noProof />
                                    </w:rPr>
                                    <w:t>10</w:t>
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                        <w:noProof />
                                    </w:rPr>
                                    <w:fldChar w:fldCharType="end" />
                                </w:r>
                            </w:p>
                        </w:tc>
                    </w:tr>
                    <w:tr w:rsidR="004654AF"
                        w:rsidRPr="00235B4E"
                        w14:paraId="3D3CA49F"
                        w14:textId="77777777">
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="2000"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="35791088"
                                w14:textId="77777777"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="004654AF">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="1900"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="007BF299"
                                w14:textId="4E988C80"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00FA072E">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:hyperlink w:anchor="id2957677"
                                    w:tooltip="Authorisation &amp; Certification"
                                    w:history="1">
                                    <w:r w:rsidRPr="00235B4E">
                                        <w:rPr>
                                            <w:rFonts w:ascii="Public Sans"
                                                w:hAnsi="Public Sans" />
                                        </w:rPr>
                                        <w:t>Authorisation &amp; Certification</w:t>
                                    </w:r>
                                </w:hyperlink>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="600"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="2E168C1C"
                                w14:textId="77777777"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00FA072E">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:t>1.3.0</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="500"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="3209CE50"
                                w14:textId="10856DE2"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00792162">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:fldChar w:fldCharType="begin" />
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:instrText xml:space="preserve"> PAGEREF  id2957677  \* MERGEFORMAT </w:instrText>
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:fldChar w:fldCharType="separate" />
                                </w:r>
                                <w:r w:rsidR="0086301E">
                                    <w:rPr>

                                        <w:noProof />
                                    </w:rPr>
                                    <w:t>11</w:t>
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                        <w:noProof />
                                    </w:rPr>
                                    <w:fldChar w:fldCharType="end" />
                                </w:r>
                            </w:p>
                        </w:tc>
                    </w:tr>
                    <w:tr w:rsidR="004654AF"
                        w:rsidRPr="00235B4E"
                        w14:paraId="47B9A199"
                        w14:textId="77777777">
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="2000"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="5A8449E1"
                                w14:textId="77777777"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="004654AF">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="1900"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="2013244B"
                                w14:textId="788F323D"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00FA072E">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:hyperlink w:anchor="id2993494"
                                    w:tooltip="Board Elections"
                                    w:history="1">
                                    <w:r w:rsidRPr="00235B4E">
                                        <w:rPr>
                                            <w:rFonts w:ascii="Public Sans"
                                                w:hAnsi="Public Sans" />
                                        </w:rPr>
                                        <w:t>Board Elections</w:t>
                                    </w:r>
                                </w:hyperlink>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="600"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="196405C6"
                                w14:textId="77777777"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00FA072E">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:t>1.4.0</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="500"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="2D3E3D12"
                                w14:textId="3495417F"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00792162">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:fldChar w:fldCharType="begin" />
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:instrText xml:space="preserve"> PAGEREF  id2993494  \* MERGEFORMAT </w:instrText>
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:fldChar w:fldCharType="separate" />
                                </w:r>
                                <w:r w:rsidR="0086301E">
                                    <w:rPr>

                                        <w:noProof />
                                    </w:rPr>
                                    <w:t>12</w:t>
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                        <w:noProof />
                                    </w:rPr>
                                    <w:fldChar w:fldCharType="end" />
                                </w:r>
                            </w:p>
                        </w:tc>
                    </w:tr>
                    <w:tr w:rsidR="004654AF"
                        w:rsidRPr="00235B4E"
                        w14:paraId="64F51C94"
                        w14:textId="77777777">
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="2000"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="37793E0E"
                                w14:textId="77777777"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="004654AF">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="1900"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="414E5FE6"
                                w14:textId="581E2FFF"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00FA072E">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:hyperlink w:anchor="id2993564"
                                    w:tooltip="Compliance Monitoring &amp; Enforcement"
                                    w:history="1">
                                    <w:r w:rsidRPr="00235B4E">
                                        <w:rPr>
                                            <w:rFonts w:ascii="Public Sans"
                                                w:hAnsi="Public Sans" />
                                        </w:rPr>
                                        <w:t>Compliance Monitoring &amp; Enforcement</w:t>
                                    </w:r>
                                </w:hyperlink>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="600"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="76C1D8F6"
                                w14:textId="77777777"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00FA072E">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:t>1.5.0</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="500"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="05AD507A"
                                w14:textId="27381293"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00792162">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:fldChar w:fldCharType="begin" />
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:instrText xml:space="preserve"> PAGEREF  id2993564  \* MERGEFORMAT </w:instrText>
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:fldChar w:fldCharType="separate" />
                                </w:r>
                                <w:r w:rsidR="0086301E">
                                    <w:rPr>

                                        <w:noProof />
                                    </w:rPr>
                                    <w:t>13</w:t>
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                        <w:noProof />
                                    </w:rPr>
                                    <w:fldChar w:fldCharType="end" />
                                </w:r>
                            </w:p>
                        </w:tc>
                    </w:tr>
                    <w:tr w:rsidR="004654AF"
                        w:rsidRPr="00235B4E"
                        w14:paraId="73043BFB"
                        w14:textId="77777777">
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="2000"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="2A5645D0"
                                w14:textId="77777777"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="004654AF">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="1900"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="4AC1138E"
                                w14:textId="0988C458"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00FA072E">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:hyperlink w:anchor="id2993817"
                                    w:tooltip="Grants &amp; Funding"
                                    w:history="1">
                                    <w:r w:rsidRPr="00235B4E">
                                        <w:rPr>
                                            <w:rFonts w:ascii="Public Sans"
                                                w:hAnsi="Public Sans" />
                                        </w:rPr>
                                        <w:t>Grants &amp; Funding</w:t>
                                    </w:r>
                                </w:hyperlink>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="600"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="6C180400"
                                w14:textId="77777777"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00FA072E">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:t>1.6.0</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="500"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="705E76E6"
                                w14:textId="423B9DE9"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00792162">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:fldChar w:fldCharType="begin" />
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:instrText xml:space="preserve"> PAGEREF  id2993817  \* MERGEFORMAT </w:instrText>
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:fldChar w:fldCharType="separate" />
                                </w:r>
                                <w:r w:rsidR="0086301E">
                                    <w:rPr>

                                        <w:noProof />
                                    </w:rPr>
                                    <w:t>14</w:t>
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                        <w:noProof />
                                    </w:rPr>
                                    <w:fldChar w:fldCharType="end" />
                                </w:r>
                            </w:p>
                        </w:tc>
                    </w:tr>
                    <w:tr w:rsidR="004654AF"
                        w:rsidRPr="00235B4E"
                        w14:paraId="53BED11A"
                        w14:textId="77777777">
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="2000"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="047DF1B7"
                                w14:textId="77777777"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="004654AF">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="1900"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="6EAEB1C0"
                                w14:textId="63912492"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00FA072E">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:hyperlink w:anchor="id2993975"
                                    w:tooltip="Incidents"
                                    w:history="1">
                                    <w:r w:rsidRPr="00235B4E">
                                        <w:rPr>
                                            <w:rFonts w:ascii="Public Sans"
                                                w:hAnsi="Public Sans" />
                                        </w:rPr>
                                        <w:t>Incidents</w:t>
                                    </w:r>
                                </w:hyperlink>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="600"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="3EE5FC66"
                                w14:textId="77777777"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00FA072E">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:t>1.7.0</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="500"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="1810B364"
                                w14:textId="3AB02F8E"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00792162">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:fldChar w:fldCharType="begin" />
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:instrText xml:space="preserve"> PAGEREF  id2993975  \* MERGEFORMAT </w:instrText>
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:fldChar w:fldCharType="separate" />
                                </w:r>
                                <w:r w:rsidR="0086301E">
                                    <w:rPr>

                                        <w:noProof />
                                    </w:rPr>
                                    <w:t>15</w:t>
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                        <w:noProof />
                                    </w:rPr>
                                    <w:fldChar w:fldCharType="end" />
                                </w:r>
                            </w:p>
                        </w:tc>
                    </w:tr>
                    <w:tr w:rsidR="004654AF"
                        w:rsidRPr="00235B4E"
                        w14:paraId="456715BF"
                        w14:textId="77777777">
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="2000"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="5A68C11D"
                                w14:textId="77777777"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="004654AF">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="1900"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="7FC55A3C"
                                w14:textId="6A7C0855"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00FA072E">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:hyperlink w:anchor="id2994046"
                                    w:tooltip="Policies &amp; Procedures"
                                    w:history="1">
                                    <w:r w:rsidRPr="00235B4E">
                                        <w:rPr>
                                            <w:rFonts w:ascii="Public Sans"
                                                w:hAnsi="Public Sans" />
                                        </w:rPr>
                                        <w:t>Policies &amp; Procedures</w:t>
                                    </w:r>
                                </w:hyperlink>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="600"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="5123B4CB"
                                w14:textId="77777777"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00FA072E">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:t>1.8.0</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="500"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="61DBB978"
                                w14:textId="3CEA485E"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00792162">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:fldChar w:fldCharType="begin" />
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:instrText xml:space="preserve"> PAGEREF  id2994046  \* MERGEFORMAT </w:instrText>
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:fldChar w:fldCharType="separate" />
                                </w:r>
                                <w:r w:rsidR="0086301E">
                                    <w:rPr>

                                        <w:noProof />
                                    </w:rPr>
                                    <w:t>16</w:t>
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                        <w:noProof />
                                    </w:rPr>
                                    <w:fldChar w:fldCharType="end" />
                                </w:r>
                            </w:p>
                        </w:tc>
                    </w:tr>
                    <w:tr w:rsidR="004654AF"
                        w:rsidRPr="00235B4E"
                        w14:paraId="442D98CA"
                        w14:textId="77777777">
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="2000"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="1EBA2278"
                                w14:textId="77777777"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="004654AF">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="1900"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="65C92684"
                                w14:textId="51BC07F1"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00FA072E">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:hyperlink w:anchor="id2994146"
                                    w:tooltip="Programs, Projects &amp; Initiatives"
                                    w:history="1">
                                    <w:r w:rsidRPr="00235B4E">
                                        <w:rPr>
                                            <w:rFonts w:ascii="Public Sans"
                                                w:hAnsi="Public Sans" />
                                        </w:rPr>
                                        <w:t>Programs, Projects &amp; Initiatives</w:t>
                                    </w:r>
                                </w:hyperlink>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="600"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="70D77662"
                                w14:textId="77777777"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00FA072E">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:t>1.9.0</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="500"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="14E5850A"
                                w14:textId="7778EC1B"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00792162">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:fldChar w:fldCharType="begin" />
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:instrText xml:space="preserve"> PAGEREF  id2994146  \* MERGEFORMAT </w:instrText>
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:fldChar w:fldCharType="separate" />
                                </w:r>
                                <w:r w:rsidR="0086301E">
                                    <w:rPr>

                                        <w:noProof />
                                    </w:rPr>
                                    <w:t>16</w:t>
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                        <w:noProof />
                                    </w:rPr>
                                    <w:fldChar w:fldCharType="end" />
                                </w:r>
                            </w:p>
                        </w:tc>
                    </w:tr>
                    <w:tr w:rsidR="004654AF"
                        w:rsidRPr="00235B4E"
                        w14:paraId="5DCBF52D"
                        w14:textId="77777777">
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="2000"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="244B5427"
                                w14:textId="77777777"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="004654AF">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="1900"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="78E81CAE"
                                w14:textId="7E1F500C"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00FA072E">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:hyperlink w:anchor="id2994382"
                                    w:tooltip="Property Summary Information"
                                    w:history="1">
                                    <w:r w:rsidRPr="00235B4E">
                                        <w:rPr>
                                            <w:rFonts w:ascii="Public Sans"
                                                w:hAnsi="Public Sans" />
                                        </w:rPr>
                                        <w:t>Property Summary Information</w:t>
                                    </w:r>
                                </w:hyperlink>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="600"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="7BA1281B"
                                w14:textId="77777777"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00FA072E">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:t>1.10.0</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="500"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="708C9F66"
                                w14:textId="1C1AD30C"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00792162">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:fldChar w:fldCharType="begin" />
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:instrText xml:space="preserve"> PAGEREF  id2994382  \* MERGEFORMAT </w:instrText>
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:fldChar w:fldCharType="separate" />
                                </w:r>
                                <w:r w:rsidR="0086301E">
                                    <w:rPr>

                                        <w:noProof />
                                    </w:rPr>
                                    <w:t>18</w:t>
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                        <w:noProof />
                                    </w:rPr>
                                    <w:fldChar w:fldCharType="end" />
                                </w:r>
                            </w:p>
                        </w:tc>
                    </w:tr>
                    <w:tr w:rsidR="004654AF"
                        w:rsidRPr="00235B4E"
                        w14:paraId="6B44F212"
                        w14:textId="77777777">
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="2000"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="7489B98E"
                                w14:textId="77777777"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="004654AF">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="1900"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="62A0603D"
                                w14:textId="66BD9162"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00FA072E">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:hyperlink w:anchor="id2994423"
                                    w:tooltip="Rates, Levies, Fees &amp; Contributions"
                                    w:history="1">
                                    <w:r w:rsidRPr="00235B4E">
                                        <w:rPr>
                                            <w:rFonts w:ascii="Public Sans"
                                                w:hAnsi="Public Sans" />
                                        </w:rPr>
                                        <w:t>Rates, Levies, Fees &amp; Contributions</w:t>
                                    </w:r>
                                </w:hyperlink>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="600"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="3D98F47A"
                                w14:textId="77777777"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00FA072E">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:t>1.11.0</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="500"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="2FE7D0E0"
                                w14:textId="62F667D8"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00792162">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:fldChar w:fldCharType="begin" />
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:instrText xml:space="preserve"> PAGEREF  id2994423  \* MERGEFORMAT </w:instrText>
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:fldChar w:fldCharType="separate" />
                                </w:r>
                                <w:r w:rsidR="0086301E">
                                    <w:rPr>

                                        <w:noProof />
                                    </w:rPr>
                                    <w:t>18</w:t>
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                        <w:noProof />
                                    </w:rPr>
                                    <w:fldChar w:fldCharType="end" />
                                </w:r>
                            </w:p>
                        </w:tc>
                    </w:tr>
                    <w:tr w:rsidR="004654AF"
                        w:rsidRPr="00235B4E"
                        w14:paraId="0A60C815"
                        w14:textId="77777777">
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="2000"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="4F078E6E"
                                w14:textId="77777777"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="004654AF">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="1900"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="6FEFEF65"
                                w14:textId="71CF061C"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00FA072E">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:hyperlink w:anchor="id2994664"
                                    w:tooltip="Reporting"
                                    w:history="1">
                                    <w:r w:rsidRPr="00235B4E">
                                        <w:rPr>
                                            <w:rFonts w:ascii="Public Sans"
                                                w:hAnsi="Public Sans" />
                                        </w:rPr>
                                        <w:t>Reporting</w:t>
                                    </w:r>
                                </w:hyperlink>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="600"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="62BFE2EF"
                                w14:textId="77777777"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00FA072E">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:t>1.12.0</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="500"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="7671E4BB"
                                w14:textId="27915CC9"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00792162">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:fldChar w:fldCharType="begin" />
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:instrText xml:space="preserve"> PAGEREF  id2994664  \* MERGEFORMAT </w:instrText>
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:fldChar w:fldCharType="separate" />
                                </w:r>
                                <w:r w:rsidR="0086301E">
                                    <w:rPr>

                                        <w:noProof />
                                    </w:rPr>
                                    <w:t>20</w:t>
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                        <w:noProof />
                                    </w:rPr>
                                    <w:fldChar w:fldCharType="end" />
                                </w:r>
                            </w:p>
                        </w:tc>
                    </w:tr>
                    <w:tr w:rsidR="004654AF"
                        w:rsidRPr="00235B4E"
                        w14:paraId="24FE4DB2"
                        w14:textId="77777777">
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="2000"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="3DE881B4"
                                w14:textId="77777777"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="004654AF">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="1900"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="1BC4B973"
                                w14:textId="1A3F3950"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00FA072E">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:hyperlink w:anchor="id2994752"
                                    w:tooltip="Research &amp; Surveys"
                                    w:history="1">
                                    <w:r w:rsidRPr="00235B4E">
                                        <w:rPr>
                                            <w:rFonts w:ascii="Public Sans"
                                                w:hAnsi="Public Sans" />
                                        </w:rPr>
                                        <w:t>Research &amp; Surveys</w:t>
                                    </w:r>
                                </w:hyperlink>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="600"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="650B2932"
                                w14:textId="77777777"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00FA072E">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:t>1.13.0</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="500"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="78385ABF"
                                w14:textId="5FBB6832"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00792162">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:fldChar w:fldCharType="begin" />
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:instrText xml:space="preserve"> PAGEREF  id2994752  \* MERGEFORMAT </w:instrText>
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:fldChar w:fldCharType="separate" />
                                </w:r>
                                <w:r w:rsidR="0086301E">
                                    <w:rPr>

                                        <w:noProof />
                                    </w:rPr>
                                    <w:t>20</w:t>
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                        <w:noProof />
                                    </w:rPr>
                                    <w:fldChar w:fldCharType="end" />
                                </w:r>
                            </w:p>
                        </w:tc>
                    </w:tr>
                    <w:tr w:rsidR="004654AF"
                        w:rsidRPr="00235B4E"
                        w14:paraId="7E35A207"
                        w14:textId="77777777">
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="2000"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="4AF76654"
                                w14:textId="77777777"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="004654AF">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="1900"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="101D74FE"
                                w14:textId="7A4123E3"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00FA072E">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:hyperlink w:anchor="id2994866"
                                    w:tooltip="Spatial Information"
                                    w:history="1">
                                    <w:r w:rsidRPr="00235B4E">
                                        <w:rPr>
                                            <w:rFonts w:ascii="Public Sans"
                                                w:hAnsi="Public Sans" />
                                        </w:rPr>
                                        <w:t>Spatial Information</w:t>
                                    </w:r>
                                </w:hyperlink>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="600"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="551DEAE5"
                                w14:textId="77777777"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00FA072E">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:t>1.14.0</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="500"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="77C93CFD"
                                w14:textId="19026346"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00792162">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:fldChar w:fldCharType="begin" />
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:instrText xml:space="preserve"> PAGEREF  id2994866  \* MERGEFORMAT </w:instrText>
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:fldChar w:fldCharType="separate" />
                                </w:r>
                                <w:r w:rsidR="0086301E">
                                    <w:rPr>

                                        <w:noProof />
                                    </w:rPr>
                                    <w:t>21</w:t>
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                        <w:noProof />
                                    </w:rPr>
                                    <w:fldChar w:fldCharType="end" />
                                </w:r>
                            </w:p>
                        </w:tc>
                    </w:tr>
                    <w:tr w:rsidR="004654AF"
                        w:rsidRPr="00235B4E"
                        w14:paraId="0A67F680"
                        w14:textId="77777777">
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="2000"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="6A95EAF0"
                                w14:textId="77777777"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="004654AF">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="1900"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="1462F7E5"
                                w14:textId="2F304242"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00FA072E">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:hyperlink w:anchor="id2994922"
                                    w:tooltip="Stock Identification"
                                    w:history="1">
                                    <w:r w:rsidRPr="00235B4E">
                                        <w:rPr>
                                            <w:rFonts w:ascii="Public Sans"
                                                w:hAnsi="Public Sans" />
                                        </w:rPr>
                                        <w:t>Stock Identification</w:t>
                                    </w:r>
                                </w:hyperlink>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="600"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="33CCC596"
                                w14:textId="77777777"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00FA072E">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:t>1.15.0</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="500"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="51C4EA93"
                                w14:textId="279E765A"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00792162">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:fldChar w:fldCharType="begin" />
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:instrText xml:space="preserve"> PAGEREF  id2994922  \* MERGEFORMAT </w:instrText>
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:fldChar w:fldCharType="separate" />
                                </w:r>
                                <w:r w:rsidR="0086301E">
                                    <w:rPr>

                                        <w:noProof />
                                    </w:rPr>
                                    <w:t>21</w:t>
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                        <w:noProof />
                                    </w:rPr>
                                    <w:fldChar w:fldCharType="end" />
                                </w:r>
                            </w:p>
                        </w:tc>
                    </w:tr>
                    <w:tr w:rsidR="004654AF"
                        w:rsidRPr="00235B4E"
                        w14:paraId="2B38085C"
                        w14:textId="77777777">
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="2000"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="516851F5"
                                w14:textId="77777777"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="004654AF">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="1900"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="2A1D0C75"
                                w14:textId="41AB673F"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00FA072E">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:hyperlink w:anchor="id2995067"
                                    w:tooltip="Strategy &amp; Planning"
                                    w:history="1">
                                    <w:r w:rsidRPr="00235B4E">
                                        <w:rPr>
                                            <w:rFonts w:ascii="Public Sans"
                                                w:hAnsi="Public Sans" />
                                        </w:rPr>
                                        <w:t>Strategy &amp; Planning</w:t>
                                    </w:r>
                                </w:hyperlink>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="600"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="37739FEC"
                                w14:textId="77777777"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00FA072E">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:t>1.16.0</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="500"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="69CAFC25"
                                w14:textId="7A47F3C1"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00792162">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:fldChar w:fldCharType="begin" />
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:instrText xml:space="preserve"> PAGEREF  id2995067  \* MERGEFORMAT </w:instrText>
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:fldChar w:fldCharType="separate" />
                                </w:r>
                                <w:r w:rsidR="0086301E">
                                    <w:rPr>

                                        <w:noProof />
                                    </w:rPr>
                                    <w:t>22</w:t>
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                        <w:noProof />
                                    </w:rPr>
                                    <w:fldChar w:fldCharType="end" />
                                </w:r>
                            </w:p>
                        </w:tc>
                    </w:tr>
                    <w:tr w:rsidR="004654AF"
                        w:rsidRPr="00235B4E"
                        w14:paraId="574FB3D8"
                        w14:textId="77777777">
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="2000"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="1FA580FF"
                                w14:textId="77777777"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="004654AF">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="1900"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="2B528CBB"
                                w14:textId="0D836932"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00FA072E">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:hyperlink w:anchor="id2995310"
                                    w:tooltip="Surveillance &amp; Investigations (Biosecurity)"
                                    w:history="1">
                                    <w:r w:rsidRPr="00235B4E">
                                        <w:rPr>
                                            <w:rFonts w:ascii="Public Sans"
                                                w:hAnsi="Public Sans" />
                                        </w:rPr>
                                        <w:t>Surveillance &amp; Investigations (Biosecurity)</w:t>
                                    </w:r>
                                </w:hyperlink>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="600"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="18EDB076"
                                w14:textId="77777777"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00FA072E">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:t>1.17.0</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="500"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="71976021"
                                w14:textId="20DBB531"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00792162">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:fldChar w:fldCharType="begin" />
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:instrText xml:space="preserve"> PAGEREF  id2995310  \* MERGEFORMAT </w:instrText>
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:fldChar w:fldCharType="separate" />
                                </w:r>
                                <w:r w:rsidR="0086301E">
                                    <w:rPr>

                                        <w:noProof />
                                    </w:rPr>
                                    <w:t>23</w:t>
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                        <w:noProof />
                                    </w:rPr>
                                    <w:fldChar w:fldCharType="end" />
                                </w:r>
                            </w:p>
                        </w:tc>
                    </w:tr>
                    <w:tr w:rsidR="004654AF"
                        w:rsidRPr="00235B4E"
                        w14:paraId="22655E00"
                        w14:textId="77777777">
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="2000"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="27B34800"
                                w14:textId="77777777"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="004654AF">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="1900"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="23DDFC5F"
                                w14:textId="4F52C581"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00FA072E">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:hyperlink w:anchor="id2995446"
                                    w:tooltip="Zoning"
                                    w:history="1">
                                    <w:r w:rsidRPr="00235B4E">
                                        <w:rPr>
                                            <w:rFonts w:ascii="Public Sans"
                                                w:hAnsi="Public Sans" />
                                        </w:rPr>
                                        <w:t>Zoning</w:t>
                                    </w:r>
                                </w:hyperlink>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="600"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="16279039"
                                w14:textId="77777777"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00FA072E">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:t>1.18.0</w:t>
                                </w:r>
                            </w:p>
                        </w:tc>
                        <w:tc>
                            <w:tcPr>
                                <w:tcW w:w="500"
                                    w:type="pct" />
                            </w:tcPr>
                            <w:p w14:paraId="06D487AB"
                                w14:textId="7942D905"
                                w:rsidR="004654AF"
                                w:rsidRPr="00235B4E"
                                w:rsidRDefault="00792162">
                                <w:pPr>
                                    <w:rPr>

                                    </w:rPr>
                                </w:pPr>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:fldChar w:fldCharType="begin" />
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:instrText xml:space="preserve"> PAGEREF  id2995446  \* MERGEFORMAT </w:instrText>
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                    </w:rPr>
                                    <w:fldChar w:fldCharType="separate" />
                                </w:r>
                                <w:r w:rsidR="0086301E">
                                    <w:rPr>

                                        <w:noProof />
                                    </w:rPr>
                                    <w:t>24</w:t>
                                </w:r>
                                <w:r w:rsidRPr="00235B4E">
                                    <w:rPr>

                                        <w:noProof />
                                    </w:rPr>
                                    <w:fldChar w:fldCharType="end" />
                                </w:r>
                            </w:p>
                        </w:tc>
                    </w:tr>
                </w:tbl>
                <w:p>
                    <w:pPr>
                        <w:rPr>
                            <w:b />
                        </w:rPr>
                        <!-- TOC section -->
                        <w:sectPr>
                            <w:headerReference w:type="default"
                                r:id="rId16" /> <!--header2-->
                            <w:footerReference w:type="default"
                                r:id="rId17" /> <!--footer4-->
                            <w:headerReference w:type="first"
                                r:id="rId18" /> <!--header3-->
                            <w:footerReference w:type="first"
                                r:id="rId19" /> <!--footer5-->
                            <w:pgSz w:w="11907"
                                w:h="16840"
                                w:code="9" />
                            <w:pgMar w:top="1418"
                                w:right="1418"
                                w:bottom="1418"
                                w:left="1418"
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
                <xsl:call-template name="render_authority" />
                <!-- authority section-->
                <w:sectPr>
                    <w:headerReference w:type="default"
                        r:id="rId20" /> <!--header4-->
                    <w:footerReference w:type="default"
                        r:id="rId21" /> <!--footer6-->
                    <w:headerReference w:type="first"
                        r:id="rId22" /> <!--header5-->
                    <w:footerReference w:type="first"
                        r:id="rId23" /> <!--footer7-->
                    <w:pgSz w:w="11907"
                        w:h="16840"
                        w:code="9" />
                    <w:pgMar w:top="1418"
                        w:right="1418"
                        w:bottom="1418"
                        w:left="1418"
                        w:header="567"
                        w:footer="567"
                        w:gutter="0" />
                    <w:paperSrc w:first="11"
                        w:other="11" />
                    <w:cols w:space="720" />
                    <w:titlePg />
                </w:sectPr>
            </w:body>
        </w:document>
    </xsl:template>
</xsl:stylesheet>