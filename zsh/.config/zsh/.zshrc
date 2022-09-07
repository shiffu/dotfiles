#!/bin/sh
export ZDOTDIR=$HOME/.config/zsh
setopt appendhistory

# some useful options (man zshoptions)
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
stty stop undef		# Disable ctrl-s to freeze terminal.
zle_highlight=('paste:none')

# beeping is annoying
unsetopt BEEP

# completions
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)		# Include hidden files.

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Colors
autoload -Uz colors && colors

# Useful Functions
source "$ZDOTDIR/zsh-functions"

# Normal files to source
zsh_source_file "zsh-exports"
zsh_source_file "zsh-aliases"
zsh_source_file "zsh-prompt"
zsh_source_file "zsh-vim-mode"

# Plugins
zsh_import_plugin "zsh-users/zsh-autosuggestions"
zsh_import_plugin "zsh-users/zsh-syntax-highlighting"
zsh_import_plugin "hlissner/zsh-autopair"
# For more plugins: https://github.com/unixorn/awesome-zsh-plugins
# More completions https://github.com/zsh-users/zsh-completions

compinit

# Key-bindings
bindkey "^p" up-line-or-beginning-search # Up
bindkey "^n" down-line-or-beginning-search # Down

# FZF 
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# [ -f $ZDOTDIR/completion/_fnm ] && fpath+="$ZDOTDIR/completion/"

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Environment variables set everywhere
export EDITOR="nvim"
