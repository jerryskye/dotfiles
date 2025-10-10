# Useful functions and aliases
function find_brew() {
  local prefixes=('/opt/homebrew' '/usr/local' '/home/linuxbrew/.linuxbrew')
  for prefix in "${prefixes[@]}"; do
    if [[ -x "$prefix/bin/brew" ]]; then
      echo "$prefix/bin/brew"
      return
    fi
  done
}

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
bindkey '^R' history-incremental-search-backward

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=nvim
export MANPAGER="nvim +Man!"
export DISABLE_SPRING=1
export ERL_AFLAGS="-kernel shell_history enabled"
export CARGO_NET_GIT_FETCH_WITH_CLI=true
export RUBY_YJIT_ENABLE=1
export GPG_TTY=$(tty)
KEYTIMEOUT=5
HISTSIZE=50000
SAVEHIST=$HISTSIZE
HISTFILE=~/.zsh_history
CLICOLOR=1
LSCOLORS=ExFxBxDxCxegedabagacad
PROMPT_EOL_MARK=""

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_DUPS          # Ignore duplicate entries in memory
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.

brew_executable=$(find_brew)

if [ -n "$brew_executable" ]; then
  export HOMEBREW_NO_INSTALL_CLEANUP=1
  export HOMEBREW_NO_AUTO_UPDATE=1

  eval "$($brew_executable shellenv)"
  brew_prefix=$(brew --prefix)
  FPATH=$brew_prefix/share/zsh/site-functions:$FPATH
  source $brew_prefix/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

  chruby_install_dir=$(brew --prefix chruby)
  source $chruby_install_dir/share/chruby/chruby.sh
  source $chruby_install_dir/share/chruby/auto.sh
  starship_precmd_user_func="chruby_auto"
fi

autoload -Uz compinit
compinit

[ -f "$HOME/.profile" ] && . "$HOME/.profile" # Source .profile last to allow host-specific overrides
source <(fzf --zsh)
eval "$(starship init zsh)"
