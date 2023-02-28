@echo off

set saxon=_saxon/saxon9he.jar


pandoc -s  --from markdown --mathml --to html5 %1 -o %1.html --metadata css="css/style_3.css"
java  -jar %saxon%  -o:temp.html %1.html _xsl/01_trans.xsl
"C:\Program Files (x86)\Prince\engine\bin\prince" --no-warn-css temp.html -o %1.pdf


pause
