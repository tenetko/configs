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

# -- Native Zsh Vi Mode
bindkey -v
export KEYTIMEOUT=1

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
fi

# -- FZF (Fuzzy Finder)
eval "$(fzf --zsh)"

export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --hidden --exclude .git'

export FZF_CTRL_T_OPTS="--preview 'bat --color=always --style=numbers --line-range=:500 {}'"
export FZF_ALT_C_OPTS="--preview 'ls -la --color=always {} | head -200'"

export FZF_DEFAULT_OPTS="
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8
"

# -- Aliases
alias dc='docker container'
alias di='docker image'
alias dl='docker logs'
alias k='kubectl'
alias kx='kubectx'
alias kns='kubens'
alias ll='ls -lah'
alias minikube='KUBECONFIG=~/.kube/minikube-config minikube'
alias term='kitty &!'
alias v='vault'
alias vi='nvim'
alias vim='nvim'
alias vimdiff='nvim -d'
alias xc='wl-copy'
alias xp='wl-paste'
alias yz='yazi'

# -- Environment
export VISUAL='nvim'
export EDITOR='nvim'
export KUBECONFIG="$HOME/.kube/config:$HOME/.kube/minikube-config"

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

# -- Keychain for SSH keys
eval $(keychain --eval --quiet id_ed25519)
