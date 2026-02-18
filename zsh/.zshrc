# -- History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# -- Options
setopt autocd extendedglob nomatch notify
unsetopt beep
source ~/.local/share/zsh/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# -- Starship Vi Mode
function zvm_after_select_vi_mode() {
  case $ZVM_MODE in
    $ZVM_MODE_NORMAL)
      ;;
    $ZVM_MODE_INSERT)
      ;;
    $ZVM_MODE_VISUAL)
      ;;
    $ZVM_MODE_VISUAL_LINE)
      ;;
  esac
  zle reset-prompt
}

# -- Completion
zstyle :compinstall filename "$HOME/.zshrc"
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
autoload -Uz compinit
compinit

# -- Starship 
if command -v starship > /dev/null; then
    eval "$(starship init zsh)"
else
    PROMPT='%n@%m %1~ %# '
fi

# -- Kubernetes
if command -v kubectl > /dev/null; then
    if [ ! -f "$HOME/.kube/completion.zsh" ]; then
        mkdir -p "$HOME/.kube"
        kubectl completion zsh > "$HOME/.kube/completion.zsh"
    fi
    source "$HOME/.kube/completion.zsh"
    alias k='kubectl --kubeconfig ~/.kube/config'
fi

# -- Aliases
alias vi='nvim'
alias vim='nvim'
alias di='docker image'
alias dc='docker container'
alias ll='ls -lah'
alias term='alacritty &!'
alias xc='wl-copy'
alias xp='wl-paste'
alias v='vault'

# -- Environment
export VISUAL='nvim'
export EDITOR='nvim'

# -- Pyenv
export PYENV_ROOT="$HOME/.pyenv"
if [ -d "$PYENV_ROOT/bin" ]; then
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

# -- Paths
[ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH"
[ -d "$HOME/go/bin" ] && export PATH="$HOME/go/bin:$PATH"

# -- Envman
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# -- Direnv
if command -v direnv > /dev/null; then
    eval "$(direnv hook zsh)"
fi
