bindkey -v

source ~/.profile

source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh

autoload -U colors && colors	# Load colors

# version control status prompt
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'
zstyle ':vcs_info:git:*' formats       ' %b%u%c'
zstyle ':vcs_info:git:*' actionformats ' %b|%a%u%c'

precmd() {
  vcs_info
}

setopt prompt_subst

PROMPT="%B%{$fg[blue]%}%~%{$fg[magenta]%}"
PROMPT+='${vcs_info_msg_0_}'
PROMPT+=" %{$fg[green]%}λ%b "

