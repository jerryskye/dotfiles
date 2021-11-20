# Useful functions and aliases

alias l=lsd
alias ll='l -l'
alias la='ll -A'
alias lt='ll -t'
alias ltr='ll -tr'
alias ltree='l --tree'
alias be='bundle exec'
alias tf='terraform'
alias g='git'

function mkcd() {
  mkdir -p $1 && cd $1
}

bindkey -v

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=nvim
export MANPAGER="nvim -c 'set ft=man' -"
export GPG_TTY=$(tty)
export KEYTIMEOUT=5
export HISTSIZE=50000
export SAVEHIST=$HISTSIZE
export HISTFILE=~/.zsh_history
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
PROMPT_EOL_MARK=""

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_DUPS          # Ignore duplicate entries in memory
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

if [ -s "$HOME/.fzf.zsh" ]; then
  source "$HOME/.fzf.zsh"
  export FZF_DEFAULT_COMMAND='rg --files --hidden'
fi

source "$HOME/.fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"

[ -f "$HOME/.profile" ] && . "$HOME/.profile" # Source .profile last to allow host-specific overrides
eval "$(starship init zsh)"
