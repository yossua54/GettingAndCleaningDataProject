## Author: Juan M Garcia-Gomez (yossua54@gmail.com)

#0. reading the dataset

#read names of the features (features.txt)
featuresdf <- read.table("./UCI HAR Dataset/features.txt",  header=FALSE) #similar a read.csv(), usar quote=""
featuresX <- featuresdf[,2] 

# read input data files
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt",  header=FALSE) #similar a read.csv(), usar quote=""
names(X_train) <- featuresX
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE) #similar a read.csv(), usar quote=""
names(y_train) <- "activity"
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt",  header=FALSE) #similar a read.csv(), usar quote=""
names(subject_train) <- "subject"
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt",  header=FALSE) #similar a read.csv(), usar quote=""
names(X_test) <- featuresX
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt",  header=FALSE) #similar a read.csv(), usar quote=""
names(y_test) <- "activity"
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE) #similar a read.csv(), usar quote=""
names(subject_test) <- "subject"

# 1. Merges the training and the test sets to create one data set.

#merging training files
training <- cbind(subject_train,X_train,y_train)
#merging training files
test <- cbind(subject_test,X_test,y_test)
#merging training and test dataframes
tidydata_all <- rbind(training,test)
head(tidydata_all)
tail(tidydata_all)
#write.table(tidydata_all,file="tidydata_all.txt")

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
