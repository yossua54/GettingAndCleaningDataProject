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
* Reads the input data files and prepare the X_train, y_train, subject_train, X_test, y_test,  and subject_test dataframes.

### 1. Merges the training and the test sets to create one data set.

* A training data frame is prepared merging columns with cbind from subject_train,X_train,y_train.
> training <- cbind(subject_train,X_train,y_train)

* A test data frame is prepared merging columns with cbind from subject_train,X_train,y_train.
> test <- cbind(subject_test,X_test,y_test)

* The trainig and test data frames are merged by rows to generate the tidydata_all dataframe.
> tidydata_all <- rbind(training,test)

### 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

* The columns with means for measurements are located using grep over the feature names of the tidydata_all dataframe.
> imean <- grep("mean()",names(tidydata_all),fixed=TRUE)

* The same with std measurements
> istd <- grep("std()",names(tidydata_all),fixed=TRUE)

* After merging and ordering the indexes, a new tidydata_meanstd dataframe is created with only mean and std measurements.

  > imeanstd <- c(imean,istd)
  
  > iimeanstd <- imeanstd[order(imeanstd)]
  
  > features_meanstd <- names(tidydata_all)[iimeanstd]
  
  > tidydata_meanstd <- tidydata_all[,iimeanstd]
  
### 3. Uses descriptive activity names to name the activities in the data set

* Activity labels from the activity_labels.txt are used to rename the values of the activity column

  > activitylabelsdf <- read.table("./UCI HAR Dataset/activity_labels.txt",  header=FALSE)
  
  > activity_labels <- activitylabelsdf[,2] 
  
  > tidydata_all[,563] <- activity_labels[tidydata_all[,563]] 

### 4. Appropriately labels the data set with descriptive variable names. 

An accumulative procedure is follow over the namesTidy auxiliary variable:

* t is substitute by time in the feature names of the tidydata_meanstd dataframe
> namesTidy <- gsub("^t","time",names(tidydata_meanstd))

* f is substitute by frequency in the feature names 
> namesTidy <- gsub("^f","frequency",namesTidy)

* - is substitute by . in the feature names 
> namesTidy <- gsub("-",".",namesTidy)

* () is eliminated from the feature names 
> namesTidy <- gsub("()","",namesTidy,fixed=TRUE)

* double body is corrected from the feature names 
> namesTidy <- gsub("BodyBody","Body",namesTidy)

* The feature names of the tidydata_meanstd dataframe is substituted by the auxilary variable with the corrected names
> names(tidydata_meanstd) <- namesTidy

### 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

* An index of subject x activity (30 x 6 levels) is created for the 10299 observations
> index <- list(tidydata_all[,"subject"],tidydata_all[,"activity"])

* The tidydata_meanstd data frame is splitted in the 180 levels
> pieces <- split(tidydata_meanstd,index)

* The average is calculated of each  variable for each activity and each subject by applying colMeans for each data frame of the pieces list
> tidy_meanstd_averageBySubjectAndActivity <- data.frame(t(sapply(pieces,colMeans)))

* Finally, the tidy dataset is written inf the file "tidy_meanstd_averageBySubjectAndActivity.txt"
> write.table(tidy_meanstd_averageBySubjectAndActivity,file="tidy_meanstd_averageBySubjectAndActivity.txt",row.names = FALSE,col.names = TRUE)

* Additionally, the variable names and observation names are saved in files to write the Code Book
  > write.table(names(tidy_meanstd_averageBySubjectAndActivity),file="tidy_meanstd_averageBySubjectAndActivity_features.txt",col.names = FALSE)
  
  > write.table(rownames(tidy_meanstd_averageBySubjectAndActivity),file="tidy_meanstd_averageBySubjectAndActivity_observations.txt",col.names = FALSE)
  
# Result

The result obtained by the [run_analysis.R](https://github.com/yossua54/GettingAndCleaningDataProject/blob/master/run_analysis.R) script is a tidy dataset composed by 180 observations and 66 variables with the average of each variable for each activity and each subject. The result is saved in the [tidy_meanstd_averageBySubjectAndActivity.txt](https://github.com/yossua54/GettingAndCleaningDataProject/blob/master/tidy_meanstd_averageBySubjectAndActivity.txt) space-separated text file.

# Conclusions

The result obtained in the project shows how to read, clean and summarize data in R to generate tidy datasets.

