
# this is the programminig assignment 1 for the getting and cleaning data course
# get data from a file path is C:/Users/smatismi/OneDrive - Capgemini/Documents/Coursera/
features <- read.table("C:/Users/smatismi/OneDrive - Capgemini/Documents/Coursera/UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("C:/Users/smatismi/OneDrive - Capgemini/Documents/Coursera/UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("C:/Users/smatismi/OneDrive - Capgemini/Documents/Coursera/UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("C:/Users/smatismi/OneDrive - Capgemini/Documents/Coursera/UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("C:/Users/smatismi/OneDrive - Capgemini/Documents/Coursera/UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("C:/Users/smatismi/OneDrive - Capgemini/Documents/Coursera/UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("C:/Users/smatismi/OneDrive - Capgemini/Documents/Coursera/UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("C:/Users/smatismi/OneDrive - Capgemini/Documents/Coursera/UCI HAR Dataset/train/y_train.txt", col.names = "code")
#set path to test files
#mypath = "C:\Users\smatismi\OneDrive - Capgemini\Documents\Coursera\UCI HAR Dataset\test"
#setwd(mypath)


# Create list of text files from test and training data and combine them 
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
merge_data <- cbind(Subject, Y, X)


#Select columns that have mean values
# Select columns whose name maches a regular expression                                                                                  
tidydatafr <- merge_data %>% select(subject, code, contains("mean"), contains("std"))

tidydatafr$code <- activities[tidydatafr$code, 2]

names(tidydatafr)[2] = "activity"
names(tidydatafr)<-gsub("tBodyAcc", "TotalbodyAccelerometer", names(tidydatafr))
names(tidydatafr)<-gsub("tGravityAcc", "totalGravity", names(tidydatafr))
names(tidydatafr)<-gsub("tBodyAccJerk", "TimeBodyAccelertionJerk", names(tidydatafr))
names(tidydatafr)<-gsub("tBodyGyr", "totalbodyGyroscope", names(tidydatafr))
names(tidydatafr)<-gsub("tBodyGyroJerk", "TotalBodyGyroscopejerk", names(tidydatafr))
names(tidydatafr)<-gsub("tBodyAccMag", "totalbodyaccelertionMagnitude", names(tidydatafr))
names(tidydatafr)<-gsub("tGravityAccMag", "TotalGravityaccelerationmagnitutde", names(tidydatafr))
names(tidydatafr)<-gsub("tBodyAccJerkMag", "Totalbodyaccelerationjerkmagnitude", names(tidydatafr))
names(tidydatafr)<-gsub("tBodyGyroMag", "totalBodygyroscopemagnitude", names(tidydatafr))
names(tidydatafr)<-gsub("tBodyGyroJerkMag", "totalbodygyroscopejerkmagnitide", names(tidydatafr))
names(tidydatafr)<-gsub("fBodyAcc", "fullbodyAcceleration", names(tidydatafr))
names(tidydatafr)<-gsub("fBodyAccJerk", "fullbodyaccelerationjerk", names(tidydatafr))
names(tidydatafr)<-gsub("fBodyGyro", "fullbodygyroscope", names(tidydatafr))
names(tidydatafr)<-gsub("fBodyAccMag", "fullbodyAccelerationmagnitutude", names(tidydatafr))
names(tidydatafr)<-gsub("fBodyBodyAccJerkMag", "fullbodybodyAccelerationjerkmagnitutude", names(tidydatafr))
names(tidydatafr)<-gsub("fBodyBodyGyroMag", "fullbodybodygyroscopejerkmagnitutude", names(tidydatafr))
names(tidydatafr)<-gsub("mean()", "Mean", names(tidydatafr))
names(tidydatafr)<-gsub("-std()", "Standard Dev.", names(tidydatafr))
names(tidydatafr)<-gsub("-freq()", "Frequency", names(tidydatafr), ignore.case = TRUE)
names(tidydatafr)<-gsub("angle", "Angle", names(tidydatafr))
names(tidydatafr)<-gsub("gravity", "Gravity", names(tidydatafr))
                                                                                                
#  create a second, independent tidy data set with the average of each variable for each activity and each subject.                        
summarizedata <- tidydatafr %>%
group_by(subject, activity) %>%
summarise_all(funs(mean))
write.table(summarizedata, "summarizedata.txt", row.name=FALSE)