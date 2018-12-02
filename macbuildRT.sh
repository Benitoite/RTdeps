#!/bin/sh

#  macbuildRT.sh
#  Builds RawTherapee on macOS 10.14.2 / Xcode 10.1
#
#  Created by Richard Barber on 12/1/18.
#  
# GIT DEPENDENCIES AND BUILD TOOLS
cd ~
git clone https://github.com/GNOME/gtk.git
git clone git://anongit.freedesktop.org/git/cairo
git clone git://anongit.freedesktop.org/git/pixman.git
git clone https://github.com/GNOME/pango.git
git clone https://gitlab.freedesktop.org/fontconfig/fontconfig.git
git clone https://git.savannah.gnu.org/git/freetype/freetype2.git
git clone https://anongit.freedesktop.org/git/harfbuzz.git
git clone https://gitlab.gnome.org/GNOME/glib.git
git clone https://git.savannah.gnu.org/git/libiconv.git
git clone https://github.com/GNOME/gtkmm.git
git clone https://github.com/GNOME/gobject-introspection.git
git clone https://github.com/GNOME/atk.git
git clone https://github.com/GNOME/atkmm.git
git clone https://github.com/GNOME/glibmm.git
git clone https://github.com/GNOME/libsigcplusplus.git
git clone git://git.code.sf.net/p/libpng/code libpng
git clone https://github.com/madler/zlib.git
git clone https://github.com/libjpeg-turbo/libjpeg-turbo.git
git clone https://github.com/mm2/Little-CMS.git lcms
git clone https://github.com/libexpat/libexpat.git
git clone git://git.code.sf.net/p/lensfun/code lensfun-code
git clone https://github.com/svn2github/pcre.git
git clone https://github.com/anholt/libepoxy.git
git clone https://github.com/silnrsi/graphite.git
git clone git://github.com/libffi/libffi.git
git clone https://github.com/Kitware/CMake.git
git clone git://git.savannah.gnu.org/automake.git
git clone git://git.savannah.gnu.org/libtool.git
git clone git://anongit.freedesktop.org/pkg-config
git clone https://github.com/openssl/openssl
git clone https://github.com/ninja-build/ninja.git
git clone https://github.com/mesonbuild/meson.git
git clone https://github.com/doxygen/doxygen.git
git clone https://gitlab.gnome.org/GNOME/mm-common.git
git clone https://github.com/GNOME/pangomm.git
git clone https://github.com/fribidi/fribidi.git
git clone https://github.com/freedesktop/cairomm.git
git clone https://gitlab.gnome.org/GNOME/gdk-pixbuf.git
git clone https://github.com/mdadams/jasper.git

