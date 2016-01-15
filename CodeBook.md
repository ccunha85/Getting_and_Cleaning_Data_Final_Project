# CodeBook

This codebook describes the variables, the data, and all the transformations executed to produce a tidy data set.

## Source of data

* Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
* Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


## Data Background - 
###from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## The data

The dataset includes the following files:

1. 'README.txt'

2. 'features_info.txt': Features vector information

3. 'features.txt': List of all features collected in the experiment.

4. 'activity_labels.txt': Labels and the activity name.

5. 'train/X_train.txt': Training data set.

6. 'train/y_train.txt': Training data labels.

7. 'test/X_test.txt': Test data set.

7. 'test/y_test.txt': Test data labels.

The following files are available for the train and test data. Their descriptions are equivalent.

- 'train/subject_train.txt': Including 30 subjects, each row represents an individual who was measured.

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.


## Transformation of data sequence

1. Load all relevant files in relation to the test set
2. Extracts the relevant variables only related to mean and standard deviation
3. Rename variables to be descriptive
4. Create a new test data table with the relevant variables in a tidy format
5. Repeat steps 1 to 4 for the training set
6. Merges the training and the test sets to create one data set.
7. Rename the activities with descriptive names and labels the new merged data set
8. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## How ```run_analysis.R``` implements the above steps:

* Download files from the relevant link and unzip.
* Load both test and train data
* Load reshape2 library
* Load the features and activity labels.
* Extract the mean and standard deviation column names and data.
* Process the data. There are two parts processing test and train data respectively.
* Merge data set.
* Create new table with the average of each variable for each activity and each subject
