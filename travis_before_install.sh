#!/bin/sh

if [ ! $TRAVIS ]
then
	exit 1
fi

if [ "$TRAVIS_OS_NAME" = "osx" ]; then
  curl -L -o ./deps/vlc-$VLC_VER-intel64.dmg http://get.videolan.org/vlc/$VLC_VER/macosx/vlc-$VLC_VER-intel64.dmg
  hdiutil mount ./deps/vlc-$VLC_VER-intel64.dmg
  cp -R "/Volumes/VLC media player/VLC.app" ./deps
fi