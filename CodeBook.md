Geeting and Cleaning Data Course Project
========================================

The raw data
------------

The raw data are in the files below:

    UCI HAR Dataset/activity_labels.txt
    UCI HAR Dataset/features.txt
    UCI HAR Dataset/test/subject_test.txt
    UCI HAR Dataset/test/X_test.txt
    UCI HAR Dataset/test/y_test.txt
    UCI HAR Dataset/train/subject_train.txt
    UCI HAR Dataset/train/X_train.txt
    UCI HAR Dataset/train/y_train.txt
    
These files must not be processed in any way before running the
script.

* *`activity_labels.txt`*

  Contains the labels for each activity that a subject might have made.

  The first column is the activity code and the second column is the
  activity label.

* *`features.txt`*

  Contains the variables names for the data in `test/X_test` and
  `train/X_train`.

  The first column is the corresponding column number in the sensors'
  data set and the second column is the variable name.

* *`test/subject_test.txt` and `train/subject_train.txt`*

  Contains the subject code for each observation.

* *`test/y_test.txt` and `train/y_train.txt`*

  Contains the activity code that the subject was doing in that 
  observation. The activity label can be recovered from the file
  `activity_labels.txt`.

* *`test/X_test.txt` and `train/X_train.txt`*

  Contains the sensors' observations for each subject and activity.
  Each line is a record, with the corresponding line in, respectively,
  `test/subject_test.txt` and `train/subject_train.txt`, corresponding
  to the subject code, and each line in, respectively,
  `test/y_test.txt` and `train/y_train.txt`, corresponding to the
  activity code that the subject was doing.


Transformation to the tidy data
-------------------------------

The script will do the following steps to create the tidy data:

1. All activities are read from `activity_labels.txt` as a activity
   table, with the activity id (variable _activity_id_) as the key;
2. The variable names (features) are read from `features.txt` as a
   features table;
3. The train set is read from `train/X_train.txt` and the variable
   names are defined with a list extracted from the second column
   of the features table. All data from the set are read as
   _numeric_;
4. The subjects from each observation are read from 
   `train/subject_train.txt` and are added to the train table
   as a new variable called _subject_;
5. The activities are read from `train/y_train.txt` and are added to
   the train table as new variable called _activity_id_;
6. The activities labels, corresponding to each _activity_id_, are
   merged with the train table using the _activity_id_ variable, that
   exists in the activity table and in the train table, as the
   merging variable;
7. The steps from 3 to 6 are repeated for the _test_ set;
8. Both tables, the _train_ and the _test_, are merged in one table;
9. The observation table is filtered to keep only the variables listed
   in the _variables description_ below, that contains only the mean
   and standard deviation values, except for the _angle_ values;
10. The average of each variable, grouped by the subject and
    activity, are calculated and saved in a file called 
    `averages.txt`, without the row names. The variables are
    separated by space in this file.

Code book
---------

The values are in decimal and represent the accelerometer and
gyroscope 3-axial signals.

A 'g' is equal to 9.80665 m/seg2 (gravity of earth).

* *subject*

  The subject identification code. There are 30 subjects numbered
  from 1 to 30.  

* *activity*
  
  The activity label, than can be one of the self explanatory labels
  below:
  
  * WALKING
  * WALKING_UPSTAIRS
  * WALKING_DOWNSTAIRS
  * SITTING
  * STANDING
  * LAYING
  
* *[t|f]BodyAcc.mean...[X|Y|Z]*

  The mean value of the 3-axial (X, Y and Z) body acceleration signal
  in [t]ime and [f]requency domains.
  
  Unit: g
  
* *[t|f]BodyAcc.std...[X|Y|Z]*

  The standard deviation value of the 3-axial (X, Y and Z) body
  acceleration signal in [t]ime and [f]requency domains.

  Unit: g
  
* *tGravityAcc.mean...[X|Y|Z]*

  The mean value of the 3-axial (X, Y and Z) gravity acceleration 
  signal in time domain.
  
  Unit: g
  
* *tGravityAcc.std...[X|Y|Z]*

  The standard deviation value of the 3-axial (X, Y and Z) gravity
  acceleration signal in time domain.

  Unit: g
  
* *[t|f]BodyAccJerk.mean...[X|Y|Z]*

  The mean value of the 3-axial (X, Y and Z) Jerk signal for the body
  acceleration signal in [t]ime and [f]requency domains.
   
  Unit: g
  
* *[t|f]BodyAccJerk.std...[X|Y|Z]*

  The standard deviation value of the 3-axial (X, Y and Z) Jerk 
  signal for the body acceleration signal in [t]ime and [f]requency
  domains.
   
  Unit: g
  
* *[t|f]BodyGyro.mean...[X|Y|Z]*

  Estimated mean value of the 3-axial (X, Y and Z) body angular
  velocity signal in [t]ime and [f]requency domains.

  Unit: rad/seg
  
* *[t|f]BodyGyro.std...[X|Y|Z]*

  Estimated standard deviation value of the 3-axial (X, Y and Z) body
  angular velocity signal in [t]ime and [f]requency domains.

  Unit: rad/seg
  
* *tBodyGyroJerk.mean...[X|Y|Z]*

  The mean value of the Jerk signal, obtained deriving the body
  angular velocity in time domain.  

  Unit: rad/seg
  
* *tBodyGyroJerk.std...[X|Y|Z]*  
  
  The standard deviation value of the Jerk signal, obtained deriving
  the body angular velocity in time domain.  

  Unit: rad/seg
  
* *[t|f]BodyAccMag.mean..*

  The mean value of the magnitude of the body acceleration signal
  in [t]ime and [f]requency domains.

  Unit: g
  
* *[t|f]BodyAccMag.std..*
  
  The standard deviation value of the magnitude of the body
  acceleration signal in [t]ime and [f]requency domains.

  Unit: g
  
* *tGravityAccMag.mean..*

  The mean value of the magnitude of the gravity acceleration signal
  in time domain.

  Unit: g
  
* *tGravityAccMag.std..*
  
  The standard deviation value of the magnitude of the gravity
  acceleration signal in time domain.

  Unit: g
  
* *tBodyAccJerkMag.mean..* and *fBodyBodyAccJerkMag.mean..*

  The mean value of the magnitude of the body acceleration Jerk's
  signal in [t]ime and [f]requency domains.

  Unit: g
  
* *tBodyAccJerkMag.std..* and *fBodyBodyAccJerkMag.std..*
  
  The standard deviation value of the magnitude of the body
  acceleration Jerk's signal in [t]ime and [f]requency domains.

  Unit: g
  
* *tBodyGyroMag.mean..* and *fBodyBodyGyroMag.mean..*

  The mean value of the magnitude of the body angular velocity 
  signal in [t]ime and [f]requency domains.

  Unit: rad/seg
  
* *tBodyGyroMag.std..* and *fBodyBodyGyroMag.std..*

  The standard deviation value of the magnitude of the body angular
  velocity signal in [t]ime and [f]requency domains.

  Unit: rad/seg
  
* *tBodyGyroJerkMag.mean..* and *fBodyBodyGyroJerkMag.mean..*

  The mean value of the magnitude of the body angular velocity Jerk's
  signal in [t]ime and [f]requency domains.

  Unit: rad/seg
  
* *tBodyGyroJerkMag.std..* and *fBodyBodyGyroJerkMag.std...*

  The standard deviation value of the magnitude of the body angular
  velocity Jerk's signal in [t]ime and [f]requency domains.

  Unit: rad/seg
  
