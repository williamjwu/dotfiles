export PATH=$PATH:$HOME/Library/Python/3.7/bin
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export GOPATH=$HOME/Developer/tools/go
export PATH="$GOPATH/bin:$PATH"

export GO111MODULE=on

# bashrc
source ~/.bashrc

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
