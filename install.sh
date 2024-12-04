#!/usr/bin/env bash
cd
# Check for network connectivity
echo 'Checking network status...'
# https://unix.stackexchange.com/a/190610 
# I'm often on networks with captive portals and sometimes edit my dotfiles while
# offline. This makes it so that the dotfiles are only cloned or pulled if there
# is a fully functional internet connection that allows access to GitHub. 
if nc -zw1 github.com 443 2>/dev/null && echo |openssl s_client -connect github.com:443 2>&1 |awk '
	$1 == "SSL" && $2 == "handshake" { handshake = 1 }
	handshake && $1 == "Verification:" { ok = $2; exit }
	END { exit ok != "OK" }'; then
	net='1'
	echo '[✓] Network connection'
else
	net='0'
	echo '[X] Network connection'
fi

# Clone dotfiles
echo "What dotfile directory would you like to use relative to $(pwd)/?" # $HOME may sometimes have a trailing directory /. This is a quick and dirty way around that because I'm lazy. TODO: FIX
read -ei 'dotfiles' -p 'Enter directory: ' dotfiledir
if [ ! -d ./$dotfiledir ] ; then
	echo "Cloning Ari's dotfiles repository into $(pwd)/$dotfiledir..."
	if [ $net == 1 ]; then
		echo 'Cloning dotfile repository...'
		git clone https://github.com/Ari-RERA-43/dotfiles.git $dotfiledir && echo '[✓] Dotfiles cloned'
	else
		echo 'WARNING: You are not connected to a network. Connect to a network to download these dotfiles.'
		exit 1
	fi
else
	echo "Looks like $(pwd)/$dotfiledir already exists, using it"
fi

cd $dotfiledir
# Make sure dotfiles are up to date if the system is connected to the internet
if [ $net == 1 ]; then
	echo 'Updating dotfile repository...'
	git pull && echo '[✓] Dotfiles updated'
else
	echo 'WARNING: You are not connected to a network, updated dotfiles will not be pulled from the git remote.'
fi

echo "Running stow to create symlinks..."
stow --no-folding --verbose ./

# Create necessary directories and empty files that aren't handled by stow
echo 'Creating other dirs...'
mkdir -pv $HOME/.local/share/shell/ && echo '[✓] Directories Created'

echo 'Done!
You may need to log out and back in for all changes to apply.'
