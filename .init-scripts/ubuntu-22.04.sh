#!/bin/bash
set -euo pipefail

# use faster apt mirror
sudo sed -i.bak -r 's!http://(jp\.)?archive\.ubuntu\.com/ubuntu/?!https://linux.yz.yamagata-u.ac.jp/ubuntu/!g' /etc/apt/sources.list

# apt packages
sudo apt-get update
sudo apt-get install -y \
  build-essential \
  fzf \
  bat \
  direnv

# Starship
if ! command -v starship &> /dev/null; then
  curl -sS https://starship.rs/install.sh | sh -s -- -y
  env -i bash -i -c "$(cat<<EOF
    source .bashrc;
    if [ -z $STARSHIP_SHELL ]; then 
      echo Starship is not setup correctly. Terminating.
      exit 1;
    fi
EOF
  )"
fi

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


