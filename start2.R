
# build and install package locally (use for development)
install.packages("remotes", lib="/home/ubuntu/rpacks")
library(remotes, lib.loc="/home/ubuntu/rpacks")
remotes::install_local('./',lib="/home/ubuntu/rpacks",dependencies=TRUE, force=TRUE)

# Start service
library(openeocubes,lib.loc="/home/ubuntu/rpacks")


aws.host <-Sys.getenv("AWSHOST")

if (aws.host == ""){
  aws.host = NULL
}

message("AWS host port id is:")
message(aws.host)

config = SessionConfig(api.port = 8080, host = "0.0.0.0", aws.ipv4 = aws.host)
config$workspace.path = "/var/openeo/workspace"
createSessionInstance(config)
Session$startSession()