#!/bin/sh

#  macbuildRT.sh
#  Builds RawTherapee on macOS 10.14.6 / Xcode 11.1
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
#git clone https://git.savannah.gnu.org/git/libiconv.git
git clone https://github.com/GNOME/gtkmm.git
git clone https://github.com/GNOME/gobject-introspection.git
git clone https://github.com/GNOME/atk.git
git clone https://github.com/GNOME/atkmm.git
git clone https://github.com/GNOME/glibmm.git
git clone https://github.com/libsigcplusplus/libsigcplusplus.git
git clone git://git.code.sf.net/p/libpng/code libpng
git clone https://github.com/madler/zlib.git
git clone https://github.com/libjpeg-turbo/libjpeg-turbo.git
git clone https://github.com/mm2/Little-CMS.git lcms
git clone https://github.com/libexpat/libexpat.git
git clone https://github.com/lensfun/lensfun.git
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

#curl https://ftp.gnu.org/gnu/wget/wget-latest.tar.gz -o wget.tar.gz && gunzip -c wget.tar.gz | tar xopf - && rm wget.tar.gz
curl https://svwh.dl.sourceforge.net/project/libiptcdata/libiptcdata/1.0.4/libiptcdata-1.0.4.tar.gz -o iptcdata.tar.gz && gunzip -c iptcdata.tar.gz | tar xopf - && rm iptcdata.tar.gz
curl http://fftw.org/fftw-3.3.8.tar.gz -o fftw.tar.gz && gunzip -c fftw.tar.gz | tar xopf - && rm fftw.tar.gz
curl https://www.openmprtl.org/sites/default/files/libomp_20160808_oss.tgz -o libiomp.tgz && tar -xvzf libiomp.tgz && rm libiomp.tgz
curl http://download.osgeo.org/libtiff/tiff-4.0.10.zip -o tiff.zip && unzip tiff.zip -d tiff && rm tiff*zip
curl https://raw.githubusercontent.com/Benitoite/RTdeps/master/xz.zip -o xz.zip && unzip xz.zip && tar -xvf xz*tar  && rm xz.zip && rm xz*tar
curl --user anonymous:example@ftp.com ftp://ftp.gnu.org/gnu/gettext/gettext-0.19.8.1.tar.gz -o gettext.tar.gz && gunzip -c gettext.tar.gz | tar xopf - && rm gettext.tar.gz
curl https://raw.githubusercontent.com/Benitoite/RTdeps/master/bzip2.zip -o bzip2.zip && unzip bzip2.zip && tar -xvf bzip*tar  && rm bzip2.zip && rm bzip*tar
curl http://ftp.gnu.org/pub/gnu/libiconv/libiconv-1.15.tar.gz -o libiconv.tar.gz && tar xf libiconv.tar.gz && rm libiconv*gz
curl https://ftp.gnu.org/gnu/texinfo/texinfo-6.6.tar.xz -o texinfo.tar.xz && tar xf texinfo.tar.xz && rm tex*xz
curl http://mirror.csclub.uwaterloo.ca/gnu/autoconf-archive/autoconf-archive-2019.01.06.tar.xz  -o autoconf-archive.tar.xz && tar xf autoconf-archive.tar.xz && rm auto*xz
curl https://raw.githubusercontent.com/Benitoite/RTdeps/master/docbook-xml.zip -o docbook-xml.zip && unzip docbook-xml.zip -d ./docbook-xml && rm doc*zip
curl https://github.com/docbook/xslt10-stylesheets/releases/download/release/1.79.2/docbook-xsl-1.79.2.tar.bz2 -o docbook-xsl.tar.bz2 && tar xvjf docbook-xsl.tar.bz2
curl https://www.x.org/archive/individual/util/util-macros-1.19.1.tar.bz2 -o util-macros.tar.bz2 && tar xvjf util-macros.tar.bz2
curl https://www.nasm.us/pub/nasm/releasebuilds/2.14.03rc2/macosx/nasm-2.14.03rc2-macosx.zip -o nasm.zip && unzip nasm.zip && rm nasm.zip && mv nasm* nasm && export PATH=~/nasm:$PATH
curl https://raw.githubusercontent.com/Benitoite/RTdeps/master/adwaita.zip -o adwaita.zip && unzip adwaita.zip && rm adwaita.zip
curl http://gnu.spinellicreations.com/help2man/help2man-1.47.11.tar.xz -o help2man.tar.xz && tar xf help2man.tar.xz && rm help2man*z

