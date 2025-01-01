setopt autocd correct histignorespace PROMPT_SUBST

# Shell completion & correction
zstyle :compinstall filename '/home/ari/.config/zsh/.zshrc'
autoload -Uz compinit bashcompinit select-word-style
select-word-style bash
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Za-z}'
zstyle ':completion::complete:*' gain-privileges 1
zstyle ':completion:*' menu select
compinit
bashcompinit

ENABLE_CORRECTION="true"

# TODO: Set up zsh-fast-syntax-highlighting
sourceife /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh # Arch
sourceife /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh # Debian
sourceife /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh # BSD
sourceife $(brew --prefix 2> /dev/null)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh # macOS Brew

sourceife /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh # Arch
sourceife /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh # Debian

# Disable beep
unsetopt beep

# This does... something
bindkey -e

# Performance Profiling
zmodload zsh/zprof

# zsh truecolor support
# https://wiki.archlinux.org/title/zsh#Colors
[[ "$COLORTERM" == (24bit|truecolor) || "${terminfo[colors]}" -eq '16777216' ]] || zmodload zsh/nearcolor

# Prompts
sourceife $HOME/.config/zsh/prompt.zsh

# Nix
sourceife $HOME/.nix-profile/etc/profile.d/nix.sh

# Aliases
sourceife $HOME/.config/shell/aliases
