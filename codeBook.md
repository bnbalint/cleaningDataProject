---
title: "codeBook"
author: "bnbalint"
date: "Sunday, April 19, 2015"
output: html_document
---


## Orignal Data Source


The original data used in this analysis come from a dataset of information gathered from the accelerometer and 
gyroscope of a Sumsung Galaxy II smartphone worn by 30 different participants. The data obtained from the smartphone was expanded on to add data about the 3-axial (XYZ) linear acceleration and 3-axial angular velocity of the device. Subsequently, the data was summarize in a variety of ways (mean, standard deviation, maximum absolute deviation, etc. More information on the original data can be found here

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

Original data set citation:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013. 

## Study Design

This study was designed as a project for the Getting and Cleaning Data course on Coursera. The study was designed to test the implementation of tidy data priciples. 


## Feature Selection

In this analysis, we chose to focus on the measures of mean and standard deviation found in the original dataset. To do so, we extracted just the columns that contained the phrases [mean, Mean] and [std]. Because of the original feature labeling, mean calculations were labeled in a variety of ways (hence, mean and Mean were matched on), while standard deviation was consistently labeled as std. Variables that labeled the particular participant ("Subject") and the activity being performed ("Activty") were also retained in the dataset.

This subset of data can be found in **tidyDataset1.txt**.


## Summarization

The data was summarized by first grouping the data by activity type (LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS). The mean of each variable (mean and standard deviation values retained above) was then calculated for each activity type. The units of these new variables (means) are the same as the units of the original variables. 

The dataset containing this summary information can be found in **tidyDataset2.txt**.


## Instructions

- Select your working directory
- Run run_analysis.R (no parameters are needed)
- The data will be downloaded to your working directory
- The analysis will be performed on the downloaded data
- Resulting data will be stored in the folder with the downloaded data


## CodeBook

The following variables can be found in each dataset

- Subject
- Activity
- angletBodyAccJerkMean_gravityMean
- angletBodyAccMean_gravity
- angletBodyGyroJerkMean_gravityMean
- angletBodyGyroMean_gravityMean
- angleX_gravityMean
- angleY_gravityMean
- angleZ_gravityMean
- frequencyBodyAcc_mean_X
- frequencyBodyAcc_mean_Y
- frequencyBodyAcc_mean_Z
- frequencyBodyAcc_meanFreq_X
- frequencyBodyAcc_meanFreq_Y
- frequencyBodyAcc_meanFreq_Z
- frequencyBodyAcc_std_X
- frequencyBodyAcc_std_Y
- frequencyBodyAcc_std_Z
- frequencyBodyAccJerk_mean_X
- frequencyBodyAccJerk_mean_Y
- frequencyBodyAccJerk_mean_Z
- frequencyBodyAccJerk_meanFreq_X
- frequencyBodyAccJerk_meanFreq_Y
- frequencyBodyAccJerk_meanFreq_Z
- frequencyBodyAccJerk_std_X
- frequencyBodyAccJerk_std_Y
- frequencyBodyAccJerk_std_Z
- frequencyBodyAccJerkMag_mean
- frequencyBodyAccJerkMag_meanFreq
- frequencyBodyAccJerkMag_std
- frequencyBodyAccMag_mean
- frequencyBodyAccMag_meanFreq
- frequencyBodyAccMag_std
- frequencyBodyGyro_mean_X
- frequencyBodyGyro_mean_Y
- frequencyBodyGyro_mean_Z
- frequencyBodyGyro_meanFreq_X
- frequencyBodyGyro_meanFreq_Y
- frequencyBodyGyro_meanFreq_Z
- frequencyBodyGyro_std_X
- frequencyBodyGyro_std_Y
- frequencyBodyGyro_std_Z
- frequencyBodyGyroJerkMag_mean
- frequencyBodyGyroJerkMag_meanFreq
- frequencyBodyGyroJerkMag_std
- frequencyBodyGyroMag_mean
- frequencyBodyGyroMag_meanFreq
- frequencyBodyGyroMag_std
- timeBodyAcc_mean_X
- timeBodyAcc_mean_Y
- timeBodyAcc_mean_Z
- timeBodyAcc_std_X
- timeBodyAcc_std_Y
- timeBodyAcc_std_Z
- timeBodyAccJerk_mean_X
- timeBodyAccJerk_mean_Y
- timeBodyAccJerk_mean_Z
- timeBodyAccJerk_std_X
- timeBodyAccJerk_std_Y
- timeBodyAccJerk_std_Z
- timeBodyAccJerkMag_mean
- timeBodyAccJerkMag_std
- timeBodyAccMag_mean
- timeBodyAccMag_std
- timeBodyGyro_mean_X
- timeBodyGyro_mean_Y
- timeBodyGyro_mean_Z
- timeBodyGyro_std_X
- timeBodyGyro_std_Y
- timeBodyGyro_std_Z
- timeBodyGyroJerk_mean_X
- timeBodyGyroJerk_mean_Y
- timeBodyGyroJerk_mean_Z
- timeBodyGyroJerk_std_X
- timeBodyGyroJerk_std_Y
- timeBodyGyroJerk_std_Z
- timeBodyGyroJerkMag_mean
- timeBodyGyroJerkMag_std
- timeBodyGyroMag_mean
- timeBodyGyroMag_std
- timeGravityAcc_mean_X
- timeGravityAcc_mean_Y
- timeGravityAcc_mean_Z
- timeGravityAcc_std_X
- timeGravityAcc_std_Y
- timeGravityAcc_std_Z
- timeGravityAccMag_mean
- timeGravityAccMag_std




