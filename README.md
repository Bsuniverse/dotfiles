# Dotfiles

After cloning this repo, run `install` to automatically set up the development
environment. Note that the install script is idempotent: it can safely be run
multiple times.

For the color scheme to look right, you will also need terminal-specific
support. The configuration for that, along with a whole bunch of other
machine-specific configuration, is located in [dotfiles-local][dotfiles-local].

## Features

- 🚀 One-click installation powered by [Dotbot](https://github.com/anishathalye/dotbot)
- 🔧 Complete terminal development environment:
  - 💻 Beautiful and efficient shell with zsh + [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
  - 📂 Modern file management experience with [yazi](https://github.com/sxyazi/yazi)
  - 🌳 Elegant Git operations through [lazygit](https://github.com/jesseduffield/lazygit)
  - ⚡ Powerful Neovim setup based on [lazyvim](https://github.com/LazyVim/LazyVim)
- 🔌 Use submodules dependency with simple and intuitive zsh/tmux/vim plugin management
- 🍺 Consistent package management experience with [Homebrew](https://brew.sh/) on Linux(x86) and macOS
- ⚙️ Modern terminal toolchain integration (eza/bat/delta/yazi and more)

## Installation Guide

### Prerequisites

- 🚫 Note: Homebrew is not supported on ARM Linux

- ⛑️ Git and zsh must be pre-installed

  ```bash
  # Ubuntu example
  sudo apt update && sudo apt install git zsh -y
  ```

- ⚠️ Homebrew cannot be installed as root on Linux

  ```bash
  # Create a new user if needed
  NEW_USER_NAME=alex
  sudo useradd -m -s /bin/bash -G users,sudo $NEW_USER_NAME && sudo passwd $NEW_USER_NAME
  ```

### Quick Start

1. Clone the repository

   ```bash
   git clone https://github.com/insv23/dotfiles.git ~/.dotfiles && cd ~/.dotfiles
   ```

2. Run the installation script

   ```bash
   ./install
   ```

   If some files already exist, remove them first:

   ```bash
   rm -f ~/.profile ~/.bashrc ~/.gitconfig && ./install
   ```

   After installation, log out of your current user session and log back in for the configuration to take effect automatically.

