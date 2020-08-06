
#import all data sets :

##data set "features"
features <- read.table("~/Wearable_Computing/UCI HAR Dataset/features.txt", quote="\"", comment.char="")

##data set "activity_labels"
activity_labels <- read.table("~/Wearable_Computing/UCI HAR Dataset/activity_labels.txt", quote="\"", comment.char="")

## import "training" data sets :

### data set "subject_train"
subject_train <- read.table("~/Wearable_Computing/UCI HAR Dataset/train/subject_train.txt", quote="\"", comment.char="")

### data set "X_train"
X_train <- read.table("~/Wearable_Computing/UCI HAR Dataset/train/X_train.txt", quote="\"", comment.char="")

###data set "y_train"
y_train <- read.table("~/Wearable_Computing/UCI HAR Dataset/train/y_train.txt", quote="\"", comment.char="")

###data set "body_acc_x_train"
body_acc_x_train <- read.table("~/Wearable_Computing/UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt", quote="\"", comment.char="")

###data set "body_acc_y_train"
body_acc_y_train <- read.table("~/Wearable_Computing/UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt", quote="\"", comment.char="")
 
###data set "body_acc_z_train"
body_acc_z_train <- read.table("~/Wearable_Computing/UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt", quote="\"", comment.char="")

###data set "body_gyro_x_train"
body_gyro_x_train <- read.table("~/Wearable_Computing/UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt", quote="\"", comment.char="")

###data set "body_gyro_y_train"
body_gyro_y_train <- read.table("~/Wearable_Computing/UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt", quote="\"", comment.char="")
 
###data set "body_gyro_z_train"
body_gyro_z_train <- read.table("~/Wearable_Computing/UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt", quote="\"", comment.char="")

###data set "total_acc_x_train"
total_acc_x_train <- read.table("~/Wearable_Computing/UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt", quote="\"", comment.char="")

###data set "total_acc_y_train"
total_acc_y_train <- read.table("~/Wearable_Computing/UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt", quote="\"", comment.char="")
 
###data set "total_acc_z_train"
total_acc_z_train <- read.table("~/Wearable_Computing/UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt", quote="\"", comment.char="")


## import "test" data sets :

### data set "subject_test"
subject_test <- read.table("~/Wearable_Computing/UCI HAR Dataset/test/subject_test.txt", quote="\"", comment.char="")

### data set "X_test"
X_test <- read.table("~/Wearable_Computing/UCI HAR Dataset/test/X_test.txt", quote="\"", comment.char="")

###data set "y_test"
y_test <- read.table("~/Wearable_Computing/UCI HAR Dataset/test/y_test.txt", quote="\"", comment.char="")

###data set "body_acc_x_test"
body_acc_x_test <- read.table("~/Wearable_Computing/UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt", quote="\"", comment.char="")

###data set "body_acc_y_test"

###data set "body_acc_z_test"
body_acc_z_test <- read.table("~/Wearable_Computing/UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt", quote="\"", comment.char="")

###data set "body_gyro_x_test"
body_gyro_x_test <- read.table("~/Wearable_Computing/UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt", quote="\"", comment.char="")

###data set "body_gyro_y_test"
body_gyro_y_test <- read.table("~/Wearable_Computing/UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt", quote="\"", comment.char="")

###data set "body_gyro_z_test"
body_gyro_z_test <- read.table("~/Wearable_Computing/UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt", quote="\"", comment.char="")

###data set "total_acc_x_test"
total_acc_x_test <- read.table("~/Wearable_Computing/UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt", quote="\"", comment.char="")

###data set "total_acc_y_test"
total_acc_y_test <- read.table("~/Wearable_Computing/UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt", quote="\"", comment.char="")

###data set "total_acc_z_test"
total_acc_z_test <- read.table("~/Wearable_Computing/UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt", quote="\"", comment.char="")


#apply "features" to and add new a column to "X_train" and "X_test" column names:

colnames(X_train) <- features$V2
names(X_train)
library(tibble)
X_train<-add_column(X_train, Seq = 1:7352, .before = 1, .name_repair = "minimal")

colnames(X_test) <- features$V2
names(X_test)
X_test<-add_column(X_test, Seq = 7353:10299, .before = 1, .name_repair = "minimal")

# rename columns of and add new a column to "subject_train" and "subject_test" 
## train
names(subject_train)[1] <- "subj_no."
subject_train<-add_column(subject_train, Seq = 1:7352, .before = 1)
## test
names(subject_test)[1] <- "subj_no."
subject_test<-add_column(subject_test, Seq = 7353:10299, .before = 1)

# work on "y_train" and "y_test" 

##1 change the column name 
names(y_train)[1] <- "activity_labels"
names(y_test)[1] <- "activity_labels"
##2 add new column "Seq"
y_train<-add_column(y_train, Seq = 1:7352, .before = "activity_labels")
y_test<-add_column(y_test, Seq = 7353:10299, .before = "activity_labels")
##3 map column values to "activity_labels"
y_train$activity_labels<-as.factor(y_train$activity_labels)
levels(y_train$"activity_labels") <- c("WALKING", "WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")
y_test$activity_labels<-as.factor(y_test$activity_labels)
levels(y_test$"activity_labels") <- c("WALKING", "WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")