curl https://ftp.gnu.org/gnu/wget/wget-1.19.5.tar.gz -o wget.tar.gz && gunzip -c wget.tar.gz | tar xopf - && rm wget.tar.gz
curl https://svwh.dl.sourceforge.net/project/libiptcdata/libiptcdata/1.0.4/libiptcdata-1.0.4.tar.gz -o iptcdata.tar.gz && gunzip -c iptcdata.tar.gz | tar xopf - && rm iptcdata.tar.gz
curl http://fftw.org/fftw-3.3.8.tar.gz -o fftw.tar.gz && gunzip -c fftw.tar.gz | tar xopf - && rm fftw.tar.gz
curl https://www.openmprtl.org/sites/default/files/libomp_20160808_oss.tgz -o libiomp.tgz && tar -xvzf libiomp.tgz && rm libiomp.tgz
curl http://download.osgeo.org/libtiff/tiff-4.0.10.zip -o tiff.zip && unzip tiff.zip -d tiff && rm tiff*zip
curl http://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.gz -o autoconf.tar.gz && gunzip -c autoconf.tar.gz | tar xopf - && rm autoconf.tar.gz
curl https://raw.githubusercontent.com/Benitoite/RTdeps/master/xz.zip -o xz.zip && unzip xz.zip && tar -xvf xz*tar  && rm xz.zip && rm xz*tar
curl --user anonymous:example@ftp.com ftp://ftp.gnu.org/gnu/gettext/gettext-0.19.8.1.tar.gz -o gettext.tar.gz && gunzip -c gettext.tar.gz | tar xopf - && rm gettext.tar.gz
curl https://raw.githubusercontent.com/Benitoite/RTdeps/master/bzip2.zip -o bzip2.zip && unzip bzip2.zip && tar -xvf bzip*tar  && rm bzip2.zip && rm bzip*tar
curl http://ftp.gnu.org/pub/gnu/libiconv/libiconv-1.15.tar.gz -o libiconv.tar.gz && tar xf libiconv.tar.gz && rm libiconv*gz
curl https://ftp.gnu.org/gnu/texinfo/texinfo-6.5.tar.xz -o texinfo.tar.xz && tar xf texinfo.tar.xz && rm tex*xz
curl http://mirror.csclub.uwaterloo.ca/gnu/autoconf-archive/autoconf-archive-2018.03.13.tar.xz -o autoconf-archive.tar.xz && tar xf autoconf-archive.tar.xz && rm auto*xz
curl https://raw.githubusercontent.com/Benitoite/RTdeps/master/docbook-xml.zip -o docbook-xml.zip && unzip docbook-xml.zip -d ./docbook-xml && rm doc*zip
curl https://github.com/docbook/xslt10-stylesheets/releases/download/release/1.79.2/docbook-xsl-1.79.2.tar.bz2 -o docbook-xsl.tar.bz2 && tar xvjf docbook-xsl.tar.bz2
curl https://www.x.org/archive/individual/util/util-macros-1.19.1.tar.bz2 -o util-macros.tar.bz2 && tar xvjf util-macros.tar.bz2
curl https://www.nasm.us/pub/nasm/releasebuilds/2.14/macosx/nasm-2.14-macosx.zip -o nasm.zip && unzip nasm.zip && rm nasm.zip
curl http://saimei.ftp.acc.umu.se/pub/gnome/sources/adwaita-icon-theme/3.30/adwaita-icon-theme-3.30.0.tar.xz -o icons.tar.xz && tar xf icons.tar.xz && rm icons.tar.xz

# Build tools and libraries

cd ~/CMake && ./configure --prefix=/opt/local && make -j8 && sudo make install && export PATH=/opt/local/bin:$PATH

cd ~/autoconf* &&  ./configure --prefix=/opt/local && make -j8 && sudo make install

cd ~/automake && ./bootstrap --prefix=/opt/local && ./configure --prefix=/opt/local && make -j8 && sudo make install

cd ~/xz* &&  ./configure --prefix=/opt/local && make -j8 && sudo make install

cd ~/libtool &&  ./bootstrap &&  ./configure --prefix=/opt/local && make -j8 && sudo make install

cd ~/pkg-config && ./configure —prefix=/opt/local && make -j8 && sudo make install

cd ~/openssl && ./config --prefix=/opt/local && make -j8 && sudo make install

cd ~/wget* && ./configure --prefix=/opt/local --with-ssl=openss && make -j8 && sudo make install

cd ~/gettext* && ./configure --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" && make -j8 && sudo make install

cd ~/ninja && ./configure.py —bootstrap && ./ninja && chmod +x ninja && cp ninja /opt/local/bin

cd ~/meson && ninja && chmod +x meson.py && sudo cp meson.py /opt/local/bin/meson

cd ~/libomp-oss && mkdir build && cd build && cmake .. -DCMAKE_OSX_SYSROOT:PATH=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk -DCMAKE_OSX_DEPLOYMENT_TARGET:STRING=10.9 -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/opt/local && make -j8 && sudo make install && sudo install_name_tool -id /opt/local/lib/libiomp5.dylib  /opt/local/lib/libiomp5.dylib

cd ~/libjpeg-turbo* && mkdir build && cd build && cmake .. -DCMAKE_OSX_SYSROOT:PATH=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk -DCMAKE_OSX_DEPLOYMENT_TARGET:STRING=10.9 -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/opt/local && ccmake .. && make -j8 && sudo make install

