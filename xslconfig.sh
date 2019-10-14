#!/bin/sh

#  xslconfig.sh
#  
#
#  Created by Richard Barber on 11/29/18.
#  based on http://www.linuxfromscratch.org/blfs/view/svn/pst/docbook-xsl.html
if [ ! -d /etc/xml ]; then install -v -m755 -d /etc/xml; fi &&
if [ ! -f /etc/xml/catalog ]; then
xmlcatalog --noout --create /etc/xml/catalog
fi &&

xmlcatalog --noout --add "rewriteSystem" \
"http://docbook.sourceforge.net/release/xsl/1.79.2" \
"/usr/local/share/xml/docbook/xsl-stylesheets-1.79.2" \
/etc/xml/catalog &&

xmlcatalog --noout --add "rewriteURI" \
"http://docbook.sourceforge.net/release/xsl/1.79.2" \
"/usr/local/share/xml/docbook/xsl-stylesheets-1.79.2" \
/etc/xml/catalog &&

xmlcatalog --noout --add "rewriteSystem" \
"http://docbook.sourceforge.net/release/xsl/current" \
"/usr/local/share/xml/docbook/xsl-stylesheets-1.79.2" \
/etc/xml/catalog &&

xmlcatalog --noout --add "rewriteURI" \
"http://docbook.sourceforge.net/release/xsl/current" \
"/usr/local/share/xml/docbook/xsl-stylesheets-1.79.2" \
/etc/xml/catalog &&

xmlcatalog --noout --add "nextCatalog" \
"catalog="file:///usr/local/share/xml/docbook-xsl/1.79.2/docbook-xsl/catalog.xml" \ 
/etc/xml/catalog
