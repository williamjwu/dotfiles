export PATH=$PATH:$HOME/Library/Python/2.7/bin
export PATH="/usr/local/sbin:$PATH"

# bashrc
source ~/.bashrc

# functions
if [ -f '/Users/williamwu/Developer/Tools/google-cloud-sdk/path.bash.inc' ]; then source '/Users/williamwu/Developer/Tools/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/williamwu/Developer/Tools/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/williamwu/Developer/Tools/google-cloud-sdk/completion.bash.inc'; fi

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

