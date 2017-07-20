##
## This R script called run_analysis.R (clean_dataset function) does the following.
##
## 1. Merges the training and the test sets to create one data set.
##
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
##
## 3. Uses descriptive activity names to name the activities in the data set
##
## 4. Appropriately labels the data set with descriptive variable names.
##
## 5. From the data set in step 4, creates a second, independent tidy data set with the average
##    of each variable for each activity and each subject.
##
##
## Start of clean_dataset R program
##

clean_dataset <- function(...){

##
      
## Verify and Load Libraries if required
        
        ## Verify and Load dplyr
        
        list.of.packages <- c("dplyr")
        new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
        if(length(new.packages)) install.packages(new.packages)
        
        library(dplyr)
        
## Retreiving Human Activity Dataset 
        
        ## Download Data from Target Location

        if(!file.exists("./data")){
                dir.create("./data")
        }
        
        if(!file.exists("./data/Dataset.zip")){
                fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
                download.file(fileUrl,destfile="./data/Dataset.zip")
        }

        
        ## Unzipping Dataset
        
        if(!file.exists("./data/UCI HAR Dataset")){
        
                unzip(zipfile="./data/Dataset.zip",exdir="./data")
        }
        
        ## Setting Paths for Unzipped File Location
        
        file_path <- file.path("./data" , "UCI HAR Dataset")
        
        ## Reading Datafiles into R DataFrame Variables
        
        
                ## Reading Activity Files
        
                dfActivityTest  <- read.table(file.path(file_path, "test" , "Y_test.txt" ),header = FALSE)
                dfActivityTrain <- read.table(file.path(file_path, "train", "Y_train.txt"),header = FALSE)
        
                ## Reading Subject Files
        
                dfSubjectTrain <- read.table(file.path(file_path, "train", "subject_train.txt"),header = FALSE)
                dfSubjectTest  <- read.table(file.path(file_path, "test" , "subject_test.txt"),header = FALSE)
                
                ## Reading Features Files
                
                dfFeaturesTest  <- read.table(file.path(file_path, "test" , "X_test.txt" ),header = FALSE)
                dfFeaturesTrain <- read.table(file.path(file_path, "train", "X_train.txt"),header = FALSE)
        
        
## Merging Training and Test DataFrames to Create One DataFrame.

        ## Rbinding DataFrame Rows for Subject, Activity, and Features
                
                dfSubject <- rbind(dfSubjectTrain, dfSubjectTest)
                dfActivity<- rbind(dfActivityTrain, dfActivityTest)
                dfFeatures<- rbind(dfFeaturesTrain, dfFeaturesTest)
                
        
        ## Setting Columns Names to DataFrame
                
                names(dfSubject)<-c("subject")
                names(dfActivity)<- c("activity")
                dfFeaturesNames <- read.table(file.path(file_path, "features.txt"),head=FALSE)
                names(dfFeatures)<- dfFeaturesNames$V2
                
        ## Merging Columns in Subject, Activity, and Features Into one DataFrame tidyData
                
                tmp <- cbind(dfSubject, dfActivity)
                tidyData <- cbind(dfFeatures, tmp)


## Extracting Only the Mean and Standard Deviation for Each Measurement

                
        ## Subset Names of Features with “mean” or “std”
                
                subsetFeaturesNames<-dfFeaturesNames$V2[grep("mean\\(\\)|std\\(\\)", dfFeaturesNames$V2)]
                
        ## Subset Dataframe by "Subject" and "Activity"
                
                tmpNames<-c(as.character(subsetFeaturesNames), "subject", "activity" )
                tidyData<-subset(tidyData,select=tmpNames)
                
                
## Use descriptive Activity Names to Name the Activities in DataFrame
                
        ## Load Activity Label Names from File
                
                activityNames <- read.table(file.path(file_path, "activity_labels.txt"),header = FALSE)
                
        ## Replace Activity Numbers with Activity Names
                
                tidyData$activity <- factor(tidyData$activity, levels = activityNames[,1], labels = activityNames[,2])
                
                head(tidyData$activity,30)
                
                
## Apply Appropriate Labels to DataFrame with Descriptive Variable Names.
                
                names(tidyData) <- gsub("\\()", "", names(tidyData))
                names(tidyData)<-gsub("^t", "time", names(tidyData))
                names(tidyData)<-gsub("^f", "frequency", names(tidyData))
                names(tidyData)<-gsub("Acc", "Accelerometer", names(tidyData))
                names(tidyData)<-gsub("Gyro", "Gyroscope", names(tidyData))
                names(tidyData)<-gsub("Mag", "Magnitude", names(tidyData))
                names(tidyData)<-gsub("BodyBody", "Body", names(tidyData))
                names(tidyData) <- gsub("-mean", "Mean", names(tidyData))
                names(tidyData) <- gsub("-std", "Std", names(tidyData))

                
## Create Second DataFrame from tidyData DataFrame with the Average of Each Activity and Each Subject.
                
        ## Obatining Average of Each Activity and Subject
                
                tidyData2 <- tidyData %>%
                        group_by(subject, activity) %>%
                        summarise_all(funs(mean))
        
        ## Writing tidyData to file as Output text and csv files
                
                write.table(tidyData2, "./tidyData.txt", row.names = FALSE)
                write.csv(tidyData2, "./tidyData.csv", row.names = FALSE)
                
## End of clean_dataset R program
                
}
