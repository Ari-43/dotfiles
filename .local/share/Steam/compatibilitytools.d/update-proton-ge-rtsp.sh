#!/usr/bin/env bash
set -euo pipefail

compatdir="$HOME/.local/share/Steam/compatibilitytools.d/"

# Check if Proton-GE-RTSP needs to be updated
# Using .tar.gz distributable because the sha512sum does not include the .tar.zst file: https://github.com/GloriousEggroll/proton-ge-custom/issues/397
dl="$(curl -s https://api.github.com/repos/SpookySkeletons/proton-ge-rtsp/releases/latest | grep browser_download_url | cut -d\" -f4 | grep .tar.gz)"
ver="${dl%.tar.gz}"
ver="${ver##*/}"
if [[ -d "$compatdir"/"$ver" ]]; then
	echo -e "$ver is up-to-date!"
	exit
else
	echo -e "Updating Proton GE RTSP..."
fi

# Check if there is more than enough free memory to safely use /tmp/, if /tmp/ is mounted as tmpfs
# There are a bunch of cases where this would fall back to internal storage when /tmp/ would be perfectly
# fine, but it's better to be safe and a bit slower than to crash the system or fail by hitting the tmpfs quota
if [[ $(stat -f -c %T /tmp/) == 'tmpfs' ]] && ( [[ $(free --byte | tr -s " " | cut -d " " -f7 | head -n 2 | tail -n 1) -lt 1073741824 ]] || [[ $(df /tmp/ --output=avail --block-size=1 | tail -n 1) -lt 2147483648 ]] ); then
	echo "Not enough free memory to safely download in '/tmp/', downloading tarball to internal storage instead"
	dldir="$compatdir/tmp-proton-ge-rtsp/"
else
	dldir="/tmp/proton-ge-rtsp"
fi

# Make temp working directory
rm -rf "$dldir"
mkdir -p "$dldir"
cd "$dldir"

echo "Download Proton GE RTSP tarball..."
curl --progress-bar -LOJ "$dl"
echo -n "Download Proton GE RTSP checksum... "
curl -sLOJ "$(curl -s https://api.github.com/repos/SpookySkeletons/proton-ge-rtsp/releases/latest | grep browser_download_url | cut -d\" -f4 | grep .sha512sum)" && echo "Done."
echo -n "Check tarball hash: "
sha512sum -c ./*.sha512sum || exit 1

echo "Extract Proton tarball to Steam Proton directory"
mkdir -p "$compatdir"
tar -xf GE-Proton*.tar.gz -C "$compatdir" || exit 1

rm -rf "$dldir"
echo "All done :)"
