# WARNING: THIS FILE IS MAINTAINED BY CFENGINE!! DO NOT EDIT BY HAND
# CONTACT itsupport@physics.ox.ac.uk IF YOU WOULD LIKE THIS CHANGED
#hack for bad env setup scripts installed by the deb for env modules
if ( ! ($?_prompt) ) then
   setenv _prompt "%U%m%u:%B%~%b%# "
endif
test  -f /etc/lsb-release &&  grep precise /etc/lsb-release >/dev/null && set DIST=ubuntu_precise
test  -f /etc/lsb-release &&  grep trusty /etc/lsb-release >/dev/null && set DIST=ubuntu_trusty
test  -f /etc/issue &&  grep "Scientific Linux release 6" /etc/issue > /dev/null && set DIST=el6
test  -f /etc/issue &&  grep "CentOS Linux 6" /etc/issue > /dev/null && set DIST=el6
test  -f /etc/issue && grep "Red Hat Enterprise Linux Server release 6" /etc/issue > /dev/null && set DIST=el6
test  -f /etc/issue &&  grep "Scientific Linux release 7" /etc/issue > /dev/null && set DIST=el7
test  -f /etc/issue &&  grep "CentOS Linux 7" /etc/issue > /dev/null && set DIST=el7
test  -f /etc/issue && grep "Red Hat Enterprise Linux Server release 7" /etc/issue > /dev/null && set DIST=el7
setenv DIST $DIST
#module use prepends to module path, so use in reverse order
#module load is set to append (I chose that)
#generic stuff for 64 bit linux
set NETBASE=/network/software
set CVMFSBASE=/cvmfs/physics.ox.ac.uk/software



if (-d "${NETBASE}/modules" ) then
 module use "${NETBASE}/modules"
else if (-d "${CVMFSBASE}/modules") then
 module use "${CVMFSBASE}/modules"
endif

if (-d "${NETBASE}/modules" || -d "${CVMFSBASE}/modules" ) then


    if ($?DIST) then
       if (-d "${NETBASE}/$DIST/modules" || -d "${CVMFSBASE}/$DIST/modules" ) then
	   module load "otheros/$DIST"
       endif
    endif
    module load otheros/generic-oxphys

    if ($?DIST) then
       if (-d "${NETBASE}/$DIST/arc-modules" || -d "${CVMFSBASE}/$DIST/arc-modules" ) then
           module load "otheros/$DIST-arc-tested"
       endif
    endif
    module load otheros/generic-arc-tested

    if ($?DIST) then
       if (-d "${NETBASE}/$DIST/arc-modules" || -d "${CVMFSBASE}/$DIST/arc-modules" ) then
           module load "otheros/$DIST-arc"
       endif
    endif
    module load otheros/generic-arc
endif


if (-d /local/software/modules) then
  module use /local/software/modules
endif

setenv PROFILESOURCED 1
