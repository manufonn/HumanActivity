---
title: "CodeBook.md"
author: "EFon"
output:
  pdf_document: default
  word_document: default
  html_document: default
---


```
```

## Analysis of wearable smarthphone data to evaluate 30 volunteers engaged in movements or activities of daily living.
## This analysis will focus on the data collected for the mean and std deviation.
## Initial Setup includes installation of certain packages.
## The data have been separated into training and test folders. The two will be merged. The data also contain non-descriptive variable names which will be made descriptive using the "features.txt" file. Here we find the variables referring to "mean" and "std" for standard deviation. We work with observations from these variables.
## We conclude by preparing a tidyset called "cleanset" and use this to calculate averages of our observations grouped by Subjects("Persons") then Activities("Activ").


## install.packages("tidyverse")
## set working directory to wearfolder or location of downloaded files.



```
install.packages("tidyverse") # Packages needed for analysis

library(tidyverse)
library(readr)
library(dplyr)

#The first part loads the data into r and renames columns appropriately. We collect 6 data frames and combine to 1.

#Question1

X_train <- read.table("train/X_train.txt")  # From the train folder, load into r "subject_train.txt", "X_train.txt", # "y_train.txt". The same is repeated for the test folder

y_train <- read.table("train/y_train.txt") %>%

        rename(Activ = V1) # Load data into r and rename column "Activ"

subject_train <- read.table("train/subject_train.txt") %>%

        rename(Persons = V1 )

X_test <- read.table("test/X_test.txt")

y_test <- read.table("test/y_test.txt") %>%

        rename(Activ = V1)

subject_test <- read.table("test/subject_test.txt") %>%

        rename(Persons = V1)

##jtrain <- left_join(X_train, Y_train, by = "V1")

xytrainbind <- cbind(y_train, X_train)

xysubTrainbind <- cbind(subject_train, xytrainbind)

xytestbind <- cbind(y_test, X_test)

xysubTestbind <- cbind(subject_test, xytestbind)

comboset <- rbind(xysubTrainbind, xysubTestbind)


## This is the final data frame containing test and training data for all volunteers.

#dim(comboset)
```

## Next we analyse the descriptive names in file "features.txt". These will be used to subset the variable containing the mean and standard deviation. 
## Here we select every variable containg the word or "mean" or "std" (standard deviation) and we do no separate these depending on the activity. We separate names from "tBodyAcc-mean()-X" to "tBodyAcc Mean X" components.


```
# Question2

#library(readr)

features_colnames <- read_table("features.txt", col_names = FALSE) %>% # read the data into r
        
        ### view(features_colnames)
        
        separate(col = X1, into = c("Position", "typre", "stat", "axis")) %>%
        
  #     separate features description into several columns to index the "mean" and "std".
  
        filter(stat == "mean" | stat == "std") # Select only those rows that contain "mean" or "std"
        
        # # view()
        # 
        # # xycol <- cbind(ytest, xtest)
        # 
        # # xysubcol <- cbind(subject_test, xycol)
        # 
        # # all_sets <- rbind(xysubcol, xysubcol2)


# We create a vector of numbers which point to the positions of variables "mean" and "std" in the combined dataframe.
     
featcol <- features_colnames %>% 
        select(Position) %>% 
        sapply(as.numeric) %>%
        tbl_df() %>%
        mutate(Position = Position + 2) %>% 
        unlist() %>%
        as.vector() 

meanANDstd <- comboset[c(featcol)] #%>% 

# The data frame is indexed to select only columns for "mean" and "std".
        
        #view()
        


#Question 3

# set working directory as appropriate

# use comboset from previous analysis

activ_labels <- read.table("activity_labels.txt") ## load activity labels into r

actlab <- rename(activ_labels, Activ = V1)  ## rename col1 V1 of activ_labels to same key as combined dataset, 
                                            ## comboset,   key =  "Activ"
  ##view(actlab)


activSet <- right_join(actlab, comboset, by = "Activ") ## keep all observations of comboset and match to actlab
                                                        ## combine to one data frame
  ## view(head(activSet))

# Question 4

## Using features_colnames

unifeat <- unite(features_colnames, "namez", typre:axis, sep = " ") ## Join the columns to have a single name

                ## view(unifeat)

                      ## comboset %>% select(-(1:2))   
                      ## %>% head() %>% view()

meancombo <- meanANDstd 
        
meancombo2 <- tbl_df(meancombo) ## use a tibble for easier processing

     ## view(head(unifeat))
     
col_names <- unifeat %>%   ##select the column of unifeat data frame that will become names of variables
        select(namez) %>% 
        tbl_df() 
col_names2 <- as.vector(unlist(col_names))
        

colnames(meancombo2) <- col_names2 ## replace variable names with descriptive names
        
              ##   view(head(meancombo2))

## Question 5

# featcol2 <- features_colnames %>% 
#         select(Position) %>% 
#         sapply(as.numeric) %>%
#         tbl_df() %>%
#         ## mutate(Position = Position + 2) %>% 
#         unlist() %>%
#         as.vector() ##  %>%
# ##  view()

featcol3 <- tbl_df(featcol)
featcol4 <- add_row(featcol3, value = 1:2, .before = TRUE) %>%   ## add two rows with values 1&2 to be used
            unlist() %>%                                         ## for "Persons" & "Activ" variable names
            as.vector()

meancombine15 <- comboset[c(featcol4)] #%>%  ##index the columns for selected variables
      
                  # view()
       

 meancombine19 <- meancombine15

        
col_names44 <- unifeat %>%   ## create new column names vector to replace variable names
        select(namez) %>%     
        tbl_df() %>%
        add_row(namez = c("Persons", "Activ"), .before = TRUE) %>%
        unlist() %>%
        as.vector()



colnames(meancombine19) <- col_names44   # change to descriptive variable names

cleanset <- meancombine19                # The final tidy data 

                      ## view(cleanset)

## Q5b

 lesommer <- cleanset %>%           ## group first by subjects then Activities then calculate average for each.
             
             group_by(Persons, Activ) %>%
             
             summarise_all( mean, na.rm = TRUE)  %>%
         
             view()
 
 # lesommer2 <- cleanset %>%
 #         group_by(Persons, Activ) %>%
 #         summarise(
 #                 count = n()
 #         ) %>%
 #         view()
```
## Please see READ.Me

##      Thank You!

