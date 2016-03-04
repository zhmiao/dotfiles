# Aliases in this file are bash and zsh compatible

# Get operating system
platform='unknown'
unamestr=$(uname)
platform='darwin'

# Delete message
alias delmess='rm -rf ~/Library/Messages/*'

# ifort short
alias ifo='ifort *.o'
alias out='./*.out'
alias run='./RUN'
alias ob='ifort -c'

# For Tmux
alias td="tmux detach -a"

# Show human friendly numbers and colors
alias df='df -h'
alias du='du -h -d 2'

# All kinds of lists
alias ll='ls -alGh'
alias ls='ls -Gh'
alias la='ls -A'
alias lla='ls -lA'
alias lf90='ls *.f90'
alias lf='ls -d */'

# show me files matching "ls grep"
alias lsg='ll | grep'
alias lsd='lf | grep'

# Alias Editing
alias ae='nvim ~/.zsh/aliases.zsh' #alias edit
alias ar='source ~/.zsh/aliases.zsh'  #alias reload

# For reload zsh comfigurations
alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"

# vim using
# mvim --version > /dev/null 2>&1
# MACVIM_INSTALLED=$?
# if [ $MACVIM_INSTALLED -eq 0 ]; then
#   alias vim="mvim -v"
# fi

# Vim and Neovim
alias nv='nvim'

# mimic vim functions
alias :q='exit'

# vimrc editing
alias ve='nvim ~/.vimrc'

# zsh profile editing
alias ze='nvim ~/.zshrc'
alias zr='source ~/.zshrc'

# Common shell functions
alias less='less -r'
alias tf='tail -f'
alias l='less'
alias lh='ls -alt | head' # see the last modified files

# Override rm -i alias which makes rm prompt for every action
alias rm='nocorrect rm'

# Homebrew
alias brewu='brew update && brew upgrade && brew cleanup && brew prune && brew doctor'

# Homebrew version Ruby
alias ruby='/usr/local/bin/ruby'
# Git related
# Don't try to glob with zsh so you can do
# stuff like ga *foo* and correctly have
# git add the right stuff
alias git='noglob git'