# Build tools and libraries

cd ~/CMake && ./configure --prefix=/opt/local && make -j8 && sudo make install && export PATH=/opt/local/bin:$PATH

cd ~/autoconf* &&  ./configure --prefix=/opt/local && make -j8 && sudo make install

cd ~/automake && ./bootstrap --prefix=/opt/local && ./configure --prefix=/opt/local && make -j8 && sudo make install

cd ~/xz* &&  ./configure --prefix=/opt/local && make -j8 && sudo make install

cd ~/help2man* && ./configure --prefix=/opt/local && make -j8 && sudo make install

cd ~/libtool &&  ./bootstrap &&  ./configure --prefix=/opt/local && make -j8 && sudo make install

cd ~/pkg-config && sh ./autogen.sh --prefix=/opt/local --with-internal-glib && make -j8 && sudo make install

cd ~/openssl && ./config --prefix=/opt/local && make -j8 && sudo make install

#cd ~/wget* && ./configure --prefix=/opt/local --with-ssl=openss && make -j8 && sudo make install

cd ~/gettext* && ./configure --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" && make -j8 && sudo make install

cd ~/ninja && ./configure.py —bootstrap && ./ninja && chmod +x ninja && cp ninja /opt/local/bin

cd ~/meson && ninja && chmod +x meson.py && sudo cp meson.py /opt/local/bin/meson

#cd ~/libomp-oss && mkdir build && cd build && cmake .. -DCMAKE_OSX_SYSROOT:PATH=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk -DCMAKE_OSX_DEPLOYMENT_TARGET:STRING=10.9 -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/opt/local && make -j8 && sudo make install && sudo install_name_tool -id /opt/local/lib/libiomp5.dylib  /opt/local/lib/libiomp5.dylib

cd ~/libjpeg-turbo* && mkdir build && cd build && cmake .. -DCMAKE_OSX_SYSROOT:PATH=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk -DCMAKE_OSX_DEPLOYMENT_TARGET:STRING=10.9 -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/opt/local && make -j8 && sudo make install

cd ~/tiff/tiff* &&  mkdir build-aux && cd build-aux && cmake .. -DCMAKE_OSX_SYSROOT:PATH=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk -DCMAKE_OSX_DEPLOYMENT_TARGET:STRING=10.9 -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/opt/local && make -j8 && sudo make install

cd ~/zlib &&  mkdir build && cd build && cmake .. -DCMAKE_OSX_SYSROOT:PATH=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk -DCMAKE_OSX_DEPLOYMENT_TARGET:STRING=10.9 -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/opt/local && make -j8 && sudo make install

cd ~/libpng && mkdir build && cd build && cmake .. -DCMAKE_OSX_SYSROOT:PATH=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk -DCMAKE_OSX_DEPLOYMENT_TARGET:STRING=10.9 -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/opt/local -DZLIB_LIBRARY_RELEASE:FILEPATH=/opt/local/lib/libz.dylib && make -j8 && sudo make install

cd ~/libexpat/expat && mkdir build && cd build && cmake .. -DCMAKE_OSX_SYSROOT:PATH=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk -DCMAKE_OSX_DEPLOYMENT_TARGET:STRING=10.9 -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/opt/local && make -j8 && sudo make install

cd ~/pcre && sh ./autogen.sh --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" CPPFLAGS="-I/opt/local/include" --enable-utf8 --enable-pcre16 --enable-pcre32 --enable-unicode-properties && ./configure  --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" CPPFLAGS="-I/opt/local/include" --enable-utf8 --enable-pcre16 --enable-pcre32 --enable-unicode-properties && make -j8 && sudo make install

#cd ~/libepoxy && mkdir _build && cd _build && meson && ninja && sudo ninja install

cd ~/libffi && sh autogen.sh --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk && ./configure --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk && make -j8 && sudo make install

cd ~/fftw* && sh bootstrap.sh  --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk && make -j8 && sudo make install

