#!/bin/bash

cd /home/handerso/junk/dualtoy/

START_TIME=`/bin/date`
echo "started at $START_TIME"


# setup software environment at UMD
#
source /cvmfs/sft.cern.ch/lcg/contrib/gcc/6.3/x86_64-centos7/setup.sh
source /cvmfs/geant4.cern.ch/geant4/10.5/x86_64-centos7-gcc63-opt-MT/CMake-setup.sh
export CXX=`which g++`
export CC=`which gcc`
export PATH=$PATH:/cvmfs/sft.cern.ch/lcg/contrib/CMake/3.11.1/Linux-x86_64/bin
source /cvmfs/sft.cern.ch/lcg/views/LCG_95/x86_64-centos7-gcc7-opt/setup.sh
source $ROOTSYS/bin/thisroot.sh
export LIBRARY_PATH=/home/handerso/fakelib2:$LIBRARY_PATH
export LD_LIBRARY_PATH=/home/handerso/fakelib2:$LD_LIBRARY_PATH
echo $LIBRARY_path
echo $LD_LIBRARY_PATH
# run 
#


./dualtoy -c template.cfg -m run_50GeV_electron_N500.mac -o haha> run.log

exitcode=$?


#
# end run
#

echo ""
END_TIME=`/bin/date`
echo "finished at $END_TIME"
exit $exitcode
