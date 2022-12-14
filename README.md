# dotfiles

User-defined configuration files repository

## zsh

There are five startup files that zsh will read commands from:

```bash
$ZSH/.zshenv
$ZSH/.zshrc
$ZSH/.zprofile
$ZSH/.zlogin
$ZSH/.zlogout
```

`$ZSH` is environment variable set in `zsh/.zshenv` and sourced on all invocations of the shell, unless the -f option is set. It should contain commands to set the command search path, plus other important environment variables. `.zshenv` should not contain commands that produce output or assume the shell is attached to a tty.

`.zshrc` is sourced in interactive shells. It should contain commands to set up aliases, functions, options, key bindings, etc.
`.zlogin` is sourced in login shells. It should contain commands that should be executed only in login shells. `.zlogout` is sourced when login shells exit.
