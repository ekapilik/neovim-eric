#!/usr/bin/bash

export NVIM_ERIC=~/.config/nvim-eric

#rm -rf $NVIM_ERIC

export NVIM_ERIC_SHARE=$NVIM_ERIC/share
export NVIM_ERIC_NVIM=$NVIM_ERIC/nvim

mkdir -p $NVIM_ERIC_SHARE
mkdir -p $NVIM_ERIC_NVIM

pushd $(dirname "${BASH_SOURCE[0]}") >/dev/null
stow --restow --target="$NVIM_ERIC_NVIM" . 
popd >/dev/null

alias nv='XDG_DATA_HOME=$NVIM_ERIC_SHARE XDG_CONFIG_HOME=$NVIM_ERIC nvim'
