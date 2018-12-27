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
