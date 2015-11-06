---
title: "Codebook for tidySet"
author: "Andras Rigler"
date: "Friday, March 20, 2015"
output: html_document
---
Codebook for tidySet
====

## The dataset

### Raw dataset

Raw dataset is [the original .zip file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) downloaded from the Coursera website, 
and consists of the following files:

* **README.txt**
* **features_info.txt**: Shows information about the variables used on the feature vector.
* **features.txt**: List of all features.
* **activity_labels.txt**: Links the class labels with their activity name.
* **train/X_train.txt**: Training set
* **train/y_train.txt**: Training labels.
* **test/X_test.txt**: Test set.
* **test/y_test.txt**: Test labels.
* **train/subject_train.txt**: Each row identifies the subject who performed the activity for each window sample for training set. Its range is from 1 to 30.
* **test/subject_test.txt**: The same as above for test set.

(Other files in the original dataset were ignored as they are not needed for the process.)
 
### Tidy dataset

The raw dataset was tidified according to the instructions of Course Project for the course _Getting and Cleaning Data_. The whole process was done by the R script **run_analysis.R** and is documented in detail in **README.md**. 
The resulting tidy dataset is called _tidySet_ and is available in two formats:

* **tidySet.txt**: tab-delimited text format including header (saved by `write.table()`)
* **tidySet.rds**: serialized R object format (saved by `saveRDS()`)

The tidy dataset consists of 180 rows (one row per each subject/activity) and 68 columns (variables) as described below.

## Variables in the dataset

    1   subjectID   ID of the person wearing the smartphone during the exercises (origin: subject_train.txt and subject_test.txt)
        type: integer
        values: (1:30)   

    2   activityLabel   Label (name) of the activity carried out by the subject during the experiment
        type: factor
        levels: "LAYING" "SITTING" "STANDING" "WALKING" "WALKING_DOWNSTAIRS" "WALKING_UPSTAIRS"
        
    3:68    Mean values of the original measurements for the given subject and activity
        type: numeric
        
Variables 3:68 were renamed using `make.names()` in order to get syntactically correct column names. The list below shows the current variable names of the tidy dataset and the corresponding original variable names of the raw dataset.

    varIndex        current.varName                 ori.varName
    3            tBodyAcc.mean...X           tBodyAcc-mean()-X
    4            tBodyAcc.mean...Y           tBodyAcc-mean()-Y
    5            tBodyAcc.mean...Z           tBodyAcc-mean()-Z
    6             tBodyAcc.std...X            tBodyAcc-std()-X
    7             tBodyAcc.std...Y            tBodyAcc-std()-Y
    8             tBodyAcc.std...Z            tBodyAcc-std()-Z
    9         tGravityAcc.mean...X        tGravityAcc-mean()-X
    10        tGravityAcc.mean...Y        tGravityAcc-mean()-Y
    11        tGravityAcc.mean...Z        tGravityAcc-mean()-Z
    12         tGravityAcc.std...X         tGravityAcc-std()-X
    13         tGravityAcc.std...Y         tGravityAcc-std()-Y
    14         tGravityAcc.std...Z         tGravityAcc-std()-Z
    15       tBodyAccJerk.mean...X       tBodyAccJerk-mean()-X
    16       tBodyAccJerk.mean...Y       tBodyAccJerk-mean()-Y
    17       tBodyAccJerk.mean...Z       tBodyAccJerk-mean()-Z
    18        tBodyAccJerk.std...X        tBodyAccJerk-std()-X
    19        tBodyAccJerk.std...Y        tBodyAccJerk-std()-Y
    20        tBodyAccJerk.std...Z        tBodyAccJerk-std()-Z
    21          tBodyGyro.mean...X          tBodyGyro-mean()-X
    22          tBodyGyro.mean...Y          tBodyGyro-mean()-Y
    23          tBodyGyro.mean...Z          tBodyGyro-mean()-Z
    24           tBodyGyro.std...X           tBodyGyro-std()-X
    25           tBodyGyro.std...Y           tBodyGyro-std()-Y
    26           tBodyGyro.std...Z           tBodyGyro-std()-Z
    27      tBodyGyroJerk.mean...X      tBodyGyroJerk-mean()-X
    28      tBodyGyroJerk.mean...Y      tBodyGyroJerk-mean()-Y
    29      tBodyGyroJerk.mean...Z      tBodyGyroJerk-mean()-Z
    30       tBodyGyroJerk.std...X       tBodyGyroJerk-std()-X
    31       tBodyGyroJerk.std...Y       tBodyGyroJerk-std()-Y
    32       tBodyGyroJerk.std...Z       tBodyGyroJerk-std()-Z
    33          tBodyAccMag.mean..          tBodyAccMag-mean()
    34           tBodyAccMag.std..           tBodyAccMag-std()
    35       tGravityAccMag.mean..       tGravityAccMag-mean()
    36        tGravityAccMag.std..        tGravityAccMag-std()
    37      tBodyAccJerkMag.mean..      tBodyAccJerkMag-mean()
    38       tBodyAccJerkMag.std..       tBodyAccJerkMag-std()
    39         tBodyGyroMag.mean..         tBodyGyroMag-mean()
    40          tBodyGyroMag.std..          tBodyGyroMag-std()
    41     tBodyGyroJerkMag.mean..     tBodyGyroJerkMag-mean()
    42      tBodyGyroJerkMag.std..      tBodyGyroJerkMag-std()
    43           fBodyAcc.mean...X           fBodyAcc-mean()-X
    44           fBodyAcc.mean...Y           fBodyAcc-mean()-Y
    45           fBodyAcc.mean...Z           fBodyAcc-mean()-Z
    46            fBodyAcc.std...X            fBodyAcc-std()-X
    47            fBodyAcc.std...Y            fBodyAcc-std()-Y
    48            fBodyAcc.std...Z            fBodyAcc-std()-Z
    49       fBodyAccJerk.mean...X       fBodyAccJerk-mean()-X
    50       fBodyAccJerk.mean...Y       fBodyAccJerk-mean()-Y
    51       fBodyAccJerk.mean...Z       fBodyAccJerk-mean()-Z
    52        fBodyAccJerk.std...X        fBodyAccJerk-std()-X
    53        fBodyAccJerk.std...Y        fBodyAccJerk-std()-Y
    54        fBodyAccJerk.std...Z        fBodyAccJerk-std()-Z
    55          fBodyGyro.mean...X          fBodyGyro-mean()-X
    56          fBodyGyro.mean...Y          fBodyGyro-mean()-Y
    57          fBodyGyro.mean...Z          fBodyGyro-mean()-Z
    58           fBodyGyro.std...X           fBodyGyro-std()-X
    59           fBodyGyro.std...Y           fBodyGyro-std()-Y
    60           fBodyGyro.std...Z           fBodyGyro-std()-Z
    61          fBodyAccMag.mean..          fBodyAccMag-mean()
    62           fBodyAccMag.std..           fBodyAccMag-std()
    63  fBodyBodyAccJerkMag.mean..  fBodyBodyAccJerkMag-mean()
    64   fBodyBodyAccJerkMag.std..   fBodyBodyAccJerkMag-std()
    65     fBodyBodyGyroMag.mean..     fBodyBodyGyroMag-mean()
    66      fBodyBodyGyroMag.std..      fBodyBodyGyroMag-std()
    67 fBodyBodyGyroJerkMag.mean.. fBodyBodyGyroJerkMag-mean()
    68  fBodyBodyGyroJerkMag.std..  fBodyBodyGyroJerkMag-std()

