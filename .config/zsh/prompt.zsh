# Prompts
## Fix broken output
autoload -Uz add-zsh-hook
function reset_broken_terminal () {
	printf '%b' '\e[0m\e(B\e)0\017\e[?5l\e7\e[0;0r\e8'
}
add-zsh-hook -Uz precmd reset_broken_terminal

# Human readable error codes
ecp () {
	~/.config/shell/errorcodeparser $1
}

# Short directory listing (currently not used)
# sourcing this file defines the `spwd` function
sourceife $HOME/.config/shell/shortpwd

## My Prompt
autoload -Uz promptinit
promptinit
fpath=("$HOME/.zprompts" "$fpath[@]")
prompt_custom_setup() {
	PS1='%F{27}'$'\ue0c7''%K{27}%F{15} %n %K{39}%F{27}'$'\ue0b0'' %F{15}%~ %k%F{39}'$'\ue0b0''%f%k '
	RPROMPT='%F{207}'$'\ue0b2''%K{207}%F{15} $(ecp $?) %F{201}'$'\ue0b2''%K{201}%F{15} %M %F{165}'$'\ue0b2''%K{165}%F{15} %* %k%F{165}'$'\ue0c6''%f%k'
}
prompt_themes+=( custom )
prompt custom
