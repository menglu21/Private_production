
from WMCore.Configuration import Configuration

config = Configuration()

config.section_("General")
config.General.requestName = "SMP-RunIISummer20UL18MiniAODv2-00444"
config.General.transferLogs = True

config.section_("JobType")
config.JobType.allowUndistributedCMSSW = True
config.JobType.pluginName = "Analysis"
config.JobType.psetName = "./SMP-RunIISummer20UL18MiniAODv2-00444_1_cfg.py"
config.JobType.numCores = 1
config.JobType.maxMemoryMB = 2300

config.section_("Data")
config.Data.inputDataset = '/WtoLNuRho/melu-WtoLNuRho_TuneCP5_13TeV_pythia8-a5d501e738bc46974ac8d371aaff19e9/USER' 
config.Data.splitting = "FileBased"
config.Data.unitsPerJob = 1
config.Data.publication = True
config.Data.outLFNDirBase = "/store/user/melu/"
config.Data.inputDBS = "phys03"
config.Data.outputDatasetTag = "WtoLNuRho_TuneCP5_13TeV_pythia8"

config.section_("Site")
config.Site.storageSite = "T2_CH_CERN"

