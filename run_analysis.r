## Filename:     run_analysis.R
## Author:       Dann Hekman
## Email:        dannhek@gmail.com
## Start Date:   5/24/14
## Initial Commit Date: 5/24/14
## Last Revision:       n/a
## Purpose:      Assignment for Coursera
##				 Johns Hopkins University GetData-003
## 				 Assignment Criteria:
##					You should create one R script called run_analysis.R that does the following. 
##					1. Merges the training and the test sets to create one data set.
##					2. Extracts only the measurements on the mean and standard deviation for each measurement. 
##					3. Uses descriptive activity names to name the activities in the data set
##					4. Appropriately labels the data set with descriptive activity names. 
##					5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
##---------------------------
## Revision History:
## 		05/2014 - Created
##				  run_analysis
##---------------------------
## Function:     run_analysis
## Start Date:   4/26/14
## Initial Commit Date: n/a
## Last Revision:       n/a
## Description:  
##			Specifications outlined in README.MD file
## 			Will read in two raw data files, select only a subset of columns,
##			associate the row and column identifiers, and combine them.
##			Hard-coded to specifically work for the UCI Galaxy S II Dataset.
## Parameters:
## 			n/a
## Returns: 
##			writes combined_data to a TSV file in the specific directory.
##			combined data includes both test and train subjects.
##---------------------------
run_analysis<-function() {
	#Start in the Main Directory; we'll assume we're either there or just one layer below
	setwd("./UCI HAR Dataset")

	#get all labels
	#colsToKeep is an arrary used to select only the features we care about 
	colsToKeep<-c(1:6,41:46,81:86,121:126,161:166,201:202,214:215,227:228,240:241,253:254,266:271,345:350,424:429,503:504,516:517,529:530,542:543)
	cLab<-read.table("features.txt")
	cLab<-c("subject","activity",as.character(cLab$V2[colsToKeep]))
	activityMap<-read.table("activity_labels.txt")
	#make all my labels pretty per asssignment guidelines
	activityMap$V2<-tolower(gsub("_","",activityMap$V2))
	cLab<-gsub("^t","timedomain",cLab)
	cLab<-gsub("^f","frequencydomain",cLab)
	cLab<-gsub("Acc","acceleration",cLab)
	cLab<-gsub("Gyro","gyroscope",cLab)
	cLab<-gsub("Mag","magnitude",cLab)
	cLab<-gsub("\\(\\)","",cLab)
	cLab<-tolower(gsub("\\-","",cLab))	
	
	#read the data from the test directory
	setwd("./test")
	message("Reading data from /test directory")
	subj<-read.table("subject_test.txt")
	activity<-read.table("y_test.txt")
	activity<-sapply(activity$V1,function(x) activityMap[activityMap$V1==x,2])
	alldata<-read.table("X_test.txt")
	file1<-cbind(subj,activity,alldata[,colsToKeep])
	names(file1)<-cLab

	#read the data from the train directory	
	setwd("../train")
	message("Reading data from /train directory")
	subj<-read.table("subject_train.txt")
	activity<-read.table("y_train.txt")
	activity<-sapply(activity$V1,function(x) activityMap[activityMap$V1==x,2])
	alldata<-read.table("X_train.txt")
	file2<-cbind(subj,activity,alldata[,colsToKeep])
	names(file2)<-cLab
	
	#Merge file1 and file2 and write
	setwd("..") #Back to original home directory
	file3<-rbind(file1,file2)
	write.table(file3,file="X_combined.txt",row.names=FALSE,sep="\t")
	message("Combined file written to ")
	message(paste(getwd(),"X_combined.tsv",sep="/"))
	
	#Finally, take the combined dataset and average each variable 
	#	by subject and activity
	#	then write that out too.
	summaryFile<-aggregate(file3[,3:ncol(file3)],list(file3$subject,file3$activity),mean)
	names(summaryFile)[1:2]<-c("subject","activity") #get rid of the 'Group' labels from aggregate
	write.table(summaryFile,file="summary_file.txt",row.names=FALSE,sep="\t")
	message("Summary file written to ")
	message(paste(getwd(),"summary_file.tsv",sep="/"))
}
run_analysis()