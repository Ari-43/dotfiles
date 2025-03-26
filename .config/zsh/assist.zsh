function setupassist () {
	if [[ $1 == 'fast' ]]; then
		# I only have an Arch path for now
		source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh || \
		return 1
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
# Janky, but it works for falling back if zsh-fast-syntax-highlighting is not available
setupassist fast 2> /dev/null || setupassist slow
