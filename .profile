
# useful aliases 
alias nv=nvim

# useful paths
export PROJS=~/Documents/Projects
export TESTS=~/Documents/CodeTemple

alias toprojs="cd $PROJS"
alias totests="cd $TESTS"

# ------- lsd -------
alias ll="lsd --group-dirs first -l"
alias la="lsd --group-dirs first -la"
alias lt="lsd --group-dirs first --tree"
# ------- end -------

# ------- fzf -------
# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}
# ------- end -------
