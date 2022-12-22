#==============
# Remove old dot flies
#==============
sudo rm -rf ~/.vim >/dev/null 2>&1
sudo rm -rf ~/.vimrc >/dev/null 2>&1
sudo rm -rf ~/.tmux.conf >/dev/null 2>&1
sudo rm -rf ~/.zshrc >/dev/null 2>&1
sudo rm -rf ~/.gitconfig >/dev/null 2>&1
sudo rm -rf ~/.gitignore >/dev/null 2>&1
sudo rm -rf ~/.config/alacritty >/dev/null 2>&1
sudo rm -rf ~/.config/bat >/dev/null 2>&1

#==============
# Create symlinks in the home folder
# Allow overriding with files of matching names in the custom-configs dir
#==============

SYMLINKS=()
ln -sf ~/dotfiles/vim ~/.vim
SYMLINKS+=('.vim')
ln -sf ~/dotfiles/.vimrc ~/.vimrc
SYMLINKS+=('.vimrc')
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
SYMLINKS+=('.tmux.conf')
ln -sf ~/dotfiles/.zshrc ~/.zshrc
SYMLINKS+=('.zshrc')
ln -sf ~/dotfiles/git/.gitconfig ~/.gitconfig
SYMLINKS+=('.gitconfig')
ln -sf ~/dotfiles/git/.gitignore ~/.gitignore
SYMLINKS+=('.gitignore')
ln -sf ~/dotfiles/config/alacritty ~/.config/alacritty
SYMLINKS+=('alacritty')
ln -sf ~/dotfiles/config/bat ~/.config/bat
SYMLINKS+=('bat')

echo ${SYMLINKS[@]}
