#!/bin/bash
set -euo pipefail

sudo apt-get update
sudo apt-get install -y \
  build-essential \
  fzf \
  bat

# Build and install neovim
if ! command -v nvim &> /dev/null; then
  # Dependencies
  sudo apt-get install -y ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen

  rm -rf /tmp/neovim
  mkdir -p /tmp/neovim
  pushd /tmp/neovim

  git clone -b stable https://github.com/neovim/neovim . --depth=1
  make -j$(grep processor /proc/cpuinfo | wc -l) CMAKE_BUILD_TYPE=Release
  sudo make install

  popd
fi

if ! command -v nvim &> /dev/null; then
  echo nvim build/installation failed.
  exit 1
fi


