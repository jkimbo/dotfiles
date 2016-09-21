# Path to your oh-my-zsh configuration.
ZSH=$HOME/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="jk"

# Example aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/oh-my-zsh"

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
plugins=(vi-mode git zsh-syntax-highlighting history-substring-search)
#plugins=(git)
fpath=(/usr/local/share/zsh-completions /usr/local/share/zsh/site-functions $fpath)

source $ZSH/oh-my-zsh.sh

[[ -s /usr/share/autojump/autojump.sh ]] && source /usr/share/autojump/autojump.sh

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

# Customize to your needs...
export PATH=$HOME/bin:$HOME/.bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:$HOME/Dropbox/bin

export EDITOR="vim"

# tmuxinator
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

TERM=screen-256color-bce
#TERM=xterm-256colors
#TERM=xterm+256colors

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source $HOME/.rvm/scripts/rvm
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Z
[[ -s "$HOME/z/z.sh" ]] && source $HOME/z/z.sh

## Add path to sudo path
alias sudo='sudo env PATH=$PATH'

# Virtualenv
export VIRTUALENV_DISTRIBUTE=true
export WORKON_HOME=~/code/virtualenvs
export PROJECT_HOME=$HOME/code
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
[[ -s "/usr/local/bin/virtualenvwrapper.sh" ]] && source /usr/local/bin/virtualenvwrapper.sh
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS="--python $HOME/.pythonz/pythons/CPython-2.7.8/bin/python"

export JAVA_HOME="$(/usr/libexec/java_home)"

export PATH=$PATH:/usr/local/opt/ruby/bin

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Add composer to path
export PATH=$HOME/.composer/vendor/bin:$PATH

if [ -e ~/.secrets ]; then
    source ~/.secrets
fi

### NPM
eval "`npm completion`"


export NVM_DIR="/Users/jkimbo/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

[[ -s $HOME/.pythonz/etc/bashrc ]] && source $HOME/.pythonz/etc/bashrc


# Add postgres tools to path
export PATH="/Applications/Postgres.app/Contents/Versions/9.4/bin:$PATH"

# Hook for desk activation
[ -n "$DESK_ENV" ] && source "$DESK_ENV" || true
fpath=($HOME/dotfiles/zsh/plugins/zsh $fpath)

# Android
export ANDROID_HOME=~/Library/Android/sdk
export PATH="~/Library/Android/sdk/tools:~/Library/Android/sdk/platform-tools:${PATH}"

# m-cli
export PATH=$PATH:/usr/local/m-cli

# ocaml
eval `opam config env`
. /Users/jkimbo/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# love2d
export PATH=$PATH:/Applications/love.app/Contents/MacOS
# Tiled
export PATH=$PATH:/Applications/Tiled.app/Contents/MacOS
