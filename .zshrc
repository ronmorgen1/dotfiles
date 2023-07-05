# Path to your oh-my-zsh configuration.
ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

source "$ZSH/oh-my-zsh.sh"

# load zsh config files
[ -f "$HOME/.zsh/aliases" ] && source "$HOME/.zsh/aliases"
[ -f "$HOME/.zsh/git-aliases" ] && source "$HOME/.zsh/git-aliases"
[ -f "$HOME/.zsh/functions" ] && source "$HOME/.zsh/functions"
[ -f "$HOME/.zsh/options" ] && source "$HOME/.zsh/options"
[ -f "$HOME/.zsh/environment" ] && source "$HOME/.zsh/environment"
[ -f "$HOME/.zsh/completion" ] && source "$HOME/.zsh/completion"

# load local config
[ -f "$HOME/.local/etc/config.zsh" ] && source "$HOME/.local/etc/config.zsh"
[ -f "$HOME/.local/etc/local.zsh" ] && source "$HOME/.local/etc/local.zsh"
[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"

# Zoxide
if command -v zoxide >/dev/null; then
	eval "$(zoxide init zsh)"
fi

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Add tab completion for many Bash commands
if which brew >/dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
	source "$(brew --prefix)/share/bash-completion/bash_completion"
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion
fi

# fzf-zsh-completion
[ -f "$ZSH_CUSTOM/plugins/fzf-tab-completion/zsh/fzf-zsh-completion.sh" ] && source "$ZSH_CUSTOM/plugins/fzf-tab-completion/zsh/fzf-zsh-completion.sh"

# Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

plug "hlissner/zsh-autopair"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "$ZSH_CUSTOM/plugins/fzf-tab"

autoload -Uz compinit && compinit
