
# Look for pyenv in $PATH and verify that it's not a part of pyenv-win in WSL
if ! command -v pyenv &>/dev/null; then
  FOUND_PYENV=0
elif [[ "${commands[pyenv]}" = */pyenv-win/* && "$(uname -r)" = *icrosoft* ]]; then
  FOUND_PYENV=0
else
  FOUND_PYENV=1
fi

# Look for pyenv and try to load it (will only work on interactive shells)
if [[ $FOUND_PYENV -ne 1 ]]; then
  pyenvdirs=("$HOME/.pyenv" "/usr/local/pyenv" "/opt/pyenv" "/usr/local/opt/pyenv")
  for dir in $pyenvdirs; do
    if [[ -d "$dir/bin" ]]; then
      FOUND_PYENV=1
      break
    fi
  done

  if [[ $FOUND_PYENV -ne 1 ]]; then
    if (( $+commands[brew] )) && dir=$(brew --prefix pyenv 2>/dev/null); then
      if [[ -d "$dir/bin" ]]; then
        FOUND_PYENV=1
      fi
    fi
  fi

  # If we found pyenv, load it but show a caveat about non-interactive shells
  if [[ $FOUND_PYENV -eq 1 ]]; then
    # Configuring in .zshrc only makes pyenv available for interactive shells
    export PYENV_ROOT="$dir"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)"
    echo "pyenv command not found in $PATH"
  fi
fi

if [[ $FOUND_PYENV -eq 1 ]]; then
  if [[ -z "$PYENV_ROOT" ]]; then
    # This is only for backwards compatibility with users that previously relied
    # on this plugin exporting it. pyenv itself does not require it to be exported
    export PYENV_ROOT="$(pyenv root)"
  fi

  # Add pyenv shims to $PATH if not already added
  if [[ -z "${path[(Re)$(pyenv root)/shims]}" ]]; then
    eval "$(pyenv init --path)"
    echo "missing pyenv shims in $PATH"
  fi

  # Load pyenv
  eval "$(pyenv init - --no-rehash zsh)"

  # If pyenv-virtualenv exists, load it
  if [[ "$ZSH_PYENV_VIRTUALENV" != false && "$(pyenv commands)" =~ "virtualenv-init" ]]; then
    eval "$(pyenv virtualenv-init - zsh)"
  fi

  function pyenv_prompt_info() {
    local version="$(pyenv version-name)"
    echo "${version:gs/%/%%}"
  }
else
  # Fall back to system python
  function pyenv_prompt_info() {
    local version="$(python3 -V 2>&1 | cut -d' ' -f2)"
    echo "system: ${version:gs/%/%%}"
  }
fi

unset FOUND_PYENV pyenvdirs dir