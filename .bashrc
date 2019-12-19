export TERM=xterm-256color
export PS1="\u:\W\[\e[38;5;35m\]\$(parse_git_branch) \[\e[39m\]$ "
export CURR_IP='ipconfig getifaddr en-1'

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Startup welcome screen
WELCOME_MSG=(
"(づ￣ ³￣)づ  Good morning!"
"(ﾉ◕ヮ◕)ﾉ*:･ﾟ✧  Good afternoon!"
"(っ˘▾˘)っ  Good evening!"
)

# Default set currMsg to evening
# from 5:00 - 12:59 is morning
# from 13:00 - 19:59 is afternoon
# from 20:00 - next day 4:59 is evening

curr_time=$(date +"%H")
curr_msg=2
if [ "$curr_time" -gt 13 ]; then
    if [ "$curr_time" -lt 20 ]; then
        curr_msg=1
    fi
fi
if [ "$curr_time" -lt 13 ]; then
    if [ "$curr_time" -gt 5 ]; then
        curr_msg=0
    fi
fi
if [ "$curr_time" -eq 13 ]; then
    curr_msg=1
fi
if [ "$curr_time" -eq 5 ]; then
    curr_msg=0
fi

echo "${WELCOME_MSG[$curr_msg]}"

# alias
alias server="browser-sync start -s -f . --no-notify --host $CURR_IP --port 8080"
alias virenv='. ~/Developer/tools/virtualenv/bin/activate'
alias tks='tmux kill-server'
alias c='clear'
alias i='pipes.sh'
alias la='ls -a'
alias lf='ranger'
alias top='vtop'
alias search='googler'
alias tml='~/Developer/scripts/termail.sh'
alias ping='~/Developer/tools/prettyping.sh --nolegend'
alias themeHop='~/Developer/scripts/themeHop.sh'
alias which='type -all'
alias sherlock='python3 ~/Developer/tools/sherlock/sherlock.py'
alias wttr='curl wttr.in'
alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'
alias ll='ls -FGlAhp'
alias sl='ls'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# git alias
alias ga='git add'
alias gcm='git commit'
alias gps='git push'
alias gpl='git pull'

# funny error msgs
INSULTS=(
"|   Haha, n00b!                            | \n"
"|   Plz uninstall                          | \n"
"|   Incompetence is also competence        | \n"
"|   No speak computer???                   | \n"
"|   Error code: 1D10T                      | \n"
"|   Water u doing to me senpai?            | \n"
"|   FakE cOdIng mONkEy spOttED iN wILd     | \n"
"|   Dear Regulars: this is not Windows     | \n"
"|   Fake it till you make it!              | \n"
"|   Pro tip: type a valid command!         | \n"
"|   Wow! That was impressively wrong!      | \n"
"|   Absolutely pathetic …                  | \n"
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
