# DATA DICTIONARY -  AVERAGE MEASUREMENTS FOR ACTIVITY AND SUBJECT OF Human Activity Recognition Using Smartphones Data Set 

## Created by Juan M Garcia-Gomez (yossua54@gmail.com) 

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.

This tidy dataset provides the  average measurement for each activity and for each subject of the mean and std variables included in the Human Activity Recognition Using Smartphones Data Set.

## Features included in the dataset:

1: timeBodyAcc.mean.X

2: timeBodyAcc.mean.Y

3: timeBodyAcc.mean.Z

4: timeBodyAcc.std.X

5: timeBodyAcc.std.Y

6: timeBodyAcc.std.Z

7: timeGravityAcc.mean.X

8: timeGravityAcc.mean.Y

9: timeGravityAcc.mean.Z

10: timeGravityAcc.std.X

11: timeGravityAcc.std.Y

12: timeGravityAcc.std.Z

13: timeBodyAccJerk.mean.X

14: timeBodyAccJerk.mean.Y

15: timeBodyAccJerk.mean.Z

16: timeBodyAccJerk.std.X

17: timeBodyAccJerk.std.Y

18: timeBodyAccJerk.std.Z

19: timeBodyGyro.mean.X

20: timeBodyGyro.mean.Y

21: timeBodyGyro.mean.Z

22: timeBodyGyro.std.X

23: timeBodyGyro.std.Y

24: timeBodyGyro.std.Z

25: timeBodyGyroJerk.mean.X

26: timeBodyGyroJerk.mean.Y

27: timeBodyGyroJerk.mean.Z

28: timeBodyGyroJerk.std.X

29: timeBodyGyroJerk.std.Y

30: timeBodyGyroJerk.std.Z

31: timeBodyAccMag.mean

32: timeBodyAccMag.std

33: timeGravityAccMag.mean

34: timeGravityAccMag.std

35: timeBodyAccJerkMag.mean

36: timeBodyAccJerkMag.std

37: timeBodyGyroMag.mean

38: timeBodyGyroMag.std

39: timeBodyGyroJerkMag.mean

40: timeBodyGyroJerkMag.std

41: frequencyBodyAcc.mean.X

42: frequencyBodyAcc.mean.Y

43: frequencyBodyAcc.mean.Z

44: frequencyBodyAcc.std.X

45: frequencyBodyAcc.std.Y

46: frequencyBodyAcc.std.Z

47: frequencyBodyAccJerk.mean.X

48: frequencyBodyAccJerk.mean.Y

49: frequencyBodyAccJerk.mean.Z

50: frequencyBodyAccJerk.std.X

51: frequencyBodyAccJerk.std.Y

52: frequencyBodyAccJerk.std.Z

53: frequencyBodyGyro.mean.X

54: frequencyBodyGyro.mean.Y

55: frequencyBodyGyro.mean.Z

56: frequencyBodyGyro.std.X

57: frequencyBodyGyro.std.Y

58: frequencyBodyGyro.std.Z

59: frequencyBodyAccMag.mean

60: frequencyBodyAccMag.std

61: frequencyBodyAccJerkMag.mean

62: frequencyBodyAccJerkMag.std

63: frequencyBodyGyroMag.mean

64: frequencyBodyGyroMag.std

65: frequencyBodyGyroJerkMag.mean

66: frequencyBodyGyroJerkMag.std

WHERE:
* time indicates the variables is in time domain
* frequency indicates the variables is in frequency domain
* Body indicates the body acceleration component
* Gravity indicates the gravity acceleration component
* Acc indicates is an accelerometer measurement
* Gyro indicates is a gyroscope measurement
* Jerk indicates it is a derived Jerk signal
* X, Y, Z indicate the axis of the measurement
* Mag indicated the magnitude calculated using the Euclidean norm 
* Acceleration signals are in standard gravity units 'g'
* Angular velocity vector measured by the gyroscope is in radians/second units
* Features are normalized and bounded within [-1,1]
* mean indicates it is the mean measurement
* std indicates it is standard deviation of the measurements

## Identification of cases

The identification of each row is provided in the separated file "tidy_meanstd_averageBySubjectAndActivity_observations" with two columns:
* The first column indicates the row of the case in the dataset
* The second column indicates the subject (from 1 to 30) and the activity in the format "N.Activity", where N is in the [1,30] interval and Activity takes the values {WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING}.

## Notes

* The tidy dataset is composed by 180 observations and 66 variables with the average of each variable for each activity and each subject.

* Based on  Human Activity Recognition Using Smartphones Data Set 

* Code book for the Solution to the Getting and Cleaning Data Course Project edited by Juan M Garcia-Gomez

