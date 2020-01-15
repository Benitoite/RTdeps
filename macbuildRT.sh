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
git clone https://gitlab.gnome.org/GNOME/pangomm.git
git clone https://github.com/fribidi/fribidi.git
git clone https://github.com/freedesktop/cairomm.git
git clone https://gitlab.gnome.org/GNOME/gdk-pixbuf.git
git clone https://github.com/mdadams/jasper.git
git clone git://anongit.freedesktop.org/xorg/util/macros
git clone https://gitlab.gnome.org/GNOME/gtk-doc.git
git clone https://gitlab.gnome.org/GNOME/librsvg.git
git clone https://github.com/rust-lang/rust.git
git clone https://gitlab.gnome.org/GNOME/libcroco.git
git clone https://gitlab.gnome.org/GNOME/libxml2
git clone https://gitlab.gnome.org/GNOME/libxslt
git clone https://gitlab.gnome.org/GNOME/gtk-mac-integration.git
git clone https://github.com/llvm-mirror/openmp.git
git clone git://git.savannah.gnu.org/gnulib.git

curl https://raw.githubusercontent.com/Benitoite/RTdeps/master/maccross -o maccross 
curl https://svwh.dl.sourceforge.net/project/libiptcdata/libiptcdata/1.0.4/libiptcdata-1.0.4.tar.gz -o iptcdata.tar.gz && gunzip -c iptcdata.tar.gz | tar xopf - && rm iptcdata.tar.gz
curl http://fftw.org/fftw-3.3.8.tar.gz -o fftw.tar.gz && gunzip -c fftw.tar.gz | tar xopf - && rm fftw.tar.gz
curl https://www.openmprtl.org/sites/default/files/libomp_20160808_oss.tgz -o libiomp.tgz && tar -xvzf libiomp.tgz && rm libiomp.tgz
curl http://download.osgeo.org/libtiff/tiff-4.1.0.zip -o tiff.zip && unzip tiff.zip -d tiff && rm tiff*zip
curl https://raw.githubusercontent.com/Benitoite/RTdeps/master/xz.zip -o xz.zip && unzip xz.zip && tar -xvf xz*tar  && rm xz.zip && rm xz*tar
curl --user anonymous:example@ftp.com ftp://ftp.gnu.org/gnu/gettext/gettext-0.20.1.tar.gz -o gettext.tar.gz && gunzip -c gettext.tar.gz | tar xopf - && rm gettext.tar.gz
curl https://raw.githubusercontent.com/Benitoite/RTdeps/master/bzip2.zip -o bzip2.zip && unzip bzip2.zip && tar -xvf bzip*tar  && rm bzip2.zip && rm bzip*tar
curl http://ftp.gnu.org/pub/gnu/libiconv/libiconv-1.16.tar.gz -o libiconv.tar.gz && tar xf libiconv.tar.gz && rm libiconv*gz
curl https://ftp.gnu.org/gnu/texinfo/texinfo-6.7.tar.xz -o texinfo.tar.xz && tar xf texinfo.tar.xz && rm tex*xz
curl http://mirror.csclub.uwaterloo.ca/gnu/autoconf-archive/autoconf-archive-2019.01.06.tar.xz  -o autoconf-archive.tar.xz && tar xf autoconf-archive.tar.xz && rm auto*xz
curl https://raw.githubusercontent.com/Benitoite/RTdeps/master/docbook-xml.zip -o docbook-xml.zip && unzip docbook-xml.zip -d ./docbook-xml && rm doc*zip
curl https://github.com/docbook/xslt10-stylesheets/releases/download/release/1.79.2/docbook-xsl-1.79.2.tar.gz -L -o docbook-xsl.tar.gz && tar xvf docbook-xsl.tar.gz && rm docbook-xsl*gz
curl https://www.x.org/archive/individual/util/util-macros-1.19.1.tar.bz2 -o util-macros.tar.bz2 && tar xvjf util-macros.tar.bz2
curl https://www.nasm.us/pub/nasm/releasebuilds/2.14.03rc2/macosx/nasm-2.14.03rc2-macosx.zip -o nasm.zip && unzip nasm.zip && rm nasm.zip && mv nasm* nasm && export PATH=~/nasm:$PATH
curl https://raw.githubusercontent.com/Benitoite/RTdeps/master/adwaita.zip -o adwaita.zip && unzip adwaita.zip && rm adwaita.zip
curl http://gnu.spinellicreations.com/help2man/help2man-1.47.11.tar.xz -o help2man.tar.xz && tar xf help2man.tar.xz && rm help2man*z
curl https://ftp.gnu.org/gnu/autoconf-archive/autoconf-archive-2019.01.06.tar.xz -o aa.tar.xz && tar xf aa.tar.xz && rm aa.tar.xz
curl https://ftp.gnu.org/gnu/m4/m4-latest.tar.xz -o m4-latest.tar.xz && tar xf m4-latest.tar.xz && rm m4-latest.tar.xz
curl https://www.python.org/ftp/python/3.7.4/Python-3.7.4.tar.xz -o py.tar.xz && tar xf py.tar.xz && rm py.tar.xz

