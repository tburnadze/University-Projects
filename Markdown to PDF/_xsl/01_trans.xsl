<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xhtml="http://www.w3.org/1999/xhtml">

    <xsl:output method="xml" omit-xml-declaration="yes"
        doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>


    <xsl:template match="xhtml:a[@class = 'footnote-back']">
        <xsl:element name="a" namespace="http://www.w3.org/1999/xhtml">
            <xsl:attribute name="class">
                <xsl:text/>
            </xsl:attribute>
        </xsl:element>
    </xsl:template>

    <xsl:template match="xhtml:div/xhtml:pre/xhtml:code/xhtml:span/xhtml:a">
        <xsl:element name="a" namespace="http://www.w3.org/1999/xhtml">
            <xsl:attribute name="class">
                <xsl:text>code</xsl:text>
            </xsl:attribute>
            <xsl:text> </xsl:text>
        </xsl:element>
    </xsl:template>

    <xsl:template match="xhtml:h1">
        <xsl:copy-of select="."/>
        <xsl:element name="div" namespace="http://www.w3.org/1999/xhtml">
            <xsl:attribute name="id">
                <xsl:text>connect</xsl:text>
            </xsl:attribute>

            <xsl:text> </xsl:text>
        </xsl:element>
    </xsl:template>

    <xsl:template match="xhtml:h2">
        <xsl:copy-of select="."/>
        <xsl:element name="div" namespace="http://www.w3.org/1999/xhtml">
            <xsl:attribute name="id">
                <xsl:text>connect</xsl:text>
            </xsl:attribute>

            <xsl:text> </xsl:text>
        </xsl:element>
    </xsl:template>
    <xsl:template match="xhtml:h3">
        <xsl:copy-of select="."/>
        <xsl:element name="div" namespace="http://www.w3.org/1999/xhtml">
            <xsl:attribute name="id">
                <xsl:text>connect</xsl:text>
            </xsl:attribute>

            <xsl:text> </xsl:text>
        </xsl:element>
    </xsl:template>
    <xsl:template match="xhtml:h4">
        <xsl:copy-of select="."/>
        <xsl:element name="div" namespace="http://www.w3.org/1999/xhtml">
            <xsl:attribute name="id">
                <xsl:text>connect</xsl:text>
            </xsl:attribute>

            <xsl:text> </xsl:text>
        </xsl:element>
    </xsl:template>
    <xsl:template match="xhtml:h5">
        <xsl:copy-of select="."/>
        <xsl:element name="div" namespace="http://www.w3.org/1999/xhtml">
            <xsl:attribute name="class">
                <xsl:text>connect</xsl:text>
            </xsl:attribute>

            <xsl:text> </xsl:text>
        </xsl:element>
    </xsl:template>
    <xsl:template match="xhtml:h6">
        <xsl:copy-of select="."/>
        <xsl:element name="div" namespace="http://www.w3.org/1999/xhtml">
            <xsl:attribute name="id">
                <xsl:text>connect</xsl:text>
            </xsl:attribute>

            <xsl:text> </xsl:text>
        </xsl:element>
    </xsl:template>

    <xsl:template match="xhtml:blockquote/xhtml:p">
        <xsl:element name="p" namespace="http://www.w3.org/1999/xhtml">
            <xsl:attribute name="id">
                <xsl:text>blockquote</xsl:text>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="xhtml:body/xhtml:table">
        <xsl:element name="table" namespace="http://www.w3.org/1999/xhtml">
            <xsl:attribute name="id">
                <xsl:text>table</xsl:text>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>


    <xsl:template match="xhtml:body/xhtml:ol/xhtml:li">
        <xsl:element name="li" namespace="http://www.w3.org/1999/xhtml">
            <xsl:attribute name="class">
                <xsl:text>orderlist1</xsl:text>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="xhtml:body/xhtml:ol/xhtml:li/xhtml:ol/xhtml:li">
        <xsl:element name="li" namespace="http://www.w3.org/1999/xhtml">
            <xsl:attribute name="class">
                <xsl:text>orderlist2</xsl:text>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="xhtml:figure[1]">
        <xsl:element name="figure" namespace="http://www.w3.org/1999/xhtml">
            <xsl:attribute name="id">
                <xsl:text>cover</xsl:text>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="xhtml:figure">
        <xsl:element name="figure" namespace="http://www.w3.org/1999/xhtml">
            <xsl:attribute name="id">
                <xsl:text>figure</xsl:text>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="* | @*">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>




</xsl:stylesheet>
