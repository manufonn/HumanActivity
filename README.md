---
title: "READMe.md"
author: "EFon"
output:
  word_document: default
  pdf_document: default
---
## *Human Activity Recognition Using Smartphones Dataset*

The data is downloaded from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The data sets contain observations from 30 volunteers on daily movement activities; Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, Laying. The data were collected using wearable smarthphones. Several measurements were collected and these include the mean and standard deviation which will be the main components of our analysis. 


The script for this analyis is in the Run_Analysis_weardata.R file. 
The first part loads the data sets into R. Upon loading, some of the variable names have been replaced by more descriptive names. The test and training data sets are merge into one data frame. 
The next part creates a data frame and also a vector containing position pointers for the variables "mean" and "std" in the combined data frame. 
Next we include the activity labels and match each into corresponding places in our data frame. For example, we can select "Walking" activity performed by "Person #3" and so forth.
We continue to include the descriptive variable names in the combined data frame.
Finally, we obtain a tidy data frame and group the data by subjects then activities and obtain a summary of the observations as an average.



   