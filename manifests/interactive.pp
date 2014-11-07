class user_software::interactive {
#   $user_package_list_generic_int = [ "emacs", 'mesa-libGL', 'kdebase', 'firefox','fuse-sshfs','ctags',  'gnome-applets', 'gnome-utils', 'gnome-terminal', 'desktop-file-utils', 'gnome-session', 'xterm', 'dia', 'gv', 'cvs2svn', 'kdegraphics', 'doxygen', 'a2ps', 'sendmail-cf',  'lyx', 'valgrind', 'system-config-printer', 'openssh-askpass', 'graphviz', 'gedit', 'gimp-data-extras', 'indent', 'alpine', 'xpdf',   'evince', 'xorg-x11-font-utils',  'kile', 'mercurial.x86_64', 'xemacs', 'xemacs-packages-extra', 'xorg-x11-fonts-misc','meld',  'rdesktop' ,'kdesdk','perl-Syntax-Highlight-Engine-Kate', 'mc', 'eclipse-cdt-sdk' ,'eclipse-mylyn-cdt', 'eclipse-callgraph',  'eclipse-valgrind' ,'eclipse-linuxprofilingframework', 'eclipse-subclipse-graph', 'eclipse-changelog','eclipse-rse', 'eclipse-rpm-editor', 'eclipse-oprofile', 'eclipse-eclox', 'eclipse-gef', "eclipse-pde", "eclipse-cdt-parsers"]
$user_package_list_generic_int = [ 'PPInteractive', 'kstart', 'tigervnc', "imake", "qt-devel" , "eog", "gthumb", "vim-X11"]
$debuginfo_package_list = ["e2fsprogs-debuginfo", "expat-debuginfo", "freetype-debuginfo", "keyutils-debuginfo", "krb5-debuginfo", "libselinux-debuginfo", "openssl-debuginfo", "zlib-debuginfo", "libICE-debuginfo","libSM-debuginfo","libX11-debuginfo","libXau-debuginfo","libXcursor-debuginfo","libXdamage-debuginfo","libXext-debuginfo","libXfixes-debuginfo","libXi-debuginfo","libXinerama-debuginfo","libXmu-debuginfo","libXrandr-debuginfo","libXrender-debuginfo","libXt-debuginfo","libXxf86vm-debuginfo","libdrm-debuginfo","libpng-debuginfo","util-linux-ng-debuginfo.x86_64","libxcb-debuginfo","mesa-debuginfo","mesa-debuginfo","qt-debuginfo",  alsa-lib-debuginfo,  fontconfig-debuginfo ,  gcc-debuginfo,  glib2-debuginfo,  gstreamer-debuginfo,  gstreamer-plugins-base-debuginfo,  libjpeg-turbo-debuginfo , libmng-debuginfo , libtiff-debuginfo,  libxml2-debuginfo,mesa-private-llvm-debuginfo, elfutils-debuginfo ]

#kdesdk for "kate"

  ensure_packages ( $user_package_list_generic_int  )
  ensure_packages ( $debuginfo_package_list )
  $sl6utils = [ 'xarchiver' ]
  ensure_packages ( $sl6utils )


}
