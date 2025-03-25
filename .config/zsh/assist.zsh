syntaxmode=fast

function setupassist () {
	if [[ $syntaxmode == 'fast' ]]; then
		sourceife /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
	else
		# https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
		# Arch, Debian, BSD, and macOS Brew respectively
		source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh || \
		source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh || \
		source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh || \
		sourceife $(brew --prefix 2> /dev/null)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
	fi
	# https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md
	# Arch, Debian, and macOS Brew respectively
	source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh || \
	source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh || \
	sourceife $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
}
setupassist
