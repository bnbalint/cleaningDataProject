---
title: "readMe"
author: "bnbalint"
date: "Saturday, April 18, 2015"
output: html_document
---

This document describes the script **run_analysis.R**

# Libraries

This code uses the following libraries

* data.table
* stringr
* dplyr

# Overview of Process

#### Download and extract the files

- Download the file, saving off the date of download
- Unzip the contents of the downloaded file



#### Process variable name data

- Read in the variable name data, found in the **features.txt** file (featureNames)
- Create more descriptive variable names
    + Remove parentheses
    + Replace commas with underscores
    + Replace dashes with underscores
    + For names beginning with "t", expand to "time"
    + For names beginning with "f", expand to "frequency"
    + For names containing "BodyBody", replace with "Body"



#### Read in the activity label data

- Read in the activity labels found in the **activity_labels.txt** file



#### Read in the test and training data

* Appropriately label the data set with descriptive variable names on ingest
    + **subject_train.txt** files receive column name "Subject"
    + **y_train.txt** files receive column name "Activty"
    + **x_train.txt** files receive column names featureNames, processed above



#### Combine various files for the training data set

- Use *cbind()* to combine the subject column, activity column and feature data into one table



#### Combine various files for the testing data set

- Use *cbind()* to combine the subject column, activity column and feature data into one table



#### Merge the training and the test sets to create one data set

- use *rbind()* to combine the training data table and the testing data table into one table



#### Remove old data sets from memory

- The files are large, remove old variables once the combining is complete



#### Extract only the measurements on the mean and standard deviation

- Get a list of the column names that involve mean or Mean (mean columns are labeled in a variety of ways)
    + Use *grep("*[m, M]ean*", names(data))*

- Get the column names that involve std (no other variations of std are found in the names)
    + Use *grep("*std*", names(data))*

- Create one list of column names to keep, including meanNames, stdNames, "Subject" and "Activity"

- Subset the data to extract only the columns with names we want to keep



#### Modidy the "Activity" column to use descriptive names instead of numbers

- Reduce activtyTable (read in earlier from activity_labels.txt to a simple factor variable (instead of table)
    + *activityNames <- activityTable[, 2]* (the index retains the assigned number)

- Use the factor to convert the activity number to the activity name
    + *activityNames[extractedData$Activity]*



#### Write out the data set

- This dataset is saved as **tidyDataset1.txt**
- To read in this dataset, use *read.table("cleaningData_Project_Data/tidyDataset1.txt", header = TRUE)*



#### Create a second tidy data set with the average of each variable for each activity and each subject

- Group the data by Activity name
- Calculate the mean of each column within each group



#### Write the dataset to a file

- This dataset is saved as **tidyDataset2.txt**
- To read in this dataset, use *read.table("cleaningData_Project_Data/tidyDataset2.txt", header = TRUE)*

