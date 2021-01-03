#!/bin/sh

#  script1.sh
#  
#  Adapted from http://www.linuxfromscratch.org/blfs/view/cvs/pst/docbook.html
#  Created by Richard Barber on 11/28/18.
#  
install -v -d -m755 /opt/local/share/xml/docbook/xml-dtd-4.3 && \
install -v -d -m755 /etc/xml && \
cp -v -af docbook.cat *.dtd ent/ *.mod \
/opt/local/share/xml/docbook/xml-dtd-4.3

# Create (or update) and populate the /etc/xml/docbook catalog file by running the following commands as the root user:

if [ ! -e /etc/xml/docbook ]; then
xmlcatalog --noout --create /etc/xml/docbook
fi &&
xmlcatalog --noout --add "public" \
"-//OASIS//DTD DocBook XML V4.3//EN" \
"http://www.oasis-open.org/docbook/xml/4.3/docbookx.dtd" \
/etc/xml/docbook &&
xmlcatalog --noout --add "public" \
"-//OASIS//DTD DocBook XML CALS Table Model V4.3//EN" \
"file:///opt/local/share/xml/docbook/xml-dtd-4.3/calstblx.dtd" \
/etc/xml/docbook &&
xmlcatalog --noout --add "public" \
"-//OASIS//DTD XML Exchange Table Model 19990315//EN" \
"file:///opt/local/share/xml/docbook/xml-dtd-4.3/soextblx.dtd" \
/etc/xml/docbook &&
xmlcatalog --noout --add "public" \
"-//OASIS//ELEMENTS DocBook XML Information Pool V4.3//EN" \
"file:///opt/local/share/xml/docbook/xml-dtd-4.3/dbpoolx.mod" \
/etc/xml/docbook &&
xmlcatalog --noout --add "public" \
"-//OASIS//ELEMENTS DocBook XML Document Hierarchy V4.3//EN" \
"file:///opt/local/share/xml/docbook/xml-dtd-4.3/dbhierx.mod" \
/etc/xml/docbook &&
xmlcatalog --noout --add "public" \
"-//OASIS//ELEMENTS DocBook XML HTML Tables V4.3//EN" \
"file:///opt/local/share/xml/docbook/xml-dtd-4.3/htmltblx.mod" \
/etc/xml/docbook &&
xmlcatalog --noout --add "public" \
"-//OASIS//ENTITIES DocBook XML Notations V4.3//EN" \
"file:///opt/local/share/xml/docbook/xml-dtd-4.3/dbnotnx.mod" \
/etc/xml/docbook &&
xmlcatalog --noout --add "public" \
"-//OASIS//ENTITIES DocBook XML Character Entities V4.3//EN" \
"file:///opt/local/share/xml/docbook/xml-dtd-4.3/dbcentx.mod" \
/etc/xml/docbook &&
xmlcatalog --noout --add "public" \
"-//OASIS//ENTITIES DocBook XML Additional General Entities V4.3//EN" \
"file:///opt/local/share/xml/docbook/xml-dtd-4.3/dbgenent.mod" \
/etc/xml/docbook &&
xmlcatalog --noout --add "rewriteSystem" \
"http://www.oasis-open.org/docbook/xml/4.3" \
"file:///usr//local/share/xml/docbook/xml-dtd-4.3" \
/etc/xml/docbook &&
xmlcatalog --noout --add "rewriteURI" \
"http://www.oasis-open.org/docbook/xml/4.3" \
"file:///opt/local/share/xml/docbook/xml-dtd-4.3" \
/etc/xml/docbook

# Create (or update) and populate the /etc/xml/catalog catalog file by running the following commands as the root user:

if [ ! -e /etc/xml/catalog ]; then
xmlcatalog --noout --create /etc/xml/catalog
fi &&
xmlcatalog --noout --add "delegatePublic" \
"-//OASIS//ENTITIES DocBook XML" \
"file:///etc/xml/docbook" \
/etc/xml/catalog &&
xmlcatalog --noout --add "delegatePublic" \
"-//OASIS//DTD DocBook XML" \
"file:///etc/xml/docbook" \
/etc/xml/catalog &&
xmlcatalog --noout --add "delegateSystem" \
"http://www.oasis-open.org/docbook/" \
"file:///etc/xml/docbook" \
/etc/xml/catalog &&
xmlcatalog --noout --add "delegateURI" \
"http://www.oasis-open.org/docbook/" \
"file:///etc/xml/docbook" \
/etc/xml/catalog
