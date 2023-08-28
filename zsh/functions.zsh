#! /usr/bin/env zsh
# vim: set fdm=marker:

# ######################
# Custom Functions #####
# ######################

# Source file if it exists under "$HOME/.zsh/custom/functions"
for f in $HOME/.zsh/custom/functions/*.zsh; do
	if [[ -f "$f" ]]; then
		source "$f"
	fi
done

# ######################
# ## General ###########
# ######################

function mcd() {
	mkdir -p "$1" && cd "$1"
}

# Pretty print functions in alphabetical order with spacing
function pa() {
	alias | grep "$1" | sort | sed -E "s/alias ([^=]+)='(.*)'/\1 = \2/"
}
