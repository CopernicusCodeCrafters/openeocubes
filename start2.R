
# build and install package locally (use for development)
#install.packages("remotes", repos = "http://cran.us.r-project.org")#, lib="/home/ubuntu/rpacks")
install.packages("devtools", repos = "http://cran.us.r-project.org",lib =.libPaths()[1])

#ibrary(remotes, lib.loc=.libPaths()[3])#, lib.loc="/home/ubuntu/rpacks")
library(devtools,lib.loc=.libPaths()[1])
#install.packages("renv",repos = "http://cran.us.r-project.org")
#library(renv)


#remove.packages("openeocubes")
#remotes::install_local('./',dependencies=TRUE, force=TRUE,lib="D:/rpacks")#,lib="/home/ubuntu/rpacks",dependencies=TRUE, force=TRUE)
devtools::install_local('./',dependencies=TRUE, force=TRUE, lib=.libPaths()[1])
# Start service
library(openeocubes,lib.loc=.libPaths()[1])#,lib.loc="/home/ubuntu/rpacks")


aws.host <-Sys.getenv("AWSHOST")

if (aws.host == ""){
  aws.host = NULL
} else {
  message("AWS host port id is: ", aws.host)
}

message("AWS host port id is:")
message(aws.host)

config = SessionConfig(api.port = 8080, host = "0.0.0.0", aws.ipv4 = aws.host)
config$workspace.path = "/var/openeo/workspace"
createSessionInstance(config)
Session$startSession()