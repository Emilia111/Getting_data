#STEP 1. Merges the training and the test sets to create one data set.
#In this step I have just merged the data that I will use in the following steps

subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt")
subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt")
subject<-rbind(subject_test,subject_train)
act_test<-read.table("UCI HAR Dataset/test/y_test.txt")
act_train<-read.table("UCI HAR Dataset/train/y_train.txt")
act<-rbind(act_test,act_train)
measure_test<-read.table("UCI HAR Dataset/test/X_test.txt")
measure_train<-read.table("UCI HAR Dataset/train/X_train.txt")
measure<-rbind(measure_test,measure_train)

#STEP 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# As they are asking to include in the data frame only the mean and the stan
# dard deviation of the measurements, I have not included
# neither the fourier transformation nor the jerks. This i sbecause they are not actually 
# measurements but mathematical transformations
# on the variables I have actually included: Triaxial angular velocity and acceleration of
# the body, triaxial acceleration of gravity and its magnitudes. For this measurements 
#I include, as asked, only the mean and standar deviation.

features<-read.table("UCI HAR Dataset/features.txt")
measures_names<-as.vector(features[,2])
colnames(measure)<-measures_names

x1<-grep("^t",measures_names,value = TRUE)
x2<-grep("mean|std",x1,value = TRUE)
x3<-grep("Jerk",x2,value = TRUE, invert = TRUE)
measurecut<-measure[,x3]   

#STEP 3. Uses descriptive activity names to name the activities in the data set. Here we build the column of the activites not
# with the numbers but with the actual names. we will not build the dataframe with the data set until the next step.

act_labels<-read.table("UCI HAR Dataset/activity_labels.txt")
act_labels<-as.vector(act_labels[,2])
act[,1]<-act_labels[act[,1]]
row_ac<-act[,1]

#STEP 4. Appropriately labels the data set with descriptive variable names. 

v1<-c("Mean", "Stand")
v2<-c("Body", "Grav")
v3<-c("Accel", "Ang Vel")
v4<- c("X","Y","Z","Mag")

rename<-c()
for(k in 1:length(x3)){
      s<-x3[[k]]
      if(grepl("mean",s) == TRUE)  x<-v1[1]  else x<-v1[2]
      if(grepl("Body",s) == TRUE)  x<-c(x,v2[1])  else x<-c(x,v2[2])
      if(grepl("Acc",s) == TRUE)  x<-c(x,v3[1])  else x<-c(x,v3[2])
      if(grepl("X",s) == TRUE)  x<-c(x,v4[1])
      if(grepl("Y",s) == TRUE)  x<-c(x,v4[2])
      if(grepl("Z",s) == TRUE)  x<-c(x,v4[3])
      if(grepl("Mag",s) == TRUE)  x<-c(x,v4[4])
      rename<-c(rename, paste(x[1],x[2],x[3],x[4], sep=" "))
}
colnames(measurecut)<-rename
row_subject<-as.vector(subject[,1])
d1<-data.frame(Activity=row_ac, Subject=row_subject)
dataset1<-cbind(d1,measurecut)

#STEP 5. From the data set in step 4, creates a second, independent tidy data set with the 
#average of each variable for each activity and each subject.

c_subj<-c()
c_act<-c()
c_means<-c()
for (i in 1:length(act_labels)){
      s1<-grep(act_labels[i],dataset1[,1])
      table2<-dataset1[s1,]
      for (j in 1:30){
            s2<-grep(paste("^", as.character(j), "$", sep=""),table2[,2])
            table3<-table2[s2,]
            c_means<-rbind(c_means,colMeans(table3[,3:26]))
            c_subj<-c(c_subj,j)
            c_act<-c(c_act,act_labels[i])
      }
} 
c_means_df<-as.data.frame(c_means)
d2<-data.frame(Activity=c_act, Subject=c_subj)
dataset2<-cbind(d2,c_means_df)
write.table(dataset2, file = "dataset2.txt", row.name = FALSE)
