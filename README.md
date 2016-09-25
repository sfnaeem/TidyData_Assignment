# TidyData_Assignment
The script does the following:

1. Loads files in the test and training folders.

2. Subject and activity variables are created in test and training data frames.

3. Merge the training and the test sets to create one data set:
   merged_dF=rbind(train_df,test_df)
   
4. Sort the data frame with respect to subject ranging from 1 - 30.

5. Assigin descriptive activity names to the Activity column in the merged data frame as follows:
   1: walking; 2: walking_upstairs; 3: walking_downstairs; 4: sitting; 5: standing; 6: laying
   
6. Assigin descriptive variable names to the variables in the merged_df w.r.t variables described in the "features.txt"
 
7. Extract mean and std. dev. data from the merged dF using the regular expression:
   (mean\\(\\)|std\\(\\))
   
8. Extract mean data from the data frame created in step 7 using the regular expression:
   (mean\\(\\)

9. Create tab delimated table the first row of which contains the variable names of each column
   File created: answer.txt
