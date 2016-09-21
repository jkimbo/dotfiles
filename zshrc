# Path to your oh-my-zsh configuration.
ZSH=$HOME/dotfiles/zsh

# Example aliases
alias zshconfig="vim ~/.zshrc"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Setup theme
ZSH_THEME='jk'

# Tmux plugin setup
ZSH_TMUX_AUTOSTART="true"
ZSH_TMUX_AUTOSTART_ONCE="true"
ZSH_TMUX_AUTOCONNECT="false"
ZSH_TMUX_AUTOQUIT="false"

plugins=(vi-mode git history-substring-search tmux)
fpath=(/usr/local/share/zsh-completions /usr/local/share/zsh/site-functions $fpath)

source $ZSH/oh-my-zsh.sh

[[ -s /usr/share/autojump/autojump.sh ]] && source /usr/share/autojump/autojump.sh

# Configuration
source $ZSH/aliases
source $ZSH/zsh_aliases

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
fpath=($HOME/dotfiles/zsh/plugins/desk $fpath)

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
