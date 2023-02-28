<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" 
  xmlns:m="http://www.w3.org/1998/Math/MathML"
  xmlns:x="https://github.com/jelovirt/dita-ot-markdown"
  xmlns="https://www.parsx.de/ns/4.0"
  exclude-result-prefixes="xs x m"
  xpath-default-namespace="http://www.w3.org/1999/xhtml" version="3.0">

  <xsl:template match="head">
    <xsl:text/>
  </xsl:template>


  <xsl:template match="body">
     <xsl:for-each-group select="*" group-starting-with="h1|h2|h3|h4|h5|h6">
       <kapitel>
         <xsl:apply-templates select="current-group()"/>
       </kapitel>
     </xsl:for-each-group>
  </xsl:template>


  <!-- Kapitel-1-->

  <xsl:template match="h1">
    <u1>
      <titel>
        <text>
          <xsl:apply-templates/>
        </text>
      </titel>
    </u1>
  </xsl:template>

  <xsl:template match="h2">
      <u2>
        <titel>
          <text>
            <xsl:apply-templates/>
          </text>
        </titel>
      </u2>
  </xsl:template>

  
  
  <xsl:template match="h3">
    <u3>
      <titel>
        <text>
          <xsl:apply-templates/>
        </text>
      </titel>
    </u3>
  </xsl:template>
  
  <xsl:template match="h4">
    <u4>
      <titel>
        <text>
          <xsl:apply-templates/>
        </text>
      </titel>
    </u4>
  </xsl:template>
  
  <xsl:template match="h5">
    <u5>
      <titel>
        <text>
          <xsl:apply-templates/>
        </text>
      </titel>
    </u5>
  </xsl:template>
  
  <xsl:template match="h6">
    <u6>
      <titel>
        <text>
          <xsl:apply-templates/>
        </text>
      </titel>
    </u6>
  </xsl:template>


  <!-- Absatz-->
  <xsl:template match="p">
    <abs>
      <xsl:apply-templates/>
    </abs>
  </xsl:template>
  
<!-- Kursiv -->
  <xsl:template match="em">
    <kursiv>
      <xsl:apply-templates/>
    </kursiv>
  </xsl:template>

<!-- Fett -->
  <xsl:template match="strong">
    <fett>
      <xsl:apply-templates/>
    </fett>
  </xsl:template>

  <!-- Fett kursiv -->
  <xsl:template match="strong/em">
    <kursiv>
      <xsl:apply-templates/>
    </kursiv>
  </xsl:template>


  <!-- Geordnete Liste -->
  <xsl:template match="ol">
    <liste_geordnet>
      <xsl:apply-templates/>
    </liste_geordnet>
  </xsl:template>

  <!-- Ungerordnete Liste -->
  <xsl:template match="ul">
    <liste_ungeordnet>
      <xsl:apply-templates/>
    </liste_ungeordnet>
  </xsl:template>


  <xsl:template match="li">
    <eintrag>
      <xsl:element name="abs">
        <xsl:apply-templates select="text()"/>
      </xsl:element>
      <xsl:apply-templates select="ul"/>
      <xsl:apply-templates select="ol"/>
    </eintrag>
  </xsl:template>



  <!-- Tabelle -->
  <xsl:template match="table">
    <tabelle>
      <table>
        <xsl:apply-templates/>
      </table>
    </tabelle>
  </xsl:template>

  <xsl:template match="thead">
    <thead>
      <xsl:apply-templates/>
    </thead>
  </xsl:template>
  <xsl:template match="tbody">
    <tbody>
      <xsl:apply-templates/>
    </tbody>
  </xsl:template>

  <xsl:template match="tr">
    <tr>
      <xsl:apply-templates/>
    </tr>
  </xsl:template>

  <xsl:template match="td">
    <td>
      <abs>
        <xsl:apply-templates/>
      </abs>
    </td>
  </xsl:template>

  <xsl:template match="th">
    <th>
      <abs>
        <xsl:apply-templates/>
      </abs>
    </th>
  </xsl:template>


  <!-- Fußnote -->

  <xsl:variable name="footnote" select="//section/ol/li"/>

  <xsl:template match="a[@class = 'footnote-ref']">
    <xsl:variable name="value">
      <xsl:value-of select="substring(@href, 2)"/>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="contains(./@href, $value)">
        <fussnote>
          <abs>
            <xsl:value-of select="substring-before($footnote[@id = $value], '↩︎')"/>
          </abs>
        </fussnote>
      </xsl:when>
      <xsl:otherwise> Text </xsl:otherwise>
    </xsl:choose>
  </xsl:template>


  <!-- Bilder -->
  <xsl:template match="figure">
    <bild>
      <xsl:apply-templates/>
    </bild>
  </xsl:template>

  <xsl:template match="img">
    <abbildung>
      <xsl:attribute name="quelle">
        <xsl:value-of select="@src"/>
      </xsl:attribute>
      <xsl:attribute name="ersatztext">
        <xsl:value-of select="@alt"/>
      </xsl:attribute>
      <xsl:apply-templates/>
    </abbildung>
  </xsl:template>

  <!-- Legende -->
  
  <xsl:template match="figcaption">
    <!-- Bildunterschrift steht auch im Attribut  "alt" -->
    <legende>
      <abs>
        <xsl:apply-templates/>
      </abs>
    </legende>
  </xsl:template>

  <!-- Blockquote -->

  <xsl:template match="blockquote">
    <einschub>
      <xsl:attribute name="typ">
        <xsl:value-of select="'zitat'"/>
      </xsl:attribute>
      <xsl:apply-templates/>
    </einschub>
  </xsl:template>

<!-- Link -->
  
  <xsl:template match="a">
    <verweis>
      <xsl:attribute name="verweis-extern">
        <xsl:value-of select="@href"/>
      </xsl:attribute>
      <xsl:apply-templates/>
    </verweis>
  </xsl:template>
  
  
  <!-- Formel -->
  
  <xsl:template match="m:math">
    <formel_inline>
      <xsl:copy>
        <xsl:copy-of select="node() | @*"/>
      </xsl:copy>
    </formel_inline>
  </xsl:template>
  
  
  
  <!-- Programmiercode -->
  
  <xsl:template match="pre">
    <codeblock>
      <xsl:attribute name="syntax">
        <xsl:value-of select="@class"/>
      </xsl:attribute>
      <xsl:apply-templates/>
    </codeblock>
  </xsl:template>
  
  <xsl:template match="pre/code/span/a">
    <xsl:text/>
  </xsl:template>

  <xsl:template match="section">
    <xsl:text/>
  </xsl:template>



</xsl:stylesheet>
