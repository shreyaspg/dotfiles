#!/bin/zsh

# --- Configuration ---
DMENU_PROMPT="Shortcuts:"
# -i = case insensitive search, -l 20 = 20 lines visible
DMENU_OPTIONS="-i -l 20 -p $DMENU_PROMPT"

# --- Shortcut List ---
# The parentheses create a subshell to collect all echo output before piping.
# Using 'printf' for consistent, neat columnar alignment.
(
printf "--- I3 WINDOW/WORKSPACE MANAGEMENT ---\n"
printf "%-25s | %-15s | %s\n" "\$mod + Enter" "i3" "Launch terminal (Alacritty)"
printf "%-25s | %-15s | %s\n" "\$mod + d" "i3" "Run application launcher (i3-dmenu-desktop)"
printf "%-25s | %-15s | %s\n" "\$mod + Shift + e" "i3" "Exit i3 session"
printf "%-25s | %-15s | %s\n" "\$mod + r" "i3" "Toggle resize mode"
printf "%-25s | %-15s | %s\n" "\$mod + h/j/k/l" "i3" "Focus left/down/up/right"
printf "%-25s | %-15s | %s\n" "\$mod + Shift + h/j/k/l" "i3" "Move focused window left/down/up/right"
printf "%-25s | %-15s | %s\n" "\$mod + 1-10" "i3" "Switch to Workspace 1-10"
printf "%-25s | %-15s | %s\n" "\$mod + Shift + 1-10" "i3" "Move current window to Workspace 1-10"
printf "%-25s | %-15s | %s\n" "\$mod + s" "i3" "Stacked layout"
printf "%-25s | %-15s | %s\n" "\$mod + w" "i3" "Tabbed layout"
printf "%-25s | %-15s | %s\n" "\$mod + e" "i3" "Split horizontal/vertical (toggle)"
printf "%-25s | %-15s | %s\n" "\$mod + f" "i3" "Toggle fullscreen"
printf "%-25s | %-15s | %s\n" "\$mod + Shift + q" "i3" "Close focused window"

printf "\n--- I3 CONFIG SHORTCUTS ---\n"
printf "%-25s | %-15s | %s\n" "\$mod + Shift + c" "i3" "Reload configuration file"
printf "%-25s | %-15s | %s\n" "\$mod + Shift + r" "i3" "Restart i3 inplace (preserves layout)"
printf "%-25s | %-15s | %s\n" "\$mod + Shift + space" "i3" "Toggle tiling / floating"
printf "%-25s | %-15s | %s\n" "\$mod + space" "i3" "Change focus tiling / floating"
printf "%-25s | %-15s | %s\n" "\$mod + a" "i3" "Focus the parent container"
printf "%-25s | %-15s | %s\n" "\$mod + Tab" "i3/Rofi" "Open Rofi window switcher"
printf "%-25s | %-15s | %s\n" "\$mod + t" "i3/Rofi" "Open Rofi application launcher (drun)"
printf "%-25s | %-15s | %s\n" "\$mod + F1" "i3/Script" "Show this Cheatsheet"
printf "%-25s | %-15s | %s\n" "\$mod + p" "i3" "Move workspace to next output (screen right)"
printf "%-25s | %-15s | %s\n" "\$mod + Shift + n" "Dunst" "Toggle notification pause"
printf "%-25s | %-15s | %s\n" "XF86AudioRaiseVolume" "Audio" "Increase volume by 10%"
printf "%-25s | %-15s | %s\n" "XF86AudioLowerVolume" "Audio" "Decrease volume by 10%"
printf "%-25s | %-15s | %s\n" "XF86AudioMute" "Audio" "Toggle volume mute"
printf "%-25s | %-15s | %s\n" "XF86AudioMicMute" "Audio" "Toggle microphone mute"

printf "\n--- ZSH ALIASES & TERMINAL ACTIONS ---\n"
printf "%-25s | %-15s | %s\n" "lock" "Zsh Alias" "Lock screen using i3lock"
printf "%-25s | %-15s | %s\n" "teams" "Zsh Alias" "Launch Google Teams PWA"
printf "%-25s | %-15s | %s\n" "extend" "Zsh Alias" "Extend display to HDMI-1"
printf "%-25s | %-15s | %s\n" "shrink" "Zsh Alias" "Turn off HDMI-1 display"
printf "%-25s | %-15s | %s\n" "nv" "Zsh Alias" "Launch Neovim with LazyVim config"
printf "%-25s | %-15s | %s\n" "bat" "Zsh Alias" "Run 'batcat' (cat replacement)"
printf "%-25s | %-15s | %s\n" "Ctrl + r" "zsh" "Search command history (reverse-i-search)"
printf "%-25s | %-15s | %s\n" "Alt + ." "zsh" "Insert last argument of previous command"
printf "%-25s | %-15s | %s\n" "Ctrl + a / Ctrl + e" "zsh" "Move cursor to start / end of line"
printf "%-25s | %-15s | %s\n" "Ctrl + u / Ctrl + k" "zsh" "Cut from cursor to start / end of line"
printf "%-25s | %-15s | %s\n" "Ctrl + w" "zsh" "Cut word before cursor"
printf "%-25s | %-15s | %s\n" "!!" "zsh" "Repeat last command"
printf "%-25s | %-15s | %s\n" "cd -" "zsh" "Go to previous directory"


# Pipe the collected output to rofi
) | rofi -dmenu -i -lines 20 -p $DMENU_PROMPT
