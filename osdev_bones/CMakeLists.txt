message("hello")
message(${CMAKE_BINARY_DIR})
add_compile_options(-O2)
add_compile_options(-Wall)
add_compile_options(-Wextra)
add_compile_options(-ffreestanding)

add_executable(boot
        ${CMAKE_SOURCE_DIR}/osdev_bones/boot.s
        ${CMAKE_SOURCE_DIR}/osdev_bones/kernel.c)
target_link_options(boot PRIVATE LINKER:-T ${CMAKE_SOURCE_DIR}/osdev_bones/linker.ld -nostdlib  -nostartfiles)

add_custom_target(repack
        COMMAND ${CMAKE_COMMAND} -E copy_directory
        ${CMAKE_SOURCE_DIR}/osdev_bones ${CMAKE_BINARY_DIR}/osdev_bones
        USES_TERMINAL)

add_custom_target(build_bare_os
        COMMAND chmod +x ${CMAKE_SOURCE_DIR}/osdev_bones/build.sh
        COMMAND ${CMAKE_SOURCE_DIR}/osdev_bones/build.sh
        DEPENDS repack
        USES_TERMINAL)