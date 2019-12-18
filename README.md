---
title: "READMe.md"
author: "EFon"
output: word_document
---
## *Human Activity Recognition Using Smartphones Dataset*

The data is downloaded from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data sets contain observations from 30 volunteers on daily movement activities; 
*Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, Laying*. 
The data were collected using wearable smarthphones. Several measurements were collected and these include the mean and standard deviation which will be the main components of our analysis. 


The script for this analyis is in the  **Run_Analysis_weardata.R file**.

The first part loads the data sets into R. Upon loading, some of the variable names have been replaced by more descriptive names. 
The test and training data sets are merge into one data frame.

The next part creates a data frame and also a vector containing position pointers for the variables "mean" and "std" in the combined data frame. 

Next we include the activity labels and match each into corresponding places in our data frame. For example, we can select "Walking" activity performed by "Person #3" and so forth.

We continue to include the descriptive variable names in the combined data frame.

Finally, we obtain a tidy data frame and group the data by subjects then activities and obtain a summary of the observations as an average.

A step-by-step analysis of the R script is included in the *CodeBood.md* file and *Run_Analysis-weardata* file.


These are the selected variables used as descriptive names later.

     Positions   Full_names
     
     1	1	tBodyAcc mean X
     2	2	tBodyAcc mean Y
     3	3	tBodyAcc mean Z
     4	4	tBodyAcc std X
     5	5	tBodyAcc std Y
     6	6	tBodyAcc std Z
     7	41	tGravityAcc mean X
     8	42	tGravityAcc mean Y
     9	43	tGravityAcc mean Z
     10	44	tGravityAcc std X
     11	45	tGravityAcc std Y
     12	46	tGravityAcc std Z
     13	81	tBodyAccJerk mean X
     14	82	tBodyAccJerk mean Y
     15	83	tBodyAccJerk mean Z
     16	84	tBodyAccJerk std X
     17	85	tBodyAccJerk std Y
     18	86	tBodyAccJerk std Z
     19	121	tBodyGyro mean X
     20	122	tBodyGyro mean Y
     21	123	tBodyGyro mean Z
     22	124	tBodyGyro std X
     23	125	tBodyGyro std Y
     24	126	tBodyGyro std Z
     25	161	tBodyGyroJerk mean X
     26	162	tBodyGyroJerk mean Y
     27	163	tBodyGyroJerk mean Z
     28	164	tBodyGyroJerk std X
     29	165	tBodyGyroJerk std Y
     30	166	tBodyGyroJerk std Z
     31	201	tBodyAccMag mean 
     32	202	tBodyAccMag std 
     33	214	tGravityAccMag mean 
     34	215	tGravityAccMag std 
     35	227	tBodyAccJerkMag mean 
     36	228	tBodyAccJerkMag std 
     37	240	tBodyGyroMag mean 
     38	241	tBodyGyroMag std 
     39	253	tBodyGyroJerkMag mean 
     40	254	tBodyGyroJerkMag std 
     41	266	fBodyAcc mean X
     42	267	fBodyAcc mean Y
     43	268	fBodyAcc mean Z
     44	269	fBodyAcc std X
     45	270	fBodyAcc std Y
     46	271	fBodyAcc std Z
     47	345	fBodyAccJerk mean X
     48	346	fBodyAccJerk mean Y
     49	347	fBodyAccJerk mean Z
     50	348	fBodyAccJerk std X
     51	349	fBodyAccJerk std Y
     52	350	fBodyAccJerk std Z
     53	424	fBodyGyro mean X
     54	425	fBodyGyro mean Y
     55	426	fBodyGyro mean Z
     56	427	fBodyGyro std X
     57	428	fBodyGyro std Y
     58	429	fBodyGyro std Z
     59	503	fBodyAccMag mean 
     60	504	fBodyAccMag std 
     61	516	fBodyBodyAccJerkMag mean 
     62	517	fBodyBodyAccJerkMag std 
     63	529	fBodyBodyGyroMag mean 
     64	530	fBodyBodyGyroMag std 
     65	542	fBodyBodyGyroJerkMag mean 
     66	543	fBodyBodyGyroJerkMag std 
     