cd ~/tiff/tiff* &&  mkdir build-aux && cd build-aux && cmake .. -DCMAKE_OSX_SYSROOT:PATH=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk -DCMAKE_OSX_DEPLOYMENT_TARGET:STRING=10.9 -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/opt/local && make -j8 && sudo make install

cd ~/zlib &&  mkdir build && cd build && cmake .. -DCMAKE_OSX_SYSROOT:PATH=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk -DCMAKE_OSX_DEPLOYMENT_TARGET:STRING=10.9 -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/opt/local && make -j8 && sudo make install

cd ~/libpng && cd build && cmake .. -DCMAKE_OSX_SYSROOT:PATH=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk -DCMAKE_OSX_DEPLOYMENT_TARGET:STRING=10.9 -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/opt/local -DZLIB_LIBRARY_RELEASE:FILEPATH=/opt/local/lib/libz.dylib && make -j8 && sudo make install

cd ~/libexpat/expat && mkdir build && cd build && cmake .. -DCMAKE_OSX_SYSROOT:PATH=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk -DCMAKE_OSX_DEPLOYMENT_TARGET:STRING=10.9 -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/opt/local && make -j8 && sudo make install

cd ~/pcre && ./configure --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" CPPFLAGS="-I/opt/local/include" --enable-utf8 --enable-pcre16 --enable-pcre32 --enable-unicode-properties && make -j8 && sudo make install

cd ~/libepoxy && mkdir _build && cd _build && meson && ninja && sudo ninja install

cd ~/libffi && sh autogen.sh --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk && ./configure --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk && make -j8 && sudo make install

cd ~/fftw* && sh bootstrap.sh  --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk && make -j8 && sudo make install

cd ~/graphite && mkdir build && cd build && cmake .. -DCMAKE_OSX_SYSROOT:PATH=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk -DCMAKE_OSX_DEPLOYMENT_TARGET:STRING=10.9 -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/opt/local  -DCMAKE_MACOSX_RPATH=/opt/local/lib -DCMAKE_SHARED_LINKER_FLAGS="-L /opt/local/lib -rpath /opt/local/lib" && make -j8 && sudo make install &&  sudo install_name_tool -id /opt/local/lib/libgraphite2.3.dylib /opt/local/lib/libgraphite2.3.0.1.dylib &&  sudo install_name_tool -id /opt/local/lib/libgraphite2.3.dylib /opt/local/lib/libgraphite2.3.2.1.dylib

cd ~/bzip2* && curl https://raw.githubusercontent.com/Benitoite/RTdeps/master/bzip2.zip -o bzip2.zip && unzip bzip2.zip && tar -xvf bzip*tar  && rm bzip2.zip && rm bzip*tar && make && sudo make install PREFIX=/opt/local

cd ~/libpng && autoconf && ./configure  --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes && make -j8 && sudo make install

cd ~/freetype2 && sh autogen.sh --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --with-harfbuzz=no --enable-shared=yes && ./configure --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --with-harfbuzz=no --enable-shared=yes && make -j8 && sudo make install && sudo install_name_tool -change @rpath/libpng16.16.dylib /opt/local/lib/libpng16.16.dylib /opt/local/lib/libfreetype.6.dylib

cd ~/fontconfig && sh autogen.sh --with-libintl-prefix=/opt/local --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes

cd ~/libiptc* && ./configure --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" && make -j8 && sudo make install

cd ~/libiconv* && ./configure --prefix=/opt/local --disable-static 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" && wget https://raw.githubusercontent.com/Beep6581/RawTherapee/dev/tools/osx/libiconv_1.15_rt.patch --no-check-certificate && patch -p1 < libiconv_1.15_rt.patch && make -j8 && sudo make install && libtool --finish /opt/local/lib

cd ~/gettext* && sh autogen.sh --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" && ./configure --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" && make -j8 && sudo make install

cd ~/glib && sh autogen.sh --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" CPPFLAGS="-I/opt/local/include" PCRE_CFLAGS="-I/opt/local/include" PCRE_LIBS="-L/opt/local/lib -lpcre" && ./configure --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" CPPFLAGS="-I/opt/local/include" PCRE_CFLAGS="-I/opt/local/include" PCRE_LIBS="-L/opt/local/lib -lpcre" && make -j8 && sudo make install

