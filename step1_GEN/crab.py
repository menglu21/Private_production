from WMCore.Configuration import Configuration

config = Configuration()

config.section_("General")
config.General.requestName = "SMP-RunIISummer20UL18GEN-00070"
config.General.transferLogs = True

config.section_("JobType")
config.JobType.allowUndistributedCMSSW = True
config.JobType.pluginName = "PrivateMC"
config.JobType.psetName = "./SMP-RunIISummer20UL18GEN-00070_1_cfg.py"
config.JobType.numCores = 1
config.JobType.maxMemoryMB = 2300

config.section_("Data")
config.Data.outputPrimaryDataset = 'WtoLNuRho'
config.Data.splitting = "EventBased"
config.Data.unitsPerJob = 5000
NJOBS = 10
config.Data.totalUnits = config.Data.unitsPerJob * NJOBS
config.Data.publication = True
config.Data.outLFNDirBase = "/store/user/melu/"
config.Data.outputDatasetTag = "WtoLNuRho_TuneCP5_13TeV_pythia8"

config.section_("Site")
config.Site.storageSite = "T2_CH_CERN"

