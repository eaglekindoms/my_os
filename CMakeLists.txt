cmake_minimum_required(VERSION 3.16)

set(CMAKE_SYSTEM_NAME "MYOSDEV")
set(CMAKE_SYSTEM_PROCESSOR "i686")

#
# Toolchain install directories
#
set(TOOLCHAIN_TRIPLET i686-elf-gcc)
set(TOOLCHAIN_ROOT "/usr/local/cross")
set(TOOLCHAIN_BIN "${TOOLCHAIN_ROOT}/bin")
set(TOOLCHAIN_INCLUDE ${TOOLCHAIN_ROOT}/include)
set(TOOLCHAIN_LIB ${TOOLCHAIN_ROOT}/lib)

#
# Toolchain paths
#
set(CMAKE_C_COMPILER "${TOOLCHAIN_BIN}/i686-elf-gcc")
set(CMAKE_CXX_COMPILER "${TOOLCHAIN_BIN}/i686-elf-g++")
set(CMAKE_ASM_COMPILER "${TOOLCHAIN_BIN}/i686-elf-gcc")
set(CMAKE_LINKER "${TOOLCHAIN_BIN}/i686-elf-ld")
set(CMAKE_RANLIB "${TOOLCHAIN_BIN}/i686-elf-gcc-ranlib")
set(CMAKE_STRIP "${TOOLCHAIN_BIN}/i686-elf-strip")
set(CMAKE_AR "${TOOLCHAIN_BIN}/i686-elf-gcc-ar")
set(CMAKE_OBJCOPY "${TOOLCHAIN_BIN}/i686-elf-objcopy")
set(CMAKE_CXXFILT "${TOOLCHAIN_BIN}/i686-elf-c++filt")
set(CMAKE_ASM_NASM_COMPILER "nasm")
set(CMAKE_ASM_NASM_COMPILE_OBJECT "${CMAKE_ASM_NASM_COMPILER} -f elf -o <OBJECT> -s <SOURCE>")

#
# C/C++ Flags
#
add_compile_options(-m32)
add_compile_options(-nostdinc) # See following include_directories() for explanation
add_compile_options(-Wdouble-promotion)
add_compile_options(-fdiagnostics-color=always)
add_compile_options($<$<COMPILE_LANGUAGE:CXX>:-Wno-literal-suffix>)

project(my_os C)

set(CMAKE_C_STANDARD 99)

add_subdirectory(test)
add_subdirectory(osdev_bones)
add_subdirectory(myosdev)