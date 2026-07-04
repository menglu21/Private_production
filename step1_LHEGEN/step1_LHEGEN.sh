#!/bin/bash

# Binds for singularity containers
# Mount /afs, /eos, /cvmfs, /etc/grid-security for xrootd
export APPTAINER_BINDPATH='/afs,/cvmfs,/cvmfs/grid.cern.ch/etc/grid-security:/etc/grid-security,/eos,/etc/pki/ca-trust,/run/user,/var/run/user'

#############################################################
#   This script is used by McM when it performs automatic   #
#  validation in HTCondor or submits requests to computing  #
#                                                           #
#      !!! THIS FILE IS NOT MEANT TO BE RUN BY YOU !!!      #
# If you want to run validation script yourself you need to #
#     get a "Get test" script which can be retrieved by     #
#  clicking a button next to one you just clicked. It will  #
# say "Get test command" when you hover your mouse over it  #
#      If you try to run this, you will have a bad time     #
#############################################################

cd /afs/cern.ch/cms/PPD/PdmV/work/McM/submit/HIG-RunIISummer20UL18wmLHEGEN-13701/

# Make voms proxy
voms-proxy-init --voms cms --out $(pwd)/voms_proxy.txt --hours 4
export X509_USER_PROXY=$(pwd)/voms_proxy.txt

# Download fragment from McM
curl -s -k https://cms-pdmv-prod.web.cern.ch/mcm/public/restapi/requests/get_fragment/HIG-RunIISummer20UL18wmLHEGEN-13701 --retry 3 --create-dirs -o Configuration/GenProduction/python/HIG-RunIISummer20UL18wmLHEGEN-13701-fragment.py
[ -s Configuration/GenProduction/python/HIG-RunIISummer20UL18wmLHEGEN-13701-fragment.py ] || exit $?;

# Dump actual test code to a HIG-RunIISummer20UL18wmLHEGEN-13701_test.sh file that can be run in Singularity
cat <<'EndOfTestFile' > HIG-RunIISummer20UL18wmLHEGEN-13701_test.sh
#!/bin/bash

export SCRAM_ARCH=slc7_amd64_gcc700

source /cvmfs/cms.cern.ch/cmsset_default.sh
if [ -r CMSSW_10_6_48/src ] ; then
  echo release CMSSW_10_6_48 already exists
else
  scram p CMSSW CMSSW_10_6_48
fi
cd CMSSW_10_6_48/src
eval `scram runtime -sh`

mv ../../Configuration .
scram b
cd ../..

# Maximum validation runtime: 28800s
# Minimum validation runtime: 600s
# Output events to run for the validation job (from application's setting): 100
# Event efficiency: Computed using the request efficiency and its error.
# Event efficiency: `efficiency - (2 * efficiency_error)`: `1 - (2 * 0)` = 1
# Input events: `int(output_events / event_efficiency)`: `int(100 / 1)` = 100
# Time per event (s): Computed adding all the time_per_event values on every sequence
# Time per event (s): 1.34e+03
# Initial target input events: 100
# Initial target output events: 100
# Validation runtime out of limits, truncating the time
# Target input events changed to: `maximum_runtime / time_per_event * number_of_threads`: `2.88e+04 / 1.34e+03 * 1` = 21.5
# Target output events change to: `target_input_events * event_efficiency`: `21.5 * 1` = 21.5
# Final target input events: 21
# Final target output events: 21
# This validation will be computed based on the target output events!
EVENTS=21


# cmsDriver command
cmsDriver.py Configuration/GenProduction/python/HIG-RunIISummer20UL18wmLHEGEN-13701-fragment.py --eventcontent RAWSIM,LHE --customise Configuration/DataProcessing/Utils.addMonitoring --datatier GEN,LHE --conditions 106X_upgrade2018_realistic_v4 --beamspot Realistic25ns13TeVEarly2018Collision --step LHE,GEN --geometry DB:Extended --era Run2_2018 --python_filename HIG-RunIISummer20UL18wmLHEGEN-13701_1_cfg.py --fileout file:HIG-RunIISummer20UL18wmLHEGEN-13701.root --number 21 --number_out 21 --no_exec --mc || exit $? ;

# End of HIG-RunIISummer20UL18wmLHEGEN-13701_test.sh file
EndOfTestFile

# Make file executable
chmod +x HIG-RunIISummer20UL18wmLHEGEN-13701_test.sh

if [ -e "/cvmfs/unpacked.cern.ch/registry.hub.docker.com/cmssw/el7:amd64" ]; then
  CONTAINER_NAME="el7:amd64"
elif [ -e "/cvmfs/unpacked.cern.ch/registry.hub.docker.com/cmssw/el7:x86_64" ]; then
  CONTAINER_NAME="el7:x86_64"
else
  echo "Could not find amd64 or x86_64 for el7"
  exit 1
fi
export SINGULARITY_CACHEDIR="/tmp/$(whoami)/singularity"
singularity run --no-home /cvmfs/unpacked.cern.ch/registry.hub.docker.com/cmssw/$CONTAINER_NAME $(echo $(pwd)/HIG-RunIISummer20UL18wmLHEGEN-13701_test.sh)

