# disallow if running as root
if [ "$EUID" -eq 0 ]; then
    echo "Do not run as root!"
    exit 1
fi

# should already have git by this point
while read packagename; do
	pacman -Q "$packagename" >> /dev/null 2>&1
	if [ $? -ne 0 ]; then
		url="https://aur.archlinux.org/$packagename.git"
		git clone $url
		cd "$packagename"
		yes | makepkg -sri
		cd ..
		rm -rf "$packagename"
	fi
done < ./pkglist/pkglist_aur.txt
