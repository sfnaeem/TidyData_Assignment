# TidyData_Assignment
The script does the following:

1. Loads files in the test and training folders.

2. Subject and activity variables are created in test and training data frames.

3. Merge the training and the test sets to create one data set:
   merged_dF=rbind(train_df,test_df)
   
4. Sort the data frame with respect to subject ranging from 1 - 30.

5. Assigin descriptive activity names to the Activity column in the merged data frame as follows:
   merged_dF$activity <- as.character(merged_dF$activity)
   merged_dF$activity[merged_dF$activity == "1"] <- "walking"
   merged_dF$activity[merged_dF$activity == "2"] <- "walking_upstairs"
   merged_dF$activity[merged_dF$activity == "3"] <- "walking_downstairs"
   merged_dF$activity[merged_dF$activity == "4"] <- "sitting"
   merged_dF$activity[merged_dF$activity == "5"] <- "standing"
   merged_dF$activity[merged_dF$activity == "6"] <- "laying"
   
6. Assigin descriptive variable names to the variables in the merged_df w.r.t variables described in the "features.txt"
   fileName<-"UCI HAR Dataset/features.txt"
   features_names = read.table(fileName)
   ...
   colnames(merged_dF)[i] <- tolower(as.character(features_names[[2]][j]))
 
7. Extract mean and std. dev. data from the merged dF as follows:
   mean_sigma_df=merged_dF
   mean_sigma_df=mean_sigma_df[,grep("(mean\\(\\)|std\\(\\))", names(merged_dF))]
   mean_sigma_df=c(merged_dF[1],merged_dF[2],mean_sigma_df)
   
8. Extract mean data from the data frame created in step 7.
   mean_df=mean_sigma_df
   mean_df=mean_df[grep("mean\\(\\)", names(mean_sigma_df))]
   mean_df=c(merged_dF[1],merged_dF[2],mean_df)
   
9. Create tab delimated table the first row of which contains the variable names of each column
   write.table(mean_df, file = "answer.txt", sep = "\t",row.names = FALSE)
   answer_df=read.table("answer.txt")
 
