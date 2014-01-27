class user_software::pp_base inherits user_software::params{
 $atlas_emi_compat = [ 'HEP_OSlibs_SL6'  ]
#"compat-db43.i686", "compat-db43.x86_64", "compat-expat1.i686", "compat-expat1.x86_64", "compat-libf2c-34.i686", "compat-libtermcap.i686", "compat-libtermcap.x86_64", "compat-openldap.x86_64", "compat-readline5.i686", "freetype-devel.i686", "freetype.i686",  "libaio.i686", "libpng-devel.i686", "libuuid-devel.i686", "libuuid-devel.x86_64", "libXext-devel.i686", "libXext.i686", "libXft.i686", "libxml2-devel.i686", "libxml2.i686", "libXpm.i686", "mesa-libGL-devel.i686", "mesa-libGL.i686", "mesa-libGLU-devel.i686", "mesa-libGLU.i686", "ncurses-devel.i686", "openssl098e.i686", "openssl098e.x86_64", "pam.i686", "zlib-devel.i686" ]
    
  ensure_packages ( $atlas_emi_compat )
  $sl6utils = [ 'sysstat', 'dos2unix', 'unix2dos' ]
  ensure_packages ( $sl6utils )

  file { '/etc/profile.d/zznag.csh' :
  source  => "puppet:///modules/$module_name/nag.csh",
  ensure  => 'present',
  mode    => '0644',
  owner   => 'root',
  group   => 'root',
  }
  file { '/etc/profile.d/zznag.sh' :
  source  => "puppet:///modules/$module_name/nag.sh",
  ensure  => 'present',
  mode    => '0644',
  owner   => 'root',
  group   => 'root',
  }

}
