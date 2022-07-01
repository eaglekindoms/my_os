cmake_minimum_required(VERSION 3.16)
project(my_os C)

set(CMAKE_C_STANDARD 99)

add_subdirectory(test)
add_subdirectory(src)