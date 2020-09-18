library(dplyr)

# Loading the traininig data
XTrain <- read.table("X_train.txt")
YTrain <- read.table("Y_train.txt")
SubjTrain <- read.table("subject_train.txt")

# Loading the test data
XTest <- read.table("X_test.txt")
YTest <- read.table("Y_test.txt")
SubjTest <- read.table("subject_test.txt")

# Loading the data features
variableNames <- read.table("features.txt")

# Loading activity labels
activityLabels <- read.table("activity_labels.txt")

# 1. Merges the training and the test sets to create one data set.
XTotal <- rbind(XTrain, XTest)
YTotal <- rbind(YTrain, YTest)
SubTotal <- rbind(SubjTrain, SubjTest)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
selectedVar <- variableNames[grep("mean\\(\\)|std\\(\\)",variableNames[,2]),]
XTotal <- XTotal[,selectedVar[,1]]

# 3. Uses descriptive activity names to name the activities in the data set
colnames(YTotal) <- "activity"
YTotal$activitylabel <- factor(YTotal$activity, labels = as.character(activityLabels[,2]))
activitylabel <- YTotal[,-1]

# 4. Appropriately labels the data set with descriptive variable names.
colnames(XTotal) <- variableNames[selectedVar[,1],2]

# 5. From the data set in step 4, creates a second, independent tidy data set with the average
# of each variable for each activity and each subject.
colnames(SubTotal) <- "subject"
total <- cbind(XTotal, activitylabel, SubTotal)
totalMean <- total %>% group_by(activitylabel, subject) %>% summarize_each(funs(mean))
write.table(totalMean, file = "tidydata.txt", row.names = FALSE, col.names = TRUE)



