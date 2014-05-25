## X_Combined.txt Dataset ##
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals. Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm.

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing, which are prefixed with 'frequencydomain' to indicate the FFT

These signals were used to estimate variables of the feature vector for each pattern:  
'x', 'y', or 'z' is used to denote 3-axial signals in the X, Y and Z directions.

'mean' and 'std' are used to denote whether which summary statistic is being reported for that variable. 

Each row has the subject's numerical identifier and activity (walking, walking upstairs, walking downstairs, sitting, standing, laying).

List of fields from left to right:  

subject   
activity  
timedomainbodyaccelerationmeanx        
timedomainbodyaccelerationmeany  
timedomainbodyaccelerationmeanz  
timedomainbodyaccelerationstdx  
timedomainbodyaccelerationstdy  
timedomainbodyaccelerationstdz   
timedomaingravityaccelerationmeanx   
timedomaingravityaccelerationmeany   
timedomaingravityaccelerationmeanz   
timedomaingravityaccelerationstdx  
timedomaingravityaccelerationstdy   
timedomaingravityaccelerationstdz   
timedomainbodyaccelerationjerkmeanx    
timedomainbodyaccelerationjerkmeany   
timedomainbodyaccelerationjerkmeanz 
timedomainbodyaccelerationjerkstdx    
timedomainbodyaccelerationjerkstdy   
timedomainbodyaccelerationjerkstdz   
timedomainbodygyroscopemeanx   
timedomainbodygyroscopemeany    
timedomainbodygyroscopemeanz  
timedomainbodygyroscopestdx   
timedomainbodygyroscopestdy  
timedomainbodygyroscopestdz   
timedomainbodygyroscopejerkmeanx   
timedomainbodygyroscopejerkmeany   
timedomainbodygyroscopejerkmeanz  
timedomainbodygyroscopejerkstdx   
timedomainbodygyroscopejerkstdy   
timedomainbodygyroscopejerkstdz    
timedomainbodyaccelerationmagnitudemean   
timedomainbodyaccelerationmagnitudestd   
timedomaingravityaccelerationmagnitudemean  
timedomaingravityaccelerationmagnitudestd  
timedomainbodyaccelerationjerkmagnitudemean  
timedomainbodyaccelerationjerkmagnitudestd  
timedomainbodygyroscopemagnitudemean  
timedomainbodygyroscopemagnitudestd  
timedomainbodygyroscopejerkmagnitudemean  
timedomainbodygyroscopejerkmagnitudestd  
frequencydomainbodyaccelerationmeanx  
frequencydomainbodyaccelerationmeany  
frequencydomainbodyaccelerationmeanz  
frequencydomainbodyaccelerationstdx  
frequencydomainbodyaccelerationstdy  
frequencydomainbodyaccelerationstdz  
frequencydomainbodyaccelerationjerkmeanx  
frequencydomainbodyaccelerationjerkmeany  
frequencydomainbodyaccelerationjerkmeanz  
frequencydomainbodyaccelerationjerkstdx  
frequencydomainbodyaccelerationjerkstdy  
frequencydomainbodyaccelerationjerkstdz  
frequencydomainbodygyroscopemeanx  
frequencydomainbodygyroscopemeany  
frequencydomainbodygyroscopemeanz  
frequencydomainbodygyroscopestdx   
frequencydomainbodygyroscopestdy   
frequencydomainbodygyroscopestdz   
frequencydomainbodyaccelerationmagnitudemean  
frequencydomainbodyaccelerationmagnitudestd  
frequencydomainbodybodyaccelerationjerkmagnitudemean  
frequencydomainbodybodyaccelerationjerkmagnitudestd  
frequencydomainbodybodygyroscopemagnitudemean  
frequencydomainbodybodygyroscopemagnitudestd  
frequencydomainbodybodygyroscopejerkmagnitudemean  
frequencydomainbodybodygyroscopejerkmagnitudestd  

Description of data and how they were obtained adapted from 
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012.

## Summary_File Dataset ##
summary_file.txt has the same variables as above, but summarizes by taking the average of each column across like activities for each subject. 

in 'X_ combined.txt', each subject had between 35 and 95 separate clusters of observations with the same activity. 
'summary_file.txt' takes the average mean and average standard deviation across each cluster. 