# Private_production

This example takes the GEN as the first step, ie, SMP-RunIISummer20UL18GEN-00070, as you can check from McM, this is a sample with ``new'' status. Typically you can start like this, and choose a sample which is already complete and check its production chain, and copy the following chains.

In the step including ``Premix'', there is a known issue that some of the pileup files can not be found, cuz they have been removed from some sites to save storage space, you need to check by yourself whether they are reachable by simply using "root -l root -l root://xrootd-cms.infn.it/NAME-OF-THE-FILE", if you can open it then it can be used.

In the nanoaod step, the default eventcontent is "--eventcontent NANOEDMAODSIM", you can change it to "--eventcontent NANOAODSIM" to make the nanoaod output to be a plain root file

If you don't want to publish the data set, and use the root file in your local, e.g., in your eos, you can use:

config.Data.userInputFiles = ['/store/user/melu/WtoLNuRho/Wto2KaPi_TuneCP5_13TeV_pythia8/250326_180808/0000/SMP-RunIISummer20UL18GEN-00070_1.root','/store/user/melu/WtoLNuRho/Wto2KaPi_TuneCP5_13TeV_pythia8/250326_162804/0000/SMP-RunIISummer20UL18GEN-00070_1.root']

instead of 

config.Data.inputDataset = '/WtoLNuRho/melu-WtoLNuRho_TuneCP5_13TeV_pythia8-6b891ca3d65a07bc1d5ba344caf0b507/USER'
