#run_analysis.R Codebook
##Your guide to your data output

This is the codebook for the run_analysis.R script's output.  

The dataset, and associated .txt files can be found here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

It is going to borrow quite heavily from the *features.txt* and *features_info.txt* text files, as well as 
a brief interlude with "activity_labels.txt".

##Codebook

Subject	1
 Subject ID - No other info available on participants
 1..30
	
Activity	Txt
	Activity Type - Activity subject was engaged in at time of measurement
		WALKING
		WALKING_UPSTAIRS
		WALKING_DOWNSTAIRS
		SITTING
		STANDING
		LAYING
		
Observations
	The remaining 66 columns represent the average of the mean and std. deviation observations for a Subject/Activity pair.  **The values are not the actual mean of a specific observation, but rather the mean of the mean.**
	
	They follow the following pattern:

```
	[domain][Measurement][mean/std][Axis]
```

Where:
	**domain** - t for time domain, f for frequency domain (fourier transform)
	**Measurement** - measurement name, e.g. BodyAcc for subject's bodily acceleration.  Raw data was processed into acceleration due to gravity and that of the body itself.  Jerk represents linear velocity and angular momentum, and Mag the magnitude of the given measurements.
	**mean/std** - either the average or standard deviation of the measurements 
	**Axis** - X/Y/Z data where applicable, not present for calculated magnitude
		
Hence:

	tBodyAcc-mean()-X
		
Translates as: *time domain measurements of body acceleration, mean value, X-axis*

	Full List of variables, reproduced from *features.info*:

	>tBodyAcc-XYZ
	>tGravityAcc-XYZ
	>tBodyAccJerk-XYZ
	>tBodyGyro-XYZ
	>tBodyGyroJerk-XYZ
	>tBodyAccMag
	>tGravityAccMag
	>tBodyAccJerkMag
	>tBodyGyroMag
	>tBodyGyroJerkMag
	>fBodyAcc-XYZ
	>fBodyAccJerk-XYZ
	>fBodyGyro-XYZ
	>fBodyAccMag
	>fBodyAccJerkMag	*named fBodyBodyAccJerkMag in actual data, typo?*
	>fBodyGyroMag	*named fBodyBodyGyroMag in actual data, typo?*
	>fBodyGyroJerkMag	*named fBodyBodyGyroJerkMag in actual data, typo?*
		
Each of which has both a *-mean()* and *-std()* component.