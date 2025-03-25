# Prompts
## Fix broken output
autoload -Uz add-zsh-hook
function _reset-broken-terminal () {
	printf '%b' '\e[0m\e(B\e)0\017\e[?5l\e7\e[0;0r\e8'
}
add-zsh-hook -Uz precmd _reset-broken-terminal
function _on-accept-line {
	_reset-broken-terminal
	zle reset-prompt
	zle .accept-line # `.` calls the default accept-line function
}
zle -N accept-line _on-accept-line # Replace accept-line with my own

# Human readable error codes
function ecp () {
	~/.config/shell/errorcodeparser $1
}

# Short directory listing (currently not used)
# sourcing this file defines the `spwd` function
sourceife $HOME/.config/shell/shortpwd

sourceife $HOME/.config/zsh/prompts/*
prompt slick-arrows
