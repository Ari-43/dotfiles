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

sourceife $HOME/.config/zsh/assist.zsh

# Disable beep
unsetopt beep

# This does... something
bindkey -e

# zsh truecolor support
# https://wiki.archlinux.org/title/zsh#Colors
[[ "$COLORTERM" == (24bit|truecolor) || "${terminfo[colors]}" -eq '16777216' ]] || zmodload zsh/nearcolor

# Prompts
sourceife $HOME/.config/zsh/prompt.zsh

# Nix
sourceife $HOME/.nix-profile/etc/profile.d/nix.sh

# Aliases
sourceife $HOME/.config/shell/aliases
