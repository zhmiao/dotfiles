#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

export EDITOR='nano'
export VISUAL='nano'
export PAGER='less'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  $path
)

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
if (( $+commands[lesspipe.sh] )); then
  export LESSOPEN='| /usr/bin/env lesspipe.sh %s 2>&-'
fi

#
# Temporary Files
#

if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$USER"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"
if [[ ! -d "$TMPPREFIX" ]]; then
  mkdir -p "$TMPPREFIX"
fi


# # Setting PATH for Python 3.5
# # The orginal version is saved in .zprofile.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
# export PATH

# added by Miniconda3 4.2.12 installer
export PATH="/Users/ranranking/miniconda3/bin:$PATH"

# # python bin
# PATH="/Users/ranranking/pybin:${PATH}"
# export PATH

# Postgres
PATH="/Library/PostgreSQL/9.5/bin:${PATH}"
export PATH

# cuda
# export CUDA_HOME=/usr/local/cuda
export CUDA_HOME="/usr/local/cuda"
export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:$CUDA_HOME/lib"
export PATH="$CUDA_HOME/bin:$PATH"
#export DYLD_FALLBACK_LIBRARY_PATH="/usr/local/cuda/lib:$HOME/miniconda3/lib:/usr/local/lib:/usr/lib:$DYLD_FALLBACK_LIBRARY_PATH"
export LD_LIBRARY_PATH="/usr/local/cuda/lib:$LD_LIBRARY_PATH"
export CAFFE_ROOT="/Users/ranranking/Work/UCB/Projects/caffe"
#export PYTHONPATH="/Users/ranranking/Work/UCB/Projects/caffe/python:$PYTHONPATH"
#export CPLUS_INCLUDE_PATH="$HOME/miniconda3/include/python3.6m/:"
#export PATH="/usr/local/opt/llvm/bin:$PATH"
# # Setting PATH for Python 2.7
# # The orginal version is saved in .zprofile.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
# export PATH
