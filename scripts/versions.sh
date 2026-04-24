#!/usr/bin/env bash
# save as versions.sh
# chmod +x versions.sh
# run: ./versions.sh

set -u

print_row() {
  printf "%-22s %s\n" "$1" "$2"
}

cmd_exists() {
  command -v "$1" >/dev/null 2>&1
}

# ----------------------------
# ZSH
# ----------------------------
get_zsh() {
  if cmd_exists zsh; then
    zsh --version | head -n1
  else
    echo "Not Installed"
  fi
}

# ----------------------------
# Neovim (shows commit if built from source)
# ----------------------------
get_nvim() {
  if cmd_exists nvim; then
    local ver commit
    ver=$(nvim --version | sed -n '1p')
    commit=$(nvim --version | grep -i "build type\|commit" | head -n1)

    if nvim --version | grep -qi "commit"; then
      echo "$ver | $(nvim --version | grep -i commit | head -n1 | xargs)"
    else
      echo "$ver"
    fi
  else
    echo "Not Installed"
  fi
}

# ----------------------------
# Alacritty (shows commit if available)
# ----------------------------
get_alacritty() {
  if cmd_exists alacritty; then
    alacritty --version | head -n1
  else
    echo "Not Installed"
  fi
}

# ----------------------------
# Ripgrep
# ----------------------------
get_rg() {
  if cmd_exists rg; then
    rg --version | head -n1
  else
    echo "Not Installed"
  fi
}

# ----------------------------
# Tmux
# ----------------------------
get_tmux() {
  if cmd_exists tmux; then
    tmux -V
  else
    echo "Not Installed"
  fi
}

# ----------------------------
# Betterlockscreen
# ----------------------------
get_bls() {
  if cmd_exists betterlockscreen; then
    betterlockscreen -v 2>/dev/null | head -n2 | cut -d ' ' -f 2- | tr '\n' ' ' | xargs
  else
    echo "Not Installed"
  fi
}

# ----------------------------
# Polybar (shows git hash if source build)
# ----------------------------
get_polybar() {
  if cmd_exists polybar; then
    polybar --version | head -n3 | tr '\n' ' ' | sed 's/  */ /g'
  else
    echo "Not Installed"
  fi
}

# ----------------------------
# Rofi
# ----------------------------
get_rofi() {
  if cmd_exists rofi; then
    rofi -version | head -n1
  else
    echo "Not Installed"
  fi
}

# ----------------------------
# Nerd Font
# ----------------------------
get_nerdfont() {
  if fc-list | grep -iq "Nerd Font"; then
    fc-list | grep -i "Nerd Font" | head -n1 | cut -d: -f2 | xargs
  else
    echo "Not Installed"
  fi
}

# ----------------------------
# NvChad (git commit if repo)
# ----------------------------
get_nvchad() {
  local dir="$HOME/.config/nvim"

  if [ -d "$dir/.git" ]; then
    local commit branch
    commit=$(git -C "$dir" rev-parse --short HEAD 2>/dev/null)
    branch=$(git -C "$dir" rev-parse --abbrev-ref HEAD 2>/dev/null)
    echo "Git Repo | branch=$branch | commit=$commit"
  elif [ -f "$dir/lua/chadrc.lua" ]; then
    echo "Installed (non-git)"
  else
    echo "Not Detected"
  fi
}

# ----------------------------
# Polybar Themes
# ----------------------------
get_polybar_themes() {
  if [ -d "$HOME/.config/polybar" ]; then
    if [ -d "$HOME/.config/polybar/.git" ]; then
      git -C "$HOME/.config/polybar" rev-parse --short HEAD 2>/dev/null
    else
      echo "Config Present"
    fi
  else
    echo "Not Detected"
  fi
}

# ----------------------------
# Rofi Themes
# ----------------------------
get_rofi_themes() {
  if [ -d "$HOME/.config/rofi/.git" ]; then
    git -C "$HOME/.config/rofi" rev-parse --short HEAD 2>/dev/null
  elif [ -d "$HOME/.config/rofi" ] || [ -d /usr/share/rofi/themes ]; then
    echo "Available"
  else
    echo "Not Detected"
  fi
}

echo "=========================================================="
echo "               Installed Tools + Build Info"
echo "=========================================================="
echo

print_row "ZSH" "$(get_zsh)"
print_row "Neovim" "$(get_nvim)"
print_row "Alacritty" "$(get_alacritty)"
print_row "Ripgrep" "$(get_rg)"
print_row "Tmux" "$(get_tmux)"
print_row "NerdFont" "$(get_nerdfont)"
print_row "NvChad" "$(get_nvchad)"
print_row "Polybar" "$(get_polybar)"
print_row "Polybar Themes" "$(get_polybar_themes)"
print_row "Betterlockscreen" "$(get_bls)"
print_row "Rofi" "$(get_rofi)"
print_row "Rofi Themes" "$(get_rofi_themes)"

echo
echo "=========================================================="
