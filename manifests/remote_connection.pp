class user_software::remote_connection {
   ensure_packages ([ "xrdp", "tigervnc-server"]  )
   service { "xrdp" :
    name       => 'xrdp',
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require => Package['xrdp']
  }
  file { '/etc/xrdp/sesman.ini' :
  source  => "puppet:///modules/$module_name/sesman.ini",
  ensure  => 'present',
  mode    => '0644',
  owner   => 'root',
  group   => 'root',
  notify => Service['xrdp']
  }
   file { '/etc/xrdp/km-0809.ini':
   source  => "puppet:///modules/$module_name/km-0809.ini",
   ensure  => 'present',
   mode    => '0644',
   owner   => 'root',
   group   => 'root',
   notify => Service['xrdp']
   }
   file { '/usr/bin/xrdp-xsession':
   source  => "puppet:///modules/$module_name/xrdp-xsession",
   ensure  => 'present',
   mode    => '0755',
   owner   => 'root',
   group   => 'root',
   }
  #This is a hack.  it replaces the Us layout with the UK one as I cant find how to switch to UK one any other way
#  file { '/etc/xrdp/km-0409.ini':
#     ensure => link,
#     target => "/etc/xrdp/km-0809.ini",
#     require => File['/etc/xrdp/km-809.ini'],
#     notify => Service['xrdp']
#   }

     
}
