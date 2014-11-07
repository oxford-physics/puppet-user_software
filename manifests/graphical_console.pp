class user_software::graphical_console inherits user_software::params{
 case $::operatingsystem {
    /RedHat|CentOS|Scientific/: {

  #Thank you to puppet labs issue 5175 
  exec { 'yum Group Install KDE Desktop':
  unless  => '/usr/bin/yum grouplist "KDE Desktop" | /bin/grep "^Installed Groups"',
  command => '/usr/bin/yum -y groupinstall "KDE Desktop"',
  }
     ensure_packages ( ['kdm', 'xorg-x11-server-Xorg', 'xorg-x11-drivers'] )
     #TODO: sed /etc/inittab / targetwants to "rl" 5
     
  }

  /Ubuntu/: {
     enusure_packages ( ['ubuntu_desktop'])
  }

 }
}