cd ~/graphite && git checkout 1.3.13 && mkdir build && cd build && cmake .. -DCMAKE_OSX_SYSROOT:PATH=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk -DCMAKE_OSX_DEPLOYMENT_TARGET:STRING=10.9 -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/opt/local  -DCMAKE_MACOSX_RPATH=/opt/local/lib -DCMAKE_SHARED_LINKER_FLAGS="-L /opt/local/lib -rpath /opt/local/lib" && make -j8 && sudo make install &&  sudo install_name_tool -id /opt/local/lib/libgraphite2.3.dylib /opt/local/lib/libgraphite2.3.0.1.dylib &&  sudo install_name_tool -id /opt/local/lib/libgraphite2.3.dylib /opt/local/lib/libgraphite2.3.2.1.dylib

cd ~/bzip2* && curl https://raw.githubusercontent.com/Benitoite/RTdeps/master/bzip2.zip -o bzip2.zip && unzip bzip2.zip && tar -xvf bzip*tar  && rm bzip2.zip && rm bzip*tar && make && sudo make install PREFIX=/opt/local

cd ~/freetype2 && sudo ln -s /opt/local/bin/libtoolize /opt/local/bin/glibtoolize && sh autogen.sh --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --with-harfbuzz=no --enable-shared=yes && ./configure --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --with-harfbuzz=no --enable-shared=yes && make -j8 && sudo make install && sudo install_name_tool -change @rpath/libpng16.16.dylib /opt/local/lib/libpng16.16.dylib /opt/local/lib/libfreetype.6.dylib

cd ~/fontconfig && sed -i -e 's+libintl.h+/opt/local/include/libintl.h+g' src/fcint.h && sh autogen.sh  --disable-rpath --with-libintl-prefix=/opt/local --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes && make -j8 && sudo make install || install_name_tool -add_rpath /opt/local/lib /Users/rb/fontconfig/fc-cache/.libs/fc-cache && sudo make install

cd ~/libiptc* && ./configure --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" && make -j8 && sudo make install

cd ~/libiconv*  && ./configure --prefix=/opt/local --disable-static 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" && ./configure --prefix=/opt/local --disable-static 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" && curl https://raw.githubusercontent.com/Beep6581/RawTherapee/dev/tools/osx/libiconv_1.15_rt.patch -o libiconv_1.15_rt.patch && patch -p1 < libiconv_1.15_rt.patch && make -j8 && sudo make install && libtool --finish /opt/local/lib

cd ~/gettext* && sh autogen.sh --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" && ./configure --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" && make -j8 && sudo make install

# cd ~/glib && git checkout 2.60.6 && LDFLAGS="-Wl,-syslibroot,/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk -arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib" SYSROOT=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk CFLAGS="-isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk -arch x86_64 -mmacosx-version-min=10.9" CXXFLAGS="-isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk -arch x86_64 -mmacosx-version-min=10.9" CPPFLAGS="-isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk -I/opt/local/include" meson --reconfigure -Dinstalled_tests=false --prefix=/opt/local -Dbsymbolic_functions=false -Diconv=gnu _build && ninja -j 8 -C _build && sudo ninja -C _build install

# cd ~/glib && sh autogen.sh --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" CPPFLAGS="-I/opt/local/include" PCRE_CFLAGS="-I/opt/local/include" PCRE_LIBS="-L/opt/local/lib -lpcre" && ./configure --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" CPPFLAGS="-I/opt/local/include" PCRE_CFLAGS="-I/opt/local/include" PCRE_LIBS="-L/opt/local/lib -lpcre" && make -j8 && sudo make install

cd ~/glib && git checkout 2.58.3 && sh autogen.sh --enable-gtk-doc=no --enable-gtk-doc-pdf=no --enable-man=no --enable-gtk-doc-html=no --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-fstrict-aliasing -arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-lresolv -bind_at_load -arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CXXFLAGS="-I/opt/local/include -arch x86_64 -mmacosx-version-min=10.9" CPPFLAGS="-I/opt/local/include" --enable-static --disable-libelf --disable-compile-warnings --disable-gtk-doc  --with-pcre=system    ac_cv_prog_AWK=/usr/bin/awk    ac_cv_prog_GTKDOC_CHECK=  ac_cv_path_GTKDOC_CHECK_PATH= ac_cv_path_GTKDOC_MKPDF= ac_cv_path_GTDOC_REBASE=  PCRE_CFLAGS="-I/opt/local/include" PCRE_LIBS="-L/opt/local/lib -lpcre" && make -j8 && sudo make install