cd ~/lensfun-code && mkdir build && cd build &&  cmake ..  -DCMAKE_OSX_SYSROOT:PATH=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk -DCMAKE_OSX_DEPLOYMENT_TARGET:STRING=10.9 -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/opt/local && make -j8 && sudo make install

cd ~/lcms && mkdir build && cd build &&  sh autogen.sh --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" CPPFLAGS="-I/opt/local/include" && make -j8 && sudo make install

cd ~/pixman && sh autogen.sh --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" CPPFLAGS="-I/opt/local/include" && make -j8 && sudo make install

cd ~/cairo && sh autogen.sh --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" CPPFLAGS="-I/opt/local/include" --enable-quartz-image && make -j8 && sudo make install

cd ~/doxygen && curl https://raw.githubusercontent.com/Benitoite/RTdeps/master/mypatch.patch -o mypatch.patch && git apply mypatch.patch && mkdir build && cd build && cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/opt/local  .. && make -j8 && sudo make install

cd ~/glib && sh autogen.sh --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" && make -j8 && sudo make install

cd ~/libsigcplusplus && git checkout 2.10.0 && sh autogen.sh --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" && make -j8 && sudo make install

cd ~/texinfo* &&  ./configure --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" CPPFLAGS="-I/opt/local/include" && make -j8 && sudo make install

cd ~/autoconf-archive && ./configure --prefix=/opt/local && make && sudo make install

cd ~/gobject-introspection &&  sh autogen.sh --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" CPPFLAGS="-I/opt/local/include" && make -j8 && sudo make install

cd ~/atk &&  meson _build . --prefix=/opt/local && ninja -C _build &&  sed -i -e 's/-current_version=1/-current_version 1/g' _build/build.ninja && sed -i -e 's/-compatibility_version=1/-compatibility_version 1/g' _build/build.ninja && ninja -C _build && sudo ninja -C _build install

cd ~/atkmm &&  autogen.sh --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" && make -j8 && sudo make install

cd ~/glibmm && git checkout glibmm-2-56 && autogen.sh --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" && make -j8

cd ~/harfbuzz && sh autogen.sh --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" --with-glib=yes --with-graphite2=yes && make -j8 && sudo make install && sudo install_name_tool -change libgraphite2.3.dylib /opt/local/lib/libgraphite2.3.dylib /opt/local/lib/libharfbuzz.0.dylib

cd ~/fribidi && git checkout git checkout f2c9d50722cb60d0cdec3b1bafba9029770e86b4 && sh autogen.sh --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" --disable-docs && make -j8 && sudo make install

cd ~/pango && mkdir build && cd build && meson --prefix=/opt/local --sysconfdir=/etc .. && ninja && sudo ninja install

cd ~/cairomm && git checkout cairomm-1-12 &&  sh autogen.sh --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" && make -j8 && sudo make install

cd ~/pangomm && git checkout 1.40.1 && sh autogen.sh --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" && make -j8 && sudo make install

cd ~/docbook-xml && curl https://raw.githubusercontent.com/Benitoite/RTdeps/master/docbook-script1.sh -o docbook-script1.sh && sudo sh docbook-script1.sh

cd ~/docbook-xsl* && curl http://www.linuxfromscratch.org/patches/blfs/svn/docbook-xsl-1.79.2-stack_fix-1.patch -o patch1.patch && patch -Np1 -i patch1-patch && sudo install -v -m755 -d /opt/share/xml/docbook/xsl-stylesheets-1.79.2 && sudo cp -v -R VERSION assembly common eclipse epub epub3 extensions fo   highlighting html htmlhelp images javahelp lib manpages params     profiling roundtrip slides template tests tools webhelp website    xhtml xhtml-1_1 xhtml5       /opt/share/xml/docbook/xsl-stylesheets-1.79.2 && sudo ln -s VERSION /opt/share/xml/docbook/xsl-stylesheets-1.79.2/VERSION.xsl && sudo install -v -m644  README     /opt/share/doc/docbook-xsl-1.79.2/README.txt && sudo install -v -m644    RELEASE-NOTES* NEWS*   /opt/share/doc/docbook-xsl-1.79.2 && curl https://raw.githubusercontent.com/Benitoite/RTdeps/master/xslconfig.sh -o xslconfig.sh && sudo sh xslconfig.sh

