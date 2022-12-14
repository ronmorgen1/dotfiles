export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="custom"

plugins=(
	git
	zsh-syntax-highlighting
)

for FILE in "$HOME/dotfiles/zsh"
do
    [ -f "$FILE" ] && source "$FILE"
done

source $ZSH/oh-my-zsh.sh
