#download files
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(url,destfile = "dataset.zip")

#after unpacking the downloaded file, removing spaces from dir names (just in case), set-up the R side for reading the data
testRootLink<-"C:\\Users\\kbp\\GettingandCleaningData\\UCI_HAR_Dataset\\test"
trainRootLink<-"C:\\Users\\kbp\\GettingandCleaningData\\UCI_HAR_Dataset\\train"
testSignalsLink<-"C:\\Users\\kbp\\GettingandCleaningData\\UCI_HAR_Dataset\\test\\Inertial_Signals"
trainSignalsLink<-"C:\\Users\\kbp\\GettingandCleaningData\\UCI_HAR_Dataset\\train\\Inertial_Signals"
rootLink<-"C:\\Users\\kbp\\GettingandCleaningData\\UCI_HAR_Dataset"

## read raw features subset 
#
setwd(rootLink)
activity_labels_orig<-readLines("activity_labels.txt")
features_orig<-readLines("features.txt")
## read raw test subset
#
setwd(testRootLink)
test_set_orig<-readLines("X_test.txt")
test_labels_orig<-readLines("y_test.txt")
subject_test_orig<-readLines("subject_test.txt")
#
setwd(testSignalsLink)
body_acc_x_test_orig<-readLines("body_acc_x_test.txt")
body_acc_y_test_orig<-readLines("body_acc_y_test.txt")
body_acc_z_test_orig<-readLines("body_acc_z_test.txt")
body_gyro_x_test_orig<-readLines("body_gyro_x_test.txt")
body_gyro_y_test_orig<-readLines("body_gyro_y_test.txt")
body_gyro_z_test_orig<-readLines("body_gyro_z_test.txt")
total_acc_x_test_orig<-readLines("total_acc_x_test.txt")
total_acc_y_test_orig<-readLines("total_acc_y_test.txt")
total_acc_z_test_orig<-readLines("total_acc_z_test.txt")
## read raw train subset
#
setwd(trainRootLink)
train_set_orig<-readLines("X_train.txt")
train_labels_orig<-readLines("y_train.txt")
subject_train_orig<-readLines("subject_train.txt")
#
setwd(trainSignalsLink)
body_acc_x_train_orig<-readLines("body_acc_x_train.txt")
body_acc_y_train_orig<-readLines("body_acc_y_train.txt")
body_acc_z_train_orig<-readLines("body_acc_z_train.txt")
body_gyro_x_train_orig<-readLines("body_gyro_x_train.txt")
body_gyro_y_train_orig<-readLines("body_gyro_y_train.txt")
body_gyro_z_train_orig<-readLines("body_gyro_z_train.txt")
total_acc_x_train_orig<-readLines("total_acc_x_train.txt")
total_acc_y_train_orig<-readLines("total_acc_y_train.txt")
total_acc_z_train_orig<-readLines("total_acc_z_train.txt")


#process the files to get proper format (128/561 element vectors for each record in the file)
my_processing<-function(x)
  {
  y<-strsplit(x," ")                        # to split the string representing one record from the file whenever space is encountered
  my_func<-function(z){z2<-z[!nchar(z)==0]} # this function will allow to get rid of empty substrings for each row of the dataset
  y<-sapply(y,my_func)                      # this converts data into matrix 128x2947 or (561x2947)
  y<-t(y)                                   # this transposes so that each record is a row and not a column
  var_name<-deparse(substitute(x))
  setNames(x, paste(var_name,".",names(x)))
  y
}

convert_num<-function(x)
{
  mode(x)<-"numeric"
  x
}

# features subset
activity_labels<-my_processing(activity_labels_orig)
features<-my_processing(features_orig)

# test subset
body_acc_x_test<-my_processing(body_acc_x_test_orig)
body_acc_x_test<-convert_num(body_acc_x_test)
body_acc_y_test<-my_processing(body_acc_y_test_orig)
body_acc_y_test<-convert_num(body_acc_y_test)
body_acc_z_test<-my_processing(body_acc_z_test_orig)
body_acc_z_test<-convert_num(body_acc_z_test)
body_gyro_x_test<-my_processing(body_gyro_x_test_orig)
body_gyro_x_test<-convert_num(body_gyro_x_test)
body_gyro_y_test<-my_processing(body_gyro_y_test_orig)
body_gyro_y_test<-convert_num(body_gyro_y_test)
body_gyro_z_test<-my_processing(body_gyro_z_test_orig)
body_gyro_z_test<-convert_num(body_gyro_z_test)
total_acc_x_test<-my_processing(total_acc_x_test_orig)
total_acc_x_test<-convert_num(total_acc_x_test)
total_acc_y_test<-my_processing(total_acc_y_test_orig)
total_acc_y_test<-convert_num(total_acc_y_test)
total_acc_z_test<-my_processing(total_acc_z_test_orig)
total_acc_z_test<-convert_num(total_acc_z_test)
test_set<-my_processing(test_set_orig)
test_set<-convert_num(test_set)
test_labels<-my_processing(test_labels_orig)
test_labels<-convert_num(test_labels)
subject_test<-my_processing(subject_test_orig)
subject_test<-convert_num(subject_test)

