# Tmux Configuration

This repository contains a configuration file for Tmux that includes keybindings and plugins.

## Installation

### Windows

1. Install Tmux:
   - Download the Windows installer from the [Tmux GitHub repository](https://github.com/tmux/tmux/releases).
   - Run the installer and follow the installation instructions.

2. Copy the provided configuration:
   - Download the `tmux.conf` file from this repository.
   - Place the `tmux.conf` file in your user directory (usually `C:\Users\YourUsername`).

3. Install Tmux Plugin Manager (TPM):
   - Open a command prompt.
   - Run the following command:
     ```
     git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
     ```

4. Launch Tmux:
   - Open a command prompt.
   - Run the following command:
     ```
     tmux
     ```
   - Tmux will read the configuration from the `tmux.conf` file.

### Linux and macOS

1. Install Tmux:
   - Linux: Use your package manager to install Tmux. For example, on Ubuntu, run `sudo apt-get install tmux`.
   - macOS: Use Homebrew to install Tmux. Run `brew install tmux` in Terminal.

2. Copy the provided configuration:
   - Download the `tmux.conf` file from this repository.
   - Place the `tmux.conf` file in your home directory (e.g., `~/.tmux.conf`).

3. Install Tmux Plugin Manager (TPM):
   - Open a terminal.
   - Run the following command:
     ```
     git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
     ```

4. Launch Tmux:
   - Open a terminal.
   - Run the following command:
     ```
     tmux
     ```
   - Tmux will read the configuration from the `tmux.conf` file.

## Keybindings

- Copy mode: `Ctrl+Shift+C`
- Enable mouse support: `Ctrl+b` followed by `:` and enter `set -g mouse on`
- Pane navigation:
  - Vertical split: `Ctrl+b` followed by `v`
  - Horizontal split: `Ctrl+b` followed by `h`
- Switch to the next pane: `Ctrl+s`
- Status line configuration: The background is set to the default color.

## List of Plugins

- TPM (Tmux Plugin Manager)
- Tmux Sensible
- Dracula (with powerline and additional plugins for CPU usage, GPU usage, and RAM usage)

---

For more information about Tmux and its features, please refer to the official [Tmux documentation](https://github.com/tmux/tmux/wiki).
