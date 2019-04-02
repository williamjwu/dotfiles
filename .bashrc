export PS1="\h:\W \[\e[38;5;40m\]$ \[\e[39m\]"
export CURR_IP='ipconfig getifaddr en-1'

# startup welcome screen
WELCOME_MSG=(
"(づ￣ ³￣)づ  Good morning!"
"(ﾉ◕ヮ◕)ﾉ*:･ﾟ✧  Good afternoon!"
"ヽ(o＾▽ ＾o)ノ~  Good evening!"
)

# default set currMsg to evening
# from 4 - 12 it is considered morning
# from 12 - 20 it is considered afternoon
# from 20 - next day 4 is considered evening

currTime=$(date +"%H")
currMsg=2
if [ "$currTime" -gt 12 ]; then
    if [ "$currTime" -lt 20 ]; then
        currMsg=1
    fi
fi
if [ "$currTime" -lt 12 ]; then
    if [ "$currTime" -gt 4 ]; then
        currMsg=0
    fi
fi
if [ "$currTime" -eq 12 ]; then
    currMsg=1
fi
if [ "$currTime" -eq 4 ]; then
    currMsg=0
fi

echo "${WELCOME_MSG[$currMsg]}"

stty -ixon
# alias
alias server="browser-sync start -s -f . --no-notify --host $CURR_IP --port 8000"
alias virenv='. ~/Developer/Tools/virtualenv/bin/activate'
alias schedule='open ~/Documents/School/HSBellSchedule.pdf'
alias math='open ~/Documents/School/Calculus.pdf'
alias c='clear'
alias i='pipes.sh'
alias la='ls -a'
alias lf='ranger'
alias ll='ls -l'
alias google='googler'
alias tml='~/Developer/Scripts/termail.sh'
alias ping='~/Developer/Tools/prettyping.sh --nolegend'
alias font-patcher='~/Developer/Tools/font-patcher'
alias themeHop='~/Developer/Scripts/themeHop.sh'
alias which='type -all'
alias sherlock='python3 ~/Developer/Tools/sherlock/sherlock.py'
alias wtr='curl wttr.in'
alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'
alias ll='ls -FGlAhp'
alias rm='rm -ir'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias sl='ls'

# git alias
alias ga='git add'
alias gc='git clone'
alias gb='git branch'
alias gcm='git commit'
alias gco='git checkout'
alias gi='git init'
alias gm='git merge'
alias gps='git push'
alias gpl='git pull'
alias gpom='git pull origin master'
alias gs='git status'

# funny error msgs OwO
INSULTS=(
" / Hahaha, n00b!                            \ \n"
" / plz uninstall                            \ \n"
" / u suk …                                  \ \n"
" / Incompetence is also competence          \ \n"
" / Y u no speak computer???                 \ \n"
" / error code: 1D10T                        \ \n"
" / Water u doing to me senpai?              \ \n"
" / fAke cOdIng mONkEy spOttED iN wILd       \ \n"
" / This is not Windows Mr.fanboy            \ \n"
" / Fake it till you make it!                \ \n"
" / Pro tip: type a valid command!           \ \n"
" / Wow! That was impressively wrong!        \ \n"
" / Absolutely pathetic …                    \ \n"
" / An easy fix will be sudo rm -rf /        \ \n"
)

command_not_found_handle () {
    printf "  __________________________________________\n"
    printf "${INSULTS[$((RANDOM % ${#INSULTS[@]}))]}"
    printf "|                                            |\n"
    printf "| （╯°□°）╯︵( .o.) Command not found        |\n"
    printf "|                                            |\n"
    printf " \_______ __________________________________/\n"
    printf "         v\n"
    printf "        ╭─╮\n"
    printf "        ⌾ ⌾\n"
    printf "        │▕│\n"
    printf "        ╰─╯\n"
    return 127
}