cd ~/lensfun && mkdir build && cd build &&  cmake ..  -DCMAKE_OSX_SYSROOT:PATH=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk -DCMAKE_OSX_DEPLOYMENT_TARGET:STRING=10.9 -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/opt/local && make -j8 && sudo make install

cd ~/lcms &&  sh autogen.sh --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" CPPFLAGS="-I/opt/local/include" && make -j8 && sudo make install

cd ~/pixman && sh autogen.sh --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" CPPFLAGS="-I/opt/local/include" && make -j8 && sudo make install

cd ~/cairo && sh autogen.sh --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include" --enable-quartz-image --enable-quartz-font --enable-quartz --enable-ft --disable-xlib --without-x && make -j8 && sudo make install

cd ~/doxygen && curl https://raw.githubusercontent.com/Benitoite/RTdeps/master/mypatch.patch -o mypatch.patch && git apply mypatch.patch && mkdir build && cd build && cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/opt/local  .. && make -j8 && sudo make install

cd ~/libsigcplusplus && git checkout 2.10.1 && sh autogen.sh --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" --disable-documentation && make -j8 && sudo make install

cd ~/texinfo* &&  ./configure --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" CPPFLAGS="-I/opt/local/include" && make -j8 && sudo make install

cd ~/autoconf-archive && ./configure --prefix=/opt/local && make && sudo make install

cd ~/gobject-introspection &&   sh autogen.sh --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes --disable-doctool --enable-gtk-doc-html=no 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" CPPFLAGS="-I/opt/local/include" && make -j8 && sudo make install

cd ~/atk &&  meson _build . --prefix=/opt/local -Dintrospection=false && ninja -C _build &&  sed -i -e 's/-current_version=1/-current_version 1/g' _build/build.ninja && sed -i -e 's/-compatibility_version=1/-compatibility_version 1/g' _build/build.ninja && ninja -C _build && sudo ninja -C _build install

cd ~/atkmm && git checkout 2.24.2 && sh autogen.sh --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" && make -j8 && sudo make install

cd ~/glibmm && git checkout 2.56.1 && sh autogen.sh --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" && make -j8 && sudo make install

cd ~/harfbuzz && sh autogen.sh --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" --with-glib=yes --with-graphite2=yes && make -j8 && sudo make install && sudo install_name_tool -change libgraphite2.3.dylib /opt/local/lib/libgraphite2.3.dylib /opt/local/lib/libharfbuzz.0.dylib

cd ~/fribidi && git checkout git checkout f2c9d50722cb60d0cdec3b1bafba9029770e86b4 && sh autogen.sh --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" --disable-docs && make -j8 && sudo make install

cd ~/pango && mkdir build && cd build && meson --prefix=/opt/local --sysconfdir=/etc .. && ninja && sudo ninja install

cd ~/cairomm && git checkout cairomm-1-14 &&  sh autogen.sh --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include" && make -j8 && sudo make install

cd ~/pangomm && git checkout 2.42.0 && sh autogen.sh --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include" && make -j8 && sudo make install

cd ~/docbook-xml && curl https://raw.githubusercontent.com/Benitoite/RTdeps/master/docbook-script1.sh -o docbook-script1.sh && sudo sh docbook-script1.sh

cd ~/docbook-xsl* && curl http://www.linuxfromscratch.org/patches/blfs/svn/docbook-xsl-1.79.2-stack_fix-1.patch -o patch1.patch && patch -Np1 -i patch1.patch && sudo install -v -m755 -d /opt/share/xml/docbook/xsl-stylesheets-1.79.2 && sudo cp -v -R VERSION assembly common eclipse epub epub3 extensions fo   highlighting html htmlhelp images javahelp lib manpages params     profiling roundtrip slides template tests tools webhelp website    xhtml xhtml-1_1 xhtml5       /opt/share/xml/docbook/xsl-stylesheets-1.79.2 && sudo ln -s VERSION /opt/share/xml/docbook/xsl-stylesheets-1.79.2/VERSION.xsl && sudo install -v -m644  README     /opt/share/doc/docbook-xsl-1.79.2/README.txt && sudo install -v -m644    RELEASE-NOTES* NEWS*   /opt/share/doc/docbook-xsl-1.79.2 && curl https://raw.githubusercontent.com/Benitoite/RTdeps/master/xslconfig.sh -o xslconfig.sh && sudo sh xslconfig.sh

