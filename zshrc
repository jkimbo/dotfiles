# Path to your zsh configuration.
ZSH=$HOME/dotfiles/zsh

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Setup theme
ZSH_THEME='jk'

TERM=screen-256color-bce
#TERM=xterm-256colors
#TERM=xterm+256colors

# Tmux plugin setup
ZSH_TMUX_AUTOSTART="true"
ZSH_TMUX_AUTOSTART_ONCE="true"
ZSH_TMUX_AUTOCONNECT="false"
ZSH_TMUX_AUTOQUIT="false"

export EDITOR="nvim"

# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
# Vi style:
zle -N edit-command-line
# Edit line in vim mode with `e` key
bindkey -M vicmd e edit-command-line

plugins=(vi-mode git history-substring-search tmux npm)
fpath=(/usr/local/share/zsh-completions /usr/local/share/zsh/site-functions $fpath)

source $ZSH/oh-my-zsh.sh

# Configuration
source $ZSH/aliases
source $ZSH/zsh_aliases

# TODO What is this?
__git_files () {
    _wanted files expl 'local files' _files
}

# Fuzzy matching of completions for when you mistype them:
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# Customize to your needs...
export PATH=$HOME/bin:$HOME/.bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:$HOME/Dropbox/bin

# tmuxinator
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source $HOME/.rvm/scripts/rvm
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Ruby
export PATH=$PATH:/usr/local/opt/ruby/bin

# Virtualenv
export VIRTUALENV_DISTRIBUTE=true
export WORKON_HOME=~/code/virtualenvs
export PROJECT_HOME=$HOME/code
export VIRTUALENVWRAPPER_PYTHON=~/.pyenv/shims/python
[[ -s "/usr/local/bin/virtualenvwrapper.sh" ]] && source /usr/local/bin/virtualenvwrapper.sh
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS="--python $HOME/.pyenv/shims/python"

# export JAVA_HOME="$(/usr/libexec/java_home)"

if [ -e ~/.secrets ]; then
  source ~/.secrets
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

[[ -s $HOME/.pythonz/etc/bashrc ]] && source $HOME/.pythonz/etc/bashrc

# Add postgres tools to path
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

# Hook for desk activation
[ -n "$DESK_ENV" ] && source "$DESK_ENV" || true
fpath=($HOME/dotfiles/zsh/plugins/desk $fpath)

# Android
export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
export PATH=${PATH}:${ANDROID_HOME}/build-tools/23.0.1

# m-cli
export PATH=$PATH:/usr/local/m-cli

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag -g ""'

# pyenv
eval "$(pyenv init -)"

# Local config
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
