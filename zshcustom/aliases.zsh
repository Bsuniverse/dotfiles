# Use colors in coreutils utilities output
alias grep='grep --color'

# ---- Eza (better ls) -----
# alias ls="eza --color=always --long --no-filesize --icons=always -<D-s><D-z>-no-time --no-user --no-permissions"
alias ls="eza -labgh --icons=always --git"
alias ll="eza -labgh --icons=always --git"
alias la="eza -labgh --icons=always --git"

# Aliases to protect against overwriting
alias cp='cp -i'
alias mv='mv -i'

# Homebrew
alias brs='brew search'
alias bri='brew install'
alias bric='brew install --cask'
alias bro='brew info'
alias bru='brew uninstall'

# nvim
alias nv='nvim'

alias ld='lazydocker'

# Tmux
alias tmat='tmux at -t'
alias tmnew='tmux new -s'
alias tmkt='tmux kill-session -t'

# create .gitignore template
function gi() { curl -sLw "\n" https://www.toptal.com/developers/gitignore/api/$@; }
alias lg='lazygit'

# zshrc
alias szsh='source ~/.zshrc'

# Create a directory and cd into it
mkcd() {
  if [ ! -n "$1" ]; then
    echo "Enter a directory name"
  elif [ -d $1 ]; then
    echo "'$1' already exists"
  else
    mkdir -pv $1 && cd $1
  fi
}
