## This script downloads and unzips the data set for the course project.
## If the data is already downloaded and unzipped into './data/' within
## the working directory, this script should not be run.

## set working directory
## setwd("C:/temp/ra/_doku/coursera/GettingCleaningData/CourseProject")

if(!file.exists("data")){dir.create("data")}
downloadURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(downloadURL, destfile = "./data/data.zip")

setwd("./data")
unzip("data.zip")
setwd("..")

