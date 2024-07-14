bindkey -v

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

source /home/linuxbrew/.linuxbrew/opt/gitstatus/gitstatus.prompt.zsh

source ~/.profile

autoload -U colors && colors	# Load colors

PROMPT="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]"
PROMPT+='${GITSTATUS_PROMPT:+ $GITSTATUS_PROMPT}'
PROMPT+=" %{$fg[cyan]%}λ%b "