# train subset
body_acc_x_train<-my_processing(body_acc_x_train_orig)
body_acc_x_train<-convert_num(body_acc_x_train)
body_acc_y_train<-my_processing(body_acc_y_train_orig)
body_acc_y_train<-convert_num(body_acc_y_train)
body_acc_z_train<-my_processing(body_acc_z_train_orig)
body_acc_z_train<-convert_num(body_acc_z_train)
body_gyro_x_train<-my_processing(body_gyro_x_train_orig)
body_gyro_x_train<-convert_num(body_gyro_x_train)
body_gyro_y_train<-my_processing(body_gyro_y_train_orig)
body_gyro_y_train<-convert_num(body_gyro_y_train)
body_gyro_z_train<-my_processing(body_gyro_z_train_orig)
body_gyro_z_train<-convert_num(body_gyro_z_train)
total_acc_x_train<-my_processing(total_acc_x_train_orig)
total_acc_x_train<-convert_num(total_acc_x_train)
total_acc_y_train<-my_processing(total_acc_y_train_orig)
total_acc_y_train<-convert_num(total_acc_y_train)
total_acc_z_train<-my_processing(total_acc_z_train_orig)
total_acc_z_train<-convert_num(total_acc_z_train)
train_set<-my_processing(train_set_orig)
train_set<-convert_num(train_set)
train_labels<-my_processing(train_labels_orig)
train_labels<-convert_num(train_labels)
subject_train<-my_processing(subject_train_orig)
subject_train<-convert_num(subject_train)


# merge test and train data and store in data frames

body_acc_x<-bind_rows(as.data.frame(body_acc_x_test),as.data.frame(body_acc_x_train))
body_acc_y<-bind_rows(as.data.frame(body_acc_y_test),as.data.frame(body_acc_y_train))
body_acc_z<-bind_rows(as.data.frame(body_acc_z_test),as.data.frame(body_acc_z_train))
body_gyro_x<-bind_rows(as.data.frame(body_gyro_x_test),as.data.frame(body_gyro_x_train))
body_gyro_y<-bind_rows(as.data.frame(body_gyro_y_test),as.data.frame(body_gyro_y_train))
body_gyro_z<-bind_rows(as.data.frame(body_gyro_z_test),as.data.frame(body_gyro_z_train))
total_acc_x<-bind_rows(as.data.frame(total_acc_x_test),as.data.frame(total_acc_x_train))
total_acc_y<-bind_rows(as.data.frame(total_acc_y_test),as.data.frame(total_acc_y_train))
total_acc_z<-bind_rows(as.data.frame(total_acc_z_test),as.data.frame(total_acc_z_train))
data_set<-bind_rows(as.data.frame(test_set),as.data.frame(train_set))
data_labels<-c(test_labels,train_labels)
data_labels<-data.frame(data_labels)
subject_data<-c(subject_test,subject_train)
subject_data<-data.frame(subject_data)
activity_labels<-as.data.frame(activity_labels,stringsAsFactors=FALSE)
activity_labels$V1<-as.numeric(activity_labels$V1)
features<-as.data.frame(features,stringsAsFactors=FALSE)
features$V1<-as.numeric(features$V1)

#use descriptive activity names to name activities in dataset
temp<-match(data_labels$data_labels,activity_labels$V1)
temp2<-activity_labels[temp,2]
temp2<-as.data.frame(temp2, stringsAsFactors=FALSE)
data_labels<-temp2
names(data_labels)<-"data_labels"

#label data set with descriptive variable names
names(activity_labels)<-c("id","label")
names(features)<-c("id","label")
names(data_set) <- make.names(names=features$label, unique=TRUE, allow_ = TRUE)
total_acc_x<-setNames(total_acc_x, paste(deparse(substitute(total_acc_x)),".",names(total_acc_x),sep=""))
total_acc_y<-setNames(total_acc_y, paste(deparse(substitute(total_acc_y)),".",names(total_acc_y),sep=""))
total_acc_z<-setNames(total_acc_z, paste(deparse(substitute(total_acc_z)),".",names(total_acc_z),sep=""))
body_acc_x<-setNames(body_acc_x, paste(deparse(substitute(body_acc_x)),".",names(body_acc_x),sep=""))
body_acc_y<-setNames(body_acc_y, paste(deparse(substitute(body_acc_y)),".",names(body_acc_y),sep=""))
body_acc_z<-setNames(body_acc_z, paste(deparse(substitute(body_acc_z)),".",names(body_acc_z),sep=""))
body_gyro_x<-setNames(body_gyro_x, paste(deparse(substitute(body_gyro_x)),".",names(body_gyro_x),sep=""))
body_gyro_y<-setNames(body_gyro_y, paste(deparse(substitute(body_gyro_y)),".",names(body_gyro_y),sep=""))
body_gyro_z<-setNames(body_gyro_z, paste(deparse(substitute(body_gyro_z)),".",names(body_gyro_z),sep=""))


# extract only the measurements on the mean and standard deviation for each measurement
var_list<-grep("mean\\.|std\\.",names(data_set),value = TRUE)
var_list_ind<-grep("mean\\.|std\\.",names(data_set))
new_data_set<-select(data_set, one_of(var_list))
names(new_data_set)<-features[var_list_ind,2]

# create tidy data set
tidy_data_set<-bind_cols(total_acc_x,total_acc_y,total_acc_z,body_acc_x, body_acc_y, body_acc_z, body_gyro_x, body_gyro_y, body_gyro_z, new_data_set, data_labels, subject_data)

#create second tidy data set with the average of each variable for each activity and each subject
gpby_activ_subj<-group_by(tidy_data_set,data_labels, subject_data)
tidy_data_set_grouped<-summarize_each(gpby_activ_subj, funs=funs(Mean="mean"), vars=c(-data_labels,-subject_data))

#clean up to leave only tidy data sets
rm(list=setdiff(ls(), c("tidy_data_set","tidy_data_set_grouped")))
