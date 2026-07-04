from WMCore.Configuration import Configuration

config = Configuration()

config.section_("General")
config.General.requestName = "HIG-RunIISummer20UL18wmLHEGEN-13701"
config.General.transferLogs = True

config.section_("JobType")
config.JobType.allowUndistributedCMSSW = True
config.JobType.pluginName = "PrivateMC"
config.JobType.psetName = "./HIG-RunIISummer20UL18wmLHEGEN-13701_1_cfg.py"
config.JobType.numCores = 1
config.JobType.maxMemoryMB = 2300
config.JobType.maxJobRuntimeMin = 2750
config.JobType.inputFiles = ['./ggHH_slc7_amd64_gcc700_CMSSW_10_6_8_workdir3_ggHH_kl_0p00_kt_1p00_c2_0p00_bugfix.tgz']

config.section_("Data")
config.Data.outputPrimaryDataset = 'HHSig'
config.Data.splitting = "EventBased"
config.Data.unitsPerJob = 5000
NJOBS = 2
config.Data.totalUnits = config.Data.unitsPerJob * NJOBS
config.Data.publication = False
config.Data.outLFNDirBase = "/store/user/melu/"
config.Data.outputDatasetTag = "HHSig"

config.section_("Site")
config.Site.storageSite = "T2_CH_CERN"
