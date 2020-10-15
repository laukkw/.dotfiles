# global alias
alias rm='rm -i'   rd='rmdir'   md='mkdir -p'
alias ls='exa -bh'  la='ls -la'  lt='ls --tree'  ll='ls -l'  l='ls'
alias dfh='df -h'  dus='du -sh' del='gio trash' dusa='dus --apparent-size'
alias reload="exec $SHELL -l -i"  grep="command grep --colour=auto --binary-files=without-match --directories=skip"
alias sfs='sshfs' fsmt='fusermount -zu'
alias df='df -h'  du='du -h'  plast="last -20"
alias ec='emacsclient'
alias cp='cp -v'   mv='mv -v'

load_localhost_addr() {
  # wsl2 获取宿主机的ip地址并且映射为 localhosts
  if [[ ! -z $WSL_DISTRO_NAME ]]; then
    local hostname=${HOSTNAME:-localhosts}
    local addr=$(sed -n 's/nameserver //p' /etc/resolv.conf)
    if [[ $(grep $hostname /etc/hosts) == '' ]]; then
      echo "$addr $hostname" | sudo tee -a /etc/hosts > /dev/null
    elif [[ $(grep $hostname /etc/hosts | awk '{print $1}') != $addr ]]; then
      sudo sed "s/.*$hostname/$addr $hostname/" -i /etc/hosts
    fi
  fi
}

function _z() {
  _zlua "$@";
}

function proxy() {
  load_localhost_addr
  export {http,https}_proxy="${PROXY_ADDR:-'http://127.0.0.1:1080'}"
}

function unproxy() {
  unset {http,https}_proxy
}

function fk() {
  proxy
  "$@"
  unproxy
}

function start() {
  sudo service $1 start
}

function stop() {
  sudo service $1 stop
}

