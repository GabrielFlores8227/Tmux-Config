# ⭐ Tmux Setup

This repository contains my personal tmux configuration files. Tmux is a terminal multiplexer that allows me to manage multiple terminal sessions within a single window. With this configuration, I have customized my tmux setup to enhance my productivity and streamline my workflow.

## 📝 List of Plugins

- TPM (Tmux Plugin Manager)
- Tmux Sensible
- Dracula (with powerline and additional plugins for CPU usage, GPU usage, and RAM usage)

## ⚡ Quick Installation (Beta)
Streamline the process of configuring Tmux and its plugins on Unix systems with the help of `unix-driver.sh`. The script will install Tmux, plugins, and required packages.

```bash
git clone https://github.com/GabrielFlores8227/Tmux-Config && chmod +x ./Tmux-Config/unix-driver.sh && ./Config-Config/unix-driver.sh
```

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

 ### License

This script is licensed under the [MIT License](LICENSE).

Feel free to use, modify, and distribute this script as per the terms of the license.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

---

For more information about Tmux and its features, please refer to the official [Tmux documentation](https://github.com/tmux/tmux/wiki).
