# disallow if running as root
if [ "$EUID" -eq 0 ]; then
    echo "Do not run as root!"
    exit 1
fi

# should already have git by this point
while read packagename; do
    url="https://aur.archlinux.org/$packagename.git"
    git clone $url
    cd $packagename
    yes | makepkg -sri
    cd ..
    rm -rf "$packagename"
done < pkglist_aur.txt

