# Wearable_Computing
Coursera-HW-Getting and Cleaning Data

Human Activity Recognition Using Smartphones Dataset
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS,  WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist

Goal:

My goal is to create a second, independent tidy data set with the average of each variable for each activity and each subject from merged data set of the training and the test sets through the steps below. 

How:

I will merge all data sets and rename columns of them first, merge them, then extract only the measurements on the mean and standard deviation for each measurement to get a tidy data set.

Step1. Import files 

First of all, I need to import all 28 data sets in the folder, UCI HAR Dataset, I use read.table() function to import the datasets eg. read.table("~/Wearable_Computing/UCI HAR Dataset/features.txt", quote="\"", comment.char="")

Step2: Appropriately labels the data set with descriptive variable names.

   2.1 map the 561 features in “features” data set to columns of “X_train” and “X_test” data sets by using :
 colnames() function. Eg. colnames(X_train) <- features$V2
 
   2.2 rename the columns for 18 data sets of signals in folder, “Inertial Signals”.
In order to make the columns distinguishable, I rename them by the abbreviation of the file name, such as “bax” for “body_acc_x_test”, “bgy” for “body_gyro_y_test”, … and so forth. Then  I use :
add_column() function from “tibble” Package  and 
paste0() function from “stringer” Package. 
Eq.  colnames(body_acc_x_train) <- paste0("bax_V",c(1:128))

2.3 rename columns to "subject_train",  "subject_test" and "activity_labels"
Eg. names(subject_train)[1] <- "subj_no."

Step.3.

Uses descriptive activity names to name the activities in the data set
First of all I convert the class of column “activity_labels” in data sets, “y_train” and “y_test” to factor by function: 
as.factor(), Eg. y_train$activity_labels<-as.factor(y_train$activity_labels), 
then assign the names of level to it. 
Eg. levels(y_train$"activity_labels") <- c("WALKING", "WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")

Step.4

adding a new column to all files with column name “Seq” with value of 1:7352 for train data sets and 7353:10299 for test data set by 
function add_column(). then:
y_train<-add_column(y_train, Seq = 1:7352, .before = "activity_labels")
This is for merging purpose later on.

Step.5

merging the training and the test sets to create one data set. 

5.1 merge all "train" data sets then "test" data sets, both by using
 join_all() function in “plyr” pacage . Eg. 
library(plyr)
dfs <- list(subject_train,   y_train,  X_train,  body_acc_x_train,   body_acc_y_train,  body_acc_z_train,  body_gyro_x_train,  body_gyro_y_train,  body_gyro_z_train,  total_acc_x_train,  total_acc_y_train,  total_acc_z_train)
merged_train<-join_all(dfs,"Seq")

5.2 vertically merge merged "train" data set and merged "test" data sets into one by
rbind() function

merged_train_test<-rbind(merged_train, merged_test)

Step.6

Extracts only the measurements on the mean and standard deviation for each measurement.
By using select() function in dplyr package to select the rows of correspondent columns containing "mean","std". Eq. 
library("dplyr")
mean_and_std<-select(merged_train_test, contains(c("seq","sudj","activity","mean","std")))

Step.7

From the data set in step 6, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
By using summarise_all(mean) function to group and get the mean of the column. Eq. 
Final_Tidy_Dataset <- mean_and_std %>% group_by(subj_no., activity_labels) %>% summarise_all(mean)
