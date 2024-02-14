
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec startx
fi

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10000
setopt autocd correct
unsetopt beep
bindkey -e
zstyle :compinstall filename '/home/ari/.zshrc'
autoload -Uz compinit select-word-style
compinit
select-word-style bash
zstyle ':completion::complete:*' gain-privileges 1

ENABLE_CORRECTION="true"
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

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

source $HOME/.bash_aliases # ZSH seems to handle bash aliases fine
$HOME/.local/bin/welcome
