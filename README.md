# Getting-and-Cleaning-Data---project
Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. Project of Coursera "Getting and Cleaning Data"

#The original dataset (.zip) included the following data files:
'features.txt': List of all features.

'activity_labels.txt': List of class labels and their activity name.

'train/X_train.txt': Training set.

'train/y_train.txt': Training labels.

'train/subject_train.txt': ID of subjects in the training data

'test/X_test.txt': Test set

'test/y_test.txt': Test labels

'test/subject_test.txt': ID of subjects in the training data

# About the Script:
The run-analysis.R script merges data from a number of .txt files and produces a tidy data set.

The first step consist of checking to see if the required "reshape2" has been installed and then loads the "reshape2" package.
Then reads all required .txt files and labels the datasets.

Later, the appropriate "activity_id" and "subject_id" are appended to the "test" and the "training" dataset, which are then combined into one unique data frame.

Using the "grep" function, all the columns with mean() and std() values are extracted and then a new data frame, including only the "activity_id", the "subject_id" and the mean() and std() columns, is created as the Exercise asked.

Using the "merge" function, descriptive activity names are merged with the mean & std values dataset, to get one dataset with descriptive activity names.

Finally with the help of the "melt" and "dcast" functions of the "reshape2" package, the data is converted into a table containing mean values of all the included features, ordered by the activity name and the subject id, and the data is written to the "tidy_movement_data.txt" file.

A description of the "tidy_movement_data.txt" file may be found in the "CodeBook.md" file.

