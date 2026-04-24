#!/usr/bin/env bash
# save as versions.sh
# chmod +x versions.sh
# run: ./versions.sh
#
# Generates:
#   VERSIONS.md

set -u

OUTFILE="VERSIONS.md"

cmd_exists() {
  command -v "$1" >/dev/null 2>&1
}

escape_md() {
  echo "$1" | sed 's/|/\\|/g'
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
# Neovim
# ----------------------------
get_nvim() {
  if cmd_exists nvim; then
    if nvim --version | grep -qi commit; then
      echo "$(nvim --version | sed -n '1p') | $(nvim --version | grep -i commit | head -n1 | xargs)"
    else
      nvim --version | sed -n '1p'
    fi
  else
    echo "Not Installed"
  fi
}

# ----------------------------
# Alacritty
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
# NvChad
# ----------------------------
get_nvchad() {
  local dir="$HOME/.config/nvim"

  if [ -d "$dir/.git" ]; then
    local commit branch
    commit=$(git -C "$dir" rev-parse --short HEAD 2>/dev/null)
    branch=$(git -C "$dir" rev-parse --abbrev-ref HEAD 2>/dev/null)
    echo "Git Repo (branch=$branch, commit=$commit)"
  elif [ -f "$dir/lua/chadrc.lua" ]; then
    echo "Installed (non-git)"
  else
    echo "Not Detected"
  fi
}

# ----------------------------
# Polybar
# ----------------------------
get_polybar() {
  if cmd_exists polybar; then
    polybar --version | head -n3 | tr '\n' ' ' | xargs
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
# Polybar Themes
# ----------------------------
get_polybar_themes() {
  if [ -d "$HOME/.config/polybar/.git" ]; then
    git -C "$HOME/.config/polybar" rev-parse --short HEAD 2>/dev/null
  elif [ -d "$HOME/.config/polybar" ]; then
    echo "Config Present"
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

# ----------------------------
# Tmuxinator
# ----------------------------
get_tmuxinator() {
  if cmd_exists tmuxinator; then
    tmuxinator version | head -n1
  else
    echo "Not Installed"
  fi
}

# ----------------------------
# FZF
# ----------------------------
get_fzf() {
  if cmd_exists fzf --version; then
    fzf --version | head -n1
  else
    echo "Not Installed"
  fi
}

# ----------------------------
# Write Markdown File
# ----------------------------
{
  echo "# Installed Tools Versions"
  echo
  echo "_Generated on $(date)_"
  echo
  echo "| Tool | Version / Build Info |"
  echo "|------|-----------------------|"

  echo "| ZSH | $(escape_md "$(get_zsh)") |"
  echo "| Neovim | $(escape_md "$(get_nvim)") |"
  echo "| Alacritty | $(escape_md "$(get_alacritty)") |"
  echo "| Ripgrep | $(escape_md "$(get_rg)") |"
  echo "| Tmux | $(escape_md "$(get_tmux)") |"
  echo "| NerdFont | $(escape_md "$(get_nerdfont)") |"
  echo "| NvChad | $(escape_md "$(get_nvchad)") |"
  echo "| Polybar | $(escape_md "$(get_polybar)") |"
  echo "| Polybar Themes | $(escape_md "$(get_polybar_themes)") |"
  echo "| Betterlockscreen | $(escape_md "$(get_bls)") |"
  echo "| Rofi | $(escape_md "$(get_rofi)") |"
  echo "| Rofi Themes | $(escape_md "$(get_rofi_themes)") |"
  echo "| Tmuxinator | $(escape_md "$(get_tmuxinator)") |"
  echo "| Fzf | $(escape_md "$(get_fzf)") |"

} >"$OUTFILE"

echo "Generated $OUTFILE"
