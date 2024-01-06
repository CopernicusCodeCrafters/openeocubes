# start.R
 remotes::install_github('CopernicusCodeCrafters/openeocubes/tree/ChangeProcesses')
# Start service

library(openeocubes)
library(lattice)
library(caret)
library(s3)
library(gdalUtilities)
#Aktuelles Image 1.2  



aws.host <-Sys.getenv("AWSHOST")

if (aws.host == ""){
  aws.host = NULL
}

message("AWS host port id is:")
message(aws.host)

config = SessionConfig(api.port = 8000, host = "0.0.0.0", aws.ipv4 = aws.host)
config$workspace.path = "/var/openeo/workspace"
createSessionInstance(config)
Session$startSession()
