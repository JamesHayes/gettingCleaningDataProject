# README.md
## Getting & Cleaning Data Coursera Course
## March 22, 2015
## ~Jim Hayes

This is the README file for the Coursera project as part of the "Getting and Cleaning Data" course.

## Data used for assignment
Human Activity Recognition Using Smartphones Dataset
Version 1.0
dataset - https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

NOTE: this script assumes that the data is uncompressed and all of the required files are moved to the working direcotry.

## Description of Data (as taken from data's README.txt file.)
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.

### Required Files
* activity_labels.txt
* features.txt
* X_test.txt
* X_train.txt
* y_test.txt
* y_train.txt
* subject_test.txt
* subject_train.txt

### Output
tidyData.gettingCleaningData.project.txt

## Description of script
The script follows the assignment tasks as defined in the project assignment.

### Merges the training and the test sets to create one data set.
First, the script reads in all the required datafiles and data. The subject "ID" and "ActivityID" names are then combined with the training and test datasets to provide appropriate labelling. Both the training and test data are merged using the rbind.
### Extracts only the measurements on the mean and standard deviation for each measurement. 
I used the grep command to find those columsn labeled "mean" or "std" and pulled out only those columns into a combined a new dataframe.

### Uses descriptive activity names to name the activities in the data set
The merge command was used to combine the movement data with the names dataframe. They were merged by matching ActivityID with it's corresponding Activity.

### Appropriately labels the data set with descriptive variable names. 
The data was melted and converted into a table w/ the means of all the features. They were then sorted according activity and suject.

### From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
The data was outputted to "tidyData.gettingCleaningData.project.txt"
A description of the data can be found in the corresponding "CodeBook.md" file.