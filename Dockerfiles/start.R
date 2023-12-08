# start.R

# Diese Pakete sind schon im Image :
# installed.packages()
 install.packages("s3")


# Start service
library(openeocubes)
library(lattice)
library(caret)
library(s3)
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
