#Load themes from yadr and from user's custom prompts (themes) in ~/.zsh.prompts
autoload promptinit
fpath=( $HOME/.zsh/prompts $fpath )
promptinit
