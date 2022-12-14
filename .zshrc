export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="custom"

plugins=(
	git
	zsh-syntax-highlighting
)

for DOTFILE in `find $HOME/.dotfiles/zsh`
do
    [ -f "$DOTFILE" ] && source "$DOTFILE"
done

source $ZSH/oh-my-zsh.sh