# Build tools and libraries

cd ~/CMake && ./configure --prefix=/opt/local && make -j8 && sudo make install && export PATH=/opt/local/bin:$PATH

cd ~/autoconf* &&  ./configure --prefix=/opt/local && make -j8 && sudo make install

cd ~/automake && ./bootstrap --prefix=/opt/local && ./configure --prefix=/opt/local && make -j8 && sudo make install

cd ~/xz* &&  ./configure --prefix=/opt/local && make -j8 && sudo make install

cd ~/help2man* && ./configure --prefix=/opt/local && make -j8 && sudo make install

cd ~/libtool &&  ./bootstrap &&  ./configure --prefix=/opt/local && make -j8 && sudo make install

cd ~/pkg-config && sh ./autogen.sh --prefix=/opt/local --with-internal-glib && make -j8 && sudo make install

cd ~/openssl && ./config --prefix=/opt/local && make -j8 && sudo make install

cd ~/gettext* && ln -s ~/gnulib . || sh autogen.sh --without-git --with-included-gettext --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" && ./configure --without-git --with-included-gettext --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes  --enable-static=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" && make -j8 && sudo make install

cd ~/ninja && python3 ./configure.py --bootstrap && ./ninja && chmod +x ninja && sudo cp ninja /opt/local/bin

cd ~/meson && ninja && chmod +x meson.py && sudo cp meson.py /opt/local/bin/meson

cd ~/libjpeg-turbo* && mkdir build && cd build && cmake .. -DCMAKE_OSX_SYSROOT:PATH=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk -DCMAKE_OSX_DEPLOYMENT_TARGET:STRING=10.9 -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/opt/local && make -j8 && sudo make install

cd ~/tiff/tiff* &&  mkdir build-aux && cd build-aux && cmake .. -DCMAKE_OSX_SYSROOT:PATH=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk -DCMAKE_OSX_DEPLOYMENT_TARGET:STRING=10.9 -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/opt/local && make -j8 && sudo make install

cd ~/zlib &&  mkdir build && cd build && cmake .. -DCMAKE_OSX_SYSROOT:PATH=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk -DCMAKE_OSX_DEPLOYMENT_TARGET:STRING=10.9 -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/opt/local && make -j8 && sudo make install

cd ~/libpng && mkdir build && cd build && cmake .. -DCMAKE_OSX_SYSROOT:PATH=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk -DCMAKE_OSX_DEPLOYMENT_TARGET:STRING=10.9 -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/opt/local -DZLIB_LIBRARY_RELEASE:FILEPATH=/opt/local/lib/libz.dylib && make -j8 && sudo make install

cd ~/libexpat/expat && mkdir build && cd build && cmake .. -DCMAKE_OSX_SYSROOT:PATH=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk -DCMAKE_OSX_DEPLOYMENT_TARGET:STRING=10.9 -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/opt/local && make -j8 && sudo make install

