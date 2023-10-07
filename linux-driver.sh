#!/bin/bash

################################################################################
# This script is licensed under the MIT License.                               #
#                                                                              #
# MIT License                                                                  #
#                                                                              #
# Permission is hereby granted, free of charge, to any person obtaining a      #
# copy of this software and associated documentation files (the "Software"),   #
# to deal in the Software without restriction, including without limitation    #
# the rights to use, copy, modify, merge, publish, distribute, sublicense,     #
# and/or sell copies of the Software, and to permit persons to whom the        #
# Software is furnished to do so, subject to the following conditions:         #
#                                                                              #
# The above copyright notice and this permission notice shall be included      #
# in all copies or substantial portions of the Software.                       #
#                                                                              #
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS      #
# OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,  #
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL      #
# THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER   #
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING      #
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER          #
# DEALINGS IN THE SOFTWARE.                                                    #
################################################################################

##
# Function
##

function convert_url() {
    local url=$1
    local raw_url=${url/blob\/main/raw\/main}
    echo "$raw_url"
}

function get_package_name() {
  local url=$1
  local filename=$(basename "$url")
  echo "$filename"
}

function download_and_install() {
  local converted_url=$(convert_url $1)
  local package_name=$(get_package_name $converted_url)
  local destination="/tmp/$(date +'%Y%m%d%H%M%S%N' | cut -b1-17).sh"

  echo -e "\n\n\033[0;37;43m[*] Downloading $package_name | $destination\033[m\n"

  wget -O $destination $converted_url \
  && chmod +x $destination 

  $destination
}

##
# Execute
##

echo -e "\n\033[0;37;43m[*] Some operations may require root privileges to install required dependencies | PRESS ENTER TO CONTINUE\033[0m" && read -sp ""
echo -e "\n"

if command -v apt >/dev/null; then
    sudo apt update -y && sudo apt-get install wget -y
elif command -v yum >/dev/null; then
    sudo yum update -y && sudo yum install wget -y
else
    exit 1
fi

# curl
download_and_install "https://github.com/GabrielFlores8227/Linux-Packages/blob/main/latest-curl/latest-curl.sh"

# unzip
download_and_install "https://github.com/GabrielFlores8227/Linux-Packages/blob/main/latest-unzip/latest-unzip.sh"

# wget
# download_and_install "https://github.com/GabrielFlores8227/Linux-Packages/blob/main/latest-wget/latest-wget.sh"

# nerd-fonts (anonymouspro)
download_and_install "https://github.com/GabrielFlores8227/Linux-Packages/blob/main/latest-nerdfonts-anonymouspro/latest-nerdfonts-anonymouspro.sh"

# git
download_and_install "https://github.com/GabrielFlores8227/Linux-Packages/blob/main/latest-git/latest-git.sh"

# tmux
download_and_install "https://github.com/GabrielFlores8227/Linux-Packages/blob/main/latest-tmux/latest-tmux.sh"

# tmp
download_and_install "https://github.com/GabrielFlores8227/Linux-Packages/blob/main/latest-tpm/latest-tpm.sh"

# neovim plugs
echo -e "\n\n\033[0;37;43m[*] Downloading .tmux.conf | $HOME/.tmux.conf\033[m\n"
wget -P $HOME $(convert_url "https://github.com/GabrielFlores8227/Tmux-Config/blob/main/.tmux.conf") \
&& echo -e "\n\033[0;37;42m[v] .tmux.conf is installed | PRESS ENTER TO CONTINUE\033[0m" && read -sp "" \
|| echo -e "\n\033[0;37;41m[x] .tmux.conf could not be installed | PRESS ENTER TO CONTINUE\033[0m" && read -sp ""
