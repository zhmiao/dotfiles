# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

for config_file ($HOME/.zsh/*.zsh) source $config_file

# For 256 colors
# Change the TERM environment variable (to get 256 colors) even if you are
# accessing your system through ssh and using either Tmux or GNU Screen:
   if [ "$TERM" = "xterm" ] || [ "$TERM" = "xterm-256color" ]
   then
       export TERM=xterm-256color
       export HAS_256_COLORS=yes
   fi
   if [ "$TERM" = "screen" ] && [ "$HAS_256_COLORS" = "yes" ]
   then
       export TERM=screen-256color
   fi

# For default editor
export EDITOR=nvim
export EDITOR=nvim ranger
export VISUAL=nvim
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd v edit-command-line
bindkey '^P' up-history
bindkey '^N' down-history

fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# =============================================
# Fzf settings

 set -o vi
 [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# For fzf functions
# CTRL-F for locate paste functions
__fsel_locate() {
  local cmd_locate="${FZF_CTRL_T_COMMAND:-"command find -L . \\( -path '*/\\.*' -o -fstype 'dev' -o -fstype 'proc' \\) -prune \
    -o -type f -print \
    -o -type d -print \
    -o -type l -print 2> /dev/null | sed 1d | cut -b3-"}"
  eval "$cmd_locate" | locate "*" | $(__fzfcmd) -m | while read item; do
    printf '%q ' "$item"
  done
  echo
}

fzf-file-widget_locate() {
  LBUFFER="${LBUFFER}$(__fsel_locate)"
  zle redisplay
}
zle     -N   fzf-file-widget_locate
bindkey '^E' fzf-file-widget_locate

# CTRL-Q for killing applications
fzf_killps() { zle -I; ps -ef | sed 1d | fzf -m | awk '{print $2}' | xargs kill -${1:-9} ; }; zle -N fzf_killps; bindkey '^Q' fzf_killps

#	================================================
# Enable vim mode on command line
bindkey -v

# no delay entering normal mode
# 10ms for key sequences
KEYTIMEOUT=1

#	================================================
# Fasd

eval "$(fasd --init auto)"
