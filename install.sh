#!/usr/bin/env bash
cd

args=$@

function sourceife () {
	if [ -f "$1" ]; then
		source "$@"
	fi
}

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

# Read local installer configuration file
dotfileconffile="$HOME/.config/net.ari43.dotfiles/dotfileconf"
if [[ $args == *'noconf'* ]]; then 
	echo 'Skipping local dotfile installer configuration'
else
	echo Reading local installer configuration
	sourceife $dotfileconffile
fi

# Clone dotfiles
if [ -z $dotfiledir ]; then
	echo "What dotfile directory would you like to use?"
	read -ei "$HOME/dotfiles" -p 'Directory: ' dotfiledir
else
	echo "Using $dotfiledir as defined in $dotfileconffile"
	echo "Use the \`noconf\` command line flag to override this"
fi

if [ ! -d $dotfiledir ] ; then
	echo "Cloning Ari43's dotfiles repository into $dotfiledir..."
	if [ $net == 1 ]; then
		echo "Cloning dotfile repository into $dotfiledir..."
		mkdir -pv $dotfiledir
		git clone https://github.com/Ari-43/dotfiles.git $dotfiledir && echo '[✓] Dotfiles cloned'
	else
		echo 'WARNING: You are not connected to a network that can access GitHub. Connect to a network to download these dotfiles.'
		exit 1
	fi
else
	echo "Looks like $dotfiledir already exists, using it"
fi

cd $dotfiledir
# Make sure dotfiles are up to date if the system is connected to the internet
if [ $net == 1 ]; then
	echo 'Updating dotfile repository...'
	git pull && echo '[✓] Dotfiles updated'
else
	echo 'WARNING: You are not connected to a network that can access GitHub. Updated dotfiles will not be pulled from the git remote.'
fi

echo "Running stow to create symlinks..."
stow --no-folding --verbose ./

# Create necessary directories and empty files that aren't handled by stow
echo 'Creating other dirs...'
mkdir -pv\
	$HOME/.local/share/shell/\
	$HOME/.config/net.ari43.dotfiles/\
	&& echo '[✓] Directories Created'

echo "Saving Preferences to $dotfileconffile"
echo "dotfiledir=$(pwd)
conf=1" > $dotfileconffile

echo 'You may need to log out and back in for all changes to apply.
Done!'
