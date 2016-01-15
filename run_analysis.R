fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="data.zip") ##Download the data file
unzip("data.zip") ##unzip the data file
setwd("UCI HAR Dataset")##set working directory to file

#load the various data files

##extract second column of txt file, corresponding to activity labels
activitylabels<- read.table("activity_labels.txt")[,2] 

##extract second column of txt file, corresponding to the featuresm- this will be the column names
features<-read.table("features.txt")[,2]

# Load and process x and y data and the subject test data
Xtest <- read.table("./test/X_test.txt")
Ytest <- read.table("./test/y_test.txt")
subjectTest <- read.table("./test/subject_test.txt")

##Objective is to extract only mean and standard deviation for each measurement
##features 2 is a variable that applies extraction of mean and std only
features2<-grepl("mean|std",features)

##allocating names to Xtest by the features extracted table
names(Xtest)=features

##extract variables that represent only mean and std of Xtest
Xtest=Xtest[,features2]

##add a column to Y test with the labels extracted before w.r.t to column 1 in Ytest
Ytest[,2]=activitylabels[Ytest[,1]]

##change the variable names in Y test 1
names(Ytest)=c("id","activity")

##change variable name in Subject Test
names(subjectTest)= "subject"

##creating a tidy table 
testdata <- cbind(subjectTest, Ytest, Xtest)

##repeating the procedure for the training set
Xtrain <- read.table("./train/X_train.txt")
Ytrain <- read.table("./train/y_train.txt")
subjectTrain <- read.table("./train/subject_train.txt")


##allocating names to Xtest by the features extracted table
names(Xtrain)=features

##extract variables that represent only mean and std of Xtest
Xtrain=Xtrain[,features2]

##add a column to Y test with the labels extracted before w.r.t to column 1 in Ytest
Ytrain[,2]=activitylabels[Ytrain[,1]]

##change the variable names in Y test 1
names(Ytrain)=c("id","activity")

##change variable name in Subject Test
names(subjectTrain)= "subject"

##creating a tidy table 
traindata <- cbind(subjectTrain, Ytrain, Xtrain)

##merging the two tidy tables
table=rbind(testdata,traindata)
library(reshape2)
idlabels   = c("subject", "id", "activity")
datalabels = setdiff(colnames(table), idlabels)
melttable = melt(table, id = idlabels, measure.vars = datalabels)

# Use dcast function to apply the mean to the dataset
tidydata   = dcast(melttable, subject + activity ~ variable, mean)

##write the new table of means to the users pc
write.table(tidydata, file = "./tidy_data.txt")