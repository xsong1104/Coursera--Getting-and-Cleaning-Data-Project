# Codebook for Getting and Cleaning Data Project

## Data location

A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## The dataset includes the following files:
1. 'README.txt'
2. 'features_info.txt': Shows information about the variables used on the feature vector.
3. 'features.txt': List of all features.
4. 'activity_labels.txt': Links the class labels with their activity name.
5. 'train/X_train.txt': Training set.
6. 'train/y_train.txt': Training labels.
7. 'test/X_test.txt': Test set.
8. 'test/y_test.txt': Test labels.
9. 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
10. 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
11. 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
12. 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

## Variables in the data set

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

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


## Variables used in the analysis

      Variable name         | Description
__________________________________________________________________________________________________________
    subject                 | ID the subject
    activity                | Activity name, Store training data read from "./data/activity_labels.txt"
    trainData               | Store training data read from "./data/train/X_train.txt"
    trainLabel              | Store training data read from "./data/train/y_train.txt"
    trainSubject            | Store training data read from "./data/train/subject_train.txt"
    testData                | Store test data read from "./data/test/X_test.txt"
    testLabel               | Store test data read from "./data/test/y_test.txt"
    testSubject             | Store test data read from "./data/test/subject_test.txt"
    joinData                | Store data by row joining trainData and testData
    joinLabel               | Store data by row joining trainLabel and testLabel
    joinSubject             | Store data by row joining trainSubject and testSubject
    features                | Store training data read from "./data/features.txt"
    meanStdIndices          | Store mean and Standard deviation
    cleanedData             | Store data by Column joining joinSubject, joinLabel, joinData
    result                  | Store tidy data with means

## Analysis Protocol

1. Read data into R
2. Merge data 
3. Compute mean and standard deviation
3. Clean the data: change the name and remove sign
4. Output the tidy data set 
5. Creates another tidy data set with the average of each variable for each activity and each subject
6. Output the data set with means