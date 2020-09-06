#!/bin/sh

if [ -d .git ]; then
  git describe --always --tags --dirty > version # get version from git
else
  echo 0.7.2 > version # hard coded versions
fi

libtoolize
aclocal
autoconf
automake --add-missing

#CONFIGDIR=$XDG_CONFIG_HOME/cava2

#if [ -z "$XDG_CONFIG_HOME" ]; then CONFIGDIR=$HOME/.config/cava2; fi

mkdir -p "/home/volumio/.config/cava2"
[ -f "/home/volumio/.config/cava2/config ] || cp example_files/config "/home/volumio/.config/cava2/config
