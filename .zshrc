export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="multiline"

plugins=(
  git
  python
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

bindkey -v

source ~/.profile

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
