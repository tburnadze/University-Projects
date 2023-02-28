<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="xml" indent="yes" omit-xml-declaration="no"/> 
    <!-- method="xml" erzeugt die geschlossenenen Elemente, 
         indent="yes" sorgt für den Umbruch, 
         omit-xml-declaration="no" 
         sorgt für die XML-Deklaration am Anfang der Datei-->
    

    <!--Die Grundstruktur-->
    <xsl:template match="/">
        <html>
            <head>
                <link href="ja_brauche_ich.css" rel="stylesheet" type="text/css"/>                
                <title>
                    <xsl:value-of select="//ebook/titelei/titelseite/titel"/>
                </title>
            </head>
            <body>
                <xsl:apply-templates/>         
            </body>
        </html>
    </xsl:template>    
    
    <xsl:template match="titelei">
        <div class="titelei">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
  
    
    <xsl:template match="titelseite">
        <div class="titelseite">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <!-- undso schmeißt man Elemente raus   -->
    <xsl:template match="verlag">
        <!--<xsl:apply-templates/>-->
    </xsl:template>
    
   
    
    <xsl:template match="isbn">
        <p class="isbn">ISBN: <xsl:apply-templates/>       
        </p>
    </xsl:template>
    <xsl:template match="gestaltung">
        <p class="isbn">Gestaltung: <xsl:apply-templates/>       
        </p>
    </xsl:template>
    
    <xsl:template match="copyright">
        <p class="isbn">Copyright: <xsl:apply-templates/>       
        </p>
    </xsl:template>
    
    <xsl:template match="impressum">
        <div class="impressum">
          <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="titel">
        <h1 class="titel">
            <xsl:apply-templates/>
        </h1>
    </xsl:template>
    
    
    <xsl:template match="vorwort">
        <div class="vorwort">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="ueberschrift_vw">
        <h5 class="ueberschrift_vw">
            <xsl:apply-templates/>
        </h5>
    </xsl:template>
    
    <xsl:template match="hauptteil">
        <div class="hauptteil">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="kapitel">
        <div class="kapitel">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="ueberschrift_k">
        <h2 class="ueberschrift_k">
            <xsl:apply-templates/>
        </h2>
    </xsl:template>
    
    <xsl:template match="textteil">
        <section class="textteil">
            <xsl:apply-templates/>
        </section>
    </xsl:template>    
    
    <xsl:template match="ueberschrift_t">
        <h3 class="ueberschrift_t">
            <xsl:apply-templates/>
        </h3>
    </xsl:template>
    
    <xsl:template match="anhang">
        <div class="anhang">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="ueberschrift_ah">
        <h6 class="ueberschrift_ah">
            <xsl:apply-templates/>
        </h6>
    </xsl:template>
    
    <xsl:template match="quelleneintrag">
        <p class="quelleneintrag">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="absatz">
        <p class="absatz">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    
    <xsl:template match="stadt">
        <span class="stadt">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="wrede">
        <span class="wrede">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="person_gruppe">
        <span class="person_gruppe">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="zahl">
        <span class="zahl">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
   
    <xsl:template match="hervorheb">
        <span class="hervorheb">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    
    
<!--  Personen -->
 <xsl:template match="person">
     <xsl:choose>
         <xsl:when test="@rolle = 'autor'">
             <span class="autor">
                 <xsl:apply-templates/>
             </span>
         </xsl:when>
         <xsl:otherwise>
             <xsl:value-of select="person"/>
             <span class="person">
                 <xsl:apply-templates/>
             </span>
         </xsl:otherwise>
     </xsl:choose>
    </xsl:template>
    
