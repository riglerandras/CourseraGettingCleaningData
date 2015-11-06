---
title: "Documentation on tidifying UCI HAR Dataset"
author: "Andras Rigler"
date: "Friday, November 6, 2015"
output: html_document
---

Documentation on tidifying UCI HAR Dataset
====

## 
## Files in this repo

#### Markdown (.md) files

- **CodeBook.md**: Codebook for the final tidy dataset
- **README.md**: This file

#### R scripts

- **CourseProjectPrepare.R**: This script downloads and unzips the data set for the course project. If the data is already downloaded and unzipped into `./data/` within the working directory, this script should not be run.
- **createCodeBook.R**: This is a helper script I used to create variable lists and file lists used in the codebook and in this readme.
- **run_analysis.R**: This is the main script performing all the process of tidifying.

#### Data files

- **tidySet.txt**: tab-delimited text format including header (saved by `write.table()`)
- **tidySet.rds**: serialized R object format (saved by `saveRDS()`)


## The main process performed by run_analysis.R

#### Step 1: Merging test and training sets into one data set

- The training set came from 3 files: **X_train.txt** (measurements for the training set), **y_train.txt** (1 column: activity ID) and **subject_train.txt** (one column: subject ID-s). Each file was read into a data frame (_trainSet, trainAct, trainSub_, resp.), and a row index was added. The variable names of the measurements coming from **features.txt** were altered by `make.names()` to get syntactically correct column names, and then applied to the corresponding dataset. The three datasets were merged using `join_all()`, joining on the row index.
- The same procedure was carried out for the test set.
- As the resulting test and training sets consisted of exactly the same columns (in exactly the same order), training and test sets were put together simply by using `rbind()`, and the result was stored in a new data frame called FullSet.

#### Step 2: Extracting the measurements on the mean and standard deviation

- The `grep()` function was used to extract the index values of the columns that had "mean" or "std" in their names, and a new data frame (ShortSet) was created including only the extracted 86 variables plus _subjectID, rowID, activity_.
- As some columns having "mean" in their name were not actually means of the original measurements but other calculated variables (those with "meanfreq" and "gravitymean" in their names), these were also removed from the dataset.
- The resulting ShortSet contained 69 variables - _subjectID, rowID, activity,_ plus 66 measurement mean and std variables.

#### Step 3: Adding descriptive activity names (instead of ID-s)

- Activity labels were originally stored in a separate file **activity_labels.txt**, this file was read into a new data set of 2 columns: _activity, activityLabel_ - the latter being a factor variable of 6 levels corresponding to the activity names.
- The activity label dataset was merged to the ShortSet with `merge()`, using _activity_ as a joining variable
- After merging, the columns of ShortSet were reordered and unnecessary columns removed; the resulting data set contained 68 columns: _subjectID, activityLabel_, plus the 66 measurements.

#### Step 4: Adding descriptive variable names

- This step was already done within Step 1.

#### Step 5: Creating a new data set with the average of each variable for each activity and subject

- First, the data set was melted with the `melt()` function, using the first 2 variables as `id.vars` and all the rest as `measure.vars`.
- The molten data set was then summarized with `dcast` using _subjectID + activityLabel_ as grouping variable and _mean_ as the aggregation function.
- The resulting tidy data set consists of 180 rows and 68 columns.

