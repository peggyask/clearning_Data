## This function loads the training or test data set and extracts only the
## measurements on the mean and standard deviation or each measurement. 
## type can be either "train" or "test"
loadData <- function(type) {
    # load feature names
    features=read.table("UCI HAR Dataset/features.txt", sep=" ")

    # load X data and assign the feature names to columns
    x=read.fwf(paste("UCI HAR Dataset", type, paste("X_", type, ".txt", sep=""), sep="/"), widths=rep(16, 561))
    colnames(x)=features[,2]

    # extract the mean and std measurements
    tb=x[colnames(x)[which(grepl("mean\\(\\)|std\\(\\)", colnames(x)))]]

    # load y and subject data
    tb=cbind(read.table(paste("UCI HAR Dataset", type, paste("y_", type, ".txt", sep=""), sep="/"), col.names=c("activity")), tb)
    tb=cbind(read.table(paste("UCI HAR Dataset", type, paste("subject_", type, ".txt", sep=""), sep="/"), col.names=c("subject")), tb)

    return(tb)
}

train_db <- loadData("train")
test_db <- loadData("test")
db <- rbind(train_db, test_db)
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", sep=" ", col.names=c("activity", "activity_label"))
# Uses descriptive activity names to name the activities in the data set
data <- merge(activity_labels, db)
# Creates a data set with the average of each variable for each activity and each subject
result <- aggregate(data[, 4:66], data[, 2:3], FUN=mean)
write.csv(result, "tidy_data.txt", row.names=FALSE)
