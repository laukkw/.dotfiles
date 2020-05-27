export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

ZDOTDIR=$XDG_CONFIG_HOME/zsh

skip_global_compinit=1

export GOPATH="$HOME/go"

() {
  local USER_PATH=(
    /usr/local/go/bin
    $HOME/.local/bin
    $HOME/.cargo/bin
    $HOME/.local/share/node/bin
    $HOME/.yarn/bin
    $GOPATH/bin
  )

  USER_PATH=$(IFS=':'; echo "${USER_PATH[*]}")

  if [[ ! $PATH =~ $USER_PATH ]]; then
    export PATH="$USER_PATH:$PATH"
  fi
}

