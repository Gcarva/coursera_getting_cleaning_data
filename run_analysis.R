require("dplyr")
## need to set source directory
## read all files
Xtest<-read.table("UCI HAR Dataset/test/X_test.txt", header=FALSE)
ytest<-read.table("UCI HAR Dataset/test/y_test.txt", header=FALSE)
stest<-read.table("UCI HAR Dataset/test/subject_test.txt", header=FALSE)
Xtrain<-read.table("UCI HAR Dataset/train/X_train.txt", header=FALSE)
ytrain<-read.table("UCI HAR Dataset/train/y_train.txt", header=FALSE)
strain<-read.table("UCI HAR Dataset/train/subject_train.txt", header=FALSE)
act<-read.table("UCI HAR Dataset/activity_labels.txt", header=FALSE)
feat<-read.table("UCI HAR Dataset/features.txt", header=FALSE)
##name columns (need to fix duplicate/invalid column name issue so use make.names)
colnames(Xtest) <- make.names(names=feat[,2], unique=TRUE, allow_ = TRUE)
colnames(Xtrain)<- make.names(names=feat[,2], unique=TRUE, allow_ = TRUE)
colnames(ytest)<- c("activityCode")
colnames(ytrain)<- c("activityCode")
colnames(act)<- c("activityCode", "activity")
#join activities
ytest<-left_join(ytest, act)
ytrain<-left_join(ytrain, act)
##add columns
Xtest<-cbind(Xtest, activityCode=ytest[,1])
Xtrain<-cbind(Xtrain, activityCode=ytrain[,1])
Xtest<-cbind(Xtest, activity=ytest[,2])
Xtrain<-cbind(Xtrain, activity=ytrain[,2])
Xtest<-cbind(Xtest, subject=stest[,1])
Xtrain<-cbind(Xtrain, subject=strain[,1])
##Add data type column (test/train)
Xtest<-cbind(Xtest, dataType='test')
Xtrain<-cbind(Xtrain, dataType='train')
##combine tables
allData<-rbind(Xtest, Xtrain)
##Select only mean and std measurements
meanStdData<-select(allData, contains("mean") | contains("std") | contains("subject") | contains("activity") )
#Remove all other variables
rm(list=setdiff(ls(), "meanStdData"))
#Select Average by subject and activity
aveData<-group_by(meanStdData, subject, activity, activityCode)
aveData<-summarize_all(aveData, mean)

