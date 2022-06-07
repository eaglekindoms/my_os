#!/usr/bin/env sh

log() {
    printf "\033[33m->\033[m %s\n" "$*"
}

download() {
    log "Downloading $2"
    
    # If the file /doesn't/ exist, download it. If it does, just extract it
    [ ! -f "$2" ] && wget -c "$1" && extract "$2" || extract "$2"
}

extract() {
    log "Inflating $1"
    tar xf "$1"
}

download_src() {
    gcc_version="9.4.0"
    gcc="gcc-$gcc_version.tar.xz"
    # download "https://mirrors.tuna.tsinghua.edu.cn/gnu/gcc/gcc-$gcc_version/$gcc" "$gcc"
    binutils_version="2.34"
    binutils="binutils-$version.tar.xz"
    # download "https://ftp.gnu.org/gnu/binutils/$binutils" "$binutils"
    export binutils_src="$PWD/binutils-$binutils_version"
    export gcc_src="$PWD/gcc-$gcc_version"
}

build_binutils() {
    log "Building binutils"
    cd binutils
    "$binutils_src/configure" --target="$TARGET"    \
                              --prefix="$PREFIX"    \
                              --with-sysroot        \
                              --disable-nls         \
                              --disable-werror
    make
    make install
    cd ..
}

build_gcc() {
    log "Building gcc"
    cd gcc
    "$gcc_src/configure" --target="$TARGET"    \
                         --prefix="$PREFIX"    \
                         --disable-nls              \
                         --enable-languages=c,c++   \
                         --without-headers          
                        #  --with-gmp="/usr/local/lib"                 \
                        #  --with-mpc="/usr/local/lib"                 \
                        #  --with-mpfr="/usr/local/lib"
    make all-gcc
    make all-target-libgcc
    make install-gcc
    make install-target-libgcc
    cd ..
}

main() {
    # exit if any commands fails
    set -e
    # disable word globbing
    set -f

    # cd toolchain

    mkdir -p src build/binutils build/gcc /usr/local/cross
    # export LD_LIBRARY_PATH=/usr/local/lib
    # install dir
    export PREFIX="/usr/local/cross"
    export TARGET="i686-elf"
    export PATH="$PREFIX/bin:$PATH"

    # download sources
    cd src
    # download_binutils
    download_src
    # download prerequisites
    cd "$gcc_src"
    ./contrib/download_prerequisites
    cd ../.. # toolchain/
    # build binutils&gcc
    cd build
    build_binutils
    build_gcc
}

main "$@"