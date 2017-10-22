#! /bin/bash
set -e

#-----------------------------------------------------------------------------
#
# Build all artefacts.
#
pushd build
rm -rf com.github.hoelzro-lua5.1-lua-term
rm -rf com.github.hoelzro-lua5.2-lua-term
rm -rf com.github.hoelzro-lua5.3-lua-term
rm -rf lua5.1
rm -rf lua5.2
rm -rf lua5.3

mkdir com.github.hoelzro-lua5.1-lua-term
mkdir com.github.hoelzro-lua5.2-lua-term
mkdir com.github.hoelzro-lua5.3-lua-term
mkdir -p lua5.1/windows_x86
mkdir -p lua5.1/windows_x86_64
mkdir -p lua5.1/ubuntu_1404_x86
mkdir -p lua5.1/ubuntu_1404_x86_64
mkdir -p lua5.1/ubuntu_1604_x86
mkdir -p lua5.1/ubuntu_1604_x86_64
mkdir -p lua5.1/ubuntu_1704_x86
mkdir -p lua5.1/ubuntu_1704_x86_64
mkdir -p lua5.2/windows_x86
mkdir -p lua5.2/windows_x86_64
mkdir -p lua5.2/ubuntu_1404_x86
mkdir -p lua5.2/ubuntu_1404_x86_64
mkdir -p lua5.2/ubuntu_1604_x86
mkdir -p lua5.2/ubuntu_1604_x86_64
mkdir -p lua5.2/ubuntu_1704_x86
mkdir -p lua5.2/ubuntu_1704_x86_64
mkdir -p lua5.3/windows_x86
mkdir -p lua5.3/windows_x86_64
mkdir -p lua5.3/ubuntu_1404_x86
mkdir -p lua5.3/ubuntu_1404_x86_64
mkdir -p lua5.3/ubuntu_1604_x86
mkdir -p lua5.3/ubuntu_1604_x86_64
mkdir -p lua5.3/ubuntu_1704_x86
mkdir -p lua5.3/ubuntu_1704_x86_64



tar --extract --directory lua5.1/windows_x86 --file build_windows_x86_lua5.1.tar.gz --gzip
tar --extract --directory lua5.2/windows_x86 --file build_windows_x86_lua5.2.tar.gz --gzip
tar --extract --directory lua5.3/windows_x86 --file build_windows_x86_lua5.3.tar.gz --gzip

tar --extract --directory lua5.1/windows_x86_64 --file build_windows_x86_64_lua5.1.tar.gz --gzip
tar --extract --directory lua5.2/windows_x86_64 --file build_windows_x86_64_lua5.2.tar.gz --gzip
tar --extract --directory lua5.3/windows_x86_64 --file build_windows_x86_64_lua5.3.tar.gz --gzip

tar --extract --directory lua5.1/ubuntu_1404_x86 --file build_ubuntu_1404_x86_lua5.1.tar.gz --gzip
tar --extract --directory lua5.2/ubuntu_1404_x86 --file build_ubuntu_1404_x86_lua5.2.tar.gz --gzip
tar --extract --directory lua5.3/ubuntu_1404_x86 --file build_ubuntu_1404_x86_lua5.3.tar.gz --gzip

tar --extract --directory lua5.1/ubuntu_1404_x86_64 --file build_ubuntu_1404_x86_64_lua5.1.tar.gz --gzip
tar --extract --directory lua5.2/ubuntu_1404_x86_64 --file build_ubuntu_1404_x86_64_lua5.2.tar.gz --gzip
tar --extract --directory lua5.3/ubuntu_1404_x86_64 --file build_ubuntu_1404_x86_64_lua5.3.tar.gz --gzip

tar --extract --directory lua5.1/ubuntu_1604_x86 --file build_ubuntu_1604_x86_lua5.1.tar.gz --gzip
tar --extract --directory lua5.2/ubuntu_1604_x86 --file build_ubuntu_1604_x86_lua5.2.tar.gz --gzip
tar --extract --directory lua5.3/ubuntu_1604_x86 --file build_ubuntu_1604_x86_lua5.3.tar.gz --gzip

tar --extract --directory lua5.1/ubuntu_1604_x86_64 --file build_ubuntu_1604_x86_64_lua5.1.tar.gz --gzip
tar --extract --directory lua5.2/ubuntu_1604_x86_64 --file build_ubuntu_1604_x86_64_lua5.2.tar.gz --gzip
tar --extract --directory lua5.3/ubuntu_1604_x86_64 --file build_ubuntu_1604_x86_64_lua5.3.tar.gz --gzip

tar --extract --directory lua5.1/ubuntu_1704_x86 --file build_ubuntu_1704_x86_lua5.1.tar.gz --gzip
tar --extract --directory lua5.2/ubuntu_1704_x86 --file build_ubuntu_1704_x86_lua5.2.tar.gz --gzip
tar --extract --directory lua5.3/ubuntu_1704_x86 --file build_ubuntu_1704_x86_lua5.3.tar.gz --gzip

tar --extract --directory lua5.1/ubuntu_1704_x86_64 --file build_ubuntu_1704_x86_64_lua5.1.tar.gz --gzip
tar --extract --directory lua5.2/ubuntu_1704_x86_64 --file build_ubuntu_1704_x86_64_lua5.2.tar.gz --gzip
tar --extract --directory lua5.3/ubuntu_1704_x86_64 --file build_ubuntu_1704_x86_64_lua5.3.tar.gz --gzip

popd


pushd build/com.github.hoelzro-lua5.1-lua-term
cmake -DCMAKE_INSTALL_PREFIX="" ../../lua-term/installer/lua5.1
make
make package
python2.7 ../../cmake/tools/generate_hash.py targets/jonchki/repository/com/github/hoelzro/lua-term/*/lua5.1-lua-term-*.xml
python2.7 ../../cmake/tools/generate_hash.py targets/jonchki/repository/com/github/hoelzro/lua-term/*/lua5.1-lua-term-*.tar.xz
popd

pushd build/com.github.hoelzro-lua5.2-lua-term
cmake -DCMAKE_INSTALL_PREFIX="" ../../lua-term/installer/lua5.2
make
make package
python2.7 ../../cmake/tools/generate_hash.py targets/jonchki/repository/com/github/hoelzro/lua-term/*/lua5.2-lua-term-*.xml
python2.7 ../../cmake/tools/generate_hash.py targets/jonchki/repository/com/github/hoelzro/lua-term/*/lua5.2-lua-term-*.tar.xz
popd

pushd build/com.github.hoelzro-lua5.3-lua-term
cmake -DCMAKE_INSTALL_PREFIX="" ../../lua-term/installer/lua5.3
make
make package
python2.7 ../../cmake/tools/generate_hash.py targets/jonchki/repository/com/github/hoelzro/lua-term/*/lua5.3-lua-term-*.xml
python2.7 ../../cmake/tools/generate_hash.py targets/jonchki/repository/com/github/hoelzro/lua-term/*/lua5.3-lua-term-*.tar.xz
popd
