#!/bin/bash

################################################################################
# This script is licensed under the MIT License.                               #
#                                                                            #
# MIT License                                                                #
#                                                                            #
# Permission is hereby granted, free of charge, to any person obtaining a    #
# copy of this software and associated documentation files (the "Software"), #
# to deal in the Software without restriction, including without limitation  #
# the rights to use, copy, modify, merge, publish, distribute, sublicense,   #
# and/or sell copies of the Software, and to permit persons to whom the      #
# Software is furnished to do so, subject to the following conditions:       #
#                                                                            #
# The above copyright notice and this permission notice shall be included    #
# in all copies or substantial portions of the Software.                     #
#                                                                            #
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS    #
# OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,#
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL    #
# THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER #
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING    #
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER        #
# DEALINGS IN THE SOFTWARE.                                                  #
################################################################################

#---Detector-----------------------------------------------------------------------------------------
# Detect the package manager
if command -v apt >/dev/null; then
  package_manager="apt"
elif command -v yum >/dev/null; then
  package_manager="yum"
elif command -v dnf >/dev/null; then
  package_manager="dnf"
elif command -v pacman >/dev/null; then
  package_manager="pacman"
elif command -v zypper >/dev/null; then
  package_manager="zypper"
elif command -v brew >/dev/null; then
  package_manager="brew"
else
  echo -e "\n\033[0;37;41m[x] Package manager not found\033[0m"
  exit 1
fi

#---Functions----------------------------------------------------------------------------------------
# Install Git
function gitDriver() {
  if [[ "$package_manager" == "apt" ]]; then
    sudo apt-get install -y git
  elif [[ "$package_manager" == "yum" || "$package_manager" == "dnf" ]]; then
    sudo $package_manager install -y git
  elif [[ "$package_manager" == "pacman" ]]; then
    sudo pacman -S --noconfirm git
  elif [[ "$package_manager" == "zypper" ]]; then
    sudo zypper install -y git
  elif [[ "$package_manager" == "brew" ]]; then
    brew install git
  fi
}

function tmuxDriver() {
  if [[ "$package_manager" == "apt" ]]; then
    sudo apt-get install -y tmux
  elif [[ "$package_manager" == "yum" || "$package_manager" == "dnf" ]]; then
    sudo $package_manager install -y tmux
  elif [[ "$package_manager" == "pacman" ]]; then
    sudo pacman -S --noconfirm tmux
  elif [[ "$package_manager" == "zypper" ]]; then
    sudo zypper install -y tmux
  elif [[ "$package_manager" == "brew" ]]; then
    brew install tmux
  fi
}

function executeDriver() {
      echo -e "\n\n\033[0;37;43m[*] Installing $1\033[m" \
      && eval $2 \
      && echo -e "\n\033[0;37;42m[v] $1 is installed | PRESS ENTER TO CONTINUE\033[0m" && read -sp "" \
      || echo -e "\n\033[0;37;41m[x] $1 could not be installed | PRESS ENTER TO CONTINUE\033[0m" && read -sp ""
}

#---Main---------------------------------------------------------------------------------------------
executeDriver "git" "gitDriver"
executeDriver "tmux" "tmuxDriver"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && chmod +x ~/.tmux/plugins/tpm/tpm && ~/.tmux/plugins/tpm/tpm 
git clone https://github.com/GabrielFlores8227/Tmux-Config && mv Tmux-Config/.tmux.conf ~/ && tmux source ~/.tmux.conf

