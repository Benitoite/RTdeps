#!/bin/sh

# macbuildRT.sh
# Builds RawTherapee on macOS 10.14 / Xcode 11.3.1
#
# Created by Richard Barber on 12/1/18.
#
# GIT DEPENDENCIES AND BUILD TOOLS
cd ~
git clone https://gitlab.gnome.org/GNOME/gtk.git
git clone https://gitlab.com/graphviz/graphviz.git
git clone git://anongit.freedesktop.org/git/cairo
git clone git://anongit.freedesktop.org/git/pixman.git
git clone https://gitlab.gnome.org/GNOME/pango.git
git clone https://gitlab.freedesktop.org/fontconfig/fontconfig.git
git clone https://git.savannah.gnu.org/git/freetype/freetype2.git
git clone https://github.com/harfbuzz/harfbuzz.git
git clone https://gitlab.gnome.org/GNOME/glib.git
git clone https://gitlab.gnome.org/GNOME/gtkmm.git
git clone https://gitlab.gnome.org/GNOME/gobject-introspection.git
git clone https://gitlab.gnome.org/GNOME/atk.git
git clone https://gitlab.gnome.org/GNOME/atkmm.git
git clone https://gitlab.gnome.org/GNOME/glibmm.git
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
git clone https://github.com/llvm/llvm-project.git
git clone git://git.savannah.gnu.org/gnulib.git
git clone https://github.com/itstool/itstool.git
git clone https://gitlab.freedesktop.org/xdg/shared-mime-info.git
git clone https://git.savannah.gnu.org/git/bison.git
git clone https://github.com/Benitoite/rt-create-dmg.git
git clone git://git.sv.gnu.org/sed
git clone https://sourceware.org/git/bzip2.git
git clone https://pagure.io/xmlto.git
git clone https://github.com/pborman/getopt.git
git clone https://github.com/ianw/libiptcdata.git

# maccross file for cross compilation using macOS SDK, flags, etc
curl https://raw.githubusercontent.com/Benitoite/RTdeps/master/maccross -o maccross

# fftw
curl http://fftw.org/fftw-3.3.9.tar.gz -o fftw.tar.gz && gunzip -c fftw.tar.gz | tar xopf - && rm fftw.tar.gz && mv fftw-3* fftw-3

# TIFF
curl http://download.osgeo.org/libtiff/tiff-4.2.0.zip -o tiff.zip && unzip tiff.zip -d tiff && rm tiff*zip

# wget
curl http://ftp.gnu.org/gnu/wget/wget-1.20.3.tar.gz -o wget.tar.gz && tar xf wget.tar.gz && rm wget*gz && mv wget-1* wget-1

# xz decompression enginge
curl https://raw.githubusercontent.com/Benitoite/RTdeps/master/xz.zip -o xz.zip && unzip xz.zip && tar -xvf xz*tar && rm xz.zip && rm xz*tar

# libiconv
curl http://ftp.gnu.org/pub/gnu/libiconv/libiconv-1.16.tar.gz -o libiconv.tar.gz && tar xf libiconv.tar.gz && rm libiconv*gz && mv libiconv-1* libiconv-1

# texinfo
curl https://ftp.gnu.org/gnu/texinfo/texinfo-6.7.tar.xz -o texinfo.tar.xz && tar xf texinfo.tar.xz && rm texinfo*xz && mv texinfo* texinfo
 
# autoconf
curl -L http://ftpmirror.gnu.org/autoconf/autoconf-2.69.tar.gz -o autoconf.gz && tar -xzf autoconf.gz && rm autoconf.gz && mv autoconf-2* autoconf-2

# autoconf-archive
curl http://mirror.csclub.uwaterloo.ca/gnu/autoconf-archive/autoconf-archive-2019.01.06.tar.xz -o autoconf-archive.tar.xz && tar xf autoconf-archive.tar.xz && rm auto*xz && mv autoconf-archive* autoconf-archive

# docbook
curl https://raw.githubusercontent.com/Benitoite/RTdeps/master/docbook-xml.zip -o docbook-xml.zip && unzip docbook-xml.zip -d ./docbook-xml && rm doc*zip

# docbook-xslt10-stylesheets
curl https://github.com/docbook/xslt10-stylesheets/releases/download/release/1.79.2/docbook-xsl-1.79.2.tar.gz -L -o docbook-xsl.tar.gz && tar xvf docbook-xsl.tar.gz && rm docbook-xsl*gz

# util-macros
curl https://www.x.org/archive/individual/util/util-macros-1.19.1.tar.bz2 -o util-macros.tar.bz2 && tar xvjf util-macros.tar.bz2

# nasm
curl https://www.nasm.us/pub/nasm/releasebuilds/2.14.03rc2/macosx/nasm-2.14.03rc2-macosx.zip -o nasm.zip && unzip nasm.zip && rm nasm.zip && mv nasm* nasm && export PATH=~/nasm:$PATH

# adwaita icons
curl https://raw.githubusercontent.com/Benitoite/RTdeps/master/adwaita.zip -o adwaita.zip && unzip adwaita.zip && rm adwaita.zip

# help2man
curl https://ftp.gnu.org/gnu/help2man/help2man-1.48.1.tar.xz -o help2man.tar.xz && tar xf help2man.tar.xz && rm help2man*z

# autoconf-archive
curl https://ftp.gnu.org/gnu/autoconf-archive/autoconf-archive-2019.01.06.tar.xz -o aa.tar.xz && tar xf aa.tar.xz && rm aa.tar.xz

# m4
curl https://ftp.gnu.org/gnu/m4/m4-1.4.18.tar.xz -o m4.tar.xz && tar xf m4.tar.xz && rm m4.tar.xz && mv m4-1.4.18 m4-code

# Python 3
curl https://www.python.org/ftp/python/3.7.4/Python-3.7.4.tar.xz -o py.tar.xz && tar xf py.tar.xz && rm py.tar.xz

# glib-2
# curl -L https://ftp.gnome.org/pub/gnome/sources/glib/2.64/glib-2.64.2.tar.xz -o glib.xz && tar xf glib.xz && rm glib.xz && mv glib-2* glib-2

# PNG
curl -L https://download.sourceforge.net/libpng/libpng-1.6.37.tar.xz -o libpng.xz && tar xf libpng.xz && rm libpng.xz && mv libpng-1* libpng-1

# getopt
#curl -L http://frodo.looijaard.name/system/files/software/getopt/getopt-1.1.6.tar.gz -o getopt.gz && tar xf getopt.gz && rm getopt.gz && mv getopt-1* getopt-1

# xmlto
#curl -L https://releases.pagure.org/xmlto/xmlto-0.0.28.tar.bz2 -o xmlto.bz2 && tar xvjf xmlto.bz2 && rm xmlto.bz2 && mv xmlto-0* xmlto-0

# atk
curl -L https://download.gnome.org/sources/atk/2.36/atk-2.36.0.tar.xz -o atk.xz && tar xf atk.xz && rm atk.xz && mv atk-2* atk-2

# gettext
curl -L https://ftp.gnu.org/pub/gnu/gettext/gettext-0.21.tar.xz -o gettext.xz && tar -xzf gettext.xz && rm gettext.xz && mv gettext-0* gettext-0

# shared-mime-info-2
curl https://gitlab.freedesktop.org/xdg/shared-mime-info/uploads/0ee50652091363ab0d17e335e5e74fbe/shared-mime-info-2.1.tar.xz -o sharedmimeinfo.xz &&  tar xf sharedmimeinfo.xz &&   mv shared-mime-info-2.* shared-mime-info-2 && rm sharedmimeinfo.xz

# libffi
curl https://sourceware.org/pub/libffi/libffi-3.3.tar.gz -o libffi.tar.gz && tar xf libffi.tar.gz && mv libffi-3* libffi && rm libffi.tar.gz

# macOS SDK
sudo ln -s /usr/local /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk/usr

# Build tools and libraries

#       ___  ,__ __          _       
#      / (_)/|  |  |        | |      
#     |      |  |  |   __,  | |   _  
#     |      |  |  |  /  |  |/_) |/  
#      \___/ |  |  |_/\_/|_/| \_/|__/
#                                
# 
cd ~/CMake && git pull && export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/usr/local/share/pkgconfig && CC=/usr/bin/clang CXX=/usr/bin/clang++ CFLAGS=-I/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk/usr/include ./bootstrap --system-zlib --system-bzip2 --system-curl --prefix=/usr/local && make -j8 && sudo make install && export PATH=/usr/local/bin:$PATH


#       ___,                                    _  
#      /   |                                   | | 
#     |    |        _|_  __   __   __   _  _   | | 
#     |    |  |   |  |  /  \_/    /  \_/ |/ |  |/  
#      \__/\_/ \_/|_/|_/\__/ \___/\__/   |  |_/|__/
#                                              |\  
#                                              |/ 
cd ~/autoconf-2 && CC=/usr/bin/clang CXX=/usr/bin/clang++ ./configure --prefix=/usr/local && make -j8 && sudo make install

#                                             _                       _             
#                                            | |                     | |    o       
#      __,        _|_  __   __   __   _  _   | |     __,   ,_    __  | |             _  
#     /  |  |   |  |  /  \_/    /  \_/ |/ |  |/-----/  |  /  |  /    |/ \   |  |  |_|/  
#     \_/|_/ \_/|_/|_/\__/ \___/\__/   |  |_/|__/   \_/|_/   |_/\___/|   |_/|_/ \/  |__/
#                                            |\                                     
#                                            |/                                     
cd ~/autoconf-archive && CC=/usr/bin/clang CXX=/usr/bin/clang++ ./configure --prefix=/usr/local && make -j8 && sudo make install

#                            
#                            
#      __,  _ _|__|_  _      _|_ 
#     /  | |/  |  |  |/  /\/  |  
#     \_/|/|__/|_/|_/|__/ /\_/|_/
#       /|                       
#      \|                       
cd ~/gettext-0 && make distclean; autoreconf -vfi && CC=gcc CXX=g++ CFLAGS="-arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include" LDFLAGS="-Wl,-headerpad_max_install_names -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -arch x86_64 -mmacosx-version-min=10.12 -L/usr/local/lib" CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.12" ./configure --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk --prefix=/usr/local && make -j8 -k && sudo make install

