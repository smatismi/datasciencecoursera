# datasciencecoursera
readme file for programing assignment for getting and cleaning data
includes code book AKA data dictionary
Data Source http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Project data https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Description of data set from web page 
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Data files at "C:\Users\smatismi\OneDrive - Capgemini\Documents\Coursera\UCI HAR Dataset\test"
Test set folder with Inertial signals folder, subject_test.txt, X_test.txt, y_test.txt
Training set folder with Inertial signals folder, subject_train.txt, X_train.txt, y_train.txt
activity_labels.txt
features.txt
features_info.txt
README.txt

Assigment details
check file dimentions and details using dim(filename) or str(filename)
identify mean and std values features.txt
create single file by merging test and training sets using rbind() with descriptive labels as column names
