# Useful functions and aliases

alias l=lsd
alias ll='l -l'
alias la='ll -A'
alias lt='l --tree'
alias be='bundle exec'

function mkcd() {
  mkdir -p $1 && cd $1
}

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=nvim
export GPG_TTY=$(tty)

export HISTSIZE=10000
export HISTCONTROL=ignoredups:erasedups:ignorespace
shopt -s histappend

SUCCESS_EMOJI=$'❤️\001 \002'
FAILURE_EMOJI="💔"
PROMPT_COMMAND='if [ $? -eq 0 ]; then exitstatus="$SUCCESS_EMOJI"; else exitstatus="$FAILURE_EMOJI"; fi'
PS1="\[\033[1;34m\]\u@\h\[\033[0;31m\][\$(rbenv version-name)]:\[\033[1;33m\]\w\[\033[0;10m\] \$exitstatus "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

if [ -s "$HOME/.fzf.bash" ]; then
  source "$HOME/.fzf.bash"
  complete -D -F _fzf_path_completion -o default -o bashdefault
  export FZF_DEFAULT_COMMAND='rg --files --hidden'
fi

eval "$(rbenv init -)"

[ -f "$HOME/.profile" ] && . "$HOME/.profile" # Source .profile last to allow host-specific overrides
true
