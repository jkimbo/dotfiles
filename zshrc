# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="jk"

# Example aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(vi-mode git zsh-syntax-highlighting history-substring-search github boom)
#plugins=(git)

source $ZSH/oh-my-zsh.sh

source /etc/profile.d/autojump.zsh

# Configuration
source $HOME/dotfiles/zsh/aliases
source $HOME/dotfiles/zsh/zsh_aliases

__git_files () {
    _wanted files expl 'local files' _files
}

# Fuzzy matching of completions for when you mistype them:
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# git completion
#source ~/dotfiles/git/git-completion.bash

# Customize to your needs...
export PATH=/home/jkimbo/dotfiles/bin:/home/jkimbo/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/jkimbo/.ec2/bin

export EDITOR="vim"

export EC2_HOME=~/.ec2
export PATH=$PATH:$EC2_HOME/bin
export EC2_PRIVATE_KEY=pk-MV4F5N7OEUMPYTMGX744V4UWYAWQNFZ4.pem
export EC2_CERT=cert-MV4F5N7OEUMPYTMGX744V4UWYAWQNFZ4.pem
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/

# tmuxinator
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

TERM=screen-256color-bce
#TERM=xterm-256colors
#TERM=xterm+256colors

