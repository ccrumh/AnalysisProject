# AnalysisProject
## Readme.md

   The purpose of the AnalysisProject repo is to complete the class project for the Coursera Getting and Cleaning Data course.  

##Project objectives:  
Demonstrate student's ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

Create one R script called run_analysis.R that does the following:

 1. Merges the training and the test sets to create one data set.
 
 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
 
 3. Uses descriptive activity names to name the activities in the data set.
 
 4. Appropriately labels the data set with descriptive variable names. 
 
 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## Files included in repository: 

### 1. Readme.md - Purpose of the repository and project goals

### 2. CodeBook.md - Explanation of study data and steps used to complete project

### 3. run_analysis.R - R script containing code used to analyze the project data. 

How the script works: 

This script will read in the data provided by the study.  Files containing "X" values include the actual measures collected as well as data processed (as explained in the features_info.txt file).  Files conaining "Y" values are the activity files (standing, walking, etc).  Subject identifiers of the human participants are in a Subject file.  There are two sets of files of each of these types one for training and one for testing participants.  The script will merge all files to create one dataset.  It will also extract only the values needed for creating a tidy data set of mean and standard deviation calculations.  The last part of the script will group variables by activity and subject and provide an average value for each column. Detailed comments on the run_analysis.R script are included in the CodeBook.md file contained in this repo.    

## Analysis files needed for this project: 

The UCI HAR Dataset folder structure should be unziped into the working directory prior to running the run_analysis.R script included in this repo. The following files are used. 

* features.txt
List of all variables collected or calculated in the study. The run_analysis.R script 
will utilize this file when applying column names to the X value files (train and test).  

* X_train.txt
Participants placed in the training group have their performance data in this dataset. Dataset includes 581 separate columns of measured and calculated fields

* y_train.txt
Activities (identified by 1 through 6) of participants placed in the training group 

* Subject_train.txt
Identifies the training group subjects who performed the activity. Subject IDs are 1 to 30. 

* X_test.txt
Participants placed in the test group have their performance data in this dataset. Dataset includes 581 separate columns of measured and calculated fields

* y_test.txt
Activities (identified by 1 through 5) of participants placed in the testing group 

* Subject_test.txt
Identifies the test group subject who performed the activity. Subject IDs are 1 to 30. 

### Project data source: 
Human Activity Recognition Using Smartphones Dataset
Version 1.0
All data and a full description of the experiments are available: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
