##Study Design
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 
##Code Book
With this script two different datasets are created. One of them is also written in a txt file called dataset2.txt.
Althouth they have some features in common they will be explained in different sections.
### 1st data set
This dataset has been built as a data frame called dataset1 in the script.
#### Units
The data given in the columns that are not Activities and Subject are normalized and bounded within [-1,1]
####Columns:
* Activities: The measurement have been performed over five different activities. In this column I include, for each measurement, the name of the activity.
* Subject: In the experiment 30 people participate. In this column it is sayd who of this 30 people carries the device to perform the measurement (each person is labelled with a number)
* Mean Body Accel X: For each measurement, the X component of the vector of the body acceleration mean is included.
* Mean Body Accel Y: For each measurement, the Y component of the vector of the body acceleration mean is included.
* Mean Body Accel Z: For each measurement, the Z component of the vector of the body acceleration mean is included.
* Stand Body Accel X: For each measurement, the X component of the vector of the body acceleration standard deviation is included.
* Stand Body Accel Y: For each measurement, the Y component of the vector of the body acceleration standard deviation is included.
* Stand Body Accel Z: For each measurement, the Z component of the vector of the body acceleration standard deviation is included.
* Mean Grav Accel X: For each measurement, the X component of the vector of the gravity acceleration mean is included.
* Mean Grav Accel Y: For each measurement, the Y component of the vector of the gravity acceleration mean is included.
* Mean Grav Accel Z: For each measurement, the Z component of the vector of the gravity acceleration mean is included.
* Stand Grav Accel X: For each measurement, the X component of the vector of the gravity acceleration standard deviation is included.
* Stand Grav Accel Y: For each measurement, the Y component of the vector of the gravity acceleration standard deviation is included.
* Stand Grav Accel Z: For each measurement, the Z component of the vector of the gravity acceleration standard deviation is included.
* Mean Body Ang Vel X: For each measurement, the X component of the vector of the body angular velocity mean is included.
* Mean Body Ang Vel Y: For each measurement, the Y component of the vector of the body angular velocity mean is included.
* Mean Body Ang Vel Z: For each measurement, the Z component of the vector of the body angular velocity mean is included.
* Stand Body Ang Vel X: For each measurement, the X component of the vector of the body angular velocity standard deviation is included.
* Stand Body Ang Vel Y: For each measurement, the Y component of the vector of the body angular velocity standard deviation is included.
* Stand Body Ang Vel Z: For each measurement, the Z component of the vector of the body angular velocity standard deviation is included.
* Mean Body Accel Mag: For each measurement, the magnitude of the vector of the body acceleration mean is included.
* Stand Body Accel Mag: For each measurement, the magnitude of the vector of the body acceleration standard deviation is included.
* Mean Grav Accel Mag: For each measurement, the magnitude of the vector of the gravity acceleration mean is included.
* Stand Grav Accel Mag: For each measurement, the magnitude of the vector of the gravity acceleration standard deviation is included.
* Mean Body Ang Vel Mag: For each measurement, the magnitude of the vector of the body angular velocity mean is included.
* Stand Body Ang Vel Mag: For each measurement, the magnitude of the vector of the body angular velocity standard deviation is included.

### 2nd data set
This dataset has been built as a dataframe called dataset2 in the script. This script also writes it in a txt file called dataset2.txt
Although the names of the columns are the same as in the previous dataset, they mean something different. The columns that are not neither Activites nor Subject, are the average for each activity and each subject. That is why there are only 180 rows: 30 people times 6 activities.
There is no need to explain again the variables, they are the same as before but now they measure the average for each activity and each subject. Before the measured its value for each activity and each subject.
