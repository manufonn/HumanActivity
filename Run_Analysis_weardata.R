## Analysis of wearable smarthphone to evaluate volunteer mov't or activities of daily living
## This analysis will focus on the data collected for the mean and std deviation


##  install.packages("tidyverse")

##  set working directory to wearfolder


library(tidyverse)
library(readr)
library(dplyr)


X_train <- read.table("train/X_train.txt")

y_train <- read.table("train/y_train.txt") %>%
        
        rename(Activ = V1)

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

#dim(comboset)





#library(readr)

features_colnames <- read_table("features.txt", col_names = FALSE) %>%
        
        ### view(features_colnames)
        
        separate(col = X1, into = c("Position", "typre", "stat", "axis")) %>%
        
        filter(stat == "mean" | stat == "std")

# view()

# xycol <- cbind(ytest, xtest)

# xysubcol <- cbind(subject_test, xycol)

# all_sets <- rbind(xysubcol, xysubcol2)



## view(head(jtrain))


featcol <- features_colnames %>% 
        select(Position) %>% 
        sapply(as.numeric) %>%
        tbl_df() %>%
        mutate(Position = Position + 2) %>% 
        unlist() %>%
        as.vector() 

meanANDstd <- comboset[c(featcol)] #%>%

#view()



#Question 3

# set working directory as appropriate

#using comboset from previous analysis

activ_labels <- read.table("activity_labels.txt") ## load activity labels into r

actlab <- rename(activ_labels, Activ = V1)  ## rename col1 V1 of activ_labels to same key as combined dataset, 
## comboset,   key =  "Activ"
##view(actlab)



activSet <- right_join(actlab, comboset, by = "Activ") ## keep all observations of comboset and match to actlab
## combine to one data frame
## view(head(activSet))

##Question 4

## Using features_colnames

unifeat <- unite(features_colnames, "namez", typre:axis, sep = " ") ## Join the columns to have a single name

## view(unifeat)

## comboset %>% select(-(1:2))   
## %>% head() %>% view()

meancombo <- meanANDstd 

meancombo2 <- tbl_df(meancombo) ## use a tiblle for easier processing

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
featcol4 <- add_row(featcol3, value = 1:2, .before = TRUE) %>% ## add two rows with values 1&2 to be used
        unlist() %>%                                            ## for "Persons" & "Activ" variable names
        as.vector()

meancombine15 <- comboset[c(featcol4)] #%>%  ##index the columns for selected variables
# view()
meancombine19 <- meancombine15 

#meancombine10 <- comboset[c(featcol2)]

col_names44 <- unifeat %>%   ## create new column names vector to replace variable names
        select(namez) %>%     
        tbl_df() %>%
        add_row(namez = c("Persons", "Activ"), .before = TRUE) %>%
        unlist() %>%
        as.vector()

# col_names20 <- add_row(col_names1, namez = c("Persons", "Activ"), .before = TRUE) ##formatted as dplyr above
# 
# col_names30 <-  as.vector(unlist(col_names20))

colnames(meancombine19) <- col_names44

cleanset <- meancombine19

## view(cleanset)

## Q5b

lesommer <- cleanset %>%     ## group first by subjects then Activities then calculate average for each.
        group_by(Persons, Activ) %>%
        summarise_all( mean, na.rm = TRUE) %>%
        
        view()
     
#####################






   
        # lesommer2 <- cleanset %>%
        #         group_by(Persons, Activ) %>%
        #         summarise(
        #                 count = n()
        #         ) %>%
        #         view()