cmake_minimum_required(VERSION 2.8)

PROJECT("lua-term")


# Set some installation folders.
#INCLUDE(cmake/muhkuh_installation_folders.cmake)

OPTION(BUILDCFG_ONLY_JONCHKI_CFG "Build only the jonchki configuration. This is used for the resolve phase. The default is OFF."
       "OFF")


#----------------------------------------------------------------------------
#
# Include the projects in the subdirectories.
#

ADD_SUBDIRECTORY(lua-term)


#----------------------------------------------------------------------------

