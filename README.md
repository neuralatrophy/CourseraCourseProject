# CourseraCourseProject
##"Getting and Cleaning Data" Course Project

###The Script

run_analysis.R takes data from the UCI HAR data set here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and attempts to transform it into a tidy format.  *Unzip this data set in the same directory as the script!*  No other actions necessary.

###Variables chosen

The *README.txt*, *features_info.txt*, and *features.txt* files included with the above data contain a complete description of the original dataset.

The course requirements were to "extract the measurements on the mean and std deviation" for each.  I interpreted that as "take all measurements that have a std deviation and a mean", resulting in 66 variables.  This did not include the meanFreq() variables, as they do not have a std. dev. but rather other variables (skewness, kurtosis).  I felt neatly matched pairs was the way to go.

###Output Format

A wide dataset with 180 observations covering 68 variables (33 variables with Mean/Std.Dev. plus Activity Type and Subject). Like so:

>Subject         Activity 		tBodyAcc-mean()-X 	tBodyAcc-mean()-Y tBodyAcc-mean()-Z
>1       1          WALKING         0.2773308       -0.01738382        -0.1111481
>2       1 WALKING_UPSTAIRS         0.2554617       -0.02395315        -0.0973020  

Output is in a space-delimited that should require no special effort to read into R with read.table.

Thanks for reading! 

 