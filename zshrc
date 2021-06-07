# Customize to your needs...
export PATH="/opt/homebrew/bin:$HOME/bin:$HOME/.bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Path to your zsh configuration.
export ZSH=$HOME/dotfiles/zsh

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Setup theme
ZSH_THEME='jk'

export EDITOR="nvim"

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
plugins=(git history-substring-search deno)

# Tmux plugin setup
ZSH_TMUX_AUTOSTART="true"
ZSH_TMUX_AUTOSTART_ONCE="true"
ZSH_TMUX_AUTOCONNECT="false"
ZSH_TMUX_UNICODE="true"

# Disable auto update
DISABLE_AUTO_UPDATE="true"

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

if [ -e ~/.secrets ]; then
  source ~/.secrets
fi

# TOOLS SETUP

# Add snap bin
if [[ $(uname -s) == "Linux" ]]; then
  export PATH="/snap/bin:$PATH"
fi

# Setup pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export PIP_REQUIRE_VIRTUALENV=true

# Setup poetry
export PATH="$HOME/.poetry/bin:$PATH"

# Created by `userpath` on 2020-12-08 17:31:57
export PATH="/Users/jkimbo/.local/bin:$PATH"

# Virtualenv
export WORKON_HOME=~/code/virtualenvs
export VIRTUALENVWRAPPER_PYTHON=~/.local/pipx/venvs/virtualenvwrapper/bin/python
# Only source virtualenvwrapper if it's installed
# (virtualenvwrapper installed through pipx)
if command -v virtualenvwrapper.sh &> /dev/null; then
    source virtualenvwrapper.sh
fi

# Nodenv
if [[ $(uname -s) == "Linux" ]]; then
  export PATH="/home/jkimbo/.nodenv/bin:$PATH"
fi
eval "$(nodenv init -)"

# Go
if [[ $(uname -s) == "Linux" ]]; then
  export PATH="$PATH:/usr/local/go/bin"
fi

# Setup direnv
eval "$(direnv hook zsh)"

# Gcloud SDK
CLOUDSDK_PYTHON=/usr/local/opt/python@3.8/bin/python

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export REACT_EDITOR="vim"

# Alias for Intel homebrew
alias ibrew='arch -x86_64 /usr/local/bin/brew'

# Local config
[ -f ~/.zshrc.local ] && source ~/.zshrc.local


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jkimbo/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/jkimbo/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jkimbo/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jkimbo/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
