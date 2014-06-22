# set working directory
setwd("C:/Users/leo/Desktop/stat/DS training/Getting and Cleaning Data/UCI HAR Dataset/")

# Merging the training and the test sets to create one data set.
# Read Training data 
trainData <- read.table("./train/X_train.txt")
# Check dimensions of the trainingData
dim(trainData)
# Read labes for training data 
trainLabel <- read.table("./train/y_train.txt")
# Read subject Training data 
trainSubject <- read.table("./train/subject_train.txt")
# Read Test data 
testData <- read.table("./test/X_test.txt")
# check dimensions of the testData
dim(testData)
# Read labels of Test data 
testLabel <- read.table("./test/y_test.txt")
# Read subject Test data 
testSubject <- read.table("./test/subject_test.txt")
# Row bind trainData and testData
joinData <- rbind(trainData, testData)
# check dimensions of the joinData
dim(joinData)
# Row bind trainLabel and testLabel
joinLabel <- rbind(trainLabel, testLabel)
# check dimensions of the joinLabel
dim(joinLabel)
# Row bind the trainSubject and testSubject
joinSubject <- rbind(trainSubject, testSubject)
# check dimensions of the joinSubject
dim(joinSubject) 

# Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table("./features.txt")
#Subset data mean and standard deviation
meanStdIndices <- grep("mean\\(\\)|std\\(\\)", features[, 2])
joinData <- joinData[, meanStdIndices]
# remove "()"
names(joinData) <- gsub("\\(\\)", "", features[meanStdIndices, 2])
# capitalize M
names(joinData) <- gsub("mean", "Mean", names(joinData))
# capitalize S
names(joinData) <- gsub("std", "Std", names(joinData))
# remove "-" in column names
names(joinData) <- gsub("-", "", names(joinData))

# Uses descriptive activity names to name the activities in the data set
# read activity_labels.txt file
activity <- read.table("./data/activity_labels.txt")
activity[, 2] <- tolower(gsub("_", "", activity[, 2]))
substr(activity[2, 2], 8, 8) <- toupper(substr(activity[2, 2], 8, 8))
substr(activity[3, 2], 8, 8) <- toupper(substr(activity[3, 2], 8, 8))
activityLabel <- activity[joinLabel[, 1], 2]
joinLabel[, 1] <- activityLabel
names(joinLabel) <- "activity"

# Appropriately labels the data set with descriptive activity names.
names(joinSubject) <- "subject"
cleanedData <- cbind(joinSubject, joinLabel, joinData)
# write out the Merged Data With Descriptive Activity dataset
write.table(cleanedData, " Tidydataset.txt")

# Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
subjectLen <- length(table(joinSubject))
activityLen <- dim(activity)[1]
columnLen <- dim(cleanedData)[2]
result <- matrix(NA, nrow=subjectLen*activityLen, ncol=columnLen)
result <- as.data.frame(result)
colnames(result) <- colnames(cleanedData)
row <- 1
for(i in 1:subjectLen) {
      for(j in 1:activityLen) {
            result[row, 1] <- sort(unique(joinSubject)[, 1])[i]
            result[row, 2] <- activity[j, 2]
            bool1 <- i == cleanedData$subject
            bool2 <- activity[j, 2] == cleanedData$activity
            result[row, 3:columnLen] <- colMeans(cleanedData[bool1&bool2, 3:columnLen])
            row <- row + 1
      }
}
head(result)
# write out the Tidy Data With Means dataset
write.table(result, "TidyDataWithMeans.txt") 
