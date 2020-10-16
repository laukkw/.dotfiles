export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

ZDOTDIR=$XDG_CONFIG_HOME/zsh

skip_global_compinit=1

export GOPATH="$HOME/.local/go"
export GO111MODULE="on"

() {
  local USER_PATH=(
    /usr/local/go/bin
    $HOME/.local/bin
    $HOME/.cargo/bin
    /usr/local/bin/node
    $HOME/.yarn/bin
    $GOPATH/bin
  )

  USER_PATH=$(IFS=':'; echo "${USER_PATH[*]}")

  if [[ ! $PATH =~ $USER_PATH ]]; then
    export PATH="$USER_PATH:$PATH"
  fi
}
# 代理设置
url=http://127.0.0.1:10080
alias poff='unset http_proxy;unset https_proxy'
# 快捷方式打开
alias pon='export http_proxy=$url; export https_proxy=$url'

