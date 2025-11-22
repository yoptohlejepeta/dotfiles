HISTFILE=~/.zsh_history  
HISTSIZE=10000          
SAVEHIST=10000         

bindkey -v
export MANPAGER='nvim +Man!'

autoload -Uz compinit && compinit

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

precmd() {
    echo ""
}

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt PROMPT_SUBST

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' unstagedstr '%F{8}*%f'
zstyle ':vcs_info:git:*' stagedstr '%F{8}+%f'
zstyle ':vcs_info:git:*' formats '%F{8}%b%f%u%c'
zstyle ':vcs_info:*' enable git

PROMPT='%F{blue}%~%f '$'\n%F{green}>>%f '
RPROMPT=' ${vcs_info_msg_0_}'

# git aliases
alias gst='git status --branch --short'
alias ga='git add -A'
alias gc='git commit'
alias gp='git push'

alias lg='lazygit'
alias ld='lazydocker'

alias vim='nvim'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history -1 | sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export PATH=$PATH:/opt/nvim-linux64/bin
export PATH=$PATH:$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:/home/petka/.juliaup/bin
export EDITOR=nvim
. "$HOME/.cargo/env"

source <(fzf --zsh)
eval "$(direnv hook zsh)"

# yazi
y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [[ -n "$cwd" && "$cwd" != "$PWD" ]]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}


# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/home/petka/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<

[ -f "/home/petka/.ghcup/env" ] && . "/home/petka/.ghcup/env" # ghcup-env
. "/home/petka/.deno/env"
