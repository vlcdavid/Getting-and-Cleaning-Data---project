## Create R Script called run_analysis.R that contains the following points:
## Beginning the code:
if(!require("data.table")){
  install.packages("data.table")
}
if(!require("reshape2")){
  install.packages("reshape2")
}
require("data.table")
require("reshape2")

## 3. First, READ all required .txt files and label the datasets and use descriptive activity names to name the activities in the data set
  
  ## ... all activities and their names and label the aproppriate columns 
  activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt",col.names=c("activity_id","activity_name"))
  
  ## ... the dataframe column names
  features <- read.table("./UCI HAR Dataset/features.txt")
  feature_names <-  features[,2]
  
  ## ... the test data and label the dataframe columns
  testdata <- read.table("./UCI HAR Dataset/test/X_test.txt")
  colnames(testdata) <- feature_names
  
  ## ... the training data and label the dataframe columns
  traindata <- read.table("./UCI HAR Dataset/train/X_train.txt")
  colnames(traindata) <- feature_names
  
  ## ... the id of the test subjects and label the the dataframe columns
  test_subject_id <- read.table("./UCI HAR Dataset/test/subject_test.txt")
  colnames(test_subject_id) <- "subject_id"
  
  ## ... the activity id of the test data and label the the dataframe columns
  test_activity_id <- read.table("./UCI HAR Dataset/test/y_test.txt")
  colnames(test_activity_id) <- "activity_id"
  
  ## ... the id of the test subjects and label the the dataframe columns
  train_subject_id <- read.table("./UCI HAR Dataset/train/subject_train.txt")
  colnames(train_subject_id) <- "subject_id"
  
  ## ... the activity id of the training data and label the dataframe columns
  train_activity_id <- read.table("./UCI HAR Dataset/train/y_train.txt")
  colnames(train_activity_id) <- "activity_id"
  
## Combine the test subject id, the test activity id and the test data into one dataframe
  test_data <- cbind(test_subject_id , test_activity_id , testdata)
  
  ## ... the test subject id, the test activity id and the test data into one dataframe
  train_data <- cbind(train_subject_id , train_activity_id , traindata)
  
  ## ... the test data and the train data into one dataframe
  all_data <- rbind(train_data,test_data)
  
## 2. and 4. Keep only columns refering to mean() or std() values
  mean_col_idx <- grep("mean",names(all_data),ignore.case=TRUE)
  mean_col_names <- names(all_data)[mean_col_idx]
  std_col_idx <- grep("std",names(all_data),ignore.case=TRUE)
  std_col_names <- names(all_data)[std_col_idx]
  meanstddata <-all_data[,c("subject_id","activity_id",mean_col_names,std_col_names)]
  
## 1. MERGE the activities datase with the mean/std values datase to get one dataset with descriptive activity names
  descrnames <- merge(activity_labels,meanstddata,by.x="activity_id",by.y="activity_id",all=TRUE)
  
  ##Melt the dataset with the descriptive activity names for better handling
  data_melt <- melt(descrnames,id=c("activity_id","activity_name","subject_id"))
  
  ##Cast the melted dataset according to  the average of each variable 
  ##for each activity and each subject
  mean_data <- dcast(data_melt,activity_id + activity_name + subject_id ~ variable,mean)
  
## 5. Create a file with the new tidy dataset
  write.table(mean_data,"./UCI HAR Dataset/tidy_movement_data.txt")
  

