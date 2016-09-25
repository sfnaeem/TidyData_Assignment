setwd("~/Desktop/R-programming/CleaningData/Week4")
library(plyr)

#################################################################################
#LOADING FILES

#test folder data set
fileName<-"UCI HAR Dataset/test/subject_test.txt"
subject_test = read.table(fileName)
colnames(subject_test) <- c("subject")

fileName<-"UCI HAR Dataset/test/X_test.txt"
X_test = read.table(fileName)

fileName<-"UCI HAR Dataset/test/y_test.txt"
y_test = read.table(fileName)
colnames(y_test) <- c("activity")

#test folder data frame
test_df<-cbind(subject_test,y_test,X_test)
test_df = data.frame(test_df) 

#training folder data set
fileName<-"UCI HAR Dataset/train/subject_train.txt"
subject_train = read.table(fileName)
colnames(subject_train) <- c("subject")

fileName<-"UCI HAR Dataset/train/X_train.txt"
X_train = read.table(fileName)

fileName<-"UCI HAR Dataset/train/y_train.txt"
y_train= read.table(fileName)
colnames(y_train) <- c("activity")

#training folder data frame
train_df<-cbind(subject_train,y_train,X_train)
train_df = data.frame(train_df)


#################################################################################
#1.Merge the training and the test sets to create one data set.
merged_dF=rbind(train_df,test_df)

#sort the df with respect to subject
merged_dF<-arrange(merged_dF,subject)

#################################################################################
#3. Assigining descriptive activity names to the Activity column in the merged_df
merged_dF$activity <- as.character(merged_dF$activity)
merged_dF$activity[merged_dF$activity == "1"] <- "walking"
merged_dF$activity[merged_dF$activity == "2"] <- "walking_upstairs"
merged_dF$activity[merged_dF$activity == "3"] <- "walking_downstairs"
merged_dF$activity[merged_dF$activity == "4"] <- "sitting"
merged_dF$activity[merged_dF$activity == "5"] <- "standing"
merged_dF$activity[merged_dF$activity == "6"] <- "laying"

#################################################################################
#4. Assigining descriptive variable names to the subject column in the merged_df
#   loading features file

fileName<-"UCI HAR Dataset/features.txt"
features_names = read.table(fileName)
#initiating 3rd column of the data frame which is V1
i<-3
#counter to go across the features.txt file
j<-1
while(i<=length(merged_dF)){
  colnames(merged_dF)[i] <- tolower(as.character(features_names[[2]][j]))
  i=i+1
  j=j+1
}

#################################################################################
#2. Extracting mean and std. dev. data from the merged dF
mean_sigma_df=merged_dF
mean_sigma_df=mean_sigma_df[,grep("(mean\\(\\)|std\\(\\))", names(merged_dF))]
mean_sigma_df=c(merged_dF[1],merged_dF[2],mean_sigma_df)

#################################################################################
#5. New data frame containing "mean" data set of each var. for each activity and subject
mean_df=mean_sigma_df
mean_df=mean_df[grep("mean\\(\\)", names(mean_sigma_df))]
mean_df=c(merged_dF[1],merged_dF[2],mean_df)
write.table(mean_df, file = "answer.txt", sep = "\t",row.names = FALSE)
answer_df=read.table("answer.txt")