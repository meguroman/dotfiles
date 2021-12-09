#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

################################
# general setting
################################
tabs -2

################################
# PATH setting
################################

export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

#For MacVim
if [[ "$OSTYPE" =~ "darwin" ]] && [ -d /Applications/MacVim.app/Contents/MacOS ];then
      export PATH=/Applications/MacVim.app/Contents/MacOS:$PATH
fi

#For neovim
export XDG_CONFIG_HOME=~/.config

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

#Add nodebrew path
export PATH=$HOME/.nodebrew/current/bin:$PATH

# Add android sdk pass
export PATH=$HOME/Library/Android/sdk/platform-tools:$PATH
export PATH=$HOME/Library/Android/sdk/build-tools/27.0.3:$PATH

# Add node_module path
export PATH=$PATH:node_modules/.bin

# Add Google Cloud SDK path
export PATH=$PATH:/Applications/google-cloud-sdk/bin

# Add for openssl PATH
export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl/lib/


################################
# alias setting
################################

alias vim='nvim'
alias ctags='/Applications/MacVim.app/Contents/MacOS/ctags "$@"'
alias zsh='/usr/local/bin/zsh'
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

# for docker
alias dk='docker'
alias dkr='docker run'
alias dki='docker image'
alias dkp='docker ps'
alias dkc='docker container'
alias dka='docker attach'
alias dksa='docker start'
alias dkso='docker stop'
alias dkpa='docker ps -a'
alias dkis='docker images'


################################
# orginal shell command
################################

# CSVファイルの文字コードをsjisに変換する
function nkf2sjis() {
  sjis_file=`echo $1 | sed -e "s/\.csv/_sjis\.csv/"`
  command nkf -s $1 > $sjis_file
}


################################
# rbenv setting
################################
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"


################################
# pyenv setting
################################
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


################################
# nodeenv setting
################################
#export PATH="$HOME/.nodenv/bin:$PATH"
#eval "$(nodenv init -)"


################################
# phpenv setting
################################
#export PATH="$PATH:$HOME/.phpenv/bin"
#eval "$(phpenv init -)"
