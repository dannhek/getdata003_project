Description of Purpose
----------------------
This repo contains several datasets and an R script for processing. It was written for a project in a Coursera course through the Johns Hopkins School of Public Health, Getting and Cleaning Data; part of the Data Science specialization.

 * [Course Information](https://class.coursera.org/getdata-003)
 * [Assignment information](https://class.coursera.org/getdata-003/human_grading/view/courses/972136/assessments/3/submissions)
 * [Original Datasource](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Description of Data
-------------------
The original dataset in in two pieces, both of which are structured the same:

 * The raw measurements are in X_test.txt (or train)
 * The rows are identified by subject in subject_test.txt (or train)
 * The rows are identified by activity type in y_test.txt (or train)
 * The columns are labeled in features.txt in the main folder

The original data contain 561 measurement summaries. This script extracts only the columns containing mean and standard deviation parameters. 

`1 tBodyAcc-mean()-X   
2 tBodyAcc-mean()-Y   
3 tBodyAcc-mean()-Z   

4 tBodyAcc-std()-X   
5 tBodyAcc-std()-Y   
6 tBodyAcc-std()-Z  	

41 tGravityAcc-mean()-X	   
42 tGravityAcc-mean()-Y		   
43 tGravityAcc-mean()-Z    
44 tGravityAcc-std()-X   
45 tGravityAcc-std()-Y   
46 tGravityAcc-std()-Z   

81 tBodyAccJerk-mean()-X   
82 tBodyAccJerk-mean()-Y   
83 tBodyAccJerk-mean()-Z   
84 tBodyAccJerk-std()-X   
85 tBodyAccJerk-std()-Y   
86 tBodyAccJerk-std()-Z   

121 tBodyGyro-mean()-X  
122 tBodyGyro-mean()-Y  
123 tBodyGyro-mean()-Z  
124 tBodyGyro-std()-X  
125 tBodyGyro-std()-Y  
126 tBodyGyro-std()-Z  

161 tBodyGyroJerk-mean()-X  
162 tBodyGyroJerk-mean()-Y  
163 tBodyGyroJerk-mean()-Z  
164 tBodyGyroJerk-std()-X  
165 tBodyGyroJerk-std()-Y  
166 tBodyGyroJerk-std()-Z  

201 tBodyAccMag-mean()  
202 tBodyAccMag-std()  

214 tGravityAccMag-mean()  
215 tGravityAccMag-std()  

227 tBodyAccJerkMag-mean()  
228 tBodyAccJerkMag-std()  

240 tBodyGyroMag-mean()  
241 tBodyGyroMag-std()  

253 tBodyGyroJerkMag-mean()  
254 tBodyGyroJerkMag-std()  

266 fBodyAcc-mean()-X  
267 fBodyAcc-mean()-Y  
268 fBodyAcc-mean()-Z  
269 fBodyAcc-std()-X  
270 fBodyAcc-std()-Y  
271 fBodyAcc-std()-Z  

345 fBodyAccJerk-mean()-X  
346 fBodyAccJerk-mean()-Y  
347 fBodyAccJerk-mean()-Z  
348 fBodyAccJerk-std()-X  
349 fBodyAccJerk-std()-Y  
350 fBodyAccJerk-std()-Z  

424 fBodyGyro-mean()-X  
425 fBodyGyro-mean()-Y  
426 fBodyGyro-mean()-Z  
427 fBodyGyro-std()-X  
428 fBodyGyro-std()-Y  
429 fBodyGyro-std()-Z  

503 fBodyAccMag-mean()  
504 fBodyAccMag-std()  

516 fBodyBodyAccJerkMag-mean()  
517 fBodyBodyAccJerkMag-std()  

529 fBodyBodyGyroMag-mean()  
530 fBodyBodyGyroMag-std()  

542 fBodyBodyGyroJerkMag-mean()  
543 fBodyBodyGyroJerkMag-std()  

See the codebook markdown  and features_info.txt under the original data source for  full descriptions of each variable.
 
 
Description of Script
---------------------
This script assumes the filestructure contained in the zip file from the above Original Datasource. That is, a directory (originally named UCI HAR Dataset) with the features.txt and activity_labels.txt files which describe the data variables. Additionally, there are test and train folders, which contain the raw data itself. 70% of subjects were randomly assigned to the train subset and the rest were in the test folder. Both test and train contain the data in three different files:   

* X_train.txt (or X_test)
* y_train.txt (contains the activity type for each line of X)
* subject_train.txt (contains subject identifier for each line of X)

For both Test and Train folders, this script will read X, subject and Y files into a single dataframe using read.table() and cbind() functions. It will only store the above features (columns) from X; this is hard-coded. 

After reading the test and train data into separate data frames, it will combine both data frames into a new frame using rbind() and write that to a new file, X_combined.txt, within the UCI HAR Dataset directory using write.table() with a tab separator 

Lastly, it will take that new, combined dataset and summarize each variable average across activities by subject using the aggregate() function in R. This summary will also be written to the UCI HAR Dataset directory as a tab-delimited txt file called summary_file.txt.