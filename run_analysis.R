# Getting & Cleaning Data coursera project
# Jim Hayes
# Due March 22, 2015
#
# Note, this assumes that all of the data has been moved from the "UCI HAR Dataset" subfolders
# and moved to the working directory.

# loads reshape2 for melting data
library(reshape2)

# Task 1: Merges the training and the test sets to create one data set.
# Reads activity labels, and codes.
activityLabels <- read.table("activity_labels.txt", col.names=c("ActivityId", "Activity"))
features <- read.table("features.txt")
featureNames <- features[,2]

# read in all test data, ids, and combine into a dataframe
testData <- read.table("X_test.txt")
colnames(testData) <- featureNames
testSubId <- read.table("subject_test.txt")
colnames(testSubId) <- "ID"
testActivity <- read.table("y_test.txt")
colnames(testActivity) <- "ActivityId"
fullTestData <- cbind(testSubId, testActivity, testData)

# read in all training data, ids, and combine into indivdual dataframes
trainData <- read.table("X_train.txt")
colnames(trainData) <- featureNames
trainSubId <- read.table("subject_train.txt")
colnames(trainSubId) <- "ID"
trainActivity <- read.table("y_train.txt")
colnames(trainActivity) <- "ActivityId"
fullTrainData <- cbind(trainSubId, trainActivity, trainData)


# Task 2: .Extracts only the measurements on the mean and standard deviation for each measurement. 
# combine testing and training data
fullData <- rbind(fullTestData, fullTrainData)


# 3.Uses descriptive activity names to name the activities in the data set
# use grep to pull out only mean and standard deviation columns, then extract the data.
meanCols <- grep("mean", names(fullData), ignore.case=TRUE)
meanColNames <- names(fullData)[meanCols]
stdCols <- grep("std", names(fullData), ignore.case=TRUE)
stdColNames <- names(fullData)[stdCols]
extractedMeanAndStdData <- fullData[, c("ID", "ActivityId", meanColNames, stdColNames)]

# merge activity names and codes from subjects w/ documentented names
translatedActivities <- merge(activityLabels, extractedMeanAndStdData, by.x="ActivityId", by.y="ActivityId", all=TRUE)


# Task 4: Appropriately labels the data set with descriptive variable names. 
# Melt the datasets, cast, and combine.
tableMelt <- melt(translatedActivities, id=c("ActivityId","Activity","ID"))
mean_data <- dcast(tableMelt, ActivityId + Activity + ID ~ variable,mean)


# Task 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# write the output
write.table(mean_data,"tidyData.gettingCleaningData.project.txt", row.names=FALSE)