#      ______                   _       
#     (_) |         o          | |      
#         | _           _  _   | |  __  
#       _ ||/  /\/  |  / |/ |  |/  /  \_
#      (_/ |__/ /\_/|_/  |  |_/|__/\__/ 
#                              |\       
#                              |/      
cd ~/texinfo && ./configure --prefix=/usr/local && make -j8 && sudo make install

#       ___,                                   _       
#      /   |                                  | |      
#     |    |        _|_  __   _  _  _    __,  | |   _  
#     |    |  |   |  |  /  \_/ |/ |/ |  /  |  |/_) |/  
#      \__/\_/ \_/|_/|_/\__/   |  |  |_/\_/|_/| \_/|__/
#                                                  
# 
cd ~/automake && git clean -dxf && git pull && CC=/usr/bin/clang CXX=/usr/bin/clang++ ./bootstrap --prefix=/usr/local && ./configure --prefix=/usr/local && make -j8 && sudo make install

#      _      __  
#     (_\  / (_ \ 
#        \/     / 
#        /\    /  
#      _/  \_//__/
#              /| 
#              \| 
cd ~/xz* && make distclean; ln -s /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk/System/Library  /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk/Library && MACOSX_DEPLOYMENT_TARGET="10.12" LIBRARY_PATH="/usr/local/lib" LD=ld CC=gcc CXX=g++ CFLAGS="-arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include -I{$HOME}/glibc/include" LDFLAGS="-Wl,-headerpad_max_install_names -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -arch x86_64 -mmacosx-version-min=10.12 -L/usr/local/lib" CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.12" ./configure --prefix=/usr/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk --enable-shared=yes && LIBRARY_PATH="/usr/local/lib" LD=ld CC=gcc CXX=g++ CFLAGS="-arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include -I{$HOME}/glibc/include" LDFLAGS="-Wl,-headerpad_max_install_names -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -arch x86_64 -mmacosx-version-min=10.12 -L/usr/local/lib" CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.12" MACOSX_DEPLOYMENT_TARGET="10.12" make -j8 && sudo make install

#      _          _       __                          
#     | |        | |     /  )                         
#     | |     _  | |   _   /  _  _  _    __,   _  _   
#     |/ \   |/  |/  |/ \_/  / |/ |/ |  /  |  / |/ |  
#     |   |_/|__/|__/|__//___  |  |  |_/\_/|_/  |  |_/
#               /|                                
#               \|  
cd ~/help2man* && CC=/usr/bin/clang CXX=/usr/bin/clang++ ./configure --prefix=/usr/local && make -j8 && sudo make install

#      _     _                 _  
#     | | o | |               | | 
#     | |   | | _|_  __   __  | | 
#     |/  | |/ \_|  /  \_/  \_|/  
#     |__/|_/\_/ |_/\__/ \__/ |__/
#                                 
# 
cd ~/libtool && git clean -dxf && git pull && CC=/usr/bin/clang CXX=/usr/bin/clang++ ./bootstrap && CC=/usr/bin/clang CXX=/usr/bin/clang++ ./configure --prefix=/usr/local && make -j8 && sudo make install

#            _                               _          
#           | |                             | | o       
#        _  | |   __,      __   __   _  _   | |     __, 
#      |/ \_|/_) /  |-----/    /  \_/ |/ |  |/  |  /  | 
#      |__/ | \_/\_/|/    \___/\__/   |  |_/|__/|_/\_/|/
#     /|           /|                       |\       /| 
#     \|           \|                       |/       \| 
cd ~/pkg-config && SYSROOT=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk LDFLAGS="-Wl,-undefined,dynamic_lookup -Wl,-flat_namespace  -Wl,-headerpad_max_install_names -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -arch x86_64 -mmacosx-version-min=10.12" CXXFLAGS=-Wall CFLAGS=-Wno-implicit-function-declaration CC=/usr/bin/clang CXX=/usr/bin/clang++ sh ./autogen.sh --prefix=/usr/local --with-internal-glib && make -j8 && sudo make install

#       __                                _   
#      /\_\/                   ()   () \_|_)  
#     |    |  _   _   _  _     /\   /\   |    
#     |    ||/ \_|/  / |/ |   /  \ /  \ _|    
#      \__/ |__/ |__/  |  |_//(__//(__/(/\___/
#          /|                                 
#          \|   
cd ~/openssl && CC=/usr/bin/clang CXX=/usr/bin/clang++ ./config --prefix=/usr/local && make -j8 && sudo make install

#                                                    
#                  |  |                       |      
#      _  _  _     |__|_          __   __   __|   _  
#     / |/ |/ |       |   -----  /    /  \_/  |  |/  
#       |  |  |_/     |          \___/\__/ \_/|_/|__/
#                                                    
#  
cd ~/m4-code && curl https://raw.githubusercontent.com/macports/macports-ports/edf0ee1e2cf/devel/m4/files/secure_snprintf.patch -o patch && patch -p0 < patch && ./configure --prefix=/usr/local && make -j8 && sudo make install

#      _     _      _         ,__ __        _      __ 
#     | | o | |    (_\  /    /|  |  |    \_|_)    /  )
#     | |   | |       \/      |  |  |      |        / 
#     |/  | |/ \_     /\      |  |  |     _|       /  
#     |__/|_/\_/    _/  \_/   |  |  |_/  (/\___/  /___
#                                                     
#  
cd ~/libxml2 && PKG_CONFIG=pkg-config CMAKE=cmake CC=gcc CXX=g++ CFLAGS="-arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include" LDFLAGS="-Wl,-headerpad_max_install_names -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -arch x86_64 -mmacosx-version-min=10.12 -L/usr/local/lib" CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.12" sh autogen.sh --prefix=/usr/local --disable-silent-rules --with-python --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk && CC=gcc CXX=g++ CFLAGS="-arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include" LDFLAGS="-Wl,-headerpad_max_install_names -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -arch x86_64 -mmacosx-version-min=10.12 -L/usr/local/lib" CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.12" make -j8 && sudo make install && sudo install_name_tool -change libz.1.dylib /usr/local/lib/libz.1.dylib /usr/local/lib/libxml2.2.dylib 

#      , __   ___  , __   ___ 
#     /|/  \ / (_)/|/  \ / (_)
#      |___/|      |___/ \__  
#      |    |      | \   /    
#      |     \___/ |  \_/\___/
#                             
# 
cd ~/pcre && CC=gcc CXX=g++ CFLAGS="-arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include" LDFLAGS="-Wl,-undefined,dynamic_lookup -Wl,-flat_namespace -Wl,-headerpad_max_install_names -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -arch x86_64 -mmacosx-version-min=10.12 -L/usr/local/lib" CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.12" CPPFLAGS="-I/usr/local/include" sh ./autogen.sh --prefix=/usr/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk --enable-shared=yes --enable-utf8 --enable-pcre16 --enable-pcre32 --enable-unicode-properties && CC=gcc CXX=g++ CMAKE=cmake PKG_CONFIG=pkg-config CFLAGS="-arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include" LDFLAGS="-Wl,-undefined,dynamic_lookup -Wl,-flat_namespace -Wl,-headerpad_max_install_names -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -arch x86_64 -mmacosx-version-min=10.12 -L/usr/local/lib" CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.12" CPPFLAGS="-I/usr/local/include" ./configure --prefix=/usr/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk --enable-shared=yes --enable-utf8 --enable-pcre16 --enable-pcre32 --enable-unicode-properties && make -j8 && sudo make install

#      _     _                             
#     | | o | |  o                         
#     | |   | |      __   __   _  _        
#     |/  | |/ \_|  /    /  \_/ |/ |  |  |_
#     |__/|_/\_/ |_/\___/\__/   |  |_/ \/  
#                                          
# 
cd ~/libiconv-1 && ./configure &&  PKG_CONFIG=pkg-config CMAKE=cmake CC=gcc CXX=g++ CFLAGS="-arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include" LDFLAGS="-Wl,-headerpad_max_install_names -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -arch x86_64 -mmacosx-version-min=10.12 -L/usr/local/lib" CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.12" ./configure --prefix=/usr/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk && make -j8 && sudo make install && libtool --finish /usr/local/lib

#                         
#                         
#              __,  _ _|_ 
#     |  |  |_/  | |/  |  
#      \/ \/  \_/|/|__/|_/
#               /|        
#               \|  
cd ~/wget-1 && CC=gcc CXX=g++ ./configure --prefix=/usr/local --disable-dependency-tracking --enable-assert --with-ssl=openssl && make -j8 && sudo make install

#                   
#                |  
#      ,   _   __|  
#     / \_|/  /  |  
#      \/ |__/\_/|_/
#                   
#  
cd ~/sed && ./bootstrap && ./configure --disable-dependency-tracking && make -j8 && sudo make install

#      _                       
#     | |  o                   
#     | |      ,   __   _  _   
#     |/ \_|  / \_/  \_/ |/ |  
#      \_/ |_/ \/ \__/   |  |_/
#                              
#  
cd ~/bison && git stash && git clean -dxf && git pull && curl https://raw.githubusercontent.com/Benitoite/RTdeps/master/bison-bootstrap.patch | git apply && sudo curl https://raw.githubusercontent.com/Benitoite/RTdeps/master/md5sum -o /usr/local/bin/md5sum && sudo chmod +x /usr/local/bin/md5sum && ./bootstrap --no-bootstrap-sync && CC=/usr/bin/clang CXX=/usr/bin/clang++ ./configure --prefix=/usr/local && make -j8 && sudo make install

