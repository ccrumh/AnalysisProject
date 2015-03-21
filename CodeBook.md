
# AnalysisProject
##CodeBook.md"


##CodeBook for Coursera Getting and Cleaning Data class project

##This document describes the variables, the data, and any transformations or work performed to clean up the data. 

Project data source: 
Human Activity Recognition Using Smartphones Dataset
Version 1.0
All data and a full description of the experiments are available: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

==================================================================

##Brief description of experiments: 

A group of 30 volunteers performed six activities wearing a Samsung Galaxy S II smartphone on their waist. 
3-axial linear acceleration and 3-axial angular velocity were measured using the device's embedded accelerometer and gyroscope. Randomly the participants' were partitioned into two sets, 70% in the training data and 30% in the test data. 

==================================================================

##Input files
The UCI HAR Dataset folder structure should be unziped into the working directory prior to running the run_analysis.R script included in this repo. The following files are used. 

##features.txt
List of all variables collected or calculated in the study. The run_analysis.R script 
will utilize this file when applying column names to the X value files (train and test).  

##X_train.txt
Participants placed in the training group have their performance data in this dataset. Dataset includes 581 separate columns of measured and calculated fields

##y_train.txt
Activities (identified by 1 through 6) of participants placed in the training group 

##Subject_train.txt
Identifies the training group subjects who performed the activity. Subject IDs are 1 to 30. 

##X_test.txt
Participants placed in the test group have their performance data in this dataset. Dataset includes 581 separate columns of measured and calculated fields

##y_test.txt
Activities (identified by 1 through 5) of participants placed in the testing group 

##Subject_test.txt
Identifies the test group subject who performed the activity. Subject IDs are 1 to 30. 

##Files not read as input in run_analysis but still relevant to understanding the study: 
##activity_labels.txt
List of activities names (ie, walking, standing). The run_analysis.R script 
will utilize the values in this file to clearly label the activities performed by subjects.

##features_info.txt
Provides detailed descriptions of the varibles measured. 

##ReadME.txt
Introduction to the study, dataset definitions, and license for use of study data. 

==================================================================

##Variables

The variables below were used in the study.  
See features_info.txt for detail descriptions of study variables.

tBodyAcc-XYZ 

tGravityAcc-XYZ 

tBodyAccJerk-XYZ 

tBodyGyro-XYZ 

tBodyGyroJerk-XYZ

tBodyAccMag

tGravityAccMag

tBodyAccJerkMag

tBodyGyroMag

tBodyGyroJerkMag

fBodyAcc-XYZ

fBodyAccJerk-XYZ

fBodyGyro-XYZ

fBodyAccMag

fBodyAccJerkMag

fBodyGyroMag

fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value

std(): Standard deviation

mad(): Median absolute deviation 

max(): Largest value in array

min(): Smallest value in array

sma(): Signal magnitude area

energy(): Energy measure. Sum of the squares divided by the number of values. 

iqr(): Interquartile range 

entropy(): Signal entropy

arCoeff(): Autorregresion coefficients with Burg order equal to 4

correlation(): correlation coefficient between two signals

maxInds(): index of the frequency component with largest magnitude

meanFreq(): Weighted average of the frequency components to obtain a mean frequency

skewness(): skewness of the frequency domain signal 

kurtosis(): kurtosis of the frequency domain signal 

bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.

angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

Note: only mean and std variables will be used to create the tidy dataset for this project

==================================================================

##To improve the readability of the variables, the following modifications were made: 

1. Substitute word "Time" when character "t" is at beginning of variable name.  
   Time represents time domain signals
2. Substitute word "Freq" when character "f" is at beginning of variable name.
   Freq represents frequency domain signals
3. Replace double occurance of the word "body""
4. Change dash "-" to underscore "_" for readablity
5. Change comma "," to underscore "_"

==================================================================

## After reading in the input files specified above, the columns representing mean and standard deviation are included in the dataframes which will be used for the remainder of the run_analysis.R commands: 

The grep function is used to select the columns:

colMatchesMeanStd <- grep(".mean\\(\\)|.std\\(\\)", nfeatureFile)

The resulting variable, colMatchesMeanStd is used to specify the X file cols to include:

appendDFX <- rbind(dfTrainX[,colMatchesMeanStd],dfTestX[,colMatchesMeanStd]) 

==================================================================

## To clearly identify the Activities in the Y files, recoding of the Activity variable is performed:

 appendDFY$Activity <- recode(appendDFY$Activity,

"1= '1_Walking';2= '2_Walking_Upstairs';3= '3_Walking_Downstairs';

 4= '4_Sitting';5= '5_Standing'        ;6= '6_Laying' " )
 
 Note:  Original activity numbers were appended to the text description for sorting and to make it easy to refer back to original study variables. 
==================================================================

##Using the cbind function, working files are merged resulting in a single file, DFSubjectActivityValues, containing the subjects, activities and mean/std values

DFSubjectActivityValues <- cbind(appendDFSubject,appendDFY,appendDFX)

## Using dataframe DFSubjectActivityValues, a second,independent tidy data set with the average of each variable by activity and subject is created using the ddply function. The numcolwise argument is used to calculate the mean of each variable.

finalAVGtidyData <- ddply(DFSubjectActivityValues, .(Activity, Subject), numcolwise(mean))

## A write command is performed to write "FinalAVGTidyData.txt" to the working directory
## Use of the sep="\t" (tab separated) parameter will allow MS Excel to easily read the file 

write.table(finalAVGtidyData, "FinalAVGTidyData.txt", sep="\t", row.names = FALSE, col.names=FALSE)

## The output file is a tidy dataset of 68 columns (Activity, Subject, 66 calculated mean), and 160 rows representing the unique combinations of Activity and Subject values

==================================================================
 Study Data credits: 
 Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
 Smartlab - Non Linear Complex Systems Laboratory
 DITEN - Università degli Studi di Genova.
 Via Opera Pia 11A, I-16145, Genoa, Italy.
 activityrecognition@smartlab.ws
 www.smartlab.ws
 Reference: 
 [1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012 

 This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

 Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
=================================================================

