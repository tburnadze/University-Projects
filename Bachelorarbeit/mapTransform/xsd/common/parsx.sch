<?xml version="1.0" encoding="UTF-8"?><sch:schema xmlns:m="http://www.w3.org/1998/Math/MathML" xmlns:parsx="https://www.parsx.de/ns/4.0" xmlns:sch="http://purl.oclc.org/dsdl/schematron" xmlns:sqf="http://www.schematron-quickfix.com/validator/process" xmlns:xlink="http://www.w3.org/1999/xlink" queryBinding="xslt2">
	
	<!-- ==========================================================================================
		
		Grammatik-Regeln zur Ergänzung der parsX 4-XSD
		
		AUTOREN:       Björn Dünckel / Heino Schmull / Tobias Fischer
		COPYRIGHT:     © 2019-2020 pagina GmbH, Tübingen
		STAND:         2021-01-26
		XSD:           Version 4.0.14
		DOKUMENT:      Version 4.0.10
		
	========================================================================================== -->
	
	
	
	<!-- Namespaces ========================================================================== -->
	
	<sch:ns uri="https://www.parsx.de/ns/4.0" prefix="parsx"/>
	<sch:ns uri="http://www.w3.org/1998/Math/MathML" prefix="m"/>
	
	
	
	<!-- Variables =========================================================================== -->
	
	<sch:let name="elemNames" value="('code','durchgestr','fett','fremd','hoch','kapitaelchen','kursiv','sperrung','tief','unterstr','versal','ziffer',     'register','definition',     'verweis','textweiche',     'initiale','spitzmarke',     'marginalie','popup_inline', 'regie_inline')"/>
	
	<sch:let name="exceptNames" value="('fussnote','endnote','tabellenfussnote','definition','marginalie','popup_inline','register','meta')"/>
	
	
	
	<!-- Patterns ============================================================================ -->
	
	<sch:pattern id="alle">
		<sch:rule context="*[name()=$elemNames]" xlink:href="parsx.basis.xsd#basis__link-004" id="basis__rule-004">
			<sch:p>Inline-Elemente sollen innerhalb desselben Textflusses nicht rekursiv verwendet werden:</sch:p>
			
			<sch:let name="currentName" value="name()"/>
			<!-- rekursives Element ist zulässig nur einem der ausgenommenen-Elemente außer in dessen Fundstelle (für <register>, <definition>) -->
			<sch:assert test="not(ancestor::*[name()=$currentName]) or ancestor-or-self::*[not(self::parsx:fundstelle)]/parent::*[name()=$exceptNames]">
				[<sch:name/>] ist nicht innerhalb [<sch:name/>] zulässig.
			</sch:assert>
		</sch:rule>
		
		<sch:rule context="( (parsx:kurztext | parsx:bio | parsx:copyright)[ancestor::parsx:global] |    parsx:kapitel |    parsx:abschnitt | parsx:einschub | parsx:einschub_vor | parsx:infokasten | parsx:deckblatt | parsx:einschub_innen |     parsx:gedicht | parsx:legende | parsx:rede | parsx:regie) [not(*)]" xlink:href="parsx.basis.xsd#basis__link-001" id="basis__rule-001">
			<sch:p>Zu dieser Meldung steht ein Schematron-QuickFix zur Verfügung</sch:p>
			<sch:report test="true()" sqf:fix="leer_loeschen">
				[<sch:name/>] muss Inhaltselemente enthalten.
			</sch:report>
		</sch:rule>
		
		<sch:rule context="( (parsx:autoren | parsx:co-autoren | parsx:herausgeber | parsx:illustratoren | parsx:uebersetzer | parsx:urheber | parsx:termine)[ancestor::parsx:global] |    parsx:ausgabe |      parsx:meta ) [not(*)]" xlink:href="parsx.basis.xsd#basis__link-009" id="basis__rule-009">
			<sch:p>Zu dieser Meldung steht ein Schematron-QuickFix zur Verfügung</sch:p>
			<sch:report test="true()" sqf:fix="leer_loeschen">
				[<sch:name/>] darf nicht leer sein.
			</sch:report>
		</sch:rule>
		
		<sch:rule context="/parsx:projekt/parsx:meta//*[@auspraegung or @auspraegung-ausschluss or @ebook='nein' or (@print='nein' and not(name()=('kolumnentitel','audio','video')))]" xlink:href="parsx.basis.xsd#basis__link-005" id="basis__rule-005">
			<sch:p>Zu dieser Meldung steht ein Schematron-QuickFix zur Verfügung</sch:p>
			<sch:report test="true()" sqf:fix="attribute_loeschen">
				Attribute zur Ausgabesteuerung sind in den Projektmetadaten nicht zulässig.
			</sch:report>
			
			<sqf:fix id="attribute_loeschen">
				<sch:let name="ausgabesteuerung" value="@auspraegung | @auspraegung-ausschluss | @ebook | @print"/>
				<sqf:description>
					<sqf:title>Attribute @<sch:value-of select="string-join($ausgabesteuerung/name(),' ,@')"/>  löschen</sqf:title>
				</sqf:description>
				<sqf:delete match="$ausgabesteuerung" use-when="not(ancestor::parsx:textweiche)"/>
			</sqf:fix>
		</sch:rule>
		
	</sch:pattern>
	
	<sch:pattern id="einzelne">
		
		<sch:rule context="/parsx:projekt/parsx:meta/parsx:dokumentation/parsx:typisierung/parsx:element" xlink:href="parsx.basis.xsd#basis__link-008" id="basis__rule-008">
			<sch:assert test="@name=('register','definition','blocktext_def') or parsx:vorkommen">
				Für dieses Element muss ein [vorkommen] angegeben werden.
			</sch:assert>
		</sch:rule>

		<sch:rule context="parsx:variante/@ebook | parsx:variante/@print" xlink:href="parsx.basis.xsd#basis__link-036" id="basis__rule-036">
			
			<sch:p>Ausnahmeregelung: Der Ausschluss von beiden Formatgruppen (@print='nein' und @ebook='nein'), wird zum Kennzeichnen des Elements zur alleinigen Ausgabe in Leseproben verwendet.</sch:p>
			
			<!-- bei Varianten mit @ebook='nein' und @print='nein' nur prüfen, ob es bereits eine Variante mit @ebook='nein' und @print='nein' gibt -->
			<sch:report test="parent::*[@ebook='nein' and @print='nein'] and parent::*/preceding-sibling::parsx:variante[@ebook='nein' and @print='nein']">
				[variante] für @ebook="nein" und @print="nein") ist bereits definiert.
			</sch:report>
			
			<!-- bei Varianten mit @ebook='nein' oder @print='nein' nur gegen Varianten ohne die Kombination @ebook='nein' und @print='nein' prüfen -->
			<sch:p>Innerhalb [textweiche] muss eine [variante] eindeutig zugeordnet sein (angegeben werden Attributnamen und -werte):</sch:p>
			<sch:report test="not(parent::*[@ebook='nein' and @print='nein']) and concat(name(),.)      =      parent::*/preceding-sibling::parsx:variante[not(@ebook='nein' and @print='nein')]/@*/concat(name(),.)">
				[variante] für <sch:value-of select="concat(name(),'=&#34;',.,'&#34;')"/> ist bereits definiert.
			</sch:report>
		</sch:rule>

		<sch:rule context="parsx:variante[position() gt 1]/@auspraegung | parsx:variante[position() gt 1]/@auspraegung-ausschluss" xlink:href="parsx.basis.xsd#basis__link-022" id="basis__rule-022">
			<sch:report test="concat(name(),.) = parent::*/preceding-sibling::parsx:variante/@*/concat(name(),.)">
				[variante] für <sch:value-of select="concat(name(),'=&#34;',.,'&#34;')"/> ist bereits definiert.
			</sch:report>
		</sch:rule>
		
		<sch:rule context="parsx:formel | parsx:formel_inline" xlink:href="formeln.mod.xsd#formeln__link-001" id="formeln__rule-001">
			<sch:assert test="parsx:abbildung | m:math">
				[<sch:name/>] muss [m:math] oder [abbildung] enthalten.
			</sch:assert>
		</sch:rule>
		
		<sch:rule context="parsx:popup_inline" xlink:href="multimedia.mod.xsd#multimedia__link-004" id="multimedia__rule-004">
			<sch:report test="ancestor::parsx:referenz">
				[<sch:name/>] ist nicht innerhalb von [referenz] zulässig.
			</sch:report>
		</sch:rule>
		

		<sch:rule context="parsx:register" xlink:href="generatedContent.mod.xsd#generatedContent__link-001" id="generatedContent__rule-001">
			<sch:report test="ancestor::parsx:register">
				[<sch:name/>] ist nicht innerhalb von [register] zulässig.
			</sch:report>
			<sch:report test="ancestor::parsx:meta">
				[<sch:name/>] ist nicht innerhalb von Metadaten zulässig.
			</sch:report>
			<sch:report test="ancestor::parsx:referenz">
				[<sch:name/>] ist nicht innerhalb von [referenz] zulässig.
			</sch:report>
		</sch:rule>

		<sch:rule context="parsx:definition" xlink:href="generatedContent.mod.xsd#generatedContent__link-002" id="generatedContent__rule-002">
			<sch:report test="ancestor::parsx:definition">
				[<sch:name/>] ist nicht innerhalb [definition] zulässig.
			</sch:report>
			<sch:report test="ancestor::parsx:meta">
				[<sch:name/>] ist nicht innerhalb von Metadaten zulässig.
			</sch:report>
			<sch:report test="ancestor::parsx:referenz">
				[<sch:name/>] ist nicht innerhalb von [referenz] zulässig.
			</sch:report>
		</sch:rule>

		<sch:rule context="parsx:ausgabe_endnoten" xlink:href="generatedContent.mod.xsd#generatedContent__link-003" id="generatedContent__rule-003">
			<sch:let name="container" value="ancestor::parsx:werk"/>
			
			<sch:p>Zu dieser Meldung steht ein Schematron-QuickFix zur Verfügung</sch:p>
			<sch:report test="$container/descendant::parsx:ausgabe_endnoten[2]" sqf:fix="dieses-loeschen uebrige-loeschen">
				[<sch:name/>] darf im Werk nur einmal vorkommen.
			</sch:report>
		</sch:rule>

		<sch:rule context="parsx:ausgabe_tabellenfussnoten" xlink:href="generatedContent.mod.xsd#generatedContent__link-004" id="generatedContent__rule-004">
			<sch:let name="container" value="ancestor::parsx:tabelle"/>
			
			<sch:p>Zu dieser Meldung steht ein Schematron-QuickFix zur Verfügung</sch:p>
			<sch:report test="$container/descendant::parsx:ausgabe_tabellenfussnoten[2]" sqf:fix="uebrige-loeschen dieses-loeschen">
				[<sch:name/>] darf innerhalb einer Tabelle nur einmal vorkommen.
			</sch:report>
		</sch:rule>

		<sch:rule context="parsx:alternativinhalt[parent::parsx:video | parent::parsx:audio]" xlink:href="multimedia.mod.xsd#multimedia__link-002" id="multimedia__rule-002">
			
			<sch:p>Zu dieser Meldung steht ein Schematron-QuickFix zur Verfügung</sch:p>
			<sch:report test="following-sibling::*" sqf:fix="last-child">
				[alternativinhalt] ist nur an letzter Stelle zulässig.
			</sch:report>
			
			<!-- Der Kontext muss zuvor in einer Variable gespeichert werden. -->
			<sch:let name="context" value="."/>
			
			<sqf:fix id="last-child">
				<sqf:description>
					<sqf:title>Element [alternativinhalt] an die letzte Stelle setzen</sqf:title>
				</sqf:description>
				<sqf:add match="parent::*" select="parsx:alternativinhalt" position="last-child"/>
				<sqf:delete match="$context"/>
			</sqf:fix>
		</sch:rule>
		
		<sch:rule context="parsx:bildgruppe" xlink:href="multimedia.mod.xsd#multimedia__link-003" id="multimedia__rule-003">
			<sch:p>Zu dieser Meldung steht ein Schematron-QuickFix zur Verfügung</sch:p>
			<sch:report test="(@wiederholung='ja' or @autoplay='ja') and not(@slideshow='ja')" sqf:fix="attribut_ergaenzen">
				Die Attribute @wiederholung und @autoplay können nur in Verbindung mit @slideshow="ja" verwendet werden.
			</sch:report>
			
			<sqf:fix id="attribut_ergaenzen">
				<sqf:description>
					<sqf:title>Attribut @slideshow ergänzen</sqf:title>
				</sqf:description>
				<sqf:add node-type="attribute" target="slideshow" select="'ja'"/>
			</sqf:fix>
		</sch:rule>

		<sch:rule context="parsx:verlag" xlink:href="parsx.basis.xsd#basis__link-031" id="basis__rule-031">
			<sch:assert test="@name | *">
				[<sch:name/>] muss entweder den Verlagsnamen (Attribut @name) oder Inhaltselemente enthalten.
			</sch:assert>
		</sch:rule>

		<sch:rule context="parsx:vorspann | parsx:hauptteil | parsx:nachspann" xlink:href="parsx.basis.xsd#basis__link-002" id="basis__rule-002">
			<sch:assert test="parsx:kapitel | parsx:import_kapitel | parsx:import_leseprobe">
				[<sch:name/>] muss [kapitel] oder Importe enthalten.
			</sch:assert>
		</sch:rule>

		<sch:rule context="parsx:titel[not(parent::parsx:global | parent::parsx:ausgabe)] | parsx:zwischentitel | parsx:kolumnentitel | parsx:toctitel" xlink:href="parsx.basis.xsd#basis__link-003" id="basis__rule-003">
			<sch:assert test="parsx:zaehler | parsx:text">
				[<sch:name/>] muss [zaehler] oder [text] enthalten.
			</sch:assert>
		</sch:rule>

		<sch:rule context="parsx:kapitel[* except parsx:meta]" xlink:href="parsx.basis.xsd#basis__link-011" id="basis__rule-011">
			<sch:assert test="(* except (parsx:meta|parsx:kapitel) ) or parsx:meta/parsx:toctitel">
				Kapitel müssen weitere Inhalte außer Unterkapiteln enthalten oder einen TOC-Titel haben.
			</sch:assert>
		</sch:rule>

		<sch:rule context="parsx:fussnote | parsx:endnote | parsx:tabellenfussnote" xlink:href="parsx.basis.xsd#basis__link-013" id="basis__rule-013">
			<sch:report test="ancestor::parsx:tabellenfussnote | ancestor::parsx:fussnote | ancestor::parsx:endnote">
				[<sch:name/>] ist nicht innerhalb Fuß-, End- oder Tabellenfussnoten zulässig.
			</sch:report>
			<sch:report test="self::parsx:tabellenfussnote and not(ancestor::parsx:table)">
				[<sch:name/>] ist nur innerhalb [table] zulässig. 
			</sch:report>
			<sch:report test="ancestor::parsx:referenz">
				[<sch:name/>] ist nicht innerhalb von [referenz] zulässig.
			</sch:report>
			<sch:report test="ancestor::parsx:toctitel">
				[<sch:name/>] ist nicht innerhalb von [toctitel] zulässig.
			</sch:report>
		</sch:rule>
		
		<sch:rule context="parsx:fussnote_ref | parsx:endnote_ref | parsx:tabellenfussnote_ref" xlink:href="parsx.basis.xsd#basis__link-017" id="basis__rule-017">
			<sch:report test="ancestor::parsx:tabellenfussnote | ancestor::parsx:fussnote | ancestor::parsx:endnote">
				[<sch:name/>] ist nicht innerhalb Fuß-, End- oder Tabellenfussnoten zulässig.
			</sch:report>
			<sch:report test="self::parsx:fussnote_ref and not(@verweis-intern = //parsx:fussnote/@id)">
				Verweis ist nur auf eine [fussnote] zulässig.
			</sch:report>
			<sch:report test="self::parsx:endnote_ref and not(@verweis-intern = //parsx:endnote/@id)">
				Verweis ist nur auf eine [endnote] zulässig.
			</sch:report>
			<sch:report test="self::parsx:tabellenfussnote_ref and not(@verweis-intern = ancestor::parsx:table//parsx:tabellenfussnote/@id)">
				Verweis ist nur auf eine [tabellenfussnote] innerhalb derselben Tabelle zulässig.
			</sch:report>
		</sch:rule>

		<sch:rule context="parsx:marginalie" xlink:href="parsx.basis.xsd#basis__link-035" id="basis__rule-035">
			<sch:report test="ancestor::parsx:referenz">
				[<sch:name/>] ist nicht innerhalb von [referenz] zulässig.
			</sch:report>
			<sch:report test="ancestor::parsx:toctitel">
				[<sch:name/>] ist nicht innerhalb von [toctitel] zulässig.
			</sch:report>
		</sch:rule>
		
		<sch:rule context="parsx:leseprobe_start | parsx:leseprobe_ende" xlink:href="parsx.basis.xsd#basis__link-019" id="basis__rule-019">
			
			<sch:let name="container" value="(ancestor::parsx:deckblatt | ancestor::parsx:kapitel)[last()]"/>
			
			<sch:p>Zu dieser Meldung steht ein Schematron-QuickFix zur Verfügung</sch:p>
			<sch:assert test="$container/@leseprobe='ja'" sqf:fix="attribut_ergaenzen element_loeschen">
				<!-- Da Unterkapitel in einem <kapitel leseprobe="ja"> NICHT in die Leseprobe übernommen werden, wenn sie nicht selbst @leseprobe="ja" haben, macht ein <leseprobe_ende/> nur als Kindelement eines Leseproben-Kapitels Sinn. -->
				[<sch:name/>] ist nur in [kapitel] oder [deckblatt] mit @leseprobe="ja" zulässig.
			</sch:assert>
			
			<sch:report test="self::parsx:leseprobe_start and not( ancestor-or-self::*/following-sibling::* intersect $container//* )">
				Nach [leseprobe_start] müssen Inhalte stehen!
			</sch:report>
			<sch:report test="self::parsx:leseprobe_ende and not( ancestor-or-self::*/preceding-sibling::* intersect $container//* )">
				Vor [leseprobe_ende] müssen Inhalte stehen!
			</sch:report>
			
			<sch:p>Zu dieser Meldung steht ein Schematron-QuickFix zur Verfügung</sch:p>
			<sch:report test="ancestor::*[position() gt 5]/self::parsx:tabelle" sqf:fix="element_loeschen">
				[<sch:name/>] ist nicht in Tabellen zulässig.
			</sch:report>


			<sqf:fix id="attribut_ergaenzen">
				<sqf:description>
					<sqf:title>Am übergeordneten [<sch:value-of select="$container/name()"/>] ein Attribut @leseprobe ergänzen</sqf:title>
				</sqf:description>
				<sqf:add match="$container" node-type="attribute" target="leseprobe" select="'ja'"/>
			</sqf:fix>
		</sch:rule>

		<sch:rule context="parsx:meta[parent::parsx:bild | parent::parsx:tabelle | parent::parsx:formel | parent::parsx:video | parent::parsx:audio]" xlink:href="parsx.basis.xsd#basis__link-020" id="basis__rule-020">
			
			<sch:p>Zu dieser Meldung steht ein Schematron-QuickFix zur Verfügung</sch:p>
			<sch:report test="preceding-sibling::*" sqf:fix="first-child">
				[meta] ist nur an erster Stelle zulässig.
			</sch:report>
			<!-- Der Kontext muss zuvor in einer Variable gespeichert werden. -->
			<sch:let name="context" value="."/>
			
			<sqf:fix id="first-child">
				<sqf:description>
					<sqf:title>Element [meta] an die erste Stelle setzen</sqf:title>
				</sqf:description>
				<sqf:delete match="$context"/>
				<sqf:add match="parent::*" select="parsx:meta" position="first-child"/>
			</sqf:fix>
		</sch:rule>

		<sch:rule context="parsx:variante" xlink:href="parsx.basis.xsd#basis__link-021" id="basis__rule-021">
			<sch:assert test="@auspraegung | @auspraegung-ausschluss | @ebook | @print">
				[<sch:name/>] ohne Ausgabesteuerung ist nicht zulässig.
			</sch:assert>
		</sch:rule>
		
		<sch:rule context="parsx:ausgabe_referenz" xlink:href="parsx.basis.xsd#basis__link-023" id="basis__rule-023">
			<sch:assert test="ancestor::parsx:verweis">
				[<sch:name/>] ist nur innerhalb [verweis] zulässig.
			</sch:assert>
			<sch:report test="ancestor::parsx:meta/parent::parsx:projekt">
				[<sch:name/>] ist nicht innerhalb der Projektmetadaten zulässig.
			</sch:report>
			<sch:report test="ancestor::parsx:fundstelle">
				[<sch:name/>] ist nicht in [fundstelle] zulässig.
			</sch:report>
			<sch:report test="ancestor::parsx:titel/parent::parsx:popup_inline">
				[<sch:name/>] ist nicht in Popuptiteln zulässig.
			</sch:report>
		</sch:rule>

		<sch:rule context="parsx:code" xlink:href="parsx.basis.xsd#basis__link-024" id="basis__rule-024">
			<sch:report test="ancestor::parsx:codeblock">
				[<sch:name/>] ist nicht innerhalb von [codeblock] zulässig.
			</sch:report>
		</sch:rule>

		<sch:rule context="parsx:eintrag[parent::parsx:liste_geordnet | parent::parsx:liste_ungeordnet]" xlink:href="parsx.basis.xsd#basis__link-025" id="basis__rule-025">
			<sch:assert test="*[not(starts-with(name(), 'liste_'))] or @ebene-ueberspringen='ja'">
				Der Eintrag muss eigene Inhalte haben oder das ebene-ueberspringen-Attribut muss auf "ja" gesetzt sein.
			</sch:assert>
			<sch:report test="@ebene-ueberspringen='ja' and *[not(starts-with(name(), 'liste_'))]">
				Wenn das ebene-ueberspringen-Attribut auf "ja" gesetzt ist, darf der Eintrag keine eigenen Inhalte haben.
			</sch:report>
		</sch:rule>

		<sch:rule context="parsx:abschnitt[parent::parsx:inhaltsverzeichnis | parent::parsx:verzeichnis | parent::parsx:index][1]" xlink:href="parsx.basis.xsd#basis__link-026" id="basis__rule-026">
			<sch:report test="parent::*/parsx:eintrag">
				[eintrag] und [abschnitt]-Elemente dürfen auf oberster Ebene nicht gemischt sein.
			</sch:report>
		</sch:rule>
		
		<!-- 1. Eintrag hat @ebene-ueberspringen='ja' und eigene Inhalte -->
		<sch:rule context="parsx:eintrag[parent::parsx:inhaltsverzeichnis | parent::parsx:verzeichnis | parent::parsx:abschnitt | parent::parsx:ebene]      [@ebene-ueberspringen='ja' and (* except parsx:ebene)]" xlink:href="parsx.basis.xsd#basis__link-027" id="basis__rule-027">
			<sch:report test="true()">
				Wenn das ebene-ueberspringen-Attribut auf "ja" gesetzt ist, darf der Eintrag keine eigenen Inhalte haben.
			</sch:report>
		</sch:rule>
		<!-- 2. Eintrag enthält nur <ebene> -->
		<sch:rule context="parsx:eintrag[parent::parsx:inhaltsverzeichnis | parent::parsx:verzeichnis | parent::parsx:abschnitt | parent::parsx:ebene]      [parsx:ebene][not(*[2])]" xlink:href="parsx.basis.xsd#basis__link-028" id="basis__rule-028">
			<sch:assert test="@ebene-ueberspringen='ja'">
				[<sch:name/>] muss [zaehler] oder [text] enthalten oder das ebene-ueberspringen-Attribut muss auf "ja" gesetzt sein.
			</sch:assert>
		</sch:rule>
		<!-- 3. Eintrag enthält weder <zaehler> noch <text> – und nicht 2. <ebene> allein (<index> mit obligatorischem <begriff> ausgenommen)-->
		<sch:rule context="parsx:eintrag[parent::parsx:inhaltsverzeichnis | parent::parsx:verzeichnis | parent::parsx:abschnitt | parent::parsx:ebene]      [not(parsx:zaehler | parsx:text | parsx:begriff)]" xlink:href="parsx.basis.xsd#basis__link-029" id="basis__rule-029">
			<sch:report test="true()">
				[<sch:name/>] muss [zaehler] oder [text] enthalten.
			</sch:report>
		</sch:rule>

		<sch:rule context="parsx:tabelle" xlink:href="parsx.basis.xsd#basis__link-030" id="basis__rule-030">
			<sch:assert test="parsx:abbildung | parsx:table">
				[<sch:name/>] muss [table] oder [abbildung] enthalten.
			</sch:assert>
		</sch:rule>

		<sch:rule context="parsx:kontervers_def" xlink:href="parsx.basis.xsd#basis__link-033" id="basis__rule-033">
			<sch:assert test="following::parsx:vers[1]/parsx:kontervers_ref/@nummer = current()/@nummer">
				Konterverse: Auf [kontervers_def nr="<sch:value-of select="@nummer"/>"] muss [kontervers_ref] mit gleicher @nummer folgen! 
			</sch:assert>
			<sch:assert test="(preceding::*[starts-with(name(),'konter')][1] | following::*[starts-with(name(),'konter')][1])[name() != current()/name()]">
				Konterverse: [kontervers_def] und [kontervers_ref] müssen einander abwechseln, auf [<sch:value-of select="name()"/>] folgt [<sch:value-of select="name()"/>]! 
			</sch:assert>
			<sch:assert test="if(preceding-sibling::parsx:kontervers_def) then preceding-sibling::parsx:kontervers_ref/@nummer = current()/@nummer - 1 else true()">
				Konterverse: Innerhalb eines Verses müssen die Kontervers-Nummern aufsteigen! 
			</sch:assert>
			<sch:assert test="@nummer = 1 or preceding-sibling::parsx:kontervers_ref/@nummer = current()/@nummer - 1">
				Konterverse: Einem [kontervers_def nr="<sch:value-of select="@nummer"/>"] muss [kontervers_ref nr="<sch:value-of select="@nummer - 1"/>"] vorausgehen! 
			</sch:assert>
		</sch:rule>
		
		<sch:rule context="parsx:kontervers_ref" xlink:href="https://tools.parsx.de/doku/v4/#xsd-features-konterverse" id="basis__rule-034">
			<sch:assert test="preceding::parsx:vers[1]/parsx:kontervers_def/@nummer = current()/@nummer">
				Konterverse: Einem [kontervers_ref nr="<sch:value-of select="@nummer"/>"] muss [kontervers_def] mit gleicher @nummer vorangehen! 
			</sch:assert>
			<sch:assert test="(preceding::*[starts-with(name(),'konter')][1] | following::*[starts-with(name(),'konter')][1])[name() != current()/name()]">
				Konterverse: [kontervers_def] und [kontervers_ref] müssen einander abwechseln, <sch:value-of select="name()"/> folgt auf <sch:value-of select="name()"/>! 
			</sch:assert>
			<sch:assert test="if(following-sibling::parsx:kontervers_def) then following-sibling::parsx:kontervers_def/@nummer = current()/@nummer + 1 else true()">
				Konterverse: Innerhalb eines Verses müssen die Kontervers-Nummern aufsteigen! 
			</sch:assert>
		</sch:rule>
		
		<sch:rule context="/parsx:projekt/parsx:meta/parsx:ausgaben/@referenzausgabe" xlink:href="parsx.basis.xsd#basis__link-007" id="basis__rule-007">
			<sch:assert test=". = ../parsx:ausgabe/@id">
				Das Attribut @referenzausgabe muss die ID einer Ausgabe enthalten.
			</sch:assert>
		</sch:rule>
		
		<sch:rule context="@verweis-intern" xlink:href="parsx.basis.xsd#basis__link-037" id="basis__rule-037">
			<sch:report test=". = //ausgabe/@id | //auspraegung/@id">
				Ein interner Verweis darf nicht auf IDs von Ausgaben und Ausprägungen verweisen. 
			</sch:report>
		</sch:rule>
		
		<sch:let name="auspraegungenIDs" value="/parsx:projekt/parsx:meta//(parsx:ausgabe | parsx:auspraegung)/@id"/>
		
		<sch:rule context="(@auspraegung | @auspraegung-ausschluss)[not($auspraegungenIDs and (every $IDREF in tokenize(.,' ') satisfies $IDREF = $auspraegungenIDs) )]" xlink:href="parsx.basis.xsd#basis__link-032" id="basis__rule-032">
			<sch:report test="true()">
				Das Attribut @<sch:name/> darf nur auf IDs von Ausgaben und Ausprägungen verweisen (definiert sind: "<sch:value-of select="if($auspraegungenIDs) then string-join($auspraegungenIDs,'&#34;, &#34;') else '- keine -'"/>").
			</sch:report>
		</sch:rule>
		
		<sch:rule context="@auspraegung" xlink:href="parsx.basis.xsd#basis__link-006" id="basis__rule-006">
			<sch:report test=".=../@auspraegung-ausschluss">
				Die Attribute @auspraegung und @auspraegung-ausschluss dürfen nicht denselben Wert haben.
			</sch:report>
		</sch:rule>
		
	</sch:pattern>

	<sqf:fixes id="common">
		<sqf:fix id="leer_loeschen" use-when="not(self::parsx:urheber | parent::parsx:urheber[not(*/*)])">
			<sqf:description>
				<sqf:title>Leeren Container [<sch:name/>] löschen</sqf:title>
			</sqf:description>
			<sqf:delete use-when="not(* | comment() | processing-instruction() | text()[matches(.,'\S')])"/>
		</sqf:fix>
		<sqf:fix id="element_loeschen">
			<sqf:description>
				<sqf:title>Element [<sch:name/>] löschen</sqf:title>
			</sqf:description>
			<sqf:delete/>
		</sqf:fix>
		<sqf:fix id="attribut_loeschen">
			<sqf:description>
				<sqf:title>Attribut löschen</sqf:title>
			</sqf:description>
			<sqf:delete/>
		</sqf:fix>
		<!-- für <ausgabe_endnoten> und <ausgabe_tabellenfussnoten> in <werk> bzw. <tabelle> -->
		<sqf:fix id="dieses-loeschen">
			<sqf:description>
				<sqf:title>Dieses [<sch:name/>]-Element löschen.</sqf:title>
				<sqf:p>Das aktuelle Element wird gelöscht, weitere [<sch:name/>]-Elemente im [<sch:name path="$container"/>]-Element bleiben stehen.</sqf:p>
			</sqf:description>
			<sqf:delete/>
		</sqf:fix>
		<sqf:fix id="uebrige-loeschen">
			<sqf:description>
				<sqf:title>Andere [<sch:name/>]-Elemente löschen.</sqf:title>
				<sqf:p>Alle weiteren [<sch:name/>]-Elemente im  [<sch:name path="$container"/>]-Element werden entfernt, nur das aktuelle Element bleibt stehen.</sqf:p>
			</sqf:description>
			<sqf:delete match="$container//*[name()=current()/name()] except current()"/>
		</sqf:fix>
	</sqf:fixes>

</sch:schema>