cd ~/libepoxy &&   sh autogen.sh --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" && make -j8 && sudo make install

cd ~/jasper && mkdir _build && cd _build && cmake .. -DCMAKE_OSX_SYSROOT:PATH=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk -DCMAKE_OSX_DEPLOYMENT_TARGET:STRING=10.9 -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/opt/local && make -j8 && sudo make install

cd ~/gdk-pixbuf &&  sh autogen.sh --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" && make -j8 && sudo make install

cd ~/gtk && git checkout 3.22.30 && sh autogen.sh  --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-quartz-backend --enable-debug=no --enable-introspection=no --enable-man=no --enable-gtk-doc-html=no --disable-dependency-tracking  'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" CPPFLAGS="-I/opt/local/include"  --libdir=/opt/local/lib && make -j8 && sudo make install

cd ~/gtkmm && git checkout 3.22.3 && sh autogen.sh  --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk   --enable-debug=no --enable-introspection=no --enable-man=no --enable-gtk-doc-html=no   'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" CPPFLAGS="-I/opt/local/include"  --libdir=/opt/local/lib

cd ~/nasm* && sudo install ldrdf nasm ndisasm rdf* rdx /opt/local/bin

cd ~/fftw* &&  ./configure  --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk   --enable-debug=no  'CFLAGS= -arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS= -arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CPPFLAGS="-arch x86_64 -mmacosx-version-min=10.9" CPPFLAGS="-I/opt/local/include " --disable-fortran --enable-avx2 --enable-float --enable-avx --enable-sse --enable-sse2 --enable-threads && make -j8 && sudo make install

cd ~/gtk-mac* && sh autogen.sh  --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk   --enable-debug=no  'CFLAGS= -arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS= -arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CPPFLAGS="-arch x86_64 -mmacosx-version-min=10.9" CPPFLAGS="-I/opt/local/include " --enable-introspection=no && make -j8 && sudo make install

cd ~/adwaita* && ./configure --prefix=/opt/local && make && sudo make install || exit 0

# RawTherapee

cd ~ && git clone https://github.com/Beep6581/RawTherapee.git && cd ~/repo-rt && mkdir build && cd build && cmake -DCMAKE_BUILD_TYPE="release"       -DPROC_TARGET_NUMBER="1" -DPROC_LABEL="generic processor"       -DCACHE_NAME_SUFFIX="5.4-dev"       -DCMAKE_C_COMPILER="clang"       -DCMAKE_CXX_COMPILER="clang++"       -DWITH_LTO="ON"    -DCMAKE_OSX_SYSROOT="/" -DCMAKE_OSX_DEPLOYMENT_TARGET="10.9"  -DLENSFUNDBDIR="./share/lensfun" -DCODESIGNID:STRING="Developer ID Application: xxxx xxxx (XXXXXXXXXX)" -DCMAKE_CXX_FLAGS="-std=c++11" -DOpenMP_C_FLAGS=-fopenmp=lomp -DOpenMP_CXX_FLAGS=-fopenmp=lomp -DOpenMP_C_LIB_NAMES="libiomp5" -DOpenMP_CXX_LIB_NAMES="libiomp5" -DOpenMP_libiomp5_LIBRARY="/opt/local/lib/libiomp5.dylib" -DOpenMP_CXX_FLAGS="-Xpreprocessor -fopenmp /opt/local/lib/libiomp5.dylib -I/opt/local/include" -DOpenMP_CXX_LIB_NAMES="libiomp5" -DOpenMP_omp_LIBRARY=/opt/local/lib/libiomp5.dylib -DOpenMP_C_FLAGS="-Xpreprocessor -fopenmp /opt/local/lib/libiomp5.dylib -I/opt/local/include"   -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON   .. && make -j8 install && sudo make macosx_bundle

echo "-end of script-"