cd ~/pcre && sh ./autogen.sh --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" CPPFLAGS="-I/opt/local/include" --enable-utf8 --enable-pcre16 --enable-pcre32 --enable-unicode-properties && ./configure  --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" CPPFLAGS="-I/opt/local/include" --enable-utf8 --enable-pcre16 --enable-pcre32 --enable-unicode-properties && make -j8 && sudo make install

cd ~/libffi && sh autogen.sh --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk && ./configure --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk && make -j8 && sudo make install

cd ~/fftw* && sh bootstrap.sh  --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk && make -j8 && sudo make install

cd ~/graphite && git checkout 1.3.13 && mkdir build && cd build && cmake .. -DCMAKE_OSX_SYSROOT:PATH=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk -DCMAKE_OSX_DEPLOYMENT_TARGET:STRING=10.9 -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/opt/local  -DCMAKE_MACOSX_RPATH=/opt/local/lib -DCMAKE_SHARED_LINKER_FLAGS="-L /opt/local/lib -rpath /opt/local/lib" && make -j8 && sudo make install &&  sudo install_name_tool -id /opt/local/lib/libgraphite2.3.dylib /opt/local/lib/libgraphite2.3.0.1.dylib &&  sudo install_name_tool -id /opt/local/lib/libgraphite2.3.dylib /opt/local/lib/libgraphite2.3.2.1.dylib

cd ~/bzip2* && curl https://raw.githubusercontent.com/Benitoite/RTdeps/master/bzip2.zip -o bzip2.zip && unzip bzip2.zip && tar -xvf bzip*tar  && rm bzip2.zip && rm bzip*tar && make && sudo make install PREFIX=/opt/local

cd ~/freetype2 && sudo ln -s /opt/local/bin/libtoolize /opt/local/bin/glibtoolize && sh autogen.sh --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --with-harfbuzz=no --enable-shared=yes && ./configure --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --with-harfbuzz=no --enable-shared=yes && make -j8 && sudo make install && sudo install_name_tool -change @rpath/libpng16.16.dylib /opt/local/lib/libpng16.16.dylib /opt/local/lib/libfreetype.6.dylib

cd ~/fontconfig && sed -i -e 's+libintl.h+/opt/local/include/libintl.h+g' src/fcint.h && sh autogen.sh  --disable-rpath --with-libintl-prefix=/opt/local --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes && make -j8 && sudo make install || install_name_tool -add_rpath /opt/local/lib /Users/rb/fontconfig/fc-cache/.libs/fc-cache && sudo make install

cd ~/libiptc* && ./configure --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" && make -j8 && sudo make install

cd ~/libiconv*  && ./configure --prefix=/opt/local --disable-static 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" && ./configure --prefix=/opt/local --disable-static 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" && curl https://raw.githubusercontent.com/Beep6581/RawTherapee/dev/tools/osx/libiconv_1.16_rt.patch -o libiconv_1.16_rt.patch && patch -p1 < libiconv_1.16_rt.patch && make -j8 && sudo make install && libtool --finish /opt/local/lib

cd ~/gnulib && true

cd ~/glib && git checkout 2.63.3 && LIBRARY_PATH='/opt/local/lib' LD=ld CC=clang CXX=clang++ CFLAGS="-O3 -mtune=generic -v -L/opt/local/lib -std=c11 -fstrict-aliasing -arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include" LDFLAGS="/opt/local/lib/libintl.8.dylib -v -bind_at_load -arch x86_64 -mmacosx-version-min=10.9 -L /opt/local/lib" CXXFLAGS="-O3 -mtune=generic -std=c++11 -I/opt/local/include -arch x86_64 -mmacosx-version-min=10.9" meson setup --pkg-config-path /opt/local/lib --cmake-prefix-path /opt/local/lib --libdir=/opt/local/lib --prefix=/opt/local --buildtype=release _build . -D iconv=external --cross-file ~/maccross --optimization 3 -D installed_tests=false && LDFLAGS="-bind_at_load -arch x86_64 -mmacosx-version-min=10.9 -L /opt/local/lib" LIBRARY_PATH='/opt/local/lib' LD=ld CC=clang CXX=clang++ CFLAGS="-O3 -mtune=generic -v -L/opt/local/lib -std=c11 -fstrict-aliasing -arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include" LDFLAGS="/opt/local/lib/libintl.8.dylib -v -arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib" CXXFLAGS="-O3 -mtune=generic -std=c++11 -I/opt/local/include -arch x86_64 -mmacosx-version-min=10.9" ninja -C _build && sudo ninja install -C _build && sudo install_name_tool -change libz.1.dylib /usr/lib/libz.1.dylib /opt/local/lib/libgio-2.0.0.dylib

