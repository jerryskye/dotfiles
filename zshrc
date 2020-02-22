# Useful functions and aliases

alias l=lsd
alias ll='l -l'
alias la='ll -A'
alias lt='ll -t'
alias ltree='l --tree'
alias be='bundle exec'

function mkcd() {
  mkdir -p $1 && cd $1
}

bindkey -v

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=nvim
export GPG_TTY=$(tty)
export KEYTIMEOUT=5
export HISTSIZE=50000
export SAVEHIST=$HISTSIZE
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.

if [ -s "$HOME/.fzf.zsh" ]; then
  source "$HOME/.fzf.zsh"
  export FZF_DEFAULT_COMMAND='rg --files --hidden'
fi

source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
precmd_functions+=(chruby_auto)


[ -f "$HOME/.profile" ] && . "$HOME/.profile" # Source .profile last to allow host-specific overrides
eval "$(starship init zsh)"