#                                            
#        |                                   
#      __|   __              __,  _   _  _   
#     /  |  /  \_/\/  |   | /  | |/  / |/ |  
#     \_/|_/\__/  /\_/ \_/|/\_/|/|__/  |  |_/
#                        /|   /|             
#                        \|   \| 
cd ~/doxygen && git clean -dxf && git stash && git pull && mkdir build && cd build && cmake .. -DCMAKE_C_COMPILER="clang" -DCMAKE_CXX_COMPILER="clang++" -DCMAKE_VERBOSE_MAKEFILE=ON -DICONV_INCLUDE_DIR=/usr/local/include -DICONV_LIBRARY:FILEPATH=/usr/local/lib/libiconv.dylib -DPYTHON_EXECUTABLE=$(which python3) -DCMAKE_C_FLAGS="-I/usr/local/include -I/Library/Developer/CommandLineTools/Library/Frameworks/Python3.framework/Versions/3.7/Headers/pyconfig.h -I/Library/Frameworks/Python.framework/Versions/3.7/include/python3.7m/patchlevel.h" -DCMAKE_CXX_FLAGS="-I/Library/Developer/CommandLineTools/Library/Frameworks/Python3.framework/Versions/3.7/Headers/pyconfig.h -I/Library/Frameworks/Python.framework/Versions/3.7/include/python3.7m/patchlevel.h" && curl https://raw.githubusercontent.com/Benitoite/RTdeps/master/doxygen.patch | git apply && make -j8 && sudo make install

#                                
#             o          o       
#      _  _       _  _      __,  
#     / |/ |  |  / |/ |  | /  |  
#       |  |_/|_/  |  |_/|/\_/|_/
#                       /|       
#                       \|    
cd ~/ninja && git stash && git clean -dxf && git pull && python3 ./configure.py --bootstrap && ./ninja && chmod +x ninja && sudo cp ninja /usr/local/bin

#                                     
#                                     
#      _  _  _    _   ,   __   _  _   
#     / |/ |/ |  |/  / \_/  \_/ |/ |  
#       |  |  |_/|__/ \/ \__/   |  |_/
#                                     
#  
cd ~/meson && git stash && git clean -dxf && git pull && python3 setup.py build && chmod +x meson.py && sudo cp meson.py /usr/local/bin/meson

#                      
#      o               
#          _   _   __, 
#      | |/ \_|/  /  | 
#      |/|__/ |__/\_/|/
#     /|/|          /| 
#     \|\|          \| 
cd ~/libjpeg-turbo && git clean -dxf && mkdir build && cd build && cmake .. -DCMAKE_C_COMPILER="gcc" -DCMAKE_CXX_COMPILER="g++" -DCMAKE_VERBOSE_MAKEFILE=ON -DCMAKE_OSX_SYSROOT:PATH=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -DCMAKE_OSX_DEPLOYMENT_TARGET:STRING=10.12 -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr/local && make -j8 && sudo make install

#           _     _   
#          | | o | |  
#      __  | |   | |  
#     / / _|/  | |/ \_
#      /_/ |__/|_/\_/ 
#       /|            
#       \| 
cd ~/zlib && git clean -dxf && mkdir build && cd build && cmake .. -DCMAKE_C_COMPILER="gcc" -DCMAKE_CXX_COMPILER="g++" -DCMAKE_VERBOSE_MAKEFILE=ON -DCMAKE_OSX_SYSROOT:PATH=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -DCMAKE_OSX_DEPLOYMENT_TARGET:STRING=10.12 -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr/local && make -j8 && sudo make install

#             _   _  
#         o  | | | | 
#     _|_    | | | | 
#      |  |  |/  |/  
#      |_/|_/|__/|__/
#            |\  |\  
#            |/  |/  
cd ~/tiff/tiff* && mkdir _build && cd _build && cmake .. -DCMAKE_C_COMPILER="gcc" -DCMAKE_CXX_COMPILER="g++" -DM_LIBRARY=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk/usr/lib/libm.dylib -DCMAKE_VERBOSE_MAKEFILE=ON -DCMAKE_OSX_SYSROOT:PATH=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -DCMAKE_OSX_DEPLOYMENT_TARGET:STRING=10.12 -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr/local  -DZLIB_LIBRARY_RELEASE=/usr/local/lib/libz.dylib  -DLIBLZMA_LIBRARY_RELEASE=/usr/local/lib/liblzma.dylib -DM_LIBRARY=/Library/Developer/CommandLineTools/SDKs/MacOSX10.14.sdk/usr/lib/libm.tbd && make -j8 && sudo make install

#      _     _                     
#     | | o | |                    
#     | |   | |    _   _  _    __, 
#     |/  | |/ \_|/ \_/ |/ |  /  | 
#     |__/|_/\_/ |__/   |  |_/\_/|/
#               /|              /| 
#               \|              \| 
cd ~/libpng-1 && mkdir build && cd build && cmake .. -DCMAKE_C_COMPILER="clang" -DCMAKE_CXX_COMPILER="clang++" -DCMAKE_VERBOSE_MAKEFILE=ON -DCMAKE_OSX_SYSROOT:PATH=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -DCMAKE_OSX_DEPLOYMENT_TARGET:STRING=10.12 -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr/local -DZLIB_LIBRARY_RELEASE:FILEPATH=/usr/local/lib/libz.dylib && make -j8 && sudo make install

#      _     _                          
#     | | o | |                         
#     | |   | |   _         _   __, _|_ 
#     |/  | |/ \_|/  /\/  |/ \_/  |  |  
#     |__/|_/\_/ |__/ /\_/|__/ \_/|_/|_/
#                        /|             
#                        \| 
cd ~/libexpat/expat && git clean -dxf && mkdir build && cd build && DYLIB_CURRENT_VERSION=8.0.1 DYLIB_COMPATIBILITY_VERSION=7.0.0 CFLAGS="-mmacosx-version-min=10.12" LDFLAGS="-Wl,-headerpad_max_install_names -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -Wl,-headerpad_max_install_names,-undefined,dynamic_lookup,-compatibility_version,7.0.0,-current_version,8.0.1" cmake .. -DCMAKE_C_COMPILER="gcc" -DCMAKE_CXX_COMPILER="g++" -DCMAKE_VERBOSE_MAKEFILE=ON -DCMAKE_OSX_SYSROOT:PATH=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -DCMAKE_OSX_DEPLOYMENT_TARGET:STRING=10.12 -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr/local && DYLIB_CURRENT_VERSION=8.0.1 CFLAGS="-mmacosx-version-min=10.12" DYLIB_COMPATIBILITY_VERSION=7.0.0 LDFLAGS="-Wl,-headerpad_max_install_names -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -Wl,-headerpad_max_install_names,-undefined,dynamic_lookup,-compatibility_version,7.0.0,-current_version,8.0.1" make -j8 && CFLAGS="-mmacosx-version-min=10.12" LDFLAGS="-Wl,-headerpad_max_install_names -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -Wl,-headerpad_max_install_names,-undefined,dynamic_lookup,-compatibility_version,7.0.0,-current_version,8.0.1" sudo make install

#      _     _    _   _     
#     | | o | |  | | | | o  
#     | |   | |  | | | |    
#     |/  | |/ \_|/  |/  |  
#     |__/|_/\_/ |__/|__/|_/
#                |\  |\     
#                |/  |/    
cd ~/libffi && CC=gcc CXX=g++ CMAKE=cmake PKG_CONFIG=pkg-config CFLAGS="-arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include" LDFLAGS="-Wl,-undefined,dynamic_lookup -Wl,-flat_namespace -Wl,-headerpad_max_install_names -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -arch x86_64 -mmacosx-version-min=10.12 -L/usr/local/lib" CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.12" ./configure --prefix=/usr/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk && make -j8 && sudo make install && libtool --finish /usr/local/lib

#      _   _             ___ 
#     | | | |           /   \
#     | | | |_|_          __/
#     |/  |/  |  |  |  |_   \
#     |__/|__/|_/ \/ \/ \___/
#     |\  |\                 
#     |/  |/ 
cd ~/fftw-3 && CC=gcc CXX=g++ CMAKE=cmake PKG_CONFIG=pkg-config CFLAGS="-O3 -std=gnu99 -I/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk/usr/include -I/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk/usr/include/sys -arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include" LDFLAGS="-Wl,-undefined,dynamic_lookup -Wl,-flat_namespace -Wl,-headerpad_max_install_names -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -arch x86_64 -mmacosx-version-min=10.12 -L/usr/local/lib" CXXFLAGS="-O3 -Xpreprocessor -fopenmp -arch x86_64 -mmacosx-version-min=10.12" ./configure --disable-fortran --enable-shared --enable-sse2 --disable-dependency-tracking --enable-openmp --host=x86 --prefix=/usr/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk && make -j8 && sudo make install

#                            _               
#                           | |    o         
#      __,  ,_    __,    _  | |      _|_  _  
#     /  | /  |  /  |  |/ \_|/ \   |  |  |/  
#     \_/|/   |_/\_/|_/|__/ |   |_/|_/|_/|__/
#       /|            /|                     
#       \|            \|  
cd ~/graphite && git clean -dxf && git checkout 1.3.14 && mkdir build && cd build && cmake .. -DCMAKE_C_COMPILER="gcc" -DCMAKE_CXX_COMPILER="g++" -DCMAKE_VERBOSE_MAKEFILE=ON -DCMAKE_OSX_SYSROOT:PATH=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -DCMAKE_OSX_DEPLOYMENT_TARGET:STRING=10.12 -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr/local -DCMAKE_MACOSX_RPATH=/usr/local/lib -DCMAKE_SHARED_LINKER_FLAGS="-L /usr/local/lib" && make -j8 && sudo make install && sudo install_name_tool -id /usr/local/lib/libgraphite2.3.dylib /usr/local/lib/libgraphite2.3.2.1.dylib

#      _                __ 
#     | |       o      /  )
#     | |   __       _   / 
#     |/ \_/ / _|  |/ \_/  
#      \_/  /_/ |_/|__//___
#            /|   /|       
#            \|   \|   
cd ~/bzip2 && CC=gcc CXX=g++ CMAKE=cmake PKG_CONFIG=pkg-config CFLAGS="-arch x86_64 -mmacosx-version-min=10.12" LDFLAGS="-Wl,-headerpad_max_install_names -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -arch x86_64 -mmacosx-version-min=10.12" CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.12" make -j8 && sudo make install PREFIX=/usr/local && sudo curl https://raw.githubusercontent.com/Benitoite/RTdeps/master/bz2.pc -o /usr/local/lib/pkgconfig/bz2.pc && sudo cp /usr/local/lib/pkgconfig/bz2.pc /usr/local/lib/pkgconfig/bzip2.pc

