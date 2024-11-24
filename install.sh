#!/usr/bin/env bash
cd
echo "What dotfiledir would you like to use relative to $(pwd)/?" # Home may sometimes have a trailing directory /. This is a quick and dirty way around that because I'm lazy. TODO: FIX
read -ei 'dotfiles' -p 'Enter directory: ' dotfiledir
if [ ! -d ./$dotfiledir ] ; then
	echo "Cloning Ari's dotfiles repository into $(pwd)/$dotfiledir"
	git clone https://github.com/Ari-RERA-43/dotfiles.git $dotfiledir
else
	echo "Looks like $(pwd)/$dotfiledir already exists, using it"
fi
cd $dotfiledir
git pull
echo "Running stow to create symlinks"
stow --no-folding --verbose ./

