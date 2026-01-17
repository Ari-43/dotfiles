setopt autocd correct histignorespace PROMPT_SUBST

# Shell completion & correction
zstyle :compinstall filename '/home/ari/.config/zsh/.zshrc'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion::complete:*' gain-privileges 1
zstyle ':completion:*' menu select
zstyle ':completion:*' use-ip true
autoload -Uz compinit bashcompinit select-word-style
compinit
select-word-style bash
bashcompinit

ENABLE_CORRECTION="true"

sourceife $HOME/.config/zsh/assist.zsh

# Disable beep
unsetopt beep

# This does... something
bindkey -e

# Ctrl+D to clear line
# https://wiki.archlinux.org/title/Zsh#Shortcut_to_exit_shell_on_partial_command_line
exit_zsh() { exit }
zle -N exit_zsh
bindkey '^D' exit_zsh

# zsh truecolor support
# https://wiki.archlinux.org/title/zsh#Colors
[[ "$COLORTERM" == (24bit|truecolor) || "${terminfo[colors]}" -eq '16777216' ]] || zmodload zsh/nearcolor

# Prompts
sourceife $HOME/.config/zsh/prompt.zsh

# Nix
sourceife $HOME/.nix-profile/etc/profile.d/nix.sh

# Aliases
sourceife $HOME/.config/shell/aliases
