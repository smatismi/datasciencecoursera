# this is the programminig assignment 1 for the getting and cleaning data course
# get data from a file
 df <- read.table(""C:\Users\smatismi\OneDrive - Capgemini\Documents\Coursera\UCI HAR Dataset\features.txt", header = TRUE)
   
#set path to test files
mypath = "C:\Users\smatismi\OneDrive - Capgemini\Documents\Coursera\UCI HAR Dataset\test"
setwd(mypath)
# Create list of text files
txt_files_ls = list.files(path=mypath, pattern="*.test.txt") 
# Read the files in, assuming comma separator
test_files_df <- lapply(test_files_ls, function(x) {read.table(file = x, header = T, sep =",")})
# Combine them
combined_df <- do.call("rbind", lapply(test_files_df, as.data.frame)) 

#set path to training files
mypath = "C:\Users\smatismi\OneDrive - Capgemini\Documents\Coursera\UCI HAR Dataset\train"
setwd(mypath)
# Create list of text files
txt_files_ls = list.files(path=mypath, pattern="*.train.txt") 
# Read the files in, assuming comma separator
train_files_df <- lapply(test_files_ls, function(x) {read.table(file = x, header = T, sep =",")})
# Combine them
combined_df <- do.call("rbind", lapply(train_files_df, as.data.frame)) 
str(df)

#Select columns that have mean values
# Select columns whose name maches a regular expression
my_datacolumns %>% select(contains("mean")
my_datacolumns %>% select(contains("std")



dfextract<- df[, c("name1", "name2", "name3")]
