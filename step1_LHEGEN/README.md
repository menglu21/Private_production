# several things to be noted:

## For powheg gridpack, the pdf reweight is super time consuming, which will excess allowed maximum time in crab

## untar the powheg gridpack, in pwg-rwl.dat, remove all the pdf weights, eg. only keep the scale variations, then tar the gridpack again

<initrwgt>
<weightgroup name='scale_variation' combine='envelope' >
<weight id='1001'> lhapdf=325300 renscfact=1d0 facscfact=1d0 </weight>
<weight id='1002'> lhapdf=325300 renscfact=1d0 facscfact=2d0 </weight>
<weight id='1003'> lhapdf=325300 renscfact=1d0 facscfact=0.5d0 </weight>
<weight id='1004'> lhapdf=325300 renscfact=2d0 facscfact=1d0 </weight>
<weight id='1005'> lhapdf=325300 renscfact=2d0 facscfact=2d0 </weight>
<weight id='1006'> lhapdf=325300 renscfact=2d0 facscfact=0.5d0 </weight>
<weight id='1007'> lhapdf=325300 renscfact=0.5d0 facscfact=1d0 </weight>
<weight id='1008'> lhapdf=325300 renscfact=0.5d0 facscfact=2d0 </weight>
<weight id='1009'> lhapdf=325300 renscfact=0.5d0 facscfact=0.5d0 </weight>
</initrwgt>
    
## attach the gridpack in crab config 
config.JobType.inputFiles = ['./ggHH_slc7_amd64_gcc700_CMSSW_10_6_8_workdir3_ggHH_kl_0p00_kt_1p00_c2_0p00_bugfix.tgz']

## set the gridpack path in the production node:
args = cms.vstring('/srv/ggHH_slc7_amd64_gcc700_CMSSW_10_6_8_workdir3_ggHH_kl_0p00_kt_1p00_c2_0p00_bugfix.tgz')

## remember to change the event number in the cmsRun config file to the number requried in the crab config:

process.maxEvents = cms.untracked.PSet(
    input = cms.untracked.int32(5000),
    output = cms.untracked.int32(5000)
)

process.externalLHEProducer = cms.EDProducer("ExternalLHEProducer",
    #args = cms.vstring('/cvmfs/cms.cern.ch/phys_generator/gridpacks/UL/13TeV/slc7_amd64_gcc700/Powheg/V2/ggHH_slc7_amd64_gcc700_CMSSW_10_6_8_workdir3_ggHH_kl_0p00_kt_1p00_c2_0p00_bugfix.tgz'),
    args = cms.vstring('/srv/ggHH_slc7_amd64_gcc700_CMSSW_10_6_8_workdir3_ggHH_kl_0p00_kt_1p00_c2_0p00_bugfix.tgz'),
    generateConcurrently = cms.untracked.bool(True),
    nEvents = cms.untracked.uint32(5000),
    numberOfParameters = cms.uint32(1),
    outputFile = cms.string('cmsgrid_final.lhe'),
    scriptName = cms.FileInPath('GeneratorInterface/LHEInterface/data/run_generic_tarball_cvmfs.sh')
)


