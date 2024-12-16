kill $(ps -u $USER | grep -i xborders | awk '{print $1;}')
#xborders --config ~/.config/xborder/config.json & disown
xborders \
	--border-rgba "$theme_primary" \
	--border-radius 10 \
	--border-width 2 \
	--border-mode inside \
	--disable-version-warning \
	--positive-x-offset 0 \
	--positive-y-offset 0 \
	--negative-x-offset 0 \
	--negative-y-offset 0 \
	& disown

