CMAKE_MINIMUM_REQUIRED(VERSION 3.0)

PROJECT("com.github.hoelzro-lua-term")

INCLUDE(../../../cmake/version.cmake)

SET(INSTALL_WIN32              "${CMAKE_CURRENT_SOURCE_DIR}/../../../build/lua5.2/windows_x86")
SET(INSTALL_WIN64              "${CMAKE_CURRENT_SOURCE_DIR}/../../../build/lua5.2/windows_x86_64")
SET(INSTALL_UBUNTU_1404_X86    "${CMAKE_CURRENT_SOURCE_DIR}/../../../build/lua5.2/ubuntu_1404_x86")
SET(INSTALL_UBUNTU_1404_X86_64 "${CMAKE_CURRENT_SOURCE_DIR}/../../../build/lua5.2/ubuntu_1404_x86_64")
SET(INSTALL_UBUNTU_1604_X86    "${CMAKE_CURRENT_SOURCE_DIR}/../../../build/lua5.2/ubuntu_1604_x86")
SET(INSTALL_UBUNTU_1604_X86_64 "${CMAKE_CURRENT_SOURCE_DIR}/../../../build/lua5.2/ubuntu_1604_x86_64")
SET(INSTALL_UBUNTU_1610_X86    "${CMAKE_CURRENT_SOURCE_DIR}/../../../build/lua5.2/ubuntu_1610_x86")
SET(INSTALL_UBUNTU_1610_X86_64 "${CMAKE_CURRENT_SOURCE_DIR}/../../../build/lua5.2/ubuntu_1610_x86_64")
SET(INSTALL_UBUNTU_1704_X86    "${CMAKE_CURRENT_SOURCE_DIR}/../../../build/lua5.2/ubuntu_1704_x86")
SET(INSTALL_UBUNTU_1704_X86_64 "${CMAKE_CURRENT_SOURCE_DIR}/../../../build/lua5.2/ubuntu_1704_x86_64")

# Get the project version. Both the WIN32 and the WIN64 folder have the same version file.
INCLUDE(${INSTALL_WIN32}/com.github.hoelzro-lua-term.version)
SET(PROJECT_VERSION ${com.github.hoelzro-lua-term_VERSION})

SET(CPACK_OUTPUT_FILE_PREFIX targets/jonchki/repository/com/github/hoelzro/lua-term/${PROJECT_VERSION})
SET(CPACK_INCLUDE_TOPLEVEL_DIRECTORY FALSE)
SET(CPACK_PACKAGE_FILE_NAME "lua5.2-lua-term-${PROJECT_VERSION}")

SET(CPACK_GENERATOR "TXZ")
INCLUDE(CPack)


#-----------------------------------------------------------------------------
#
# Install the 32bit files.
#
INSTALL(FILES ${INSTALL_WIN32}/lib/core.dll
        DESTINATION windows_x86/lua_plugins/term)
INSTALL(FILES ${INSTALL_WIN32}/lua/colors.lua ${INSTALL_WIN32}/lua/cursor.lua ${INSTALL_WIN32}/lua/init.lua
        DESTINATION windows_x86/lua/term)

INSTALL(FILES ${INSTALL_UBUNTU_1404_X86}/lib/core.so
        DESTINATION ubuntu_1404_x86/lua_plugins/term)
INSTALL(FILES ${INSTALL_UBUNTU_1404_X86}/lua/colors.lua ${INSTALL_UBUNTU_1404_X86}/lua/cursor.lua ${INSTALL_UBUNTU_1404_X86}/lua/init.lua
        DESTINATION ubuntu_1404_x86/lua/term)

INSTALL(FILES ${INSTALL_UBUNTU_1604_X86}/lib/core.so
        DESTINATION ubuntu_1604_x86/lua_plugins/term)
INSTALL(FILES ${INSTALL_UBUNTU_1604_X86}/lua/colors.lua ${INSTALL_UBUNTU_1604_X86}/lua/cursor.lua ${INSTALL_UBUNTU_1604_X86}/lua/init.lua
        DESTINATION ubuntu_1604_x86/lua/term)

INSTALL(FILES ${INSTALL_UBUNTU_1704_X86}/lib/core.so
        DESTINATION ubuntu_1704_x86/lua_plugins/term)
INSTALL(FILES ${INSTALL_UBUNTU_1704_X86}/lua/colors.lua ${INSTALL_UBUNTU_1704_X86}/lua/cursor.lua ${INSTALL_UBUNTU_1704_X86}/lua/init.lua
        DESTINATION ubuntu_1704_x86/lua/term)


#-----------------------------------------------------------------------------
#
# Install the 64bit files.
#
INSTALL(FILES ${INSTALL_WIN64}/lib/core.dll
        DESTINATION windows_x64/lua_plugins/term)
INSTALL(FILES ${INSTALL_WIN64}/lua/colors.lua ${INSTALL_WIN64}/lua/cursor.lua ${INSTALL_WIN64}/lua/init.lua
        DESTINATION windows_x64/lua/term)

INSTALL(FILES ${INSTALL_UBUNTU_1404_X86_64}/lib/core.so
        DESTINATION ubuntu_1404_x86_64/lua_plugins/term)
INSTALL(FILES ${INSTALL_UBUNTU_1404_X86_64}/lua/colors.lua ${INSTALL_UBUNTU_1404_X86_64}/lua/cursor.lua ${INSTALL_UBUNTU_1404_X86_64}/lua/init.lua
        DESTINATION ubuntu_1404_x86_64/lua/term)

INSTALL(FILES ${INSTALL_UBUNTU_1604_X86_64}/lib/core.so
        DESTINATION ubuntu_1604_x86_64/lua_plugins/term)
INSTALL(FILES ${INSTALL_UBUNTU_1604_X86_64}/lua/colors.lua ${INSTALL_UBUNTU_1604_X86_64}/lua/cursor.lua ${INSTALL_UBUNTU_1604_X86_64}/lua/init.lua
        DESTINATION ubuntu_1604_x86_64/lua/term)

INSTALL(FILES ${INSTALL_UBUNTU_1704_X86_64}/lib/core.so
        DESTINATION ubuntu_1704_x86_64/lua_plugins/term)
INSTALL(FILES ${INSTALL_UBUNTU_1704_X86_64}/lua/colors.lua ${INSTALL_UBUNTU_1704_X86_64}/lua/cursor.lua ${INSTALL_UBUNTU_1704_X86_64}/lua/init.lua
        DESTINATION ubuntu_1704_x86_64/lua/term)


#-----------------------------------------------------------------------------

INSTALL(FILES install.lua
        DESTINATION .)


CONFIGURE_FILE(lua-term.xml
               ${CPACK_OUTPUT_FILE_PREFIX}/lua5.2-lua-term-${PROJECT_VERSION}.xml
               @ONLY)

#-----------------------------------------------------------------------------
#
# Filter the pom.xml file.
#
SET(POM_ARTIFACT_ID  "lua5.2-lua-term")
SET(POM_GROUP_ID     "com.github.hoelzro")
SET(POM_VERSION      "${PROJECT_VERSION}")
SET(POM_PACKAGING    "tar.xz")
CONFIGURE_FILE(${CMAKE_CURRENT_SOURCE_DIR}/pom.xml ${CPACK_OUTPUT_FILE_PREFIX}/lua5.2-lua-term-${PROJECT_VERSION}.pom)
