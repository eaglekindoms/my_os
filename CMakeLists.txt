cmake_minimum_required(VERSION 3.16)
project(my_os LANGUAGES C CXX ASM)

set(CMAKE_C_STANDARD 99)
# set(CMAKE_VERBOSE_MAKEFILE off)
# set(BUILD_SHARED_LIBRARIES off)           # disable shared libs globally
# set(CMAKE_SHARED_LIBRARY_LINK_C_FLAGS)    # disable -rdynamic globally
# set(CMAKE_SHARED_LIBRARY_LINK_CXX_FLAGS)  # disable -rdynamic globally
# set(DEFAULT_TARGET_ARCH "i386")
add_subdirectory(test)
add_subdirectory(src)