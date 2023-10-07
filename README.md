<div align="center">
  <img src='https://github.com/GabrielFlores8227/GabrielFlores8227/blob/main/global-assets/Tmux-Config/image.png' height='50'>
</div>

<h1 align="center">
  My Tmux .tmux.conf
</h1>

<p align="center">
  This repository contains Tmux configuration file (.tmux.conf)
</p>

<p align="center">
  <img src="https://img.shields.io/badge/version-2.0.0-blue" alt="version">
</p>

##  🖥️ Demo

This repository contains my personal tmux configuration files. Tmux is a terminal multiplexer that allows me to manage multiple terminal sessions within a single window. With this configuration, I have customized my tmux setup to enhance my productivity and streamline my workflow.

![GIF](https://github.com/GabrielFlores8227/GabrielFlores8227/blob/main/global-assets/Tmux-Config/image.gif)

## 📝 List of Plugins

- TPM (Tmux Plugin Manager)
  
- Tmux Sensible
  
- Dracula (with powerline and additional plugins for CPU usage, GPU usage, and RAM usage)

## ⚠️ Required Packages

- NerdFonts

## ⚡ Quick Installation

The unix-driver.sh script is designed to automate the setup of Tmux and its plugins on Unix systems. This efficient script handles the installation of Tmux, essential plugins, and any required dependencies, all while managing necessary sudo privileges.

### 📦 Dependencies to be Installed

- [Latest Curl Script](https://github.com/GabrielFlores8227/Linux-Packages/blob/main/latest-curl/latest-curl.sh)

- [Latest Unzip Script](https://github.com/GabrielFlores8227/Linux-Packages/blob/main/latest-unzip/latest-unzip.sh)

- [Latest Wget Script](https://github.com/GabrielFlores8227/Linux-Packages/blob/main/latest-wget/latest-wget.sh) (currently commented out)

- [Latest Nerd Fonts (Anonymous Pro) Script](https://github.com/GabrielFlores8227/Linux-Packages/blob/main/latest-nerdfonts-anonymouspro/latest-nerdfonts-anonymouspro.sh)
  
- [Latest Git Script](https://github.com/GabrielFlores8227/Linux-Packages/blob/main/latest-git/latest-git.sh)

- [Latest Tmux Script](https://github.com/GabrielFlores8227/Linux-Packages/blob/main/latest-tmux/latest-tmux.sh)
  
- [Latest Tpm Script](https://github.com/GabrielFlores8227/Linux-Packages/blob/main/latest-tpm/latest-tpm.sh)
  
- [.tmux.conf](https://github.com/GabrielFlores8227/Tmux-Config/blob/main/.tmux.conf) (installed via wget)

### ⚡ Execute

```bash
git clone https://github.com/GabrielFlores8227/Tmux-Config \
&& chmod +x ./Tmux-Config/linux-driver.sh \
&& ./Tmux-Config/linux-driver.sh
```

(Optional) This command uses sed to insert the provided script at line 1 of the .bashrc file. This will ensure that it's executed right at the beginning when you open a new terminal session.

```bash
sed -i '1iif command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then exec tmux; fi' ~/.bashrc
```

To install the plugins, you simply need to run the tmux command prefix + I (which means pressing Ctrl + b followed by Shift + I). This line tells TPM to install the tmux-resurrect plugin from the tmux-plugins GitHub repository.

## 📎 Keybindings

- Copy mode: `Ctrl+Shift+C`
- Enable mouse support: `Ctrl+b` followed by `:` and enter `set -g mouse on`
- Pane navigation:
  - Vertical split: `Ctrl+b` followed by `v`
  - Horizontal split: `Ctrl+b` followed by `h`
- Switch to the next pane: `Ctrl+s`
- Status line configuration: The background is set to the default color.

## 💻 Copy [.tmux.conf](https://github.com/GabrielFlores8227/Tmux-Config/blob/main/.tmux.conf)

```conf
# Copy mode key binding
bind-key -n "C-S-c" copy-mode

# Enable mouse support
set -g mouse on

# Pane navigation (Replace C-w to C+s)
unbind-key C-w
bind-key C-s select-pane -t :.+
bind-key -n C-s select-pane -t :.+

# Create a new vertical pane
bind-key -n C-v split-window

# Create a new horizontal pane
bind-key -n C-h split-window -h

# Status line configuration
set -g status-bg default


# List of plugins
set -g @plugin 'tmux-plugins/tpm'

set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @dracula-show-powerline true
set -g @dracula-plugins "cpu-usage gpu-usage ram-usage"
set -g @plugin 'dracula/tmux'

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
```

## 📖 License

This script is licensed under the MIT License.

Feel free to use, modify, and distribute this script as per the terms of the license.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
