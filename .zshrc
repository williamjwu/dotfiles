export PATH=$HOME/bin:/usr/local/bin:$PATH

export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin

export GOPATH=$HOME/workspace/tools/golib
export PATH=$PATH:$GOPATH/bin
export GOPATH=$GOPATH:$HOME/workspace/golang

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

    printf "*------------------------------------------*\n"
    printf "${insults[$(($RANDOM % $size + 1))]}"
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


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