<!--    FUSSNOTEN -->
    <xsl:template match="fussnote">
        <span class="fussnotenaufruf">
            <a>
                <xsl:attribute name="href">
                  <xsl:value-of select="@href"/>
                </xsl:attribute>
                <xsl:attribute name="id">
                    <xsl:value-of select="@id"/>
                </xsl:attribute>
                <xsl:apply-templates/>
            </a>
            
        </span>
    </xsl:template>
    
    
    
    <!-- Mediaobjekte -->
    <xsl:template match="mediaobjekt">
        <xsl:choose>
            
            <xsl:when test="@typ = 'bild'">
                <div class="bild">
                    <figure>
                        <xsl:for-each select="daten">
                            <img>
                                <xsl:attribute name="src">
                                    <xsl:value-of select="@fileref"/>
                                </xsl:attribute>
                                <xsl:attribute name="alt">
                                    <xsl:value-of select="@alt"/>
                                </xsl:attribute>
                                <xsl:apply-templates/>
                            </img>
                        </xsl:for-each>
                          <xsl:for-each select="legende"> 
                        <xsl:choose>
                            <xsl:when test="@label">
                                <figcaption>
                                    <a>
                                    <xsl:attribute name="href">
                                        <xsl:value-of select="@href"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="id">
                                        <xsl:value-of select="@label"/>
                                    </xsl:attribute>
                                    Abbildung: </a>
                                    <xsl:apply-templates/>
                                </figcaption>
                            </xsl:when>
                            <xsl:otherwise>
                        
                        <figcaption><xsl:value-of select="legende"/>
                            <xsl:apply-templates/> </figcaption>
                                
                            </xsl:otherwise>
                        </xsl:choose>
                        </xsl:for-each>
                    </figure>
                </div>
            </xsl:when>
            
            
            
            <xsl:when test="@typ = 'video'">
                <div class="video">
                    <figure>
                    <video controls="controls" width="1080">
                        <xsl:for-each select="daten">
                            <source type="video/mp4">
                                <xsl:attribute name="src">
                                    <xsl:value-of select="@fileref"/>
                                </xsl:attribute>
                                <xsl:apply-templates/>
                            </source>
                            <xsl:value-of select="@alt"/>
                        </xsl:for-each>
                        
                    </video><xsl:for-each select="legende"> 
                        <xsl:choose>
                            <xsl:when test="@label">
                                <figcaption>
                                    <a>
                                        <xsl:attribute name="href">
                                            <xsl:value-of select="@href"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="id">
                                            <xsl:value-of select="@label"/>
                                        </xsl:attribute>
                                        Video: </a>
                                    <xsl:apply-templates/>
                                </figcaption>
                            </xsl:when>
                            <xsl:otherwise>
                                
                                <figcaption><xsl:value-of select="legende"/> 
                                    <xsl:apply-templates/>
                                </figcaption>
                                
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each></figure>
                </div>
            </xsl:when>
            
            
            <xsl:when test="@typ = 'sound'">
                <div class="sound">
                    <xsl:for-each select="daten">
                        <audio controls="controls">
                            <source type="audio/mpeg">
                                <xsl:attribute name="src">
                                    <xsl:value-of select="@fileref"/>
                                </xsl:attribute>
                                <xsl:apply-templates/>
                            </source>
                            <xsl:value-of select="@alt"/>
                        </audio>
                    </xsl:for-each>
                </div>
            </xsl:when>
            
        </xsl:choose>
    </xsl:template>
    
    <!--    Formeln übernehmen ohne Anpassung-->
    <xsl:template match="formel">
        <div class="formel">
            <xsl:copy-of select="."/>
        </div>
    </xsl:template> 
    
    <!--    Tabellen übernehmen mit Anpassung-->
    <xsl:template match="tabelle">
        <table class="table"> 
            <xsl:apply-templates/>
        </table>
    </xsl:template>
    
    <xsl:template match="tbody">
        <tbody> 
            <xsl:apply-templates/>
        </tbody>
    </xsl:template>
    
    <xsl:template match="tabelle-caption">
        <caption>
            <xsl:apply-templates/>
        </caption>
    </xsl:template>
    
    <xsl:template match="thead">
        <thead>
            <xsl:apply-templates/>
        </thead>
    </xsl:template>
    
    <xsl:template match="tr">
        <tr>
            <xsl:apply-templates/>
        </tr>
    </xsl:template>
    
    <xsl:template match="td">
        <td>
            <xsl:apply-templates/>
        </td>
    </xsl:template>
    
    <!-- Listen -->
    <xsl:template match="liste">
        <div class="liste">
            <xsl:apply-templates/>
        </div>             
    </xsl:template>
    
    <xsl:template match="ueberschrift_liste">
        <h4 class="ueberschrift_liste">
            <xsl:apply-templates/>
        </h4>
    </xsl:template>
    
    <xsl:template match="liste_chaos">
        <ul>
            <xsl:apply-templates/>
        </ul>
    </xsl:template>
    
    <xsl:template match="liste_geordnet">
        <ol>
            <xsl:attribute name="type">
                <xsl:value-of select="@zaehlertyp"/>
            </xsl:attribute>
            <xsl:attribute name="start">
                <xsl:value-of select="@start"/>
            </xsl:attribute> 
            <xsl:apply-templates/>
        </ol>
    </xsl:template>
    
    <xsl:template match="liste_punkt">
        <li>
            <xsl:apply-templates/>
        </li>
    </xsl:template>
    
    
    <!-- Hyperlinks -->
    
    <xsl:template match="link">
        <a>
            <xsl:attribute name="href">
                <xsl:value-of select="@quelle"/>                    
            </xsl:attribute>
            <xsl:apply-templates/>
        </a>
    </xsl:template>    
    
    
</xsl:stylesheet>