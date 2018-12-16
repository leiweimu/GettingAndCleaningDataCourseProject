# This R script reads the test and training sets from UCI Human Activity Recognition Using Smartphones 
# project, merges two sets, computes statistics, cleans up the set, and finally exports a tidy data set 
# with the average of each variable for each activity and each subject.

# initiates packages
library(reshape2)

# downloads and decompresses dataset if necessary
if (!dir.exists("UCI HAR Dataset")) { 
    fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    filename <- "HAR.zip"
    download.file(fileURL, filename, method="curl")
    unzip(filename) 
}

# reads activity labels
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt", colClasses = c("integer", "character"))

# identifies relevant features pertinent to mean and standard deviation measurements
features <- read.table("./UCI HAR Dataset/features.txt", colClasses = c("NULL", "character"))
featuresIndex <- grep("mean|std", features[,])
featuresName <- features[featuresIndex,]
featuresName <- sub("mean", "Mean", featuresName)
featuresName <- sub("std", "Std", featuresName)
featuresName <- gsub("-|[()]", "", featuresName)

# loads data into R
test <- read.table("./UCI HAR Dataset/test/X_test.txt")[,featuresIndex]
testSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
testActivity <- read.table("./UCI HAR Dataset/test/y_test.txt")
test <- cbind(testSubject, testActivity, test)

train <- read.table("./UCI HAR Dataset/train/X_train.txt")[,featuresIndex]
trainSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
trainActivity <- read.table("./UCI HAR Dataset/train/y_train.txt")
train <- cbind(trainSubject, trainActivity, train)

# merges sets
complete <- rbind(test, train)
colnames(complete) <- c("subject", "activity", featuresName)

# creates factors
complete$subject <- as.factor(complete$subject)
complete$activity <- factor(complete$activity, levels = activityLabels[,1], labels = activityLabels[,2])

# computes average of each variable for each activity and each subject
completeMelt <- melt(complete, id.vars = c("subject", "activity"))
tidy <- dcast(completeMelt, subject + activity ~ variable, mean)

# exports cleansed set
write.table(tidy, "tidy.txt", quote = FALSE, row.names = FALSE)

# removes temporary objects and prompts success message
rm(list = ls())
message("Data has been successfully processed. \nCleansed set \"tidy.txt\" was saved to the current directory. ")