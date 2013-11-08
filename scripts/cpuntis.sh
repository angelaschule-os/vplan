#!/bin/bash
cd /group/vplan/Files/lehrer
for i in subst_*.htm; do \
	    iconv --from-code=ISO-8859-1 --to-code=UTF-8 $i \
	    | sed -e 's/iso-8859-1/utf-8/' \
	    | sed -ne '/refresh/{s/<meta http-equiv="refresh" content="10; URL=/<div style="text-align:center"><a href="lehrer_/;s/">$/">weiter...<\/a><\/div>/;h;d}' -ne '/\/body/{H;g}' -ne 'p' \
	    > /usr/share/iserv/www/vplan/lehrer_$i; \
done
cd /group/vplan/Files/schueler
for i in subst_*.htm; do \
	    iconv --from-code=ISO-8859-1 --to-code=UTF-8 $i \
	    | sed -e 's/iso-8859-1/utf-8/' \
	    | sed -ne '/refresh/{s/<meta http-equiv="refresh" content="10; URL=/<div style="text-align:center"><a href="schueler_/;s/">$/">weiter...<\/a><\/div>/;h;d}' -ne '/\/body/{H;g}' -ne 'p' \
	    > /usr/share/iserv/www/vplan/schueler_$i; \
done
