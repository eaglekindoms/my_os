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


# set(BOOT_FILE "boot/boot.s")

# file(
#    GLOB
#    KERNEL_SOURCES
#    "${CMAKE_SOURCE_DIR}/kernel/*.c"
# )

# file(
#     GLOB
#     KERNEL_SCRIPT
#     "${CMAKE_SOURCE_DIR}/config/linker.ld"
# )

# # Override CMake's default executable output directory
# set(EXECUTABLE_OUTPUT_PATH ${CMAKE_BINARY_DIR})

# add_executable(

#    kernel

#    ${BOOT_FILE}
#    ${KERNEL_SOURCES}
# )

# set(
#    KERNEL_LINK_FLAGS_LIST

#    -nostdlib
#    -static

#    -Wl,--build-id=none
#    -Wl,--script=${KERNEL_SCRIPT}
# )

# JOIN("${KERNEL_LINK_FLAGS_LIST}" ${SPACE} KERNEL_LINK_FLAGS)

# set_target_properties(

#    kernel

#    PROPERTIES
#       LINK_FLAGS "${KERNEL_LINK_FLAGS}"
#       LINK_DEPENDS ${KERNEL_SCRIPT}
# )

# build_all_modules(kernel)

# # -lgcc is necessary for things like 64 bit integers in 32 bit mode.
# target_link_libraries(kernel gcc)