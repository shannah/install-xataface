#!/bin/bash
set -e
XATAFACE_ROOT=$HOME/xataface
XATAFACE_BIN=$XATAFACE_ROOT/bin
if [ ! -d "$XATAFACE_ROOT" ]; then
	cd $HOME
	if [ -x "$(command -v git)" ]; then
		git clone https://github.com/shannah/xataface xataface
	else
		echo "git was not found.  Using curl to download swete from github master"
		curl -fsSL https://github.com/shannah/xataface/archive/master.zip > .xataface-master.zip
		unzip .xataface-master.zip
		rm .xataface-master.zip
		mv .xataface-master .swete
	fi
else
	echo "Xataface is already installed at $XATAFACE_ROOT"
fi
if [[ ":$PATH:" == *":$XATAFACE_BIN:"* ]]; then
	echo "$XATAFACE_BIN is already in your PATH"
else
	echo "Adding $XATAFACE_BIN to your path in $HOME/.bash_profile"
  	echo "export PATH=$XATAFACE_BIN:$PATH" >> $HOME/.bash_profile
fi