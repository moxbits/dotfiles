bindkey -v

source ~/gitstatus/gitstatus.prompt.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

source ~/.profile

PROMPT=' %B%F{green}λ%f%b %B%F{blue}%c%f%b${GITSTATUS_PROMPT:+ $GITSTATUS_PROMPT} '

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
