Geeting and Cleaning Data Course Project
========================================

Human Activity Recognition Using Smartphones Data Set
-----------------------------------------------------

The data set contains information about a experiment to detect the
human activity using a smartphone's accelerometer and gyroscope. This
data was donated to the UCI's Machine Learning Repository on
12/10/2012.

See [`CodeBook.md`](CodeBook.md) for more information on how the raw data was
transformed to a tidy data and the variables information.

### Running the script

To run the script in `run_analysis.R`, you should have downloaded the data set
from [this link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
and unpacked it in the same folder where the script is. When unpacking, make
sure that a folder named `UCI HAR Dataset` is created, where the data set
files reside.

You will have the following folder structure:

    |-- CodeBook.md
    |-- README.md
    |-- run_analysis.R
    |-- UCI HAR Dataset
    |   |-- activity_labels.txt
    |   |-- features.txt
    |   |-- features_info.txt
    |   |-- README.txt
    |   |-- test
    |   |   |-- Inertial Signals
    |   |   |   |-- body_acc_x_test.txt
    |   |   |   |-- body_acc_y_test.txt
    |   |   |   |-- body_acc_z_test.txt
    |   |   |   |-- body_gyro_x_test.txt
    |   |   |   |-- body_gyro_y_test.txt
    |   |   |   |-- body_gyro_z_test.txt
    |   |   |   |-- total_acc_x_test.txt
    |   |   |   |-- total_acc_y_test.txt
    |   |   |   |-- total_acc_z_test.txt
    |   |   |-- subject_test.txt
    |   |   |-- X_test.txt
    |   |   |-- y_test.txt
    |   |-- train
    |   |   |-- Inertial Signals
    |   |   |   |-- body_acc_x_train.txt
    |   |   |   |-- body_acc_y_train.txt
    |   |   |   |-- body_acc_z_train.txt
    |   |   |   |-- body_gyro_x_train.txt
    |   |   |   |-- body_gyro_y_train.txt
    |   |   |   |-- body_gyro_z_train.txt
    |   |   |   |-- total_acc_x_train.txt
    |   |   |   |-- total_acc_y_train.txt
    |   |   |   |-- total_acc_z_train.txt
    |   |   |-- subject_train.txt
    |   |   |-- X_train.txt
    |   |   |-- y_train.txt 

### Tidy Data preparation

The script will read and process the files below (the *raw data*):

    |-- UCI HAR Dataset
    |   |-- activity_labels.txt
    |   |-- features.txt
    |   |-- test
    |   |   |-- subject_test.txt
    |   |   |-- X_test.txt
    |   |   |-- y_test.txt
    |   |-- train
    |   |   |-- subject_train.txt
    |   |   |-- X_train.txt
    |   |   |-- y_train.txt  

The files under `Inertial Signals` are ignored, as they are raw data
read from the sensors, and the remaining files, those that are
processed, contains the information for the analysis, already
filtered and pre-processed by the researchers. Those pre-processed
files are the *raw data* for the script.

These *raw data* must not be processed in any way before running the
script. 