#      _                                   __ 
#     | |                                 /  )
#     | |  ,_    _   _ _|_         _   _    / 
#     |/  /  |  |/  |/  |  |   | |/ \_|/   /  
#     |__/   |_/|__/|__/|_/ \_/|/|__/ |__//___
#     |\                      /|/|            
#     |/                      \|\| 
cd ~/freetype2 && sudo ln -s /usr/local/bin/libtoolize /usr/local/bin/glibtoolize || sudo rm -f -r build && mkdir build && cd build && cmake ..  -DBZIP2_LIBRARY_RELEASE=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk/usr/lib/libbz2.tbd    -DZLIB_LIBRARY_RELEASE=/usr/local/lib/libz.dylib  -DLIBLZMA_LIBRARY_RELEASE=/usr/local/lib/liblzma.dylib -DCMAKE_C_COMPILER="gcc" -DCMAKE_CXX_COMPILER="g++" -DCMAKE_VERBOSE_MAKEFILE=ON -DCMAKE_OSX_SYSROOT:PATH=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -DCMAKE_OSX_DEPLOYMENT_TARGET:STRING=10.12 -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr/local -DCMAKE_C_COMPILER="gcc" -DCMAKE_EXE_LINKER_FLAGS="-arch x86_64 -mmacosx-version-min=10.12 -L/usr/local/lib" -DZLIB_LIBRARY_RELEASE=/usr/local/lib/libz.dylib -DCMAKE_VERBOSE_MAKEFILE=ON -DCMAKE_C_FLAGS="-arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include" -DBUILD_SHARED_LIBS=ON &&  LD=ld64.lld CC=gcc CFLAGS="-arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include" LDFLAGS="-lbz2 -Wl,-headerpad_max_install_names -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -arch x86_64 -mmacosx-version-min=10.12 -L/usr/local/lib" make -j8 && sudo make install

