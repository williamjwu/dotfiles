export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
export EDITOR=vim
export TERM=xterm-256color
export PS1="\u:\W\[\e[38;5;2m\]\$(parse_git_branch) \[\e[39m\]$ "

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# temp alias
alias cs241='ssh jiajiew3@fa20-cs241-128.cs.illinois.edu'

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

# funny error msgs
INSULTS=(
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

command_not_found_handle () {
    printf "*------------------------------------------*\n"
    printf "${INSULTS[$((RANDOM % ${#INSULTS[@]}))]}"
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
