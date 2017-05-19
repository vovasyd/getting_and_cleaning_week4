library(reshape2)

#load initial datasets
measures_train <- read.csv("UCI HAR Dataset/train/X_train.txt", header = FALSE, sep = "")
activities_train <- read.csv("UCI HAR Dataset/train/y_train.txt", header = FALSE, col.names = c("act_id"))
subj_train <- read.csv("UCI HAR Dataset/train/subject_train.txt", header = FALSE, col.names = c("subj_id"))

measures_test <- read.csv("UCI HAR Dataset/test/X_test.txt", header = FALSE, sep = "")
activities_test <- read.csv("UCI HAR Dataset/test/y_test.txt", header = FALSE, col.names = c("act_id"))
subj_test <- read.csv("UCI HAR Dataset/test/subject_test.txt", header = FALSE, col.names = c("subj_id"))

#load column names and activity labels
measure_cnames <- read.csv("UCI HAR Dataset/features.txt", header = FALSE, sep = "")
activiti_labs <- read.csv("UCI HAR Dataset/activity_labels.txt", header = FALSE, col.names = c("act_id", "act_name"), sep = "")

#generate merged dataset and assign column lables
measures_full <- rbind(measures_train, measures_test)
activities_full <- rbind(activities_train, activities_test)
subj_full <- rbind(subj_train, subj_test)

names(measures_full) <- measure_cnames[, 2]
ds_full <- cbind(measures_full, subj_full, activities_full)

#Extract only the measurements on the mean and standard deviation for each measurement.
ds_mean_std <- ds_full[, grep("mean|std|act_id|subj_id", names(ds_full))]

#Use descriptive activity names to name the activities in the data set
ds_mean_std <- merge(ds_mean_std, activiti_labs)

#remove redundant act_id column
ds_mean_std <- ds_mean_std[, -grep("act_id", names(ds_mean_std))]

#creates independent tidy data set with the average of each variable for each activity and each subject.
ds_avg <- melt(ds_mean_std, id = c("subj_id", "act_name"))
ds_avg <- dcast(ds_avg, subj_id + act_name ~ variable, mean)

write.csv(ds_avg, "tidy_ds.csv")