#Run analysis.R
#
library("dplyr")
setwd("D:/yuthika_work/data analysis/course3/assignment")

#################################################################################
# Create tidy dataset 1
#################################################################################

# Load and prepare training dataset
#
train_data <- read.table("train/X_train.txt") # Load training dataset
activity_num <- read.table("train/y_train.txt") # activity labels for data as numbers
features <- read.table("features.txt") # features labels
activities <- read.table("activity_labels.txt") # activity labels
names(train_data) <- features[,2] # Assign descriptive names to training dataset variables
names(train_data) <- make.unique(as.character(names(train_data))) #  duplicate column names unique 

# Bind activity labels to training dataset
activity <- as.data.frame(lapply(activity_num[,1], function(val) as.character(activities[val,2])))
activity <- t(activity)
row.names(activity) <- 1:length(activity)
train_data <- cbind( activity, train_data )

# Add subject IDs to training dataset
subjects <- read.table("train/subject_train.txt") # subject label
train_data <- cbind(subjects, train_data) #add subject column to training dataset
names(train_data)[1] <- "subject" # give a meaningful name to the newly added column

# Load and prepare test dataset
#
test_data <- read.table("test/X_test.txt") # Load test dataset
activity_num_test <- read.table("test/y_test.txt") # activity labels for test data as numbers
features_test <- read.table("features.txt") # features labels
activities_test <- read.table("activity_labels.txt") # activity labels
names(test_data) <- features_test[,2] # Assign descriptive names to test set variables
names(test_data) <- make.unique(as.character(names(test_data))) #  duplicate column names unique 

# Bind activity labels to test dataset
activity_test <- as.data.frame(lapply(activity_num_test[,1], function(val) as.character(activities_test[val,2])))
activity_test <- t(activity_test)
row.names(activity_test) <- 1:length(activity_test)
test_data <- cbind( activity_test, test_data)
names(test_data)[1] <- "activity" # rename activity column name to be the same as the training dataset

# Add subject IDs to test dataset
subjects_test <- read.table("test/subject_test.txt") # subject label
test_data <- cbind(subjects_test, test_data) # add subject column to test dataset
names(test_data)[1] <- "subject" # give a meaningful name to the newly added column

# Merge training and test datasets
merged_data <- rbind(train_data, test_data) 
# Covert the type of subject column from integer to factor since it takes integer values 1:30 only
merged_data$subject <- factor(merged_data$subject)

#Extract columns on subject,activity,mean,std
all_col_names <- as.data.frame(names(merged_data))
mean_std_col_indices <- grep("^subject$|^activity$|mean\\(\\)|std\\(\\)", all_col_names$`names(merged_data)`)

mean_std_merged_data <- select(merged_data, mean_std_col_indices)
names(mean_std_merged_data) <- gsub("-", "_", names(mean_std_merged_data)) # replace '-' in column names with '_'

View(mean_std_merged_data)

#################################################################################
# Create tidy dataset 2 with variable averages for each subject, each activity
#################################################################################

tidy_data <- mean_std_merged_data
td_colnames <- names(tidy_data)[-(1:2)]
# Prefix "Average" to column names
td_colnames <- lapply(as.vector(td_colnames), function(val) paste0("Average_", val))
# Convert list data into vector form
tidy_data_colnames <- vector(mode = "character", length = length(td_colnames)+2)
tidy_data_colnames[1] <- names(tidy_data)[1]
tidy_data_colnames[2] <- names(tidy_data)[2]
for(i in 1:length(td_colnames)){
  tidy_data_colnames[i+2] <- td_colnames[[i]]
}

names(tidy_data) <- tidy_data_colnames

tidy_data <- group_by( tidy_data, subject, activity)
tidy_data_averages <- summarize_all( tidy_data, mean )

View(tidy_data_averages) # Tidy dataset 2


