## Coursera "Getting and Cleaning Data" Course Project
## Requires dplyr, plyr, reshape2

library(plyr)
library(dplyr)
library(reshape2)

# Input All Required Files -- NOTE -- Assumes you have unzipped the following:
#
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#
# into your working directory with NO FURTHER MODIFICATIONS...srsly...pls don't break me

train.subject <- read.table("UCI HAR Dataset/train/subject_train.txt")
train.activity <- read.table("UCI HAR Dataset/train/y_train.txt")
train.measure <- read.table("UCI HAR Dataset/train/X_train.txt")

test.subject <- read.table("UCI HAR Dataset/test/subject_test.txt")
test.activity <- read.table("UCI HAR Dataset/test/y_test.txt")
test.measure <- read.table("UCI HAR Dataset/test/X_test.txt")

measure.labels <- read.table("UCI HAR Dataset/features.txt")
activity.labels <- read.table("UCI HAR Dataset/activity_labels.txt")

# Merge training and test sets piecemeal: first vertically merging subject lists, then activity, then measurements; then name them (using the 
# handy features.txthead file); then horizontally merge subject/activity/measure.

merged.subject <- rbind(train.subject, test.subject)
merged.activity <- rbind(train.activity, test.activity)
merged.measure <- rbind(train.measure, test.measure)

# To complete a relatively tidy (if unwieldy) dataset, give everything names (importing the names from features.txt)

colnames(merged.subject) <- "Subject"
colnames(merged.activity) <- "Activity"
colnames(merged.measure) <- measure.labels[[2]]

# Extract only columns with "mean()" and "std()".  Intentionally ignoring several columns, see README for more info.

trimmed.measure <- merged.measure[grepl("(mean|std)\\(\\)", names(merged.measure))]

# Bring everything together in a sane data frame.

rawData <- cbind(merged.subject, merged.activity, trimmed.measure)

# Replace Acvtivity Numbers with Activity Labels, courtesy of the activity_labels.txt file.  How thoughtful of them :)
# Cast rawData$Activity as a factor, then rename factor levels with actual labels.

rawData$Activity <- as.factor(rawData$Activity)
rawData$Activity <- mapvalues(rawData$Activity, from = c(1:6), to = as.vector(activity.labels[[2]]))

# Melt and recast selected data into a second data set providing the average of each variable for each activity per subject.
# 30 subjects with 6 activities = 180 observations.  (Reuses trimmed.measure cause I was too lazy to make a list of just the names.)

meltedData <- melt(rawData, id = c("Subject", "Activity"), measure.vars = names(trimmed.measure))

finalData <- dcast(meltedData, Subject + Activity ~ variable, mean)

# Wide format for great justice!

#write tidy, summarized data out to a file and celebrate!

write.table(finalData, file = "UCI-HAR_analysis_output.txt", row.names = FALSE)




