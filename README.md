# Getting-and-Cleaning-Data-Week-4-Assignment

This repo was created to finish the assignment for week 4 of Getting and Cleaning Data Coursera course.
* First, download data.
* Second, performe analysis acording to instructions.
* Finally, write data that produced by analysis steps into file .

### Code explaination
Read necessary data, combine datasets and get partial variables to create another dataset with the averages of each variable for each activity.

### Created dataset
The new generated dataset contained variables calculated based on the mean and standard deviation. Each row of the dataset is an average of each activity type for all subjects.

### Instruction of this assignment

1. Merges the training and the test sets to create one data set.
Use command rbind to combine training and test set
2. Extracts only the measurements on the mean and standard deviation for each measurement.
Use grep command to get column indexes for variable name contains "mean()" or "std()"
3. Uses descriptive activity names to name the activities in the data set
Convert activity labels to characters and add a new column as factor
4. Appropriately labels the data set with descriptive variable names.
Give the selected descriptive names to variable columns
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Use pipeline command to create a new tidy dataset with command group_by and summarize_each in dplyr package
