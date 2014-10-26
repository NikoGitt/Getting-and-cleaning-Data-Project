Getting-and-cleaning-Data-Project
=================================

Repo for my Coursera Course Part 3
#########################################################################################################
The Project work for Coursera Course, Getting and Cleaning Data
Setting the working dir <-----If you should run the code, change the Wd to ur own

Loading the train datasets, from the UCI HAR folder. 
For loop for changing the activity labels 1:6 to walking,sitting etc. as characters instead, so when I add the column,
activity it will give the proper acitvity labels instead of numericals.

Column binding the subject test files, and the other two datasets xtrain and ytrain with one another.

Loading the testing datasets all three of them, subjecttrain y and xtrain.
Column binding like before all datasets to one.
Row binding the two complete datasets, which I mention above, so it is the columnbinded test dataset, combined with rowbind, with the traindataset.

Name the columns of the merged dataset

Which columns contain SD and Mean variables,through the grep function and looking for the STD and Mean labels in the features text file.

Create the new tidy dataset from the existing mergeddataset and scaled down dataset that only includes the standard deviation and mean values for all the subjects.
Create the final tidy dataset which gives means for each variable,activitiy and subject. By using a for loop in which, I repeat the loop 30 times, because we have 30 participants, but, in the for loop body, there is another for loop. This for loop, repeats 6 times, every 1 cycle of the original for loop. So in total, this loop, repeats 180 times. What it does, is that it, subsets the last created dataset, identifies the participant through their ID numbers (1:30), identifies the acitivty label for the same participant i.e. Subject 1 ---walking. And finaly does a colmean for all the 81 columns that are present in the final tidy dataset.
 
 Give Colnames to TidyData by the colname function equating the same names and positions as the dataframe created before the last tidy dataset.
Create a tabel with the finished dataset with the write.table function. 






