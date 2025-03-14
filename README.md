# Private_production

This example takes the GEN as the first step, ie, SMP-RunIISummer20UL18GEN-00070, as you can check from McM, this is a sample with ``new'' status. Typically you can start like this, and choose a sample which is already complete and check its production chain, and copy the following chains.

In the step including ``Premix'', there is a known issue that some of the pileup files can not be found, cuz they have been removed from some sites to save storage space, you need to check by yourself whether they are reachable by simply using "root -l root -l root://xrootd-cms.infn.it/NAME-OF-THE-FILE", if you can open it then it can be used.

In the nanoaod step, the default eventcontent is "--eventcontent NANOEDMAODSIM", you can change it to "--eventcontent NANOAODSIM" to make the nanoaod output to be a plain root file
