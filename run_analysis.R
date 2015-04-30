library(data.table)
library(stringr)
library(dplyr)

##
##
## Download and extract the files
##
###############################################################################


## download the file
fileURL <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipFile <- "cleaningData_Project.zip"
download.file(fileURL, destfile = zipFile)
dateDownloaded <- date()

## unzip the file
unzip(zipFile, exdir = "cleaningData_Project_Data")


##
##
## Read in the variable name data
## Create descriptive variable name
##
###############################################################################

## get the feature names
## these correspond to the 561 columns in the X data files
featureNames <- read.table("cleaningData_Project_Data/features.txt")

## remove parentheses from var names
featureNames[,2] <- str_replace_all(featureNames[,2], "\\(", "")
featureNames[,2] <- str_replace_all(featureNames[,2], "\\)", "")

## replace commas with underscores
featureNames[,2] <- str_replace_all(featureNames[,2], ",", "_")

## replace dashes with underscores
featureNames[,2] <- str_replace_all(featureNames[,2], "-", "_")


## check for names that begin with the letter t
## change the t to time
featureNames[,2] <- str_replace(featureNames[,2], "^t", "time")

## check for names that begin with the letter f
## change the f to frequency
featureNames[,2] <- str_replace(featureNames[,2], "^f", "frequency")


## check for names with "BodyBody"
## change this to "Body"
featureNames[,2] <- str_replace(featureNames[,2], "BodyBody", "Body")


##
##
## Read in the activity label data
##
###############################################################################


## get the activity labels
## these are the numeric designators for
## the activities performed (found in the Y file)
activityTable <- read.table("cleaningData_Project_Data/activity_labels.txt")




##
##
## Read in the data
## Appropriately label the data set with descriptive variable names
##
###############################################################################


## read in the files
## assign column names (cleaned above) on ingest
trainSub <-  read.table("cleaningData_Project_Data/train/subject_train.txt", col.names = "Subject")
trainX   <-  read.table("cleaningData_Project_Data/train/X_train.txt", col.names = featureNames[,2])
trainY   <-  read.table("cleaningData_Project_Data/train/y_train.txt", col.names = "Activity")

testSub <-  read.table("cleaningData_Project_Data/test/subject_test.txt", col.names = "Subject")
testX   <-  read.table("cleaningData_Project_Data/test/X_test.txt", col.names = featureNames[,2])
testY   <-  read.table("cleaningData_Project_Data/test/y_test.txt", col.names = "Activity")


##
##
## Merge the training and the test sets to create one data set
##
###############################################################################

## combine the subject column, activity column and data into one table
trainData <- cbind(trainSub, trainY, trainX)
testData  <- cbind(testSub, testY, testX)

## remove old data sets from memory
rm(trainSub)
rm(trainX)
rm(trainY)
rm(testSub)
rm(testX)
rm(testY)


## combine the training data with the test data
data <- rbind(testData, trainData)


## remove old data sets from memory
rm(testData)
rm(trainData)




##
##
## Extract only the measurements on the mean 
## and standard deviation for each measurement
##
###############################################################################

## get the column names that involve mean or Mean
meanIndices <- grep("*[m, M]ean*", names(data))
meanNames   <- names(data)[meanIndices]

## get the column names that involve std
stdIndices <- grep("*std*", names(data))
stdNames   <- names(data)[stdIndices]

## create one list of column names to keep
columnsToKeep <- c("Subject", "Activity", meanNames, stdNames)

## extract just these columns
extractedData <- data[, columnsToKeep]


##
##
## Use descriptive activity names to name the activities in the data set
##
###############################################################################

## reduce activtyTable to a simple factor variable (instead of table)
## the index retains the assigned number
activityNames <- activityTable[, 2] 

## use the above factor to convert the activity number
## to the activity name
extractedData$Activity <- activityNames[extractedData$Activity]


##
##
## Write out the data set
##
###############################################################################


## write the dataset to a file
write.table(extractedData, file = "cleaningData_Project_Data/tidyDataset1.txt")




##
##
## Create a second tidy data set with 
## the average of each variable for each activity and each subject
##
###############################################################################

## group the data by Activity and Subject
activities <- group_by(extractedData, Activity, Subject)

## calculate the mean of each column
## within each group
activityMeans <- summarise_each(activities, funs(mean))

## write the dataset to a file
write.table(activityMeans, file = "cleaningData_Project_Data/tidyDataset2.txt", row.name = FALSE)
