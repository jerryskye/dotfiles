# Useful functions and aliases

alias l=lsd
alias ll='l -l'
alias la='ll -A'
alias lt='ll -t'
alias ltree='l --tree'
alias be='bundle exec'
alias bi='bundle install'

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

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

if [ -s "$HOME/.fzf.bash" ]; then
  source "$HOME/.fzf.bash"
  complete -D -F _fzf_path_completion -o default -o bashdefault
  export FZF_DEFAULT_COMMAND='rg --files --hidden'
fi

source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
starship_precmd_user_func="chruby_auto"

[ -f "$HOME/.profile" ] && . "$HOME/.profile" # Source .profile last to allow host-specific overrides
eval "$(starship init bash)"
