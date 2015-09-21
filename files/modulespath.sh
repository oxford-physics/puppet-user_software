# WARNING: THIS FILE IS MAINTAINED BY CFENGINE!! DO NOT EDIT BY HAND
# CONTACT itsupport@physics.ox.ac.uk IF YOU WOULD LIKE THIS CHANGED
DIST=''
test  -f /etc/lsb-release && . /etc/lsb-release >/dev/null && test  "$DISTRIB_ID" == Ubuntu  && DIST="ubuntu_${DISTRIB_CODENAME}"
test  -f /etc/issue && grep "Scientific Linux release 6" /etc/issue > /dev/null && DIST=el6
test  -f /etc/issue && grep "CentOS release 6" /etc/issue > /dev/null && DIST=el6
test  -f /etc/issue && grep "Red Hat Enterprise Linux Server release 6" /etc/issue > /dev/null && DIST=el6
test  -f /etc/issue && grep "Scientific Linux release 7" /etc/issue > /dev/null && DIST=el7
test  -f /etc/issue && grep "CentOS release 7" /etc/issue > /dev/null && DIST=el7
test  -f /etc/issue && grep "Red Hat Enterprise Linux Server release 7" /etc/issue > /dev/null && DIST=el7
export DIST

NETBASE=/network/software
CVMFSBASE=/cvmfs/physics.ox.ac.uk/software

#prepends to module path with module use, so use in reverse order
if [ -d "${NETBASE}/modules" ]; then
    module use "${NETBASE}/modules"
elif [ -d "${CVMFSBASE}/modules" ]; then
    module use "${CVMFSBASE}/modules"
fi

#module load is set to append to path (I chose this)
( test -d "${NETBASE}/modules" || test -d "${CVMFSBASE}/modules" ) &&  module load "otheros/${DIST}"
( test -d "${NETBASE}/modules" || test -d "${CVMFSBASE}/modules" ) &&  module load otheros/generic-oxphys

if [ -n "$DIST" ]; then
   ( test -d "${NETBASE}/$DIST/arc-modules/modules-tested" || test -d "${CVMFSBASE}/$DIST/arc-modules/modules-tested" )  &&  module load otheros/$DIST-arc-tested
fi
( test -d "${NETBASE}/modules" || test -d "${CVMFSBASE}/modules" ) &&  module load otheros/generic-arc-tested

( test -d "${NETBASE}/$DIST/arc-modules/modules" || test -d "${CVMFSBASE}/$DIST/arc-modules/modules" )  &&  module load otheros/$DIST-arc
( test -d "${NETBASE}/modules" || test -d "${CVMFSBASE}/modules" ) &&  module load otheros/generic-arc

test -d /local/software/modules && module use /local/software/modules


