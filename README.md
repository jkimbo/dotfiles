# My dotfiles

## Installation

* Install [homebrew](https://brew.sh/)
* Install [homebrew bundle](https://github.com/Homebrew/homebrew-bundle): `brew tap Homebrew/bundle`
* Install apps in `Brewfile`: `brew bundle`
* Add `/usr/local/bin/zsh` to `/etc/shells/`
* `chsh -s /usr/local/bin/zsh # change default shell to zsh`
* Symlink zsh config: `cd ~/ && ln -s dotfiles/zshrc .zshrc`
* Symlink tmux config: `ln -s dotfiles/tmux.conf .tmux.conf`
* Start iTerm


## Vim/Neovim setup

**Make sure neovim is installed**

Configuration:

```bash
ln -s ~/dotfiles/vim ~/.config/nvim
```

Install plugins:

```
nvim +PlugInstall
```

Follow this comment to get navigation keys to work properly: https://github.com/neovim/neovim/issues/2048#issuecomment-78045837

## Sensible macOS defaults

When setting up a new Mac, you may want to set some sensible macOS defaults:

```bash
source ./macos
```

## Useful commands

### Vim

`:CheckHelth`: Checks neovim health
