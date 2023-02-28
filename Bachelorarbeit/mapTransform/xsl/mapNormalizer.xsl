<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:os-command="java:java.lang.Runtime"
    xmlns:thread="java.lang.Thread"
    xmlns:file="http://expath.org/ns/file"
    xmlns:functx="http://www.functx.com"
    exclude-result-prefixes="xs os-command"
    xpath-default-namespace="https://www.parsx.de/ns/4.0"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    version="3.0">
    
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:variable name="path" select="functx:substring-before-last(substring-after(document-uri(/),'file:/'),'/')"/>
    
    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
    
    
    <xsl:template match="import_kapitel[@format='md']">
        <xsl:message select="$path"></xsl:message>
       
        <xsl:variable name="filename" select="@system-ressource"/>
        <xsl:variable name="filenamehtml" select="concat(substring-before($filename,'.'),'.html')"/>
        <xsl:variable name="call" select="concat('pandoc -s  --from markdown --mathml --to html5 ',$path,'/',$filename,' -o ',$path,'/xsl/',$filenamehtml)"/>
        <xsl:message select="$call"/>
        <xsl:message>
        <xsl:value-of 
            select="os-command:exec(os-command:getRuntime(),$call)"/>
        </xsl:message>
        
        <xsl:value-of select="thread:sleep(1000)"/>  
        
        <xsl:variable name="doc" select="document($filenamehtml)"/>
         
        <xsl:variable name="v"
            select="
            transform(map {
            'stylesheet-location': 'htmltoparsx.xsl',
            'source-node': $doc
            })"/>
        
        
        <xsl:copy-of select="map:get($v,'output')"/>
    </xsl:template>
    
    <xsl:function name="functx:substring-before-last" as="xs:string">
        <xsl:param name="arg" as="xs:string?"/>
        <xsl:param name="delim" as="xs:string"/>
        
        <xsl:sequence select="
            if (matches($arg, functx:escape-for-regex($delim)))
            then replace($arg,
            concat('^(.*)', functx:escape-for-regex($delim),'.*'),
            '$1')
            else ''
            "/>
        
    </xsl:function>
    
    <xsl:function name="functx:escape-for-regex" as="xs:string">
        <xsl:param name="arg" as="xs:string?"/>
        
        <xsl:sequence select="
            replace($arg,
            '(\.|\[|\]|\\|\||\-|\^|\$|\?|\*|\+|\{|\}|\(|\))','\\$1')
            "/>
        
    </xsl:function>
</xsl:stylesheet>