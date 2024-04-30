# Legorel's dotfiles

Almost all of my dotfiles.

## Content

- bash
- foot
- git
- tmux
- neovim
- hyprland
- dunst
- systemd
- wlogout
- waybar
- yambar \(will probably be removed, as i'm moving to waybar\)
- zathura
- shell scripts

## Install

Clone the repository into your home folder \(e.g. `git clone https://github.com/Legorel/dotfiles.git ~/dotfiles`\).  
Some packages are git submodules. If you want to use their config, you have to also clone the submodules:

```bash
git submodule update --init --recursive
```

And when you need to update them:

```bash
git submodule update --recursive
```

### Using GNU Stow

GNU Stow can be used to symlink packages' config folder into the correct directory.
The most basic usage of stow requires you to place the repo in your home folder \(`~/myconfig` will work, `~/config/myconfig` will not work\).
See the [GNU Stow manual](https://www.gnu.org/software/stow/manual/) for more info.
For example, to install the config files for `bash` and `tmux`,

```bash
cd ~/dotfiles
stow bash tmux
```

Stow will report any error that occurs when creating symlinks. Mind that stow will symlink all the files in a folder if this folder already exists on your pc.
\(e.g. if `~/.config/dunst` alread exists, `~/dotfiles/dunst/.config/` will not be symlinked to `~/.config/dunst`, but every file in it will be individually linked.
This behavior is helpful for the `~/.config` directory, but may not be for package's config directory!\)

To uninstall, pass the `-D` flag to stow:

```bash
stow -D tmux
```

There is also a sh script `config` that uses stow to install/unsinstall packages, but it is incomplete for the moment.

### Manually

Use an external tool, copy the file by yourself, or use any other method that fits you.
