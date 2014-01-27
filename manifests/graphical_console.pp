class user_software::graphical_console inherits user_software::params{
 case $::operatingsystem {
    /RedHat|CentOS|Scientific/: {

  #Thank you to puppet labs issue 5175 
  exec { 'yum Group Install devtools':
  unless  => '/usr/bin/yum grouplist "Development tools" | /bin/grep "^Installed Groups"',
  command => '/usr/bin/yum -y groupinstall "KDE Desktop"',
  }
     ensure_packages ( ['kdm', 'Xorg'] )
  }

  /Ubuntu/: {
     enusure_packages ( ['ubuntu_desktop'])
  }

 }
}