cd ~/libepoxy &&   sh autogen.sh --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" && make -j8 && sudo make install

cd ~/jasper && mkdir _build && cd _build && cmake .. -DCMAKE_OSX_SYSROOT:PATH=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk -DCMAKE_OSX_DEPLOYMENT_TARGET:STRING=10.9 -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/opt/local && make -j8 && sudo make install

cd ~/gdk-pixbuf && 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib -Wl,-rpath,/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include" meson _build -Dx11=false -Dman=false --prefix=/opt/local && cd _build && 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib -Wl,-rpath,/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include" ninja && sudo ninja install

cd ~/gtk && git checkout gtk-3-24 && sh autogen.sh  --libdir=/opt/local/lib --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-quartz-backend --enable-debug=no --enable-introspection=yes --enable-man=no --enable-gtk-doc-html=no --disable-dependency-tracking  'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib -Wl,-rpath,/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include"  && DYLD_SEARCH_PATH=/opt/local/lib make -j8 && sudo make install

cd ~/gtkmm && git checkout 3.24.1 && sh autogen.sh  --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk   --enable-debug=no --enable-introspection=no --enable-man=no --enable-gtk-doc-html=no   'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include"  --libdir=/opt/local/lib && make -j8 && sudo make install

cd ~/librsvg && git checkout 2.44.13 && sh autogen.sh  --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk   --enable-debug=no --enable-introspection=no --enable-man=no --enable-gtk-doc-html=no   'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include"  --libdir=/opt/local/lib && make -j8 && sudo make install

cd ~/nasm* && sudo install ldrdf nasm ndisasm rdf* rdx /opt/local/bin

cd ~/fftw* &&  ./configure  --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk   --enable-debug=no  'CFLAGS= -arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS= -arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CPPFLAGS="-arch x86_64 -mmacosx-version-min=10.9" CPPFLAGS="-I/opt/local/include " --disable-fortran --enable-avx2 --enable-float --enable-avx --enable-sse --enable-sse2 --enable-threads && make -j8 && sudo make install

cd ~/gtk-mac* && sh autogen.sh  --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk  --libdir=/opt/local/lib --enable-debug=no  'CFLAGS= -arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS= -arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CPPFLAGS="-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include" --enable-introspection=no  --with-gtk3 && make -j8 && sudo make install

cd ~ && sudo ditto Adwaita /opt/local/share/icons/Adwaita

# RawTherapee

cd ~ && git clone https://github.com/Beep6581/RawTherapee.git && cd ~/repo-rt && mkdir build && cd build && cmake -DCMAKE_BUILD_TYPE="release"       -DPROC_TARGET_NUMBER="1" -DPROC_LABEL="generic processor"       -DCACHE_NAME_SUFFIX="5.6-dev"       -DCMAKE_C_COMPILER="clang"       -DCMAKE_CXX_COMPILER="clang++"       -DWITH_LTO="ON"    -DCMAKE_OSX_SYSROOT="/" -DCMAKE_OSX_DEPLOYMENT_TARGET="10.9"  -DLENSFUNDBDIR="./share/lensfun" -DCODESIGNID:STRING="Developer ID Application: xxxx xxxx (XXXXXXXXXX)" -DCMAKE_CXX_FLAGS="-std=c++11" -DOpenMP_C_FLAGS=-fopenmp=lomp -DOpenMP_CXX_FLAGS=-fopenmp=lomp -DOpenMP_C_LIB_NAMES="libiomp5" -DOpenMP_CXX_LIB_NAMES="libiomp5" -DOpenMP_libiomp5_LIBRARY="/opt/local/lib/libiomp5.dylib" -DOpenMP_CXX_FLAGS="-Xpreprocessor -fopenmp /opt/local/lib/libiomp5.dylib -I/opt/local/include" -DOpenMP_CXX_LIB_NAMES="libiomp5" -DOpenMP_omp_LIBRARY=/opt/local/lib/libiomp5.dylib -DOpenMP_C_FLAGS="-Xpreprocessor -fopenmp /opt/local/lib/libiomp5.dylib -I/opt/local/include"   -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON   .. && make -j8 install && sudo make macosx_bundle

echo "-end of script-"
