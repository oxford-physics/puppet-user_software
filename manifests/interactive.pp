class user_software::interactive {
   $user_package_list_generic_int = [ "emacs", 'mesa-libGL', 'kdebase', 'firefox','fuse-sshfs','ctags',  'gnome-applets', 'gnome-utils', 'gnome-terminal', 'desktop-file-utils', 'gnome-session', 'xterm', 'dia', 'gv', 'cvs2svn', 'kdegraphics', 'doxygen', 'a2ps', 'sendmail-cf',  'lyx', 'valgrind', 'system-config-printer', 'openssh-askpass', 'graphviz', 'gedit', 'gimp-data-extras', 'indent', 'alpine', 'xpdf',   'evince', 'xorg-x11-font-utils',  'kile', 'mercurial.x86_64', 'xemacs', 'xemacs-packages-extra', 'xorg-x11-fonts-misc','meld',  'rdesktop' ,'kdesdk','perl-Syntax-Highlight-Engine-Kate', 'mc', 'eclipse-cdt-sdk' ,'eclipse-mylyn-cdt', 'eclipse-callgraph',  'eclipse-valgrind' ,'eclipse-linuxprofilingframework', 'eclipse-subclipse-graph', 'eclipse-changelog','eclipse-rse', 'eclipse-rpm-editor', 'eclipse-oprofile', 'eclipse-eclox', 'eclipse-gef', "eclipse-pde", "eclipse-cdt-parsers"]
#kdesdk for "kate"

  ensure_packages ( $user_package_list_generic_int  )
  $sl6utils = [ 'xarchiver' ]
  ensure_packages ( $sl6utils )


}
