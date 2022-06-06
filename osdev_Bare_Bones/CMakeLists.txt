message("hello")
message(${CMAKE_BINARY_DIR})

add_custom_target(repack
        COMMAND ${CMAKE_COMMAND} -E copy_directory
        ${CMAKE_SOURCE_DIR}/osdev_Bare_Bones ${CMAKE_BINARY_DIR}/osdev_Bare_Bones
        USES_TERMINAL)

add_custom_target( build_bare_os
        COMMAND chmod +x ${CMAKE_SOURCE_DIR}/osdev_Bare_Bones/build.sh
        COMMAND ${CMAKE_SOURCE_DIR}/osdev_Bare_Bones/build.sh
        DEPENDS repack
        USES_TERMINAL)