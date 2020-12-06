# Customize to your needs...
export PATH="/opt/homebrew/bin:$HOME/bin:$HOME/.bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Path to your zsh configuration.
export ZSH=$HOME/dotfiles/zsh

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Setup theme
ZSH_THEME='jk'

# Tmux plugin setup
# ZSH_TMUX_AUTOSTART="true"
# ZSH_TMUX_AUTOSTART_ONCE="true"
# ZSH_TMUX_AUTOCONNECT="false"
# ZSH_TMUX_AUTOQUIT="false"

# export EDITOR="nvim"

# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
# Vi style:
zle -N edit-command-line
# Edit line in vim mode with `e` key
bindkey -M vicmd e edit-command-line

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Configuration
source $HOME/dotfiles/aliases
source $HOME/dotfiles/zsh_aliases

# Load some zsh plugins
# source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Fuzzy matching of completions for when you mistype them:
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# Virtualenv
# export VIRTUALENV_DISTRIBUTE=true
# export WORKON_HOME=~/code/virtualenvs
# export PROJECT_HOME=$HOME/code
# export VIRTUALENVWRAPPER_PYTHON=~/.pyenv/shims/python
# [[ -s "/usr/local/bin/virtualenvwrapper.sh" ]] && source /usr/local/bin/virtualenvwrapper.sh
# export VIRTUALENVWRAPPER_VIRTUALENV_ARGS="--python $HOME/.pyenv/shims/python"

if [ -e ~/.secrets ]; then
  source ~/.secrets
fi

# Add postgres tools to path
# export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export REACT_EDITOR=code

# Alias for Intel homebrew
alias ibrew='arch -x86_64 /usr/local/bin/brew'

# Local config
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
