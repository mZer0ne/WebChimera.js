#!/bin/sh

if [ ! $TRAVIS ]; then
  exit 1
fi

if [ ! $MY_PLATFORM ]; then
  export MY_PLATFORM="intel64"
fi

if [ "$TRAVIS_OS_NAME" = "osx" ]; then
  curl -L -o ./deps/vlc-$VLC_VER-$MY_PLATFORM.dmg https://get.videolan.org/vlc/$VLC_VER/macosx/vlc-$VLC_VER-$MY_PLATFORM.dmg --insecure
  hdiutil mount ./deps/vlc-$VLC_VER-$MY_PLATFORM.dmg
  cp -R "/Volumes/VLC media player/VLC.app" ./deps
fi
