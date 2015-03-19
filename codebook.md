#Getting and Cleaning Data Course Project CodeBook
This file describes the variables, the data, and any transformations or work that I have performed to clean up the data.
•	The run_analysis.R script performs the following steps to clean the data:

i.	Read X_train.txt, y_train.txt and subject_train.txt from the "./data/train" folder and store them in train_x,train_test_y and train_test_sub variables respectively.
ii.	Read X_test.txt, y_test.txt and subject_test.txt from the "./data/test" folder and store them in test_x, test_y and test_sub variables respectively.
iii.Concatenate train_x to test_x to generate a 10299x561 data frame, train_test; concatenate train_y to test_y to generate a 10299x1 data frame, train_test_y; concatenate train_sub to test_sub to generate a 10299x1 data frame, train_test_sub.
iv.	Read the features.txt file from the "/data" folder and store the data in a variable called extract. We only extract the measurements on the mean and standard deviation. This results in a 66 indices list. We get a subset of train_test with the 66 corresponding columns.
v.	Read the activity_labels.txt file from the "./data"" folder and store the data in a variable called label.
vi.	Clean the activity names in the second column of activity.
vii.	Transform the values of train_test according to the label data frame.
ix.	Combine the train_test train_test_y and train_test_sub by column to get a new cleaned 10299x68 data frame,final_data. Properly name the first two columns, "subject" and "activity". The "subject" column contains integers that range from 1 to 30 inclusive; the "activity" column contains 6 kinds of activity names; the last 66 columns contain measurements that range from -1 to 1 exclusive.
x.	Write the cleanedData out to "merged_data.txt" file in current working directory.
xi.	Finally, generate a second independent tidy data set with the average of each measurement for each activity and each subject. We have 30 unique subjects and 6 unique activities, which result in a 180 combinations of the two. Then, for each combination, we calculate the mean of each measurement with the corresponding combination. So, after initializing the result data frame and performing the two for-loops, we get a 180x68 data frame.
xii.	Write the result out to "data_with_means.txt" file in current working directory.
