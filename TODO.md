# To-Do—Next stable branch merge (High priority)

- Finish polybar update status script
  - Flatpak support
  - Click to open a terminal and update using a configurable command
  - Captive network & offline handling
- Verify xfce4 locker functionality and security
- Verify xfce4 notification daemon startup works reliably
- Fix theming in certain GTK4 applications

# General To-Do (Low priority)

- Add support for other distributions and package managers to polybar update status script
  
  - `apt`
  
  - Nix
  
  - Flatpak (High priority)

- Add support for other distributions and package managers to sysupdate script
  
  - `apt`
  
  - Nix
  
  - Flatpak

- Make polybar modules that do not strictly need to use a monospace font more readable using Noto Sans
  
  - xwindow
  - date
  - i3

- Fix polybar icon vertical alignment

- Fix horizontal alignment of some icons
  
  - Volume mute/unmute shifts the icon
    - Use a half space to add padding to the unmuted icon?

- Finish Albert configuration
  
  - Fix xborder showing around albert with empty padding in between

- Set up an easier way of switching keyboard layouts
  
  - Currently using ibus-daemon or shell commands/aliases

- Reorganize polybar to be more balanced instead of most modules being on the right

- Make mpvradio useful without being in a bar

- Fix non-centered picom shadow on Polybar

# Long-term project: Switch to Sway(Fx)

- All applicable General TODO items

- Set up a bar that works on Wayland
  
  - Options: Waybar, Eww, ags

- Security & Power managment
  
  - Suspend on lid close
  - LightDM-like lock screen

- Screenshot tool
  
  - xfce4-screenshooter may work since the XFCE 4.20 update
