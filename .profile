export TERM='st'
export EDITOR='nvim'

alias nv=nvim
alias lg=lazygit
alias vi="nvim -u ~/.config/nvim/mini.lua" 

# useful paths
export PROJS=~/Documents/Projects
export TESTS=~/Documents/CodeTemple

alias toprojs="cd $PROJS"
alias totests="cd $TESTS"

# ------- lsd -------
alias ls="lsd"
alias ll="lsd --group-dirs first -l"
alias la="lsd --group-dirs first -la"
alias lt="lsd --group-dirs first --tree"
# ------- end -------

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# ------- end -------
