# Oh my ZSH setup

setup_on_my_zsh() {
  export ZSH="${HOME}/.oh-my-zsh"
  ZSH_THEME="lssimple"
  plugins=(
      git
      brew
  )
  source $ZSH/oh-my-zsh.sh
}

setup_aliases() {
  source "${XDG_DATA_HOME}/zsh/aliases.zsh"
}

setup_secrets() {
  source "${XDG_DATA_HOME}/zsh/secrets.zsh"
}

setup_completions() {  
  if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  fi

  FPATH="${HOME}/.zsh:${FPATH}"

  autoload -Uz compinit
  compinit -u
  
  autoload -U +X bashcompinit && bashcompinit
}

setup_editor() {
  export EDITOR="nvim"
}

setup_asdf() {
  . "$(brew --prefix asdf)/libexec/asdf.sh"

  # required for nodejs install to work
  export NODEJS_CHECK_SIGNATURES=no
}

setup_deno() {
  export PATH="${XDG_DATA_HOME}/deno/bin:${PATH}"
}

cd_enhanced() {
  builtin cd "$@"
  use_envrc
  use_asdf
}

setup_rust() {
  . "${XDG_DATA_HOME}/cargo/env"
}

setup_coursier() {
  export PATH="$PATH:${HOME}/Library/Application Support/Coursier/bin"
}

setup_pnpm() {
  export PNPM_HOME="/Users/lshay/Library/pnpm"
  export PATH="$PNPM_HOME:$PATH"
}

setup_starship() {
  eval "$(starship init zsh)"
}


export PATH="/usr/local/sbin:${PATH}"
export TERM=xterm-256color

setup_on_my_zsh
setup_secrets
setup_aliases
setup_completions
setup_editor
setup_asdf
setup_deno
use_envrc
use_asdf
setup_rust
setup_coursier
setup_pnpm
setup_starship

alias cd="cd_enhanced"

