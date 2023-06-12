
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

alias fzn="nvim \$(fzf)"

fsn() {
  result_str=`rg -n $1 | fzf`
  split_result=(${(s/:/)result_str})
  file_path=$split_result[1]
  linenumber=$split_result[2]
  (( linenumber -= 1))
  nvim $file_path +$linenumber +"/$1"
}

# ------- end -------

# ------- rust --------

# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
. "$HOME/.cargo/env"

# ------- end -------
