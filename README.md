# Course Project: Getting and Cleaning Data
### Peer-graded Assignment - John Hopkins University/Coursea

## Project Overview
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. The project will consist of the following deliverables: 1) a tidy data set, 2) a link to a Github repository with script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work performed to clean up the data called CodeBook.md. and 4) this README file.


### Dataset Description
#### Human Activity Recognition Using Smartphones

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project [1]:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


### Project Requirements

Project should create one R script called "run_analysis.R"" that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each  
   variable for each activity and each subject.


### Result of Project

The completion of this project resulted in the following per project requirements:

1. Tidy dataset based on source data that has been merged, inwhich, the mean and standard deviation was calculated for each activity and subject: [tidy_data.txt](https://github.com/gutekanst/GettingCleaningDataProject/blob/master/tidyData.txt) and [tidy_data.csv](https://github.com/gutekanst/GettingCleaningDataProject/blob/master/tidyData.csv)
2. Project R script [run_analysis.R](https://github.com/gutekanst/GettingCleaningDataProject/blob/master/run_analysis.R) used to generate tidy dataset
3. Code book [CodeBook.md](https://github.com/gutekanst/GettingCleaningDataProject/blob/master/CodeBook.md) that describes variables, data and any transformations or work performed to clean up the source data 



### Additional Resources
* [Human Activity Recognition Using Smartphones Data Set - Center for Machine Learning and Intelligent Systems](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
* [Human Activity Dataset Use in Project](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)


### References

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012