GettingAndCleaningDataProject
=============================

Solution to the Getting and Cleaning Data Course Project

## Author: Juan M Garcia-Gomez (yossua54@gmail.com)

# Objective

The objective of this project is to provide generate a tidy dataset with summarized data collected from the accelerometers from the Samsung Galaxy S smartphone.

# Materials

The data processed in this project is the "Human Activity Recognition Using Smartphones Data Set " downloaded from this [URL](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

# Methods

The solution was implemented in the R language, using the Rstudio 0.98.490. All the code is including in the single R script [run_analysis.R](https://github.com/yossua54/GettingAndCleaningDataProject/blob/master/run_analysis.R).

# Solution

The [run_analysis.R](https://github.com/yossua54/GettingAndCleaningDataProject/blob/master/run_analysis.R) execute the next ordered actions:

* 0. Reads the dataset, feature names and subjects ids.
* 1. Merges the training and the test sets to create one data set.
* 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
* 3. Uses descriptive activity names to name the activities in the data set
* 4. Appropriately labels the data set with descriptive variable names. 
* 5. Creates an independent tidy data set with the average of each variable for each activity and each subject. 

Next, a detailed explanation of the actions is reported:

### 0. Reads the dataset, feature names and subjects ids.

* Reads and prepares names of the features from [features.txt](https://github.com/yossua54/GettingAndCleaningDataProject/blob/master/UCI%20HAR%20Dataset/features.txt).
* Reads the input data files and prepare the X_train, y_train, subject_train, X_test, y_test,  and subject_test data frames.

### 1. Merges the training and the test sets to create one data set.

* A training data frame is prepared merging columns with cbind from subject_train,X_train,y_train.
> training <- cbind(subject_train,X_train,y_train)

* A test data frame is prepared merging columns with cbind from subject_train,X_train,y_train.
> test <- cbind(subject_test,X_test,y_test)

* The trainig and test data frames are merged by rows to generate the tidydata_all dataframe.
> tidydata_all <- rbind(training,test)

#2. Extracts only the measurements on the mean and standard deviation for each measurement. 

imean <- grep("mean()",names(tidydata_all),fixed=TRUE)
istd <- grep("std()",names(tidydata_all),fixed=TRUE)
imeanstd <- c(imean,istd)
iimeanstd <- imeanstd[order(imeanstd)]
features_meanstd <- names(tidydata_all)[iimeanstd]
tidydata_meanstd <- tidydata_all[,iimeanstd]
head(tidydata_meanstd)
#write.table(tidydata_meanstd,file="tidydata_meanstd.txt")

#3. Uses descriptive activity names to name the activities in the data set

activitylabelsdf <- read.table("./UCI HAR Dataset/activity_labels.txt",  header=FALSE) #similar a read.csv(), usar quote=""
activity_labels <- activitylabelsdf[,2] 
tidydata_all[,563] <- activity_labels[tidydata_all[,563]] 
head(tidydata_all) #checking the result
tidydata_all[27:28,] #checking the result, activities 5,4 

#4. Appropriately labels the data set with descriptive variable names. 

namesTidy <- gsub("^t","time",names(tidydata_meanstd))
namesTidy <- gsub("^f","frequency",namesTidy)
namesTidy <- gsub("-",".",namesTidy)
namesTidy <- gsub("()","",namesTidy,fixed=TRUE)
namesTidy <- gsub("bodybody","body",namesTidy)
namesTidy
names(tidydata_meanstd) <- namesTidy

#5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

#an index of subject x activity (30 x 6 levels) is created for the 10299 observations
index <- list(tidydata_all[,"subject"],tidydata_all[,"activity"])
#the tidydata_meanstd data frame is splitted in the 180 levels
pieces <- split(tidydata_meanstd,index)
#the average is calculated of each  variable for each activity and each subject by applying colMeans for each data frame of the pieces list
tidy_meanstd_averageBySubjectAndActivity <- data.frame(t(sapply(pieces,colMeans)))

#the tidy dataset is written
write.table(tidy_meanstd_averageBySubjectAndActivity,file="tidy_meanstd_averageBySubjectAndActivity.txt",row.names = FALSE,col.names = TRUE)
#the variable names and observation names are also saved in files to write the Code Book
write.table(names(tidy_meanstd_averageBySubjectAndActivity),file="tidy_meanstd_averageBySubjectAndActivity_features.txt",col.names = FALSE)
write.table(rownames(tidy_meanstd_averageBySubjectAndActivity),file="tidy_meanstd_averageBySubjectAndActivity_observations.txt",col.names = FALSE)
