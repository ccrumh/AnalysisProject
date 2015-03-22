
# AnalysisProject
## CodeBook.md


## CodeBook for Coursera Getting and Cleaning Data class project

### This document describes the variables, the data, and any transformations or work performed to clean up the data. 

Project data source: 
Human Activity Recognition Using Smartphones Dataset
Version 1.0
All data and a full description of the experiments are available: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

==================================================================

##Brief description of experiments: 

A group of 30 volunteers performed six activities wearing a Samsung Galaxy S II smartphone on their waist. 
3-axial linear acceleration and 3-axial angular velocity were measured using the device's embedded accelerometer and gyroscope. Randomly the participants' were partitioned into two sets, 70% in the training data and 30% in the test data. 
 See study Readme.txt in UCI HAR Dataset folder for complete description of experiments. 
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

See features_info.txt for detail descriptions of original study variables.  Only the variables
that have mean or standard deviation are used in the run_analysis.R script. 

### To improve the readability of the variables, the following modifications were made: 

1. Substitute word "Time" when character "t" is at beginning of variable name.  
   Time represents time domain signals
2. Substitute word "Freq" when character "f" is at beginning of variable name.
   Freq represents frequency domain signals
3. Replace double occurance of the word "body""
4. Change dash "-" to underscore "_" for readablity
5. Change comma "," to underscore "_"

 The 66 variables (mean, std) used by the run_analysis.R script follow.  
 "Time_BodyAcc_mean()-X" 
 
 "Time_BodyAcc_mean()-Y" 
 
 "Time_BodyAcc_mean()-Z"
 
 "Time_BodyAcc_std()-Y"
 
 "Time_BodyAcc_std()-Z"   
 
 "Time_GravityAcc_mean()-X"
 
 "Time_GravityAcc_mean()-Y"  
 
 "Time_GravityAcc_mean()-Z"  
 
 "Time_GravityAcc_std()-X" 
 
 "Time_BodyGyroJerk_std()-X"  
 
 "Time_BodyGyroJerk_std()-Y"
 
 "Time_BodyGyroJerk_std()-Z" 
 
 "Time_BodyAccMag_mean()"  
 
 "Time_BodyAccMag_std()"  
 
 "Time_GravityAccMag_mean()"
 
 "Time_GravityAccMag_std()"  
 
 "Time_BodyAccJerkMag_mean()" 
 
 "Time_BodyAccJerkMag_std()" 
 
 "Time_BodyGyroMag_mean()" 
 
 "Time_BodyGyroMag_std()" 
 
 "Time_BodyGyroJerkMag_mean()"
 
 "Time_BodyGyroJerkMag_std()" 
 
 "Freq_BodyAcc_mean()-X"   
 
 "Freq_BodyAcc_mean()-Y"  
 
 "Freq_BodyAcc_mean()-Z"  
 
 "Freq_BodyAcc_std()-X"   
 
 "Freq_BodyAcc_std()-Y" 
 
 "Freq_BodyAcc_std()-Z"  
 
 "Freq_BodyAccJerk_mean()-X" 
 
 "Freq_BodyAccJerk_mean()-Y"  
 
 "Freq_BodyAccJerk_mean()-Z" 
 
 "Freq_BodyAccJerk_std()-X"  
 
 "Freq_BodyAccJerk_std()-Y"  
 
 "Freq_BodyAccJerk_std()-Z" 
 
 "Freq_BodyGyro_mean()-X"  
 
 "Freq_BodyGyro_mean()-Y"  
 
 "Freq_BodyGyro_mean()-Z"  
 
 "Freq_BodyGyro_std()-X"  
 
 "Freq_BodyGyro_std()-Y"
 
 "Freq_BodyGyro_std()-Z"
 
 "Freq_BodyAccMag_mean()"  
 
 "Freq_BodyAccMag_std()"  
 
 "Freq_BodyAccJerkMag_mean()" 
 
 "Freq_BodyAccJerkMag_std()" 
 
 "Freq_BodyGyroMag_mean()"  
 
 "Freq_BodyGyroMag_std()" 
 
 "Freq_BodyGyroJerkMag_mean()"
 
 "Freq_BodyGyroJerkMag_std()"
 

 NOTE: TidyData output file will contain 68 cols (Activity and Subject) are the first two columns.  
  
 Variable descriptions follow: 
 
 Time - time domain signal
 
 Acc -  accelerometer measurement variable
 
 Body - measure body movement
 
 Gyro - gyroscope
 
 Freq - frequency domain signals
 
 Jerk - jerk signal calculation
 
 Mag -  magnitude
 
 Gravity - Gravity calculation
 
 X - x axis measurement
 
 Y - y axis measurement
 
 Z - z axis measurement
 
 XYZ' - denote 3-axial signals in the X, Y and Z directions
 
Accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth 
filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity 
acceleration signals (Time_BodyAcc-XYZ and Time_GravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

The body linear acceleration and angular velocity were derived in time to obtain Jerk signals (Time_BodyAccJerk-XYZ and Time_BodyGyroJerk-XYZ). 
Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (Time_BodyAccMag, Time_GravityAccMag, Time_BodyAccJerkMag, Time_BodyGyroMag, Time_BodyGyroJerkMag). 

A Fast Fourier Transform (FFT) was applied to some of these signals producing Freq_BodyAcc-XYZ, Freq_BodyAccJerk-XYZ,
 Freq_BodyGyro-XYZ, Freq_BodyAccJerkMag, Freq_BodyGyroMag, Freq_BodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


==================================================================

### After reading in the input files specified above, the columns representing mean and standard deviation are included in the dataframes which will be used for the remainder of the run_analysis.R commands: 

The grep function is used to select the columns:

colMatchesMeanStd <- grep(".mean\\(\\)|.std\\(\\)", nfeatureFile)

The resulting variable, colMatchesMeanStd is used to specify the X file cols to include:

appendDFX <- rbind(dfTrainX[,colMatchesMeanStd],dfTestX[,colMatchesMeanStd]) 

==================================================================

### To clearly identify the Activities in the Y files, recoding of the Activity variable is performed:

 appendDFY$Activity <- recode(appendDFY$Activity,

 "1= '1_Walking';2= '2_Walking_Upstairs';3= '3_Walking_Downstairs';

 4= '4_Sitting';5= '5_Standing'        ;6= '6_Laying' " )
 
 Note: Original activity numbers were appended to the text description for sorting and to make it easy to refer back to original study variables. 

 ==================================================================

### Using the cbind function, working files are merged resulting in a single file, DFSubjectActivityValues, containing the subjects, activities and mean/std values

 DFSubjectActivityValues <- cbind(appendDFSubject,appendDFY,appendDFX)

### Using dataframe DFSubjectActivityValues, a second,independent tidy data set with the average of each variable by activity and subject is created using the ddply function. The numcolwise argument is used to calculate the mean of each variable.

finalAVGtidyData <- ddply(DFSubjectActivityValues, .(Activity, Subject), numcolwise(mean))

### A write command is performed to write "FinalAVGTidyData.txt" to the working directory
### Use of the sep="\t" (tab separated) parameter will allow MS Excel to easily read the file 

 write.table(finalAVGtidyData, "FinalAVGTidyData.txt", sep="\t", row.names = FALSE, col.names=FALSE)

### The output file is a tidy dataset of 68 columns (Activity, Subject, 66 calculated mean), and 180 rows representing the unique combinations of Activity and Subject values

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

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.  Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.


=================================================================

