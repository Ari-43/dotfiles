# dotfiles
My dotfiles, for use on multiple operating systems (mainly Linux).  
This repository also includes some simple scripts and other small projects that don't deserve their own repos.  
Much of what is here is very janky. If you use something, consider copying only the parts you actually need. 

## Screenshots
![Desktop example](/Pictures/screenshots/desktop.png)
![Laptop example](/Pictures/screenshots/laptop.png)

## Dependencies
Dependencies follow Arch and AUR package names, since that's what I currently use. These are for i3 and do not include all experimental configs in this repo (ie. Hyprland). 
### Important: 
`i3 rofi picom-ftlabs-git polybar xbindkeys network-manager-applet kitty bash`  
### Optional: 
`xfce4-power-manager libnotify xfce4-notifyd kvantum kvantum-qt5 kvantum-qt4-git papirus-icon-theme papirus-folders graphite-kde-theme-git graphite-gtk-theme-nord-git xfce4-clipman-plugin redshift redshift-gtk blueman streamdeckui xorg-setxkbmap xorg-xrdb clight clight-gui-git kdeconnect polkit-gnome gtk3-nocsd-git light-locker xfce4-screensaver i3lock firefox feh glib2 libinput-gestures xkb-switch conky zsh zsh-syntax-highlighting zsh-autosuggestions neovim xborder-git ttf-jetbrains-mono`

## Structure: 
The files within this repository are meant to be placed inside the user's home folder. For example, the `.config` folder in this repository should be placed at `$HOME/.config`. Files that are to be placed relative to root (`/`) are located in the `/rootfs` folder of this repository. 

## My keyboard is weird!
I'm a user of the Dvorak keyboard layout, so keybinds are optimized for that. Wherever possible I have used key codes instead of symbols (letters) for binds, but in some cases this is not possible, such as with neovim. Most cases of this are small and can be edited out easily. 
