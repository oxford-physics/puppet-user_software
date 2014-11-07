#hack for bad env setup scripts installed by the deb for env modules
if ( ! ($?_prompt) ) then
   setenv _prompt "%U%m%u:%B%~%b%# "
endif
test  -f /etc/lsb-release &&  grep precise /etc/lsb-release >/dev/null && set DIST=ubuntu_precise
test  -f /etc/issue &&  grep "Scientific Linux release 6" /etc/issue > /dev/null && set DIST=el6
test  -f /etc/issue && grep "Red Hat Enterprise Linux Server release 6" /etc/issue > /dev/null && set DIST=el6
setenv DIST $DIST
#prepends to module path, so use in reverse order
#generic stuff for 64 bit linux

if (-d /network/software/modules) then
 module use /network/software/modules
else if (-d /cvmfs/physics.ox.ac.uk/software/modules) then
 module use /cvmfs/physics.ox.ac.uk/software/modules
endif


if (-d /network/software/modules || -d /cvmfs/physics.ox.ac.uk/software/modules ) then
    if ($?DIST) then
       if (-d /network/software/$DIST/arc/modules-tested || -d /cvmfs/physics.ox.ac.uk/software/$DIST/arc/modules-tested ) then
           module load otheros/$DIST-arc-tested
       endif
    endif
    module load otheros/generic-oxphys
    module load otheros/generic-arc-tested
endif

if ($?DIST) then
    if (-d /network/software/$DIST/modules) then
           module use /network/software/$DIST/modules
    else if (-d /cvmfs/physics.ox.ac.uk/software/$DIST/modules) then
           module use /cvmfs/physics.ox.ac.uk/software/$DIST/modules
    endif
endif

if (-d /local/software/modules) then
  module use /local/software/modules
endif

setenv PROFILESOURCED 1
