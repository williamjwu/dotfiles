export PATH="$HOME/.local/bin:$PATH"

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
PROMPT="%n:%.\$vcs_info_msg_0_ $ "
zstyle ':vcs_info:git:*' formats ' %F{green}(%b)%f'
zstyle ':vcs_info:*' enable git

alias ws="cd ~/workspace"
alias ..="cd .."
alias c="clear"
alias ll="ls -lGaf"
alias la="ls -a"
alias vi="nvim"
alias vim="nvim"

