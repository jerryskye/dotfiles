export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=nvim
export GPG_TTY=$(tty)
[ -f $HOME/.profile ] && . $HOME/.profile

# Avoid duplicates
export HISTCONTROL=ignoredups:erasedups
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend

# After each command, append to the history file and reread it
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h\[\033[31m\][\$($rvm_bin_path/rvm-prompt)]:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

if [ -f ~/.fzf.bash ]; then
  source ~/.fzf.bash # fzf completion
  complete -D -F _fzf_path_completion -o default -o bashdefault # use it for every command
fi

#custom convenient aliases and functions
function mkcd() {
  mkdir -p $1 && cd $1
}

function stopall() {
  for srv in $(brew services ls | grep started | awk '{print $1}'); do brew services stop $srv; done
}
