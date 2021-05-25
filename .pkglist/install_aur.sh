# should already have git by this point
while read packagename; do
    url="https://aur.archlinux.org/$packagename.git"
    git clone $url
    cd $packagename
    yes | makepkg -sri
    cd ..
done < pkglist_aur.txt

# gets my ST build
mkdir st
cd st
url='https://raw.githubusercontent.com/MetriC-DT/st/master/PKGBUILD'
wget "$url"
yes | makepkg -sri
cd ..
rm -rf st
