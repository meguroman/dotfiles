# -----------------------
# environment variable
# -----------------------
#
# for Japanese language setting via ssh
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8



# -----------------------
# zsh option settings
# -----------------------

# for auto complete of zsh
autoload -U compinit
compinit

#display correct cmd
setopt correct

# don't sound beep
setopt nobeep


# -----------------------
# zsh addon
# -----------------------

# expand auto complete of zsh
if [ -e /usr/local/share/zsh-completions ]; then
    fpath=(/usr/local/share/zsh-completions $fpath)
fi


export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# -----------------------
# aliases
# -----------------------

alias ls='ls -G'
alias ll='ls -lG'
alias la='ls -laG'
alias vim='Vim'
alias mysql='/Applications/MAMP/Library/bin/mysql'
alias ctags='/Applications/MacVim.app/Contents/MacOS/ctags "$@"'
alias zsh='/usr/local/bin/zsh'
