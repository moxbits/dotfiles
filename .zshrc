bindkey -v

source ~/plugins/gitstatus/gitstatus.prompt.zsh

source ~/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source ~/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
if [ -n "${commands[fzf-share]}" ]; then
  source "$(fzf-share)/key-bindings.zsh"
  source "$(fzf-share)/completion.zsh"
fi

source ~/.profile

autoload -U colors && colors	# Load colors
PROMPT="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]"
PROMPT+='${GITSTATUS_PROMPT:+ $GITSTATUS_PROMPT} '
PROMPT+="%{$fg[cyan]%}λ%b "

