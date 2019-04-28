# cp -va ~/Qt5.10.0.bak/5.10.0/gcc_64/lib/libQt5{Core,Gui,Widgets,Network,Qml,Quick,QuickTemplates2,QuickControls2,QuickWidgets,XcbQpa,Svg,DBus}.so* .


set -x

md5sums=""
sha1sums=""

for p in qt512_linux_x64 qt512_macos_x64_xcode10.1 qt512_macos_x64_xcode9.3 qt512_win_x64 qt512_android_arm7 qt512_linux_x64_static qt512_win_x32 qt512_win_x64_static qt512_android_x86 qt512_macos_x64_xcode8.3 qt512_win_x32_static; do
    echo $p
    tar zcvf $p.tar.bz2 $p
    md5val=$(md5sum $p.tar.bz2)
    sha1val=$(sha1sum $p.tar.bz2)
    md5sums="${md5sums}\n${md5val}"
    sha1sums="${sha1sums}\n${sha1val}"
done

echo -e "$md5sums" > md5sums.txt
echo -e "$sha1sums" > sha1sums.txt

tar jcf qt512_qtenv_win32.tar.gz qtenv_win32
tar jcf qt512_qtenv_win64.tar.gz qtenv_win64

