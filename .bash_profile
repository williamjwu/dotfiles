export PATH=$PATH:$HOME/Library/Python/2.7/bin

# powerline
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. ~/Library/Python/2.7/lib/python/site-packages/powerline/bindings/bash/powerline.sh

# bashrc
source ~/.bashrc

# functions
if [ -f '/Users/williamwu/Tools/google-cloud-sdk/path.bash.inc' ]; then source '/Users/williamwu/Tools/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/williamwu/Tools/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/williamwu/Tools/google-cloud-sdk/completion.bash.inc'; fi

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"


export PATH="/usr/local/sbin:$PATH"

