class user_software::common inherits user_software::params{
    #Generic SL5/ SL6 list
    $user_package_list_generic = [ 'PPOSLibs' ]
    ensure_packages ( $user_package_list_generic )

#######################HISTORY SECTION#############################
#    $user_package_list_SL6 = [ "libcurl-devel" , "fftw", "fftw-devel", "aspell","aspell-en" ,  "git", "git-all", "libreoffice" , "libreoffice-langpack-en", "pcre", "libXt-devel",   "gnuplot44", "libXaw-devel", "python-pip", "python-virtualenv", "PyYAML", "cernlib-devel", "cernlib-utils" ]
    #list of arc installed compat libs
 #    ensure_packages ( ['opensm-libs' ] )
 #   ensure_packages ( [ 'log4cpp-devel', ] ) # Requested by Raj Shah, RT #26971
     #Trying to run python panda and prun with emi3 spits out some errors.  Solution is to isntall these, apparently (ref. Asoka De Silva via Shaun Gupta).  Installing here as it is not clear whether this is only a UI dependency

    #ensure_packages ( $user_package_list_SL6 )
    #A few packages that I have needed but were not asked for - theres not really a need to distinguish too much but the history is nice.
   # $sl6utils = [ 'sysstat', 'dos2unix', 'unix2dos' ,'nc', "yum-plugin-downloadonly"]
   # ensure_packages ( $sl6utils )
##########################################################################

    package { 'mpich2' : ensure =>absent }
 #Thank you to puppet labs issue 5175 
 exec { 'yum Group Install devtools':
  unless  => '/usr/bin/yum grouplist "Development tools" | /bin/grep "^Installed Groups"',
  command => '/usr/bin/yum -y groupinstall "Development tools"',
}
  #Modules setup
  file { '/etc/profile.d/zzmodulespath.sh' :
  source  => "puppet:///modules/$module_name/modulespath.sh",
  ensure  => 'present',
  mode    => '0644',
  owner   => 'root',
  group   => 'root',
  }

  file { '/etc/profile.d/zzmodulespath.csh' :
  source  => "puppet:///modules/$module_name/modulespath.csh",
  ensure  => 'present',
  mode    => '0644',
  owner   => 'root',
  group   => 'root',
  }

}
