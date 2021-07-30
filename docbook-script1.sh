#!/bin/sh

#  script1.sh
#
#  Adapted from http://www.linuxfromscratch.org/blfs/view/cvs/pst/docbook.html
#  Created by Richard Barber on 11/28/18.
#
install -v -d -m755 /usr/local/share/xml/docbook/xml-dtd-4.3 && \
install -v -d -m755 /usr/local/share/etc/xml && \
cp -v -af docbook.cat *.dtd ent/ *.mod \
/usr/local/share/xml/docbook/xml-dtd-4.3

# Create (or update) and populate the /usr/local/share/etc/xml/docbook catalog
# file by running the following commands as the root user:

if [ ! -e /usr/local/share/etc/xml/docbook ]; then xmlcatalog --noout --create /usr/local/share/etc/xml/docbook
fi &&
xmlcatalog --noout --add "public" \
"-//OASIS//DTD DocBook XML V4.3//EN" \
"http://www.oasis-open.org/docbook/xml/4.3/docbookx.dtd" \
/usr/local/share/etc/xml/docbook &&
xmlcatalog --noout --add "public" \
"-//OASIS//DTD DocBook XML CALS Table Model V4.3//EN" \
"file:///usr/local/share/xml/docbook/xml-dtd-4.3/calstblx.dtd" \
/usr/local/share/etc/xml/docbook &&
xmlcatalog --noout --add "public" \
"-//OASIS//DTD XML Exchange Table Model 19990315//EN" \
"file:///usr/local/share/xml/docbook/xml-dtd-4.3/soextblx.dtd" \
/usr/local/share/etc/xml/docbook &&
xmlcatalog --noout --add "public" \
"-//OASIS//ELEMENTS DocBook XML Information Pool V4.3//EN" \
"file:///usr/local/share/xml/docbook/xml-dtd-4.3/dbpoolx.mod" \
/usr/local/share/etc/xml/docbook &&
xmlcatalog --noout --add "public" \
"-//OASIS//ELEMENTS DocBook XML Document Hierarchy V4.3//EN" \
"file:///usr/local/share/xml/docbook/xml-dtd-4.3/dbhierx.mod" \
/usr/local/share/etc/xml/docbook &&
xmlcatalog --noout --add "public" \
"-//OASIS//ELEMENTS DocBook XML HTML Tables V4.3//EN" \
"file:///usr/local/share/xml/docbook/xml-dtd-4.3/htmltblx.mod" \
/usr/local/share/etc/xml/docbook &&
xmlcatalog --noout --add "public" \
"-//OASIS//ENTITIES DocBook XML Notations V4.3//EN" \
"file:///usr/local/share/xml/docbook/xml-dtd-4.3/dbnotnx.mod" \
/usr/local/share/etc/xml/docbook &&
xmlcatalog --noout --add "public" \
"-//OASIS//ENTITIES DocBook XML Character Entities V4.3//EN" \
"file:///usr/local/share/xml/docbook/xml-dtd-4.3/dbcentx.mod" \
/usr/local/share/etc/xml/docbook &&
xmlcatalog --noout --add "public" \
"-//OASIS//ENTITIES DocBook XML Additional General Entities V4.3//EN" \
"file:///usr/local/share/xml/docbook/xml-dtd-4.3/dbgenent.mod" \
/usr/local/share/etc/xml/docbook &&
xmlcatalog --noout --add "rewriteSystem" \
"http://www.oasis-open.org/docbook/xml/4.3" \
"file:///usr//local/share/xml/docbook/xml-dtd-4.3" \
/usr/local/share/etc/xml/docbook &&
xmlcatalog --noout --add "rewriteURI" \
"http://www.oasis-open.org/docbook/xml/4.3" \
"file:///usr/local/share/xml/docbook/xml-dtd-4.3" \
/usr/local/share/etc/xml/docbook

# Create (or update) and populate the
#/usr/local/share/etc/xml/catalog catalog file by running the following commands as the root user:

if [ ! -e /usr/local/share/etc/xml/catalog ]; then xmlcatalog --noout --create /usr/local/share/etc/xml/catalog
fi &&
xmlcatalog --noout --add "delegatePublic" \
"-//OASIS//ENTITIES DocBook XML" \
"file:///etc/xml/docbook" \
/usr/local/share/etc/xml/catalog &&
xmlcatalog --noout --add "delegatePublic" \
"-//OASIS//DTD DocBook XML" \
"file:///etc/xml/docbook" \
/usr/local/share/etc/xml/catalog &&
xmlcatalog --noout --add "delegateSystem" \
"http://www.oasis-open.org/docbook/" \
"file:///etc/xml/docbook" \
/usr/local/share/etc/xml/catalog &&
xmlcatalog --noout --add "delegateURI" \
"http://www.oasis-open.org/docbook/" \
"file:///etc/xml/docbook" \
/usr/local/share/etc/xml/catalog

# END
