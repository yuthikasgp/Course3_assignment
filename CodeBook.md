# CodeBook for generating the tidy datasets required for course3 assignment.

## Variables

### Tidy dataset 1: <i>mean_std_merged_data</i> generated through steps 1:4 in assignment instructions

variable 1: subject - Volunteer ID, integer taking values between 1:30

variable 2: activity - Factor with 6 levels corresponding to activities WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING,  LAYING

variables 3 to 68: mean and standard deviation features from the original 561-feature vector (values normalized and bounded within [-1,1]) relating to triaxial accelerometer and the gyroscope sensor readings. Variables are named according to information provided in features.txt file included with the original data.

### Tidy dataset 2: <i>tidy_data_averages</i> generated through step 5 in assignment instructions

variable 1: subject - Volunteer ID, integer taking values between 1:30

variable 2: activity - Factor with 6 levels corresponding to activities WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING,  LAYING

variables 3 to 68: Averages (mean) of the variables 3:68 from the tidy dataset 1 for each activity and each subject.Variable names from tidy dataset 1 are prefixed with "Average" to name these variables since they are average values.

## Transformations carried out to generate tidy data from raw data

### Transformations on raw data to obtain Tidy dataset 1: <i>mean_std_merged_data</i> 

1. Load ./train/X_train.txt, ./train/Y_train.txt, features.txt and activity_labels.txt files in R studio.

2. Assign feature names (loaded through features.txt) as column names of training data features (loaded through X_train.txt) . Assign unique names through make.unique() function for duplicated column names.

3. Modify the numeric activity labels loaded through ./train/Y_train.txt loaded using textual label mapping loaded through activity_labels.txt.
 
4. Column bind the activity label to the training dataset.

5. Column bind the volunteering subject ID loaded through train/subject_train.txt to the training dataset.

6. Repeat steps 1:5 for the test dataset using the files corresponding to the test data.

7. Merge training and test datasets obtained using above steps.

8. Extract the columns relating to subject ID, activity label and all variables relating to feature mean() and std() calculations from the merged dataset.

9. Change subject column type from integer to factor since it is more appropriate.

10. Replace the '-' in the column names with underscore to beautify. Tidy dataset 1 is now ready.

### Transformations on raw data to obtain Tidy dataset 2: <i>tidy_data_averages</i> 

1. Take the tidy dataset 1 prepared earlier and add the prefix "Average" to all column names except for the subject and activity columns to beautify column names for the second tidy dataset.

2. group the resulting tidy dataset by subject and activity.

3. Compute the mean() of all columns (except grouping columns). Tidy dataset 2 is now ready.
