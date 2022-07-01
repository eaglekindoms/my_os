message("hello")
message(${CMAKE_BINARY_DIR})

add_custom_target(repack
        COMMAND ${CMAKE_COMMAND} -E copy_directory
        ${CMAKE_SOURCE_DIR}/src ${CMAKE_BINARY_DIR}/src
        USES_TERMINAL)

add_custom_target( build_os
        COMMAND chmod +x ${CMAKE_SOURCE_DIR}/src/build.sh
        COMMAND ${CMAKE_SOURCE_DIR}/src/build.sh
        DEPENDS repack
        USES_TERMINAL)