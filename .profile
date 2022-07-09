
# useful aliases 
alias nv=nvim

# useful paths
export PROJS=~/Documents/Projects
export TESTS=~/Documents/CodeTemple

# ------- fzf -------
# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}
# ------- end -------
