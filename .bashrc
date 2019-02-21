#aliases
alias ls='ls -G'
alias ll='ls -lG'
alias la='ls -laG'
alias vim='nvim'
#alias mysql='/Applications/MAMP/Library/bin/mysql'
alias ctags='/Applications/MacVim.app/Contents/MacOS/ctags "$@"'
alias zsh='/usr/local/bin/zsh'
alias aws='/Users/meguroman/.pyenv/shims/aws'

#For rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

#For pyenv
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


#setting for autojump
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh


#For MacVim
if [[ "$OSTYPE" =~ "darwin" ]] && [ -d /Applications/MacVim.app/Contents/MacOS ];then
      export PATH=/Applications/MacVim.app/Contents/MacOS:$PATH
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

#Add nodebrew path
export PATH=$HOME/.nodebrew/current/bin:$PATH

#display datetime on history command
export HISTTIMEFORMAT='%F %T '
