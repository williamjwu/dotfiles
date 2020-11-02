export PATH=$HOME/bin:/usr/local/bin:$PATH
export GOPATH=$HOME/Developer/tools/go
export PATH="$GOPATH/bin:$PATH"
export GO111MODULE=on

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
PROMPT="%n:%.\$vcs_info_msg_0_ $ "
zstyle ':vcs_info:git:*' formats ' %F{green}(%b)%f'
zstyle ':vcs_info:*' enable git

# alias
alias c='clear'
alias la='ls -a'
alias wttr='curl wttr.in'
alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'
alias ll='ls -lGaf'
alias ..='cd ..'

# funny error msgs

insults=(
    "|   Haha, n00b!                            | \n"
    "|   Incompetence is also competence        | \n"
    "|   No speak computer???                   | \n"
    "|   Error code: 1D10T                      | \n"
    "|   Dog shit coder found?!                 | \n"
    "|   FakE cOdIng mONkEy spOttED iN wILd     | \n"
    "|   Pro tip: type a valid command!         | \n"
    "|   Wow! That was impressively wrong!      | \n"
    "|   An easy fix will be sudo rm -rf /      | \n"
    "|   Absolutely nobody:     You: eRrOR      | \n"
)

command_not_found_handler() {
    size=${#insults[@]}
    idx=$(($RANDOM % $size + 1))

    printf "*------------------------------------------*\n"
    printf "${insults[$idx]}"
    printf "|                                          |\n"
    printf "|  （╯°□°）╯︵( .o.) Command not found     |\n"
    printf "|                                          |\n"
    printf "*------------------------------------------*\n"
    printf "       o\n"
    printf "        o   ╭─╮\n"
    printf "         o  ⌾ ⌾\n"
    printf "            │▕│\n"
    printf "            ╰─╯\n"
    return 127
}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

