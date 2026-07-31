# Private_production

This example takes the GEN as the first step, ie, SMP-RunIISummer20UL18GEN-00070, as you can check from McM, this is a sample with ``new'' status. Typically you can start like this, and choose a sample which is already complete and check its production chain, and copy the following chains.

In the step including ``Premix'', there is a known issue that some of the pileup files can not be found, cuz they have been removed from some sites to save storage space, you need to check by yourself whether they are reachable by simply using "root -l root -l root://xrootd-cms.infn.it/NAME-OF-THE-FILE", if you can open it then it can be used.

In the nanoaod step, the default eventcontent is "--eventcontent NANOEDMAODSIM", you can change it to "--eventcontent NANOAODSIM" to make the nanoaod output to be a plain root file

If you don't want to publish the data set, and use the root file in your local, e.g., in your eos, you can use:

config.Data.userInputFiles = ['/store/user/melu/WtoLNuRho/Wto2KaPi_TuneCP5_13TeV_pythia8/250326_180808/0000/SMP-RunIISummer20UL18GEN-00070_1.root','/store/user/melu/WtoLNuRho/Wto2KaPi_TuneCP5_13TeV_pythia8/250326_162804/0000/SMP-RunIISummer20UL18GEN-00070_1.root']

instead of 

config.Data.inputDataset = '/WtoLNuRho/melu-WtoLNuRho_TuneCP5_13TeV_pythia8-6b891ca3d65a07bc1d5ba344caf0b507/USER'

Another thing to keep in mind: it seems using " output = cms.untracked.int32(10)" in the configure file, ie,
process.maxEvents = cms.untracked.PSet(
    input = cms.untracked.int32(10),
    output = cms.untracked.int32(10)
)
would cause error 
"31-Jul-2026 13:26:55 CEST  Closed file file:/eos/cms/store/group/phys_b2g/melu/PrivateMC/2018/step3_DIGIPremix/GluGluToHHto2B2Zto2L2J/HIG-RunIISummer20UL18DIGIPremix-13515/260722_101832/0000/HIG-RunIISummer20UL18DIGIPremix-13515_1.root
MENG DEBUG:5 1
%MSG-e StateMachine:  AfterFile 31-Jul-2026 13:26:56 CEST PostGlobalEndRun
The EventProcessor state machine encountered an unexpected event
and went to the error state
Will attempt to terminate processing normally
(IF using the looper the next loop will be attempted)
This likely indicates a bug in an input module or corrupted input or both

%MSG
----- Begin Fatal Exception 31-Jul-2026 13:26:56 CEST-----------------------
An exception of category 'BadTransition' occurred while
   [0] Calling EventProcessor::runToCompletion (which does almost everything after beginJob and before endJob)
Exception Message:
Unexpected transition change 5
"
remove it can solve the issue.
