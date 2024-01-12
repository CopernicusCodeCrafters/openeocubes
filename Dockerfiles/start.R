# start.R
# remotes::install_github('CopernicusCodeCrafters/openeocubes@ChangeProcesses')
# Start service


library(lattice)
library(caret)
library(s3)
library(remotes)
library(gdalUtilities)
#Aktuelles Image 1.2  
remotes::install_local("/opt/dockerfiles", dependencies = TRUE, force = TRUE)
library(openeocubes)

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