cd ~/lensfun && mkdir build && cd build &&  cmake ..  -DCMAKE_OSX_SYSROOT:PATH=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk -DCMAKE_OSX_DEPLOYMENT_TARGET:STRING=10.9 -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/opt/local && make -j8 && sudo make install

cd ~/lcms &&  sh autogen.sh --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" CPPFLAGS="-I/opt/local/include" && make -j8 && sudo make install

cd ~/pixman && sh autogen.sh --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" CPPFLAGS="-I/opt/local/include" && make -j8 && sudo make install

cd ~/cairo && sh autogen.sh --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include" --enable-quartz-image --enable-quartz-font --enable-quartz --enable-ft --disable-xlib --without-x && make -j8 && sudo make install && sudo install_name_tool -add_rpath /opt/local/lib /opt/local/lib/libcairo.2.dylib

cd ~/mm-common && sh autogen.sh --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" --disable-documentation && make -j8 && sudo make install

cd ~/libsigcplusplus && git checkout 3.0.2 && sh autogen.sh --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" --disable-documentation && make -j8 && sudo make install

cd ~/texinfo* &&  ./configure --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" CPPFLAGS="-I/opt/local/include" && make -j8 && sudo make install

cd ~/autoconf-archive* && ./configure --prefix=/opt/local && make && sudo make install

