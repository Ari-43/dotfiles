
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec startx
fi

export PATH=$PATH:"$HOME/.local/bin"

export EDITOR='/usr/bin/nvim'
export VISUAL=$EDITOR 
export PAGER='nvimpager'
export MANPAGER='nvim +Man!'

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=100000
setopt autocd correct histignorespace
unsetopt beep
bindkey -e
zstyle :compinstall filename '/home/ari/.zshrc'
autoload -Uz compinit select-word-style
compinit
select-word-style bash
zstyle ':completion::complete:*' gain-privileges 1

ENABLE_CORRECTION="true"
if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh; fi
#if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh; fi

# https://wiki.archlinux.org/title/zsh#Colors
[[ "$COLORTERM" == (24bit|truecolor) || "${terminfo[colors]}" -eq '16777216' ]] || zmodload zsh/nearcolor
autoload -Uz promptinit
promptinit
fpath=("$HOME/.zprompts" "$fpath[@]")
prompt_custom_setup() {
	PS1='%F{27}'$'\ue0c7''%K{27}%F{15} %* %K{39}%F{27}'$'\ue0b0%F''{15} %n %K{45}%F{39}'$'\ue0b0%'' %F{15} %~ %k%F{45}'$'\ue0b0''%f%k '
}
prompt_themes+=( custom )
prompt custom

source $HOME/.shell_aliases # Shared with bash
if [ -x $HOME/.local/bin/welcome ]; then $HOME/.local/bin/welcome; fi

if [ -e /home/ari/.nix-profile/etc/profile.d/nix.sh ]; then . /home/ari/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
