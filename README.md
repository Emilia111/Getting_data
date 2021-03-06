# Getting_data
### How the script works
The run_analysis.R script works reading the data of the folder "UCI HAR Dataset" and generating, as an output, a txt file with a table where the information asked in the assignment is given (see CodeBook).
For the run_analysis.R script to run properly, it must be located in the same folder than the folder with the unzipped data "UCI HAR Dataset".
This script is divided into the five steps the instructions suggested (at the beginning of each step the code is commented and explained). It is important to say that the steps have not exactly been followed, because the aim was to complete the assignment and generate two tidy datasets. Only one of them is exported as a txt file.
#### 1st step:
To merge the data of test and train, first, I have read the data of the corresponding folders (no the ones in "Inertial Signals", as they are not needed for the assignment) and then, I have used rbind to join the rows.
#### 2nd step:
The instructions asked to include in the tidy dataset only the measurements of the mean and standar deviation. As they asked for measurements, I have included only the variables that are actually measures: acceleration of gravity, acceleration of the body and angular velocity of the body (its vector components and the magnitude). Neither the Jerks nor its Fourier transformations. That is why the table of X_data.txt is reduced to just 24 columns: the multiplication of the vector components and magnitude, times the three variables, times the mean and the standard deviation. In the code this dataframe is called measurecut.
#### 3rd step:
To substitute the numbers of the activity by its actual names, I have just evaluated the vector with the activity_labels over the elements of the vector I built in step 1 (where I merged the y_test.txt and y_train.txt datasets) with the numbers of the activities. It works because the numbers of the activities coincide with the position of the activity in the activity label vector.
#### 4rd step:
To rename the labels in a more understandable way, I hace created four vectors with the names that are going to be mixed to form the new labels. To know when to use each of them, I have used grep to look for in the old variables. After this, I have finally created the asked data set as a dataframe called dataset1.
#### 5th step:
In this step we build the dataset2 which will be exported as txt file. Although the names of the columns are the same that in the previous dataset, they mean something different. The columns that are not neither Activites nor Subject, have the average for each activity and each subject. That is why there are only 180 rows: 30 people times 6 activities. To build this second dataset I have used different combinations of grep and rbind.
