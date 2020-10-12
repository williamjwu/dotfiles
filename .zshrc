export PATH=$HOME/bin:/usr/local/bin:$PATH

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
PROMPT="%n:%.\$vcs_info_msg_0_ %% "
zstyle ':vcs_info:git:*' formats ' %F{green}(%b)%f'
zstyle ':vcs_info:*' enable git

# alias
alias c='clear'
alias la='ls -a'
alias which='type -all'
alias wttr='curl wttr.in'
alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'
alias ll='ls -lGaf'
alias ..='cd ..'