#      _                                     _          
#     | |                                   | | o       
#     | |  __   _  _  _|_  __   __   _  _   | |     __, 
#     |/  /  \_/ |/ |  |  /    /  \_/ |/ |  |/  |  /  | 
#     |__/\__/   |  |_/|_/\___/\__/   |  |_/|__/|_/\_/|/
#     |\                                    |\       /| 
#     |/                                    |/       \| 
cd ~/fontconfig && git clean -dxf && sed -i -e 's+"libintl.h"+"/usr/local/include/libintl.h"+g' src/*.{c,h} && sed -i -e 's+<libintl.h>+"/usr/local/include/libintl.h"+g' src/*.{c,h} && autoreconf -vfi && EXPAT_LIBS=/usr/local/lib/libexpat.1.dylib LIBRARY_PATH="/usr/local/lib" LD=ld64.lld CC=gcc CXX=g++ CFLAGS="-I/usr/local/include/freetype2 -arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include" LDFLAGS="-Wl,-headerpad_max_install_names -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -arch x86_64 -mmacosx-version-min=10.12 -L/usr/local/lib /usr/local/lib/libexpat.1.dylib" CXXFLAGS="-I/usr/local/include/freetype2  -arch x86_64 -mmacosx-version-min=10.12" FREETYPE_LIBS="$(pkg-config --libs freetype2) $(pkg-config --libs bz2)" FREETYPE_CFLAGS="$(pkg-config --cflags freetype2) $(pkg-config --cflags bz2)" ./configure --with-pkgconfigdir=/usr/local/lib/pkgconfig --with-libintl-prefix=/usr/local --prefix=/usr/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk --enable-shared=yes --enable-libxml2 &&  LD=ld64.lld CC=gcc CXX=g++ CFLAGS="-I/usr/local/include/freetype2 -arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include" LDFLAGS="-Wl,-headerpad_max_install_names -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk /usr/local/lib/libexpat.1.dylib -Wl,-rpath -Wl,/usr/local/lib -arch x86_64 -mmacosx-version-min=10.12 -L/usr/local/lib" CXXFLAGS="-I/usr/local/include/freetype2 -arch x86_64 -mmacosx-version-min=10.12"  make -j8 && sudo make install; sudo install_name_tool -change @rpath/libpng16.16.dylib /usr/local/lib/libpng16.16.dylib /Users/rb/fontconfig/fc-cache/.libs/fc-cache && sudo install_name_tool -change libfreetype.6.dylib /usr/local/lib/libfreetype.6.dylib /Users/rb/fontconfig/fc-cache/.libs/fc-cache && install_name_tool -change @rpath/libexpat.1.dylib /usr/local/lib/libexpat.1.dylib /Users/rb/fontconfig/fc-cache/.libs/fc-cache && sudo install_name_tool -change libfreetype.6.dylib /usr/local/lib/libfreetype.6.dylib /Users/rb/fontconfig/src/.libs/libfontconfig.1.dylib && sudo install_name_tool -change @rpath/libexpat.1.dylib /usr/local/lib/libexpat.1.dylib /Users/rb/fontconfig/src/.libs/libfontconfig.1.dylib && sudo install_name_tool -add_rpath /usr/local/lib /usr/local/lib/libfreetype.6.*.dylib && sudo install_name_tool -change libfreetype.6.dylib /usr/local/lib/libfreetype.6.dylib  /usr/local/lib/libfontconfig.1.dylib && sudo make install

#      _     _                   
#     | | o | |  o               
#     | |   | |       _ _|_  __  
#     |/  | |/ \_|  |/ \_|  /    
#     |__/|_/\_/ |_/|__/ |_/\___/
#                  /|            
#                  \|   
cd ~/libiptc* && LIBRARY_PATH="/usr/local/lib" LD=ld CC=gcc CXX=g++ CFLAGS="-arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include" LDFLAGS=" -Xlinker -U -Xlinker _libintl_bind_textdomain_codeset -Xlinker -U -Xlinker _libintl_bindtextdomain -Xlinker -U -Xlinker _libintl_dgettext -Wl,-headerpad_max_install_names -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -arch x86_64 -mmacosx-version-min=10.12 -L/usr/local/lib" CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.12" ./configure --prefix=/usr/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk --enable-shared=yes && make -j8 && sudo make install

#                          _     _   
#                         | | o | |  
#      __,  _  _          | |   | |  
#     /  | / |/ |  |   |  |/  | |/ \_
#     \_/|/  |  |_/ \_/|_/|__/|_/\_/ 
#       /|                           
#       \| 
cd ~/gnulib && true

#           _     _   
#          | | o | |  
#      __, | |   | |  
#     /  | |/  | |/ \_
#     \_/|/|__/|_/\_/ 
#       /|            
#       \| 
cd ~/glib && git stash && git clean -dxf && git checkout 2.68.4 && echo "#define _GNU_SOURCE" >> glib/glib-unix.c && PKG_CONFIG=pkg-config CMAKE=cmake meson setup --cmake-prefix-path /usr/local -D selinux=disabled -D xattr=false --prefix=/usr/local --buildtype=release _build . -D iconv=external --cross-file ~/maccross --optimization 3 --default-library=shared -D installed_tests=false -D dtrace=false -D bsymbolic_functions=false -D gio_module_dir=/usr/local/lib/gio/modules -D force_posix_threads=true && ninja -C _build && sudo ninja -C _build install



PKG_CONFIG=pkg-config CMAKE=cmake meson setup --cmake-prefix-path /usr/local -D selinux=disabled -D xattr=false --prefix=/usr/local --buildtype=release _build . -D iconv=external --cross-file ~/maccross --optimization 3 --default-library=shared -D installed_tests=false -D dtrace=false -D bsymbolic_functions=false -D gio_module_dir=/usr/local/lib/gio/modules -D force_posix_threads=true && ninja -C _build && sudo ninja install -C _build && sudo install_name_tool -change libz.1.dylib /usr/local/lib/libz.1.dylib /usr/local/lib/libgio-2.0.0.dylib && curl https://raw.githubusercontent.com/Benitoite/RTdeps/master/glib.la -o glib.la && sed -i -e "s+5900+$(otool -l /usr/local/lib/libglib-2.0.dylib | grep "current version" | head -1 | tail -c9 | cut -c1-4)+g" glib.la && sudo cp glib.la /usr/local/lib/libglib-2.0.la

#      _                   _                 
#     | |                 | |                
#     | |  _   _  _    ,  | |         _  _   
#     |/  |/  / |/ |  / \_|/  |   |  / |/ |  
#     |__/|__/  |  |_/ \/ |__/ \_/|_/  |  |_/
#                         |\                 
#                         |/  
cd ~/lensfun && sudo git clean -dxf && mkdir build && cd build && cmake .. -DCMAKE_C_COMPILER="gcc" -DCMAKE_CXX_COMPILER="g++" -DCMAKE_VERBOSE_MAKEFILE=ON -DCMAKE_OSX_SYSROOT:PATH=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -DCMAKE_OSX_DEPLOYMENT_TARGET:STRING=10.12 -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr/local && make -j8 && sudo make install

#        _    ___  ,__ __        
#     \_|_)  / (_)/|  |  |    () 
#       |   |      |  |  |    /\ 
#      _|   |      |  |  |   /  \
#     (/\___/\___/ |  |  |_//(__/
#                                
# 
cd ~/lcms && git clean -dxf && CC=gcc GXX=g++ CMAKE=cmake PKG_CONFIG=pkg-config sh autogen.sh --prefix=/usr/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include' LDFLAGS="-Wl,-undefined,dynamic_lookup -Wl,-flat_namespace -Wl,-headerpad_max_install_names -arch x86_64 -mmacosx-version-min=10.12 -L/usr/local/lib" CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.12" CPPFLAGS="-I/usr/local/include" && make -j8 && sudo make install

#                                            
#           o                                
#        _           _  _  _    __,   _  _   
#      |/ \_|  /\/  / |/ |/ |  /  |  / |/ |  
#      |__/ |_/ /\_/  |  |  |_/\_/|_/  |  |_/
#     /|                                     
#     \|
cd ~/pixman && git clean -dxf && CC=gcc GXX=g++ CMAKE=cmake PKG_CONFIG=pkg-config sh autogen.sh --prefix=/usr/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk --enable-shared=yes 'CFLAGS=-arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include' 'LDFLAGS=-arch x86_64 -mmacosx-version-min=10.12 -L/usr/local/lib' CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.12" CPPFLAGS="-I/usr/local/include" && make -j8 && sudo make install

#                              
#                o             
#      __   __,      ,_    __  
#     /    /  |  |  /  |  /  \_
#     \___/\_/|_/|_/   |_/\__/ 
#                              
# 
cd ~/cairo && git clean -dxf && git checkout 1.17.4 && CC=gcc CXX=g++ PKG_CONFIG=pkg-config CMAKE=cmake ./configure  --enable-ft=yes  --enable-fc=yes --prefix=/usr/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk && make -j8 && sudo make install

#                                                                           
#                                                                           
#      _  _  _    _  _  _       __   __   _  _  _    _  _  _    __   _  _   
#     / |/ |/ |  / |/ |/ |-----/    /  \_/ |/ |/ |  / |/ |/ |  /  \_/ |/ |  
#       |  |  |_/  |  |  |_/   \___/\__/   |  |  |_/  |  |  |_/\__/   |  |_/
#                                                                           
#   
cd ~/mm-common && git stash && git checkout 0.9.12 && git clean -dxf && LIBRARY_PATH="/usr/local/lib" LD=ld CC=gcc CXX=g++ CFLAGS="-arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include" LDFLAGS="-Wl,-headerpad_max_install_names -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -arch x86_64 -mmacosx-version-min=10.12 -L/usr/local/lib" CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.12" sh autogen.sh --prefix=/usr/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk --enable-shared=yes --disable-documentation && LIBRARY_PATH="/usr/local/lib" LD=ld CC=gcc CXX=g++ CFLAGS="-arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include" LDFLAGS="-Wl,-headerpad_max_install_names -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -arch x86_64 -mmacosx-version-min=10.9 -L/usr/local/lib" CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.12" make -j8 && sudo make install

#                             _  
#     o                      | | 
#       _|_  , _|_  __   __  | | 
#     |  |  / \_|  /  \_/  \_|/  
#     |_/|_/ \/ |_/\__/ \__/ |__/
#                                
#  
cd ~/itstool && PYTHON=python3 sh autogen.sh --prefix=/usr/local && make -j8 && sudo make install

#                              
#                              
#      __,  _ _|_  __    _ _|_ 
#     /  | |/  |  /  \_|/ \_|  
#     \_/|/|__/|_/\__/ |__/ |_/
#       /|            /|       
#       \|            \| 
cd ~/getopt-1 && make && sudo make install &&  sudo install_name_tool -change libfreetype.6.dylib /usr/local/lib/libfreetype.6.dylib /usr/local/bin/getopt

#                      _          
#                     | |         
#           _  _  _   | |_|_  __  
#     /\/  / |/ |/ |  |/  |  /  \_
#      /\_/  |  |  |_/|__/|_/\__/ 
#                                 
#  
cd ~/xmlto && autoreconf -vfi && ./configure --disable-dependency-tracking --prefix=/usr/local && make && sudo make install

#           _                           ,__ __                        _          _  
#       () | |                       | /|  |  |  o                   | |        | | 
#       /\ | |     __,   ,_    _   __|  |  |  |      _  _  _    _    | | _  _   | |   __  
#      /  \|/ \   /  |  /  |  |/  /  |  |  |  |  |  / |/ |/ |  |/  _ |/ / |/ |  |/   /  \_
#     /(__/|   |_/\_/|_/   |_/|__/\_/|_/|  |  |_/|_/  |  |  |_/|__/\_/\/  |  |_/|__/ \__/ 
#                                                                               |\  
#                                                                               |/         
cd ~/shared-mime-info-2 && PKG_CONFIG=pkg-config CMAKE=cmake XML_CATALOG_FILES=/usr/local/etc/xml/catalog LIBRARY_PATH="/usr/local/lib" CC=gcc CXX=g++ CFLAGS="-arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include" LDFLAGS="-Wl,-headerpad_max_install_names -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -arch x86_64 -mmacosx-version-min=10.13 -L/usr/local/lib" CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.12" meson _build -Ddocs=false --prefix=/usr/local --buildtype release --default-library both --optimization 3 --cross-file ~/maccross && XML_CATALOG_FILES=/usr/local/etc/xml/catalog LIBRARY_PATH="/usr/local/lib" CC=gcc CXX=g++ CFLAGS="-arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include" LDFLAGS="-Wl,-headerpad_max_install_names -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -arch x86_64 -mmacosx-version-min=10.12 -L/usr/local/lib" CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.12" ninja -C _build && sudo ninja -C _build install

#      _     _                          _                   _             __ 
#     | | o | |      o                 | |                 | |           /  )
#     | |   | |   ,      __,  __    _  | |         ,    _  | |         ,   / 
#     |/  | |/ \_/ \_|  /  | /    |/ \_|/  |   |  / \_|/ \_|/  |   |  / \_/  
#     |__/|_/\_/  \/ |_/\_/|/\___/|__/ |__/ \_/|_/ \/ |__/ |__/ \_/|_/ \//___
#                         /|     /|                  /|                      
#                         \|     \|                  \|   
cd ~/libsigcplusplus && git checkout 2.10.6 && LIBRARY_PATH="/usr/local/lib" LD=ld CC=gcc CXX=g++ CFLAGS="-arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include" LDFLAGS="-Wl,-headerpad_max_install_names -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -arch x86_64 -mmacosx-version-min=10.12 -L/usr/local/lib" CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.12" sh autogen.sh --prefix=/usr/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk --enable-shared=yes --disable-documentation && LIBRARY_PATH="/usr/local/lib" LD=ld CC=gcc CXX=g++ CFLAGS="-arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include" LDFLAGS="-Wl,-headerpad_max_install_names -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -arch x86_64 -mmacosx-version-min=10.12 -L/usr/local/lib" CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.12" make -j8 && sudo make install

#      _     _                          _                   _             ___ 
#     | | o | |      o                 | |                 | |           /   \
#     | |   | |   ,      __,  __    _  | |         ,    _  | |         ,   __/
#     |/  | |/ \_/ \_|  /  | /    |/ \_|/  |   |  / \_|/ \_|/  |   |  / \_   \
#     |__/|_/\_/  \/ |_/\_/|/\___/|__/ |__/ \_/|_/ \/ |__/ |__/ \_/|_/ \/\___/
#                         /|     /|                  /|                       
#                         \|     \|                  \|       
cd ~/libsigcplusplus && git checkout 3.0.6 && sh autogen.sh && DOXYGEN=doxygen LIBRARY_PATH="/usr/local/lib" LD=ld CC=gcc CXX=g++ CFLAGS="-arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include" LDFLAGS="-Wl,-headerpad_max_install_names -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -arch x86_64 -mmacosx-version-min=10.12 -L/usr/local/lib" CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.12" ./configure --prefix=/usr/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk --enable-shared=yes --disable-documentation && LIBRARY_PATH="/usr/local/lib" LD=ld CC=gcc CXX=g++ CFLAGS="-arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include" LDFLAGS="-Wl,-headerpad_max_install_names -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -arch x86_64 -mmacosx-version-min=10.12 -L/usr/local/lib" CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.12" make -j8 && sudo make install
#                _                                                                  
#               | |  o                o                                             
#      __,  __  | |     _   __ _|_        _  _  _|_  ,_    __   ,    _   _   __ _|_  o              
#     /  | /  \_|/ \_| |/  /    |-----|  / |/ |  |  /  |  /  \_/ \_|/ \_|/  /    |       __   _  _   
#     \_/|/\__/  \_/ |/|__/\___/|_/   |_/  |  |_/|_/   |_/\__/  \/ |__/ |__/\___/|_/ |  /  \_/ |/ |  
#       /|          /|                                            /|                 |_/\__/   |  |_/
#       \|          \|                                            \|                
cd ~/gobject-introspection && PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/usr/local/share/pkgconfig:/Library/Frameworks/Python.framework/Versions/3.9/lib/pkgconfig PYTHON=python3 PKG_CONFIG=pkg-config CMAKE=cmake GOBJECT_INTROSPECTION_LIBDIR=/usr/local/lib CC=gcc CXX=g++ CFLAGS="-Wno-implicit -std=gnu99 -arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include -I/usr/gtk/include -I/Library/Frameworks/Python.framework/Versions/3.9/include" LDFLAGS="-Wl,-headerpad_max_install_names -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -arch x86_64 -mmacosx-version-min=10.12" CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.12 -I/usr/gtk/include -I/usr/local/include" meson setup _build --errorlogs  --prefix=/usr/local -D doctool=disabled -D python=/Library/Frameworks/Python.framework/Versions/3.9/bin --buildtype release --default-library shared  --cross-file=/Users/rb/maccross && PKG_CONFIG_PATH=/usr/local/lib/pkgconfig CC=gcc CXX=g++ CFLAGS="-arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include -I/usr/gtk/include" LDFLAGS="-Wl,-headerpad_max_install_names -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -arch x86_64 -mmacosx-version-min=10.12" CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include" ninja -C _build && sudo ninja -C _build install

#               _   
#              | |  
#      __, _|_ | |  
#     /  |  |  |/_) 
#     \_/|_/|_/| \_/
#                   
# 
cd ~/atk-2 && CMAKE=/usr/local/bin/cmake PKG_CONFIG=/usr/local/bin/pkg-config CC=gcc CXX=g++ CFLAGS="-arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include/glib-2.0 -I/usr/local/lib/glib-2.0/include -I/usr/local/include" LDFLAGS="-Wl,-no_compact_unwind -Wl,-headerpad_max_install_names -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -arch x86_64 -mmacosx-version-min=10.12 -L/usr/local/lib" CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include" meson setup _build . --prefix=/usr/local --cross-file ~/maccross -D introspection=false && ninja -C _build && sed -i -e 's/-current_version=1/-current_version 1/g' _build/build.ninja && sed -i -e 's/-compatibility_version=1/-compatibility_version 1/g' _build/build.ninja && CC=gcc CXX=g++ CFLAGS="-arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include" LDFLAGS="-Wl,-no_compact_unwind -Wl,-headerpad_max_install_names -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -arch x86_64 -mmacosx-version-min=10.12 -L/usr/local/lib" CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include" ninja -C _build && sudo ninja -C _build install

#           _     _                         
#          | | o | |                        
#      __, | |   | |   _  _  _    _  _  _   
#     /  | |/  | |/ \_/ |/ |/ |  / |/ |/ |  
#     \_/|/|__/|_/\_/   |  |  |_/  |  |  |_/
#       /|                                  
#       \|
cd ~/glibmm && git clean -dxf && git checkout 2.68.1 && CC=gcc CXX=g++ PKG_CONFIG=pkg-config CMAKE=cmake meson _build --cross=~/maccross -D build-documentation=false -D build-examples=false && ninja -C _build && sudo ninja -C _build install

#                            _                  
#                           | |         o       
#      __,  ,_    __,    _  | |             __  
#     /  | /  |  /  |  |/ \_|/ \   |  |_|  / / _
#     \_/|/   |_/\_/|_/|__/ |   |_/ \/  |_/ /_/ 
#       /|            /|                     /| 
#       \|            \|                     \| 
cd ~/graphviz && git clean -dxf && mkdir build && cd build && CC=gcc CXX=g++ cmake -G "Unix Makefiles" ..  -DCMAKE_VERBOSE_MAKEFILE=ON -DCMAKE_OSX_SYSROOT:PATH=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -DCMAKE_OSX_DEPLOYMENT_TARGET:STRING=10.12 -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr/local && make -j8 && sudo make install

#               _                         
#              | |                        
#      __, _|_ | |   _  _  _    _  _  _   
#     /  |  |  |/_) / |/ |/ |  / |/ |/ |  
#     \_/|_/|_/| \_/  |  |  |_/  |  |  |_/
#                                         
#  
cd ~/atkmm && git clean -dxf && git checkout 2.36.0 && CC=gcc CXX=g++ PKG_CONFIG=pkg-config CMAKE=cmake meson _build --cross=~/maccross -D build-documentation=false -D build-examples=false && ninja -C _build && sudo ninja -C _build install

#      _                  _  _                    
#     | |                | || |                   
#     | |     __,   ,_   | || |          __   __  
#     |/ \   /  |  /  |  |/ |/ \_|   |  / / _/ / _
#     |   |_/\_/|_/   |_/|__/\_/  \_/|_/ /_/  /_/ 
#                        |\               /|   /| 
#                        |/               \|   \| 
cd ~/harfbuzz && PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/usr/local/share/pkgconfig:/Library/Frameworks/Python.framework/Versions/3.9/lib/pkgconfig CC=gcc CXX=g++ CMAKE=cmake PKG_CONFIG=pkg-config meson setup --prefix=/usr/local --sysconfdir=/etc --buildtype release --default-library shared  --optimization 3 --cross-file ~/maccross _build . -D coretext=disabled -D tests=disabled -D docs=disabled -D graphite=enabled -D icu=disabled -D freetype=enabled -D glib=enabled --wrap-mode=nofallback && CXXFLAGS=-Wno-narrowing CFLAGS=-Wno-narrowing ninja -C _build && sudo ninja install -C _build

#      _           _               
#     | |       o | |  o     |  o  
#     | |  ,_     | |      __|     
#     |/  /  |  | |/ \_|  /  |  |  
#     |__/   |_/|_/\_/ |_/\_/|_/|_/
#     |\                           
#     |/ 
cd ~/fribidi && git checkout master && PKG_CONFIG=pkg-config CMAKE=/usr/local/bin/cmake CC=gcc CXX=g++ CFLAGS="-arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include" LDFLAGS="-Wl,-no_compact_unwind -Wl,-headerpad_max_install_names -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -arch x86_64 -mmacosx-version-min=10.12 -L/usr/local/lib" CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include" meson setup _build . --prefix=/usr/local --cross-file ~/maccross -D introspection=false -Ddocs=false && ninja -C _build  && sudo ninja -C _build install

#                                   
#                                   
#        _   __,   _  _    __,  __  
#      |/ \_/  |  / |/ |  /  | /  \_
#      |__/ \_/|_/  |  |_/\_/|/\__/ 
#     /|                    /|      
#     \|                    \|  
cd ~/pango && git checkout 1.48.8 && PKG_CONFIG=pkg-config CMAKE=cmake CC=gcc CXX=g++ CFLAGS="-w -std=c2x -arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include" LDFLAGS="-Wl,-headerpad_max_install_names -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -arch x86_64 -mmacosx-version-min=10.12 -L/usr/local/lib" CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.12" meson setup -D fontconfig=enabled --prefix=/usr/local --sysconfdir=/etc --buildtype release --default-library both --optimization 3 --cross-file ~/maccross _build . && CC=gcc CXX=g++ CFLAGS="-arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include" LDFLAGS="-Wl,-headerpad_max_install_names -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -arch x86_64 -mmacosx-version-min=10.12 -L/usr/local/lib" CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.12" ninja -C _build && sudo ninja install -C _build && sudo install_name_tool -change libfreetype.6.dylib /usr/local/lib/libfreetype.6.dylib /usr/local/lib/libpangocairo-1.0.0.dylib && sudo install_name_tool -change libfreetype.6.dylib /usr/local/lib/libfreetype.6.dylib /usr/local/lib/libpangoft2-1.0.0.dylib

#                                                    
#                o                                   
#      __   __,      ,_    __   _  _  _    _  _  _   
#     /    /  |  |  /  |  /  \_/ |/ |/ |  / |/ |/ |  
#     \___/\_/|_/|_/   |_/\__/   |  |  |_/  |  |  |_/
#                                                    
# 
cd ~/cairomm && git clean -dxf && git checkout master && git pull && PKG_CONFIG=pkg-config CMAKE=cmake CC=gcc CXX=g++ CFLAGS="-arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include" LDFLAGS="-Wl,-headerpad_max_install_names -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -arch x86_64 -mmacosx-version-min=10.12 -L/usr/local/lib" CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.12" sh autogen.sh --prefix=/usr/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk --enable-shared=yes --disable-documentation && CC=gcc CXX=g++ CFLAGS="-arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include" LDFLAGS="-Wl,-headerpad_max_install_names -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -arch x86_64 -mmacosx-version-min=10.12 -L/usr/local/lib" CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.12" make -j8 && sudo make install

#                                                         
#                                                         
#        _   __,   _  _    __,  __   _  _  _    _  _  _   
#      |/ \_/  |  / |/ |  /  | /  \_/ |/ |/ |  / |/ |/ |  
#      |__/ \_/|_/  |  |_/\_/|/\__/   |  |  |_/  |  |  |_/
#     /|                    /|                            
#     \|                    \|   
cd ~/pangomm && git clean -dxf && git checkout master && git pull && PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/usr/local/share/pkgconfig PKG_CONFIG=pkg-config CMAKE=cmake CC=gcc CXX=g++ meson setup _build --cross=~/maccross -D build-documentation=false -D build-deprecated-api=false --wrap-mode=nofallback && ninja -C _build && sudo ninja -C _build install
 
#      _     _                             
#     | | o | |                            
#     | |   | |   __   ,_    __   __   __  
#     |/  | |/ \_/    /  |  /  \_/    /  \_
#     |__/|_/\_/ \___/   |_/\__/ \___/\__/ 
#                                          
# 
cd ~/libcroco && git pull && CC=gcc CXX=g++ CFLAGS="-arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include" LDFLAGS="-Wl,-headerpad_max_install_names -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -arch x86_64 -mmacosx-version-min=10.12 -L/usr/local/lib" CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.12" sh autogen.sh --prefix=/usr/local --disable-Bsymbolic && CC=gcc CXX=g++ CFLAGS="-arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include" LDFLAGS="-Wl,-headerpad_max_install_names -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -arch x86_64 -mmacosx-version-min=10.12 -L/usr/local/lib" CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.12" make -j8 && sudo make install

#      _     _             _     
#     | | o | |           | |    
#     | |   | |        ,  | |_|_ 
#     |/  | |/ \_/\/  / \_|/  |  
#     |__/|_/\_/  /\_/ \/ |__/|_/
#                                
# 
cd ~/libxslt && git pull && CC=gcc CXX=g++ CFLAGS="-arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include" LDFLAGS="-Wl,-headerpad_max_install_names -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -arch x86_64 -mmacosx-version-min=10.12 -L/usr/local/lib" CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.12" sh autogen.sh --prefix=/usr/local && CC=gcc CXX=g++ CFLAGS="-arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include" LDFLAGS="-Wl,-headerpad_max_install_names -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -arch x86_64 -mmacosx-version-min=10.12 -L/usr/local/lib" CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.12" make -j8 && sudo make install

#       ____    __    ___  , __   __    __   ,            __ 
#      (|   \  /\_\/ / (_)/|/  \ /\_\/ /\_\//|   /   |  |/  )
#       |    ||    ||      | __/|    ||    | |__/    |__|_ / 
#      _|    ||    ||      |   \|    ||    | | \        | /  
#     (/\___/  \__/  \___/ |(__/ \__/  \__/  |  \_/     |/___
#                                                            
#   
cd ~ && curl http://www.oasis-open.org/docbook/xml/4.2/docbook-xml-4.2.zip -o docbook-xml-4.2.zip && sudo mkdir -p /usr/local/share/docbook-xml-4.2 && cd /usr/local/share/docbook-xml-4.2 && sudo unzip ~/docbook-xml-4.2 && cd ~ && curl http://downloads.sourceforge.net/docbook/docbook-xsl-1.73.2.tar.bz2 -L -o docbookxsl.tar.bz2 && cd /usr/local/share && sudo tar xjvf ~/docbookxsl.tar.bz2 && rm ~/docbookxsl.tar.bz2 && export XML_CATALOG_FILES=/usr/local/share/docbook-xsl-1.73.2/catalog:/usr/local/share/docbook-xml-4.2/catalog

#                     _              _                        _  
#        |           | |            | |                      | | 
#      __|   __   __ | |   __   __  | |            _  _  _   | | 
#     /  |  /  \_/   |/ \_/  \_/  \_|/_)-----/\/  / |/ |/ |  |/  
#     \_/|_/\__/ \___/\_/ \__/ \__/ | \_/     /\_/  |  |  |_/|__/
#                                                                
#  
cd ~/docbook-xml && curl https://raw.githubusercontent.com/Benitoite/RTdeps/master/docbook-script1.sh -o docbook-script1.sh && sudo sh docbook-script1.sh

#                     _              _                 _  
#        |           | |            | |               | | 
#      __|   __   __ | |   __   __  | |            ,  | | 
#     /  |  /  \_/   |/ \_/  \_/  \_|/_)-----/\/  / \_|/  
#     \_/|_/\__/ \___/\_/ \__/ \__/ | \_/     /\_/ \/ |__/
#                                                         
#   
cd ~/docbook-xsl* && curl http://www.linuxfromscratch.org/patches/blfs/svn/docbook-xsl-nons-1.79.2-stack_fix-1.patch -o patch1.patch && patch -Np1 -i patch1.patch || sudo install -v -m755 -d /usr/local/share/xml/docbook/xsl-stylesheets-1.79.2 && sudo cp -v -R VERSION assembly common eclipse epub epub3 extensions fo highlighting html htmlhelp images javahelp lib manpages params profiling roundtrip slides template tests tools webhelp website xhtml xhtml-1_1 xhtml5 /usr/local/share/xml/docbook/xsl-stylesheets-1.79.2 && sudo ln -s VERSION /usr/local/share/xml/docbook/xsl-stylesheets-1.79.2/VERSION.xsl && sudo install -v -m644 README /usr/local/share/doc/docbook-xsl-1.79.2/README.txt && sudo install -v -m644 RELEASE-NOTES* NEWS* /usr/local/share/doc/docbook-xsl-1.79.2 && curl https://raw.githubusercontent.com/Benitoite/RTdeps/master/xslconfig.sh -o xslconfig.sh && sudo sh xslconfig.sh && install -d /usr/local/share/xml/docbook-xsl/1.79.2/docbook-xsl && sudo install catalog.xml /usr/local/share/xml/docbook-xsl/1.79.2/docbook-xsl/catalog.xml

#                                          
#                                          
#      _  _  _    __,   __   ,_    __   ,  
#     / |/ |/ |  /  |  /    /  |  /  \_/ \_
#       |  |  |_/\_/|_/\___/   |_/\__/  \/ 
#                                          
#  
cd ~/macros && git pull && CC=gcc CXX=g++ CFLAGS="-arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include" LDFLAGS="-Wl,-headerpad_max_install_names -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -arch x86_64 -mmacosx-version-min=10.12 -L/usr/local/lib" CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.12" sh autogen.sh --prefix=/usr/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk --enable-shared=yes && CC=gcc CXX=g++ CFLAGS="-arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include" LDFLAGS="-Wl,-headerpad_max_install_names -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -arch x86_64 -mmacosx-version-min=10.12 -L/usr/local/lib" CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.12" make -j8 && sudo make install

#      _     _                            
#     | | o | |                           
#     | |   | |   _    _   __             
#     |/  | |/ \_|/  |/ \_/  \_/\/  |   | 
#     |__/|_/\_/ |__/|__/ \__/  /\_/ \_/|/
#                   /|                 /| 
#                   \|                 \| 
cd ~/libepoxy && git clean -dxf && PKG_CONFIG=pkg-config CMAKE=cmake CC=gcc CXX=g++ CFLAGS="-arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include" LDFLAGS="-Wl,-headerpad_max_install_names -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -arch x86_64 -mmacosx-version-min=10.12 -L/usr/local/lib" CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.12" meson _build -Ddocs=false --prefix=/usr/local --buildtype release --default-library both --optimization 3 --cross-file ~/maccross && CC=gcc CXX=g++ CFLAGS="-arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include" LDFLAGS="-Wl,-headerpad_max_install_names -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -arch x86_64 -mmacosx-version-min=10.12 -L/usr/local/lib" CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.12" ninja -C _build && sudo ninja -C _build install

#                                 
#      o                          
#         __,   ,    _   _   ,_   
#      | /  |  / \_|/ \_|/  /  |  
#      |/\_/|_/ \/ |__/ |__/   |_/
#     /|          /|              
#     \|          \|
cd ~/jasper && git clean -dxf && mkdir _build && cd _build && CC=gcc CXX=g++ CFLAGS="-arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include" LDFLAGS="-Wl,-headerpad_max_install_names -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -arch x86_64 -mmacosx-version-min=10.12 -L/usr/local/lib" CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.12" cmake .. -DCMAKE_C_COMPILER="gcc" -DCMAKE_CXX_COMPILER="g++" -DCMAKE_VERBOSE_MAKEFILE=ON -DCMAKE_OSX_SYSROOT:PATH=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -DCMAKE_OSX_DEPLOYMENT_TARGET:STRING=10.12 -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr/local && CC=gcc CXX=g++ CFLAGS="-arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include" LDFLAGS="-Wl,-headerpad_max_install_names -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -arch x86_64 -mmacosx-version-min=10.12 -L/usr/local/lib" CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.12" make -j8 && sudo make install

#                 _                    _           _  
#             |  | |           o      | |         | | 
#      __,  __|  | |        _         | |         | | 
#     /  | /  |  |/_)-----|/ \_|  /\/ |/ \_|   |  |/  
#     \_/|/\_/|_/| \_/    |__/ |_/ /\_/\_/  \_/|_/|__/
#       /|               /|                       |\  
#       \|               \|                       |/  
cd ~/gdk-pixbuf && git clean -dxf && git checkout master && git pull && PKG_CONFIG=pkg-config CMAKE=cmake CC=gcc CXX=g++ CFLAGS="-I/usr/local/include/glib-2.0 -I/usr/local/lib/glib-2.0/include  -I/usr/local/include/libpng16 -arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include" LDFLAGS="-Wl,-headerpad_max_install_names -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -arch x86_64 -mmacosx-version-min=10.12 -L/usr/local/lib -Wl,-rpath,/Applications/RawTherapee.app/Contents/Frameworks" CXXFLAGS="-I/usr/local/lib/glib-2.0/include -I/usr/local/include/libpng16 -Dx11=false -D_REENTRANT -arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include" meson _build -Dnative_windows_loaders=false -Drelocatable=true -Dgir=true -Dx11=false -Dman=false --prefix=/usr/local -D installed_tests=false -D gir=false -D png=enabled -Ddocs=false -Dman=false --prefix=/usr/local --buildtype release --default-library shared --optimization 3 --cross-file ~/maccross && cd _build && CC=gcc CXX=g++ CFLAGS="-I/usr/local/include/glib-2.0   -I/usr/local/lib/glib-2.0/include -I/usr/local/include/libpng16 -arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include" LDFLAGS="-Wl,-headerpad_max_install_names -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -arch x86_64 -mmacosx-version-min=10.12 -L/usr/local/lib -Wl,-rpath,/usr/local/lib" CXXFLAGS="-I/usr/local/lib/glib-2.0/include -D_REENTRANT -arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include -I/usr/local/include/libpng16" ninja && sudo ninja install && sudo install_name_tool -add_rpath /usr/local/lib /usr/local/lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-png.so && sudo install_name_tool -add_rpath /usr/local/lib /usr/local/lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-jpeg.so && sudo install_name_tool -add_rpath /usr/local/lib /usr/local/lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-tiff.so

cd ~/perl && make distclean || PKG_CONFIG=pkg-config CMAKE=cmake CC=gcc CXX=g++ CFLAGS="-arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include" LDFLAGS="-Wl,-headerpad_max_install_names -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -arch x86_64 -mmacosx-version-min=10.12 -L/usr/local/lib" CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.12" ./configure.gnu --prefix=/usr/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk && make -j8 && sudo make install 



#              _       ___ 
#             | |     /   \
#      __,_|_ | |   |   __/
#     /  | |  |/_)--+--   \
#     \_/|/|_/| \_/ | \___/
#       /|                 
#       \|  
cd ~/gtk && git clean -dxf && git checkout gtk-3-24 && git pull && PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/usr/local/share/pkgconfig PKG_CONFIG=pkg-config CMAKE=cmake CC=gcc CXX=g++ CXXFLAGS="-DX_LOCALE" CFLAGS="-fstrict-aliasing" meson setup --prefix=/usr/local --buildtype=release _build . --cross-file ~/maccross --optimization 3 -D tests=false -D win32_backend=false -D wayland_backend=false -D x11_backend=false -D quartz_backend=true -D print_backends=file -D demos=false -D examples=false -D installed_tests=false -D builtin_immodules=yes -D introspection=false && ln -s /usr/local/lib _build/lib && V=1 CPP_FOR_BUILD=g++ CC=gcc CXX=g++ CXXFLAGS="-DX_LOCALE" CFLAGS="-fstrict-aliasing" ninja -C _build && sudo install_name_tool -change libfreetype.6.dylib /usr/local/lib/libfreetype.6.dylib _build/gtk/libgtk-3.0.dylib && sudo ninja install -C _build

#              _                         
#             | |                        
#      __,_|_ | |   _  _  _    _  _  _   
#     /  | |  |/_) / |/ |/ |  / |/ |/ |  
#     \_/|/|_/| \_/  |  |  |_/  |  |  |_/
#       /|                               
#       \| 
cd ~/gtkmm && git clean -dxf && git checkout 3.24.3 && PKG_CONFIG=pkg-config CMAKE=cmake CXXFLAGS="-DX_LOCALE" CFLAGS="-fstrict-aliasing" meson setup --prefix=/usr/local --buildtype=release _build . --cross-file ~/maccross --optimization 3 -D tests=false -D win32_backend=false -D wayland_backend=false -D x11_backend=false -D quartz_backend=true -D print_backends=file -D demos=false -D examples=false -D installed_tests=false -D builtin_immodules=yes -D introspection=false -D build-documentation=false && sudo ninja install -C _build

#      , __                
#     /|/  \               
#      |___/         , _|_ 
#      | \   |   |  / \_|  
#      |  \_/ \_/|_/ \/ |_/
#                          
# 
cd ~ && curl https://sh.rustup.rs -sSf | sh && rustup update

#      _     _                       
#     | | o | |                      
#     | |   | |   ,_    ,        __, 
#     |/  | |/ \_/  |  / \_|  |_/  | 
#     |__/|_/\_/    |_/ \/  \/  \_/|/
#                                 /| 
#                                 \| 
cd ~/librsvg && git clean -dxf && ln -s /usr/local/lib/libz.1.dylib ./libz.1.dylib && sudo install_name_tool -change libz.1.dylib @rpath/libz.1.dylib /usr/local/lib/libpng16.16.dylib && CMAKE=cmake CC=/usr/bin/clang CXX=/usr/bin/clang++ CFLAGS="-arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include" CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include" LDFLAGS="-Wl,-undefined,dynamic_lookup -Wl,-flat_namespace  -Wl,-headerpad_max_install_names -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -Wl,-headerpad_max_install_names -L/usr/local/lib -arch x86_64 -mmacosx-version-min=10.12 -Wl,-rpath -Wl,/Applications/RawTherapee.app/Contents/Frameworks" sh autogen.sh --prefix=/usr/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk --enable-introspection=no --enable-debug=no --enable-gtk-doc=no --disable-Bsymbolic --disable-tools --enable-static --enable-shared --disable-silent-rules --with-libiconv-prefix=/usr/local/lib --with-libintl-prefix=/usr/local/lib && CC=/usr/bin/clang CXX=/usr/bin/clang++ CFLAGS="-arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include" CXXFLAGS="-arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include" LDFLAGS="-Wl,-headerpad_max_install_names -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -Wl,-headerpad_max_install_names -arch x86_64 -mmacosx-version-min=10.12 -L/usr/local/lib -Wl,-rpath -Wl,/usr/local/lib" make -j8 && sudo make install

#      , _        ___,            ,__ __   
#     /|/ \      /   |      ()   /|  |  |  
#      |   |    |    |      /\    |  |  |  
#      |   |    |    |     /  \   |  |  |  
#      |   |_/   \__/\_/  /(__/   |  |  |_/
#                                          
#  
cd ~/nasm* && sudo install ldrdf nasm ndisasm rdf* rdx /usr/local/bin

#              _                                                                   
#             | |                               o                                       o               
#      __,_|_ | |       _  _  _    __,   __         _  _  _|_  _   __,  ,_    __,  _|_     __   _  _   
#     /  | |  |/_)-----/ |/ |/ |  /  |  /  -----|  / |/ |  |  |/  /  | /  |  /  |   |  |  /  \_/ |/ |  
#     \_/|/|_/| \_/      |  |  |_/\_/|_/\___/   |_/  |  |_/|_/|__/\_/|/   |_/\_/|_/ |_/|_/\__/   |  |_/
#       /|                                                          /|             
#       \|                                                          \|             
cd ~/gtk-mac-integration && git clean -dxf && git checkout master && git pull && CFLAGS="-arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include" LDFLAGS="-Wl,-headerpad_max_install_names -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -arch x86_64 -mmacosx-version-min=10.12 -L/usr/local/lib -Wl,-rpath -Wl,/usr/local/lib" CPPFLAGS="-arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include" CC=/usr/bin/clang CXX=/usr/bin/clang++ LT_SYS_LIBRARY_PATH=/usr/local/lib sh autogen.sh --prefix=/usr/local --with-sysroot=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk --libdir=/usr/local/lib --disable-glibtest --enable-introspection=no --enable-python=no --with-gtk3 --with-libiconv-prefix=/usr/local/lib --with-libintl-prefix=/usr/local/lib && sed -i -e 's/GETTEXT_MACRO_VERSION\ =\ 0.19/GETTEXT_MACRO_VERSION\ =\ 0.20/g' po/Makefile.in.in && CC=/usr/bin/clang CXX=/usr/bin/clang++ CFLAGS="-arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include" LDFLAGS="-Wl,-headerpad_max_install_names -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -arch x86_64 -mmacosx-version-min=10.12 -L/usr/local/lib -Wl,-rpath -Wl,/usr/local/lib" CPPFLAGS="-arch x86_64 -mmacosx-version-min=10.12 -I/usr/local/include"  LT_SYS_LIBRARY_PATH=/usr/local/lib make -j8 && sudo make install

#       ___,                                  
#      /   |     |                o           
#     |    |   __|           __,    _|_  __,  
#     |    |  /  |  |  |  |_/  |  |  |  /  |  
#      \__/\_/\_/|_/ \/ \/  \_/|_/|_/|_/\_/|_/
#                                             
#  
cd ~ && sudo ditto Adwaita /usr/local/share/icons/Adwaita

#        _        _      _          ,__ __   
#     \_|_)    \_|_)    (_|   |_/  /|  |  |  
#       |        |        |   |     |  |  |  
#      _|       _|        |   |     |  |  |  
#     (/\___/  (/\___/     \_/      |  |  |_/
#                                            
# 
cd ~/llvm-project && git clean -dxf && mkdir build && cd build && cmake -DLLVM_ENABLE_PROJECTS="clang;openmp" -DLLVM_TARGETS_TO_BUILD="X86" -G "Unix Makefiles" ..  -DCMAKE_VERBOSE_MAKEFILE=ON -DCMAKE_OSX_SYSROOT:PATH=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk -DCMAKE_OSX_DEPLOYMENT_TARGET:STRING=10.12 -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr/local 

#                                                          
#                                       |                  
#      __   ,_    _   __, _|_  _      __|   _  _  _    __, 
#     /    /  |  |/  /  |  |  |/-----/  |  / |/ |/ |  /  | 
#     \___/   |_/|__/\_/|_/|_/|__/   \_/|_/  |  |  |_/\_/|/
#                                                       /| 
#                                                       \| 
cd ~/rt-create-dmg && chmod 4755 create-dmg && sudo ln -s ~/rt-create-dmg/create-dmg /usr/local/bin && sudo ln -s ~/rt-create-dmg/support /usr/local/bin

#      _____             _______ _                                    
#     |  __ \           |__   __| |                                   
#     | |__) |__ ___      _| |  | |__   ___ _ __ __ _ _ __   ___  ___ 
#     |  _  // _` \ \ /\ / / |  | '_ \ / _ \ '__/ _` | '_ \ / _ \/ _ \
#     | | \ \ (_| |\ V  V /| |  | | | |  __/ | | (_| | |_) |  __/  __/
#     |_|  \_\__,_| \_/\_/ |_|  |_| |_|\___|_|  \__,_| .__/ \___|\___|
#                                                    | |              
#                                                    |_|      
cd ~ && git clone https://github.com/Beep6581/RawTherapee.git repo-rt && cd ~/repo-rt && sudo rm -r build || git checkout dev && git pull && mkdir build && cd build && cmake -DCMAKE_BUILD_TYPE="release" -DPROC_TARGET_NUMBER="1" -DPROC_LABEL="generic processor" -DCACHE_NAME_SUFFIX="5-dev" -DCMAKE_C_COMPILER="clang" -DCMAKE_CXX_COMPILER="clang++" -DWITH_LTO="ON" -DCMAKE_OSX_SYSROOT="/" -DCMAKE_OSX_DEPLOYMENT_TARGET="10.12" -DLOCAL_PREFIX:STRING="/opt" -DLENSFUNDBDIR="share/lensfun" -DCODESIGNID:STRING="Developer ID Application: Xxxxx Xxxxx (ABCDEFGHIJ)" -DNOTARY:STRING="--username aaaa@aaaa.aaaa --password abcd-efgh-hijk-lmno" -DCMAKE_CXX_FLAGS="-Wno-pass-failed -arch x86_64 -Wno-deprecated-register -Wno-unused-command-line-argument -std=c++11" -DCMAKE_C_FLAGS="-Wno-pass-failed -arch x86_64 -Wno-deprecated-register -Wno-unused-command-line-argument" -DCMAKE_EXE_LINKER_FLAGS="--arch x86_64" -DOpenMP_C_FLAGS=-fopenmp=lomp -DOpenMP_CXX_FLAGS=-fopenmp=lomp -DOpenMP_C_LIB_NAMES="libomp" -DOpenMP_CXX_LIB_NAMES="libomp" -DOpenMP_libomp_LIBRARY="/usr/local/lib/libomp.dylib" -DOpenMP_CXX_FLAGS="-Xpreprocessor -fopenmp /usr/local/lib/libomp.dylib -I/usr/local/include" -DOpenMP_CXX_LIB_NAMES="libomp" -DOpenMP_C_FLAGS="-Xpreprocessor -fopenmp /usr/local/lib/libomp.dylib -I/usr/local/include" -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON -DFANCY_DMG:BOOL=ON .. && make -j8 install && sudo make macosx_bundle

#       _   _   _     _   _     _   _   _   _   _   _  
#      / \ / \ / \   / \ / \   / \ / \ / \ / \ / \ / \ 
#     ( E | N | D ) ( O | F ) ( S | C | R | I | P | T )
#      \_/ \_/ \_/   \_/ \_/   \_/ \_/ \_/ \_/ \_/ \_/ 
echo "-end of script-"
