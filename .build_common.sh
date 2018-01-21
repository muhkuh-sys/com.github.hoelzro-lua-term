# Do not call this script directly. It is included from the .build??_*.sh files.

echo "PRJ_DIR        = ${PRJ_DIR}"
echo "BUILD_DIR      = ${BUILD_DIR}"
echo "CMAKE_COMPILER = ${CMAKE_COMPILER}"
echo "JONCHKI_SYSTEM = ${JONCHKI_SYSTEM}"

# Create all folders.
rm -rf ${BUILD_DIR}
mkdir -p ${BUILD_DIR}
mkdir -p ${BUILD_DIR}/lua5.1
mkdir -p ${BUILD_DIR}/lua5.1/build_requirements
mkdir -p ${BUILD_DIR}/lua5.2
mkdir -p ${BUILD_DIR}/lua5.2/build_requirements
mkdir -p ${BUILD_DIR}/lua5.3
mkdir -p ${BUILD_DIR}/lua5.3/build_requirements


# Install jonchki v0.0.2.1 .
python2.7 jonchki/jonchkihere.py --jonchki-version 0.0.2.1 ${BUILD_DIR}

# This is the path to the jonchki tool.
JONCHKI=${BUILD_DIR}/jonchki-0.0.2.1/jonchki


# Get the build requirements for the LUA5.1 version.
pushd ${BUILD_DIR}/lua5.1/build_requirements
cmake -DBUILDCFG_ONLY_JONCHKI_CFG="ON" -DCMAKE_INSTALL_PREFIX="" -DBUILDCFG_LUA_VERSION="5.1" ${CMAKE_COMPILER} ${PRJ_DIR}
make
${JONCHKI} --verbose debug --syscfg ${PRJ_DIR}/jonchki/jonchkisys.cfg --prjcfg ${PRJ_DIR}/jonchki/jonchkicfg.xml ${JONCHKI_SYSTEM} --build-dependencies lua5.1-lua-term-*.xml
popd

# Build the LUA5.1 version.
pushd ${BUILD_DIR}/lua5.1
cmake -DBUILDCFG_ONLY_JONCHKI_CFG="OFF" -DBUILDCFG_LUA_USE_SYSTEM="OFF" -DCMAKE_INSTALL_PREFIX="" -DBUILDCFG_LUA_VERSION="5.1" ${CMAKE_COMPILER} ${CMAKE_PATHS} ${PRJ_DIR}
make
popd

# Get the build requirements for the LUA5.2 version.
pushd ${BUILD_DIR}/lua5.2/build_requirements
cmake -DBUILDCFG_ONLY_JONCHKI_CFG="ON" -DCMAKE_INSTALL_PREFIX="" -DBUILDCFG_LUA_VERSION="5.2" ${CMAKE_COMPILER} ${PRJ_DIR}
make
${JONCHKI} --verbose info --syscfg ${PRJ_DIR}/jonchki/jonchkisys.cfg --prjcfg ${PRJ_DIR}/jonchki/jonchkicfg.xml ${JONCHKI_SYSTEM} --build-dependencies lua5.2-lua-term-*.xml
popd

# Build the LUA5.2 version.
pushd ${BUILD_DIR}/lua5.2
cmake -DBUILDCFG_ONLY_JONCHKI_CFG="OFF" -DBUILDCFG_LUA_USE_SYSTEM="OFF" -DCMAKE_INSTALL_PREFIX="" -DBUILDCFG_LUA_VERSION="5.2" ${CMAKE_COMPILER} ${CMAKE_PATHS} ${PRJ_DIR}
make
popd

# Get the build requirements for the LUA5.3 version.
pushd ${BUILD_DIR}/lua5.3/build_requirements
cmake -DBUILDCFG_ONLY_JONCHKI_CFG="ON" -DCMAKE_INSTALL_PREFIX="" -DBUILDCFG_LUA_VERSION="5.3" ${CMAKE_COMPILER} ${PRJ_DIR}
make
${JONCHKI} --verbose info --syscfg ${PRJ_DIR}/jonchki/jonchkisys.cfg --prjcfg ${PRJ_DIR}/jonchki/jonchkicfg.xml ${JONCHKI_SYSTEM} --build-dependencies lua5.3-lua-term-*.xml
popd

# Build the LUA5.3 version.
pushd ${BUILD_DIR}/lua5.3
cmake -DBUILDCFG_ONLY_JONCHKI_CFG="OFF" -DBUILDCFG_LUA_USE_SYSTEM="OFF" -DCMAKE_INSTALL_PREFIX="" -DBUILDCFG_LUA_VERSION="5.3" ${CMAKE_COMPILER} ${CMAKE_PATHS} ${PRJ_DIR}
make
popd