cd ~/gobject-introspection &&  ln -s -f /Library/Frameworks/Python.framework/Versions/3.7/include/python3.7m/*.h /opt/local/include && git checkout 1.62.0 && meson setup _build . --prefix=/opt/local --buildtype release --default-library both --optimization 3 --cross-file ~/maccross && ninja -C _build && sudo ninja -C _build install

cd ~/atk &&  meson setup _build . --prefix=/opt/local --cross-file ~/maccross && ninja -C _build &&  sed -i -e 's/-current_version=1/-current_version 1/g' _build/build.ninja && sed -i -e 's/-compatibility_version=1/-compatibility_version 1/g' _build/build.ninja && ninja -C _build && sudo ninja -C _build install

cd ~/glibmm && git checkout 2.62.0 && sh autogen.sh --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9 -std=c++17" && make -j8 && sudo make install

cd ~/atkmm && git checkout 2.24.2 && sh autogen.sh --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" && make -j8 && sudo make install

cd ~/harfbuzz && sh autogen.sh --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" --with-glib=yes --with-graphite2=yes && make -j8 && sudo make install && sudo install_name_tool -change libgraphite2.3.dylib /opt/local/lib/libgraphite2.3.dylib /opt/local/lib/libharfbuzz.0.dylib

cd ~/fribidi && git checkout v1.0.8 && meson _build -Ddocs=false --prefix=/opt/local --buildtype release --default-library both --optimization 3 --cross-file ~/maccross && ninja -C _build && sudo ninja -C _build install

cd ~/pango && git checkout 1.43.0 && meson wrap promote subprojects/glib/subprojects/proxy-libintl.wrap && mkdir build || cd build && meson --prefix=/opt/local --sysconfdir=/etc --buildtype release --default-library both --optimization 3 --cross-file ~/maccross .. && ninja && sudo ninja install

cd ~/cairomm && git checkout cairomm-1-14 &&  sh autogen.sh --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include" && make -j8 && sudo make install

cd ~/pangomm && git checkout pangomm-2-42 && sh autogen.sh --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include" && make -j8 && sudo make install

cd ~/libxml2 && git pull && sh autogen.sh --prefix=/opt/local && make -j8 && sudo make install

cd ~/libcroco && git pull && sh autogen.sh --prefix=/opt/local --disable-Bsymbolic && make -j8 && sudo make install

cd ~/libxslt && git pull && sh autogen.sh --prefix=/opt/local && make -j8 && sudo make install

cd ~ && curl http://www.oasis-open.org/docbook/xml/4.2/docbook-xml-4.2.zip -o docbook-xml-4.2.zip && sudo mkdir -p /usr/local/share/docbook-xml-4.2 && cd /usr/local/share/docbook-xml-4.2 && sudo unzip ~/docbook-xml-4.2 && cd ~ && curl http://downloads.sourceforge.net/docbook/docbook-xsl-1.73.2.tar.bz2 -L -o docbookxsl.tar.bz2 && cd /usr/local/share && sudo tar xjvf ~/docbookxsl.tar.bz2 && rm ~/docbookxsl.tar.bz2 &&  export XML_CATALOG_FILES="/usr/local/share/docbook-xsl-1.73.2/catalog /usr/local/share/docbook-xml-4.2/catalog"

cd ~/docbook-xml && curl https://raw.githubusercontent.com/Benitoite/RTdeps/master/docbook-script1.sh -o docbook-script1.sh && sudo sh docbook-script1.sh

cd ~/docbook-xsl* && curl http://www.linuxfromscratch.org/patches/blfs/svn/docbook-xsl-nons-1.79.2-stack_fix-1.patch -o patch1.patch && patch -Np1 -i patch1.patch || sudo install -v -m755 -d /usr/local/share/xml/docbook/xsl-stylesheets-1.79.2 && sudo cp -v -R VERSION assembly common eclipse epub epub3 extensions fo   highlighting html htmlhelp images javahelp lib manpages params     profiling roundtrip slides template tests tools webhelp website    xhtml xhtml-1_1 xhtml5       /usr/local/share/xml/docbook/xsl-stylesheets-1.79.2 && sudo ln -s VERSION /usr/local/share/xml/docbook/xsl-stylesheets-1.79.2/VERSION.xsl && sudo install -v -m644  README     /usr/local/share/doc/docbook-xsl-1.79.2/README.txt && sudo install -v -m644    RELEASE-NOTES* NEWS*   /usr/local/share/doc/docbook-xsl-1.79.2 && curl https://raw.githubusercontent.com/Benitoite/RTdeps/master/xslconfig.sh -o xslconfig.sh && sudo sh xslconfig.sh && install -d /usr/local/share/xml/docbook-xsl/1.79.2/docbook-xsl && sudo install catalog.xml /usr/local/share/xml/docbook-xsl/1.79.2/docbook-xsl/catalog.xml

cd ~/macros && sh autogen.sh --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9" && make -j8 && sudo make install

cd ~/libepoxy && meson _build -Ddocs=false --prefix=/opt/local --buildtype release --default-library both --optimization 3 --cross-file ~/maccross && ninja -C _build && sudo ninja -C _build install

cd ~/jasper && rm -r _build || mkdir _build && cd _build && cmake .. -DCMAKE_OSX_SYSROOT:PATH=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk -DCMAKE_OSX_DEPLOYMENT_TARGET:STRING=10.9 -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/opt/local && make -j8 && sudo make install

cd ~/gdk-pixbuf && sudo rm -r _build || git checkout gdk-pixbuf-2-40 && CFLAGS="-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include" LDFLAGS="-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib -Wl,-rpath,/opt/local/lib" CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include" meson _build -Dx11=false -Dman=false --prefix=/opt/local  -Ddocs=false --prefix=/opt/local --buildtype release --default-library both --optimization 3 --cross-file ~/maccross && cd _build && CFLAGS="-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include" LDFLAGS="-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib -Wl,-rpath,/opt/local/lib" CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include" ninja && sudo ninja install && sudo install_name_tool -add_rpath /opt/local/lib /opt/local/lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-png.so

cd ~/gtk && git checkout gtk-3-24 && meson setup  --prefix=/opt/local --buildtype=release _build .  --cross-file ~/maccross --optimization 3  -Dtests=false && ninja -C _build && sudo ninja install -C _build

cd ~/gtkmm && git checkout gtkmm-3-24 && sh autogen.sh  --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk   --enable-debug=no --enable-introspection=no --enable-man=no --enable-gtk-doc-html=no   'CFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include"  --libdir=/opt/local/lib && make -j8 && sudo make install

cd ~ && curl https://sh.rustup.rs -sSf | sh

cd ~/librsvg && git checkout librsvg-2.46 &&  ln -s /opt/local/lib/libz.1.dylib ./libz.1.dylib || sudo install_name_tool -change libz.1.dylib @rpath/libz.1.dylib /opt/local/lib/libpng16.16.dylib && ./configure --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk --enable-introspection=no --enable-debug=no --enable-gtk-doc=no CC=clang CXX=clang++ && make -j8 && sudo make install

cd ~/nasm* && sudo install ldrdf nasm ndisasm rdf* rdx /opt/local/bin

cd ~/fftw* &&  ./configure  --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk   --enable-debug=no  'CFLAGS= -arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS= -arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CPPFLAGS="-arch x86_64 -mmacosx-version-min=10.9" CPPFLAGS="-I/opt/local/include " --disable-fortran --enable-avx2 --enable-float --enable-avx --enable-sse --enable-sse2 --enable-threads && make -j8 && sudo make install

cd ~/gtk-mac* && sh autogen.sh  --prefix=/opt/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk  --libdir=/opt/local/lib --enable-debug=no  'CFLAGS= -arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include' 'LDFLAGS= -arch x86_64 -mmacosx-version-min=10.9 -L/opt/local/lib' CPPFLAGS="-arch x86_64 -mmacosx-version-min=10.9 -I/opt/local/include" --enable-introspection=no  --with-gtk3 && make -j8 && sudo make install

cd ~ && sudo ditto Adwaita /opt/local/share/icons/Adwaita

cd ~/openmp && rm -r build || mkdir build && cd build && cmake .. -DCMAKE_OSX_SYSROOT:PATH=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk -DCMAKE_OSX_DEPLOYMENT_TARGET:STRING=10.9 -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/opt/local  -DCMAKE_MACOSX_RPATH=/opt/local/lib -DCMAKE_SHARED_LINKER_FLAGS="-L /opt/local/lib -rpath /opt/local/lib" && make -j8 && sudo make install

# RawTherapee

cd ~ && git clone https://github.com/Beep6581/RawTherapee.git && cd ~/repo-rt && mkdir build && cd build && cmake -DCMAKE_BUILD_TYPE="release"       -DPROC_TARGET_NUMBER="1" -DPROC_LABEL="generic processor"       -DCACHE_NAME_SUFFIX="5.6-dev"       -DCMAKE_C_COMPILER="clang"       -DCMAKE_CXX_COMPILER="clang++"       -DWITH_LTO="ON"    -DCMAKE_OSX_SYSROOT="/" -DCMAKE_OSX_DEPLOYMENT_TARGET="10.9"  -DLENSFUNDBDIR="./share/lensfun" -DCODESIGNID:STRING="Developer ID Application: xxxx xxxx (XXXXXXXXXX)" -DCMAKE_CXX_FLAGS="-std=c++11" -DOpenMP_C_FLAGS=-fopenmp=lomp -DOpenMP_CXX_FLAGS=-fopenmp=lomp -DOpenMP_C_LIB_NAMES="libiomp5" -DOpenMP_CXX_LIB_NAMES="libiomp5" -DOpenMP_libiomp5_LIBRARY="/opt/local/lib/libiomp5.dylib" -DOpenMP_CXX_FLAGS="-Xpreprocessor -fopenmp /opt/local/lib/libiomp5.dylib -I/opt/local/include" -DOpenMP_CXX_LIB_NAMES="libiomp5" -DOpenMP_omp_LIBRARY=/opt/local/lib/libiomp5.dylib -DOpenMP_C_FLAGS="-Xpreprocessor -fopenmp /opt/local/lib/libiomp5.dylib -I/opt/local/include"   -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON   .. && make -j8 install && sudo make macosx_bundle

echo "-end of script-"
