###############################################################################
# Getting and Cleaning Data
#
# Course Project
#
# See README.md and CodeBook.md
#
# author: Eduardo Bortoluzzi Junior
###############################################################################

library(data.table)
library(dplyr)

# Constants
FOLDER <- "UCI HAR Dataset"
LIMIT <- -1 # -1 is to read all rows
RM_INTERMEDIATES <- TRUE

# Read a set of information
#
# Arguments
#  partition: "train" or "test" for the dataset being worked
#
# Returns
#  A data.table with the observations of the partition requested, with the
#  subject and activity done.
read_set <- function(partition) {
    # Observations
    X_TEST_FILE <- file.path(FOLDER, partition, 
                             paste0("X_", partition, ".txt"))
    # 4. Appropriately labels the data set with descriptive variable names. 
    # (this is done using the col.names)
    partial_x_set <- read.table(X_TEST_FILE, header=FALSE, 
                                col.names=features$feature, 
                                colClasses="numeric", nrows=LIMIT, 
                                strip.white=TRUE) 
    # Subject of observation
    SUBJECT_TEST_FILE <- file.path(FOLDER, partition, 
                                   paste0("subject_", partition, ".txt"))
    partial_subject_set <- fread(SUBJECT_TEST_FILE, nrows=LIMIT)
    partial_x_set$subject <- partial_subject_set[[1]]
    rm(partial_subject_set)
    
    # Activity done by the subject in each observation 
    Y_TEST_FILE <- file.path(FOLDER, partition, paste0("y_", partition, ".txt"))
    partial_y_set <- fread(Y_TEST_FILE, nrows=LIMIT, header=FALSE)
    partial_x_set$activity_id <- partial_y_set[[1]]
    rm(partial_y_set)

    # 3. Uses descriptive activity names to name the activities in the data set
    partial_x_set <- merge(partial_x_set, activity_labels, by="activity_id")

    partial_x_set
}

# Read the activity labels
activity_labels <- fread(file.path(FOLDER, "activity_labels.txt"), header=FALSE)
setnames(activity_labels, c("activity_id", "activity"))
setkey(activity_labels, "activity_id")

# Read the features (variable names) of the observation
features <- fread(file.path(FOLDER, "features.txt"), header=FALSE)
setnames(features, c("id", "feature"))

# Read the "train" partition and the "test" partition
train_set <- read_set("train")
test_set <- read_set("test")

if(RM_INTERMEDIATES) {
    rm(activity_labels)
    rm(features)
}

# 1. Merges the training and the test sets to create one data set.
merged_set <- bind_rows(train_set, test_set)

if(RM_INTERMEDIATES) {
    rm(train_set)
    rm(test_set)
}

# 2. Extracts only the measurements on the mean and standard deviation for each 
#    measurement. 
merged_set <- select(merged_set, subject, activity, contains(".mean."), 
                     contains(".std."), contains(".gravityMean.")) %>% group_by(subject,activity)

# 5. From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.
avg_set <- aggregate(. ~ subject + activity, data=merged_set, mean)
