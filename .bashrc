export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
export EDITOR=vim
export TERM=xterm-256color
export PS1="\u:\W\[\e[38;5;35m\]\$(parse_git_branch) \[\e[39m\]$ "

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# alias
alias c='clear'
alias la='ls -a'
alias which='type -all'
alias wttr='curl wttr.in'
alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'
alias ll='ls -fGlAhp'
alias ll='ls -lGaf'
alias sl='ls'
alias ..='cd ..'

alias ga='git add'
alias gc='git commit'
alias gs='git status'
alias gps='git push'
alias gpl='git pull'

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