# rename the columns of and add new column "Seq" to data sets body/total_acc/gyro_x/y/z_train/test 
library(stringr)
## train
colnames(body_acc_x_train) <- paste0("bax_V",c(1:128))
body_acc_x_train<-add_column(body_acc_x_train, Seq = 1:7352, .before = "bax_V1")
colnames(body_acc_y_train) <- paste0("bay_V",c(1:128))
body_acc_y_train<-add_column(body_acc_y_train, Seq = 1:7352, .before = "bay_V1")
colnames(body_acc_z_train) <- paste0("baz_V",c(1:128))
body_acc_z_train<-add_column(body_acc_z_train, Seq = 1:7352, .before = "baz_V1")
colnames(body_gyro_x_train) <- paste0("bgx_V",c(1:128))
body_gyro_x_train<-add_column(body_gyro_x_train, Seq = 1:7352, .before = "bgx_V1")
colnames(body_gyro_y_train) <- paste0("bgy_V",c(1:128))
body_gyro_y_train<-add_column(body_gyro_y_train, Seq = 1:7352, .before = "bgy_V1")
colnames(body_gyro_z_train) <- paste0("bgz_V",c(1:128))
body_gyro_z_train<-add_column(body_gyro_z_train, Seq = 1:7352, .before = "bgz_V1")
colnames(total_acc_x_train) <- paste0("tax_V",c(1:128))
total_acc_x_train<-add_column(total_acc_x_train, Seq = 1:7352, .before = "tax_V1")
colnames(total_acc_y_train) <- paste0("tay_V",c(1:128))
total_acc_y_train<-add_column(total_acc_y_train, Seq = 1:7352, .before = "tay_V1")
colnames(total_acc_z_train) <- paste0("taz_V",c(1:128))
total_acc_z_train<-add_column(total_acc_z_train, Seq = 1:7352, .before = "taz_V1")
##test
colnames(body_acc_x_test) <- paste0("bax_V",c(1:128))
body_acc_x_test<-add_column(body_acc_x_test, Seq = 7353:10299, .before = "bax_V1")
colnames(body_acc_y_test) <- paste0("bay_V",c(1:128))
body_acc_y_test<-add_column(body_acc_y_test, Seq = 7353:10299, .before = "bay_V1")
colnames(body_acc_z_test) <- paste0("baz_V",c(1:128))
body_acc_z_test<-add_column(body_acc_z_test, Seq = 7353:10299, .before = "baz_V1")
colnames(body_gyro_x_test) <- paste0("bgx_V",c(1:128))
body_gyro_x_test<-add_column(body_gyro_x_test, Seq = 7353:10299, .before = "bgx_V1")
colnames(body_gyro_y_test) <- paste0("bgy_V",c(1:128))
body_gyro_y_test<-add_column(body_gyro_y_test, Seq = 7353:10299, .before = "bgy_V1")
colnames(body_gyro_z_test) <- paste0("bgz_V",c(1:128))
body_gyro_z_test<-add_column(body_gyro_z_test, Seq = 7353:10299, .before = "bgz_V1")
colnames(total_acc_x_test) <- paste0("tax_V",c(1:128))
total_acc_x_test<-add_column(total_acc_x_test, Seq = 7353:10299, .before = "tax_V1")
colnames(total_acc_y_test) <- paste0("tay_V",c(1:128))
total_acc_y_test<-add_column(total_acc_y_test, Seq = 7353:10299, .before = "tay_V1")
colnames(total_acc_z_test) <- paste0("taz_V",c(1:128))
total_acc_z_test<-add_column(total_acc_z_test, Seq = 7353:10299, .before = "taz_V1")

# merge all "train" data sets
library(plyr)
dfs <- list(
  subject_train,
  y_train,
  X_train,
  body_acc_x_train,
  body_acc_y_train,
  body_acc_z_train,
  body_gyro_x_train,
  body_gyro_y_train,
  body_gyro_z_train,
  total_acc_x_train,
  total_acc_y_train,
  total_acc_z_train
)
merged_train<-join_all(dfs,"Seq")


# merge all "test" data sets
dfs <- list(
  subject_test,
  y_test,
  X_test,
  body_acc_x_test,
  body_acc_y_test,
  body_acc_z_test,
  body_gyro_x_test,
  body_gyro_y_test,
  body_gyro_z_test,
  total_acc_x_test,
  total_acc_y_test,
  total_acc_z_test
)
merged_test<-join_all(dfs,"Seq")

# merge data sets "merged_train" and "merged_test" 
## Add data sets vertically
merged_train_test<-rbind(merged_train, merged_test)


#Extracts only the measurements on the mean and standard deviation for each measurement.
library("dplyr")
mean_and_std<-select(merged_train_test, contains(c("seq","subj","activity","mean","std")))


#creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Final_Tidy_Dataset <- mean_and_std %>% group_by(subj_no., activity_labels) %>% summarise_all(mean)

## cover it to a txt file for submission
write.table(Final_Tidy_Dataset, file="~/Wearable_Computing/Final_Tidy_Dataset.txt",row.name=FALSE) 


