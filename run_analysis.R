
# run_analysis.R 

#Coursera Getting and Cleaning Data course
#ccrumh March 21, 2015

# Detailed comments on the run_analysis.R script are included in the CodeBook.md file contained in this repo.
#This script will read in the data provided by the study.
#Files containing "X" values include the actual measures collected
#as well as data processed (as explained in the feature-info.txt file).  
#Files conaining "Y" values are the activity files (standing, walking, etc).  
#Subject identifiers of the human participants are in a Subject file.  
#There are two sets of files of each of these types one for training and one for testing participants.
#The script will merge all files to create one dataset.  It will also extract only the values needed 
#for creating a tidy data set of mean and standard deviation calculations.  
#The last part of the script will group variables by activity and subject and provide an average
#value for each column. 

#before running script 
#Download dataset from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#Unzip files to working directory

#install needed packages and load libraries 
#install.packages("car")
library(car)
library(plyr)

#Read in the features.text file containing the variable column names
featureFile <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt")

#Prepare descriptive variable names before assigning to X file column names
nfeatureFile <- sub("^t", "Time_",featureFile[,2])  #replace t with time_, indicates time domain signals
nfeatureFile <- sub("^f", "Freq_",nfeatureFile)  #replace f with freq_, indicates frequency domain signals
nfeatureFile <- sub("BodyBody", "Body",nfeatureFile)  #replace double occurance of body
nfeatureFile <- sub("\\-", "_",nfeatureFile)  #change dash to underscore for readablity
nfeatureFile <- sub("\\,", "_",nfeatureFile)  #change comma to underscore

#Read the Training Datasets(X, Y and subject files)
dfTrainX <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt", col.names=nfeatureFile) 
dfTrainY <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/Y_train.txt",col.names=c("Activity"))
dfTrainSubject <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt",col.names=c("Subject")) 

#Read the Testing Datasets(X, Y and subject files)
dfTestX <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt",col.names=nfeatureFile) 
dfTestY <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/Y_test.txt",col.names=c("Activity"))
dfTestSubject <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt",col.names=c("Subject")) 

#Include only the mean and std columns
colMatchesMeanStd <- grep(".mean\\(\\)|.std\\(\\)", nfeatureFile)

# Append the training, test and subject datasets
# Resulting data will include cols representing Mean and Std

appendDFX <- rbind(dfTrainX[,colMatchesMeanStd],dfTestX[,colMatchesMeanStd])  #Append the X value files for training and testing
appendDFY <- rbind(dfTrainY,dfTestY)                                          #Append the Y value files for training and testing
appendDFSubject <- rbind(dfTrainSubject,dfTestSubject)                        #Append the training and test subjects

#Assign descriptive activity names to name the activities in the data set.  Keep numeric value as part of 
#description for ease of sorting and reference back to original study data
appendDFY$Activity <- recode(appendDFY$Activity, "1= '1_Walking'           ;2= '2_Walking_Upstairs';
                                                  3= '3_Walking_Downstairs';4= '4_Sitting';
                                                  5= '5_Standing'          ;6= '6_Laying' " )

#Merge the files so the activity column is added, dataframe DFSubjectActivityValue results
DFSubjectActivityValues <- cbind(appendDFSubject,appendDFY,appendDFX)


# Using DFSubjectActivityValues create a second, independent tidy data set 
# with the average of each variable by activity and subject
finalAVGtidyData <- ddply(DFSubjectActivityValues, .(Activity, Subject), numcolwise(mean))

#Write dataset to a file on disk, use tabs as separators, suppress row names and column names
#this file can eaisly be read using Excel (specify tab delimited).
write.table(finalAVGtidyData, "FinalAVGTidyData.txt", sep="\t", row.names = FALSE, col.names=FALSE)
