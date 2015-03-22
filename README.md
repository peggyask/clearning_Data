# clearning_Data
run_analytics.R
This script analyzes the data (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) collected from the accelerometers from the Samsung Galaxy S smartphone. It does the following. 

1. Loads feature names from features.txt
2. Loads the train and test data sets and apply step 3 and 4 for each set.
3. Appropriately labels the data set with feature names from step 1.
4. Extracts only the measurements on the mean and standard deviation for each measurement.
5. Merges the training and the test sets to create one data set.
6. Uses descriptive activity names to name the activities in the data set.
7. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
8. Outputs the tidy data set to tidy_data.txt file.