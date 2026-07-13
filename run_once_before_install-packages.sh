#!/usr/bin/env sh
# Runs automatically on `chezmoi apply`, once, and again only if this file changes.
# Installs the tools dot_zshrc and the i3 configs expect. Idempotent.
set -e

sudo apt update
sudo apt install -y zsh tmux ripgrep fzf direnv bat i3 i3status dmenu feh rofi

# oh-my-zsh + powerlevel10k theme + external plugins the .zshrc loads
[ -d "$HOME/.oh-my-zsh" ] || \
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

ZC=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}
[ -d "$ZC/themes/powerlevel10k" ] || \
  git clone --depth=1 https://github.com/romkatv/powerlevel10k "$ZC/themes/powerlevel10k"
[ -d "$ZC/plugins/zsh-autosuggestions" ] || \
  git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions "$ZC/plugins/zsh-autosuggestions"

echo "Packages ready. Not installed here: nvim, alacritty binary, a NerdFont — see README."
