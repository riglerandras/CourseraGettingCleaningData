library(data.table)
library(plyr)
library(dplyr)
library(reshape2)

features <- read.table("./data/UCI HAR Dataset/features.txt",
                       stringsAsFactors=F)

## Prepare Training Set

trainSet <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
colnames(trainSet)<-make.names(features$V2, unique=T)
trainSet <- mutate(trainSet, rowID=seq(nrow(trainSet)))

trainAct <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
colnames(trainAct) <- "activity"
trainAct <- mutate(trainAct, rowID=seq(nrow(trainAct)))

trainSub <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
colnames(trainSub) <- "subjectID"
trainSub <- mutate(trainSub, rowID=seq(nrow(trainSub)))

trainMerged <- data.table(join_all(list(trainSub, trainAct, trainSet), 
        by="rowID"))
trainMerged <- mutate(trainMerged, datasource="Train")

rm(trainSet,trainAct,trainSub)


## Prepare Test Set

testSet <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
colnames(testSet)<-make.names(features$V2, unique=T)
testSet <- mutate(testSet, rowID=seq(nrow(testSet)))

testAct <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
colnames(testAct) <- "activity"
testAct <- mutate(testAct, rowID=seq(nrow(testAct)))

testSub <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
colnames(testSub) <- "subjectID"
testSub <- mutate(testSub, rowID=seq(nrow(testSub)))

testMerged <- data.table(join_all(list(testSub, testAct, testSet), 
        by="rowID"))
testMerged <- mutate(testMerged, datasource="Test")

rm(testSet,testAct,testSub)
rm(features)

## Create Full Dataset (merge training and test set)

FullSet <- rbind(testMerged, trainMerged)
rm(testMerged, trainMerged)

## Save FullSet for further use

saveRDS(FullSet, "./data/fullset.rds")
FullSet<-readRDS("./data/fullset.rds")

## Extract means and standard deviations.

ColumnsToKeep <- sort(c(1:3, grep("mean", tolower(colnames(FullSet))), 
                   grep("std", tolower(colnames(FullSet)))))

ShortSet <- select(FullSet, ColumnsToKeep)

colDrop <- sort(c(grep("meanfreq", tolower(colnames(ShortSet))),
                  grep("gravitymean", tolower(colnames(ShortSet)))))

ShortSet <- select(ShortSet, -(colDrop))
ShortSet <- select(ShortSet, -(angle.tBodyAccMean.gravity.))

## Create a factor for the activities

activities <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
colnames(activities) <- c("activity", "activityLabel")

ShortSet <- merge(ShortSet, activities, 
        by = "activity")


## Re-order columns and remove unnecessary columns

ShortSet <- select(ShortSet, -(activity))
ShortSet <- select(ShortSet, -(rowID))
ShortSet <- select(ShortSet, c(1,68,2:67))

## Create independent tidy dataset

meltSet <- melt(ShortSet, id.vars=1:2, measure.vars=3:68)
tidySet <- dcast(meltSet, subjectID + activityLabel ~ variable, mean)
tidySet <- arrange(tidySet, subjectID, activityLabel)

## Save tidy dataset

saveRDS(tidySet, "./data/tidySet.rds")
write.table(tidySet, "./data/tidySet.txt", sep="\t", row.names=F)



