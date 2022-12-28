export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit
complete -C '/usr/local/bin/aws_completer' aws

plugins=(
	zsh-syntax-highlighting
	jump
)

for FILE in $(find "$HOME/dotfiles/zsh")
do
    [ -f "$FILE" ] && source "$FILE"
done

source $ZSH/oh-my-zsh.sh
