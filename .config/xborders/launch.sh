kill $(ps -u $USER | grep -i xborders | awk '{print $1;}')
#xborders & disown
xborders \
	--border-rgba "${theme_primary}FF" \
	--border-radius 10 \
	--border-width 2 \
	--border-mode inside \
	--disable-version-warning \
	--positive-x-offset 0 \
	--positive-y-offset 0 \
	--negative-x-offset 0 \
	--negative-y-offset 0 \
	& disown

