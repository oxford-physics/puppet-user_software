DIST=''
test  -f /etc/lsb-release && grep precise /etc/lsb-release >/dev/null && DIST=ubuntu_precise
test  -f /etc/issue && grep "Scientific Linux release 6" /etc/issue > /dev/null && DIST=el6
test  -f /etc/issue && grep "Red Hat Enterprise Linux Server release 6" /etc/issue > /dev/null && DIST=el6
export DIST

#prepends to module path, so use in reverse order
if [ -d /network/software/modules ]; then
    module use /network/software/modules
elif [ -d /cvmfs/physics.ox.ac.uk/software/modules ]; then
    module use /cvmfs/physics.ox.ac.uk/software/modules
fi

if [[ -n $DIST ]]; then
   ( test -d /network/software/$DIST/arc/modules-tested || test -d /cvmfs/physics.ox.ac.uk/software/$DIST/arc/modules-tested )  &&  module load otheros/$DIST-arc-tested
fi

( test -d /network/software/modules || test -d /cvmfs/physics.ox.ac.uk/software/modules ) &&  module load otheros/generic-oxphys
( test -d /network/software/modules || test -d /cvmfs/physics.ox.ac.uk/software/modules ) &&  module load otheros/generic-arc-tested

if [[ -n $DIST ]]; then
#   export MODULEPATH=$MODULEPATH:/local/software/modules:/network/software/$DIST/modules:/network/software/modules
  if [ -d /network/software/$DIST/modules ] ; then
       module use /network/software/$DIST/modules
  elif [ -d /cvmfs/physics.ox.ac.uk/software/$DIST/modules ] ; then
       module use /cvmfs/physics.ox.ac.uk/software/$DIST/modules
  fi
fi
test -d /local/software/modules && module use /local/software/modules


