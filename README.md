# My dotfiles

## How to setup 
1. Use branch `master` to use `gnu stow` to manage dotfiles.
2. Use branch `chezmoi` to use Chezmoi to manage dotfiles.

## 1. Using GNU Stow
## Setup:
1. Clone the repo(dotfiles), preferably at home `"~/"`.
2. CD into the `repo(dotfiles)/shome` directory.
3. Clone the starter repo `github.com/shreyaspg/starter` inside `shome/nvim/.config`
3. Run `stow -vt ~ *` inside `shome`

## 2. Using Chezmoi
## Setup:
```
chezmoi init https://github.com/shreyaspg/dotfiles
```
You can then see what would be changed:
```
chezmoi diff
```
If you're happy with the changes then apply them:
```
chezmoi apply
```
The above commands can be combined into a single command to initialize, checkout, and apply:
```
chezmoi init --apply --verbose https://github.com/shreyaspg/dotfiles
```


## Dependencies:
1.  [ZSH](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH#install-and-set-up-zsh-as-default)
2.  [Neovim-v0.9.5](https://github.com/neovim/neovim/releases/tag/v0.9.5)
3.  [Alacritty](https://github.com/alacritty/alacritty/blob/master/INSTALL.md#debianubuntu)
4.  [Ripgrep](https://github.com/BurntSushi/ripgrep?tab=readme-ov-file#installation)
5.  [NvChad](https://nvchad.com/docs/quickstart/install)
6.  [Tmux](https://github.com/tmux/tmux/wiki/Installing)
7.  [NerdFont](https://www.nerdfonts.com/)
8.  [Polybar Themes](https://github.com/adi1090x/polybar-themes)
9.  [Betterlockscreen](https://github.com/betterlockscreen/betterlockscreen.git)
10. [Rofi Themes](https://github.com/adi1090x/rofi) 


## i3 Setup
```
sudo apt install -y i3 i3status dmenu feh rofi
```

### i3 Config ( `~/.config/i3/config`)
1. Set Mod key 
```
set $mod Mod4
```

2. Select polybar as the status bar
```
# To use Polybar themes
exec_always --no-startup-id $HOME/.config/polybar/launch.sh --cuts

# To use default status bar
#bar {
#  status_command i3status
#}
```

3. Set wallpaper
```
exec --no-startup-id feh --bg-scale /usr/share/backgrounds/mountain_wall.png
```

4. Betterlockscreen
    1. Setup `i3lock-color`
    ```
    sudo apt install -y git meson ninja-build gcc make \
    libpam0g-dev libcairo2-dev libfontconfig1-dev \
    libxcb-composite0-dev libev-dev libx11-xcb-dev \
    libxcb-xinerama0-dev libxcb-randr0-dev \ 
    libxcb-image0-dev libxcb-util-dev libxcb-xkb-dev \
    libxkbcommon-dev libxkbcommon-x11-dev libjpeg-dev

    git clone git@github.com:Raymo111/i3lock-color.git
    cd i3lock-color
    ./install-i3lock-color.sh
    ```

    2. Install `Betterlockscreen`
    ```
    sudo apt install -y i3lock imagemagick xss-lock
    git clone https://github.com/betterlockscreen/betterlockscreen.git
    cd betterlockscreen
    sudo cp betterlockscreen /usr/local/bin/
    betterlockscreen -u /usr/share/backgrounds/mountain_wall.png
    ```

    3. Setup `Betterlockscreen` in `~/.config/i3/config`
    ```
    exec --no-startup-id xss-lock --transfer-sleep-lock -- betterlockscreen -l dim
    ```

5. Setup rofi
    1. Install `rofi themes`
    ```
    git clone --depth=1 https://github.com/adi1090x/rofi.git
    $ cd rofi
    $ chmod +x setup.sh
    ./setup.sh
    ```
    2. Rofi config in i3
    ```
    # open rofi switcher
    bindsym $mod+Tab exec --no-startup-id rofi -show window
    bindsym $mod+t exec --no-startup-id rofi -show drun

    # Cheatsheet: Brings up a dmenu/rofi window with shortcuts
    bindsym $mod+F1 exec --no-startup-id ~/.config/i3/scripts/i3_cheatsheet.sh
    ```


