#!/bin/sh

# Default params
export BUILD_DIR="./build/Release"
export TRAVIS_OS_NAME="osx"
export MY_PLATFORM="arm64"
export TRAVIS="TRUE"

# Versions
export ELECTRON_VER="12.2.3"
export TRAVIS_TAG="1.3.0"
export VLC_VER="3.0.16"

# Other
export WCJS_FULL_ARCHIVE=WebChimera.js_${TRAVIS_TAG}_electron_v${ELECTRON_VER}_VLC_v${VLC_VER}_${MY_PLATFORM}_${TRAVIS_OS_NAME}.tar.gz
export WCJS_ARCHIVE=WebChimera.js_electron_v${ELECTRON_VER}_${MY_PLATFORM}_${TRAVIS_OS_NAME}.zip
export WCJS_FULL_ARCHIVE_PATH=$BUILD_DIR/$WCJS_FULL_ARCHIVE
export WCJS_ARCHIVE_PATH=$BUILD_DIR/$WCJS_ARCHIVE

./travis_before_install.sh
npm install
./travis_before_deploy.sh