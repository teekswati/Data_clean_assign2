####Merges the training and the test sets to create one data set.
 

setwd("E:\\data_scientiest toolbar\\cleaning\\assignment-2\\UCI HAR Dataset\\test")
list.files()
test_x=read.table("X_test.txt")
test_y=read.table("y_test.txt")
 dim(test_y)
test_sub=read.table("subject_test.txt")
dim(test_sub)
setwd("E:\\data_scientiest toolbar\\cleaning\\assignment-2\\UCI HAR Dataset\\train")
list.files()
train_x= read.table("X_train.txt")
 dim(train_x)
[1] 7352  561
train_y= read.table("y_train.txt")
dim(train_y)
[1] 7352    1
train_sub= read.table("subject_train.txt")
dim(train_sub)
train_test=rbind(train_x, test_x)
dim(train_test)
[1] 10299   561
 train_test_y=rbind(train_y, test_y)
dim(train_test_y)
[1] 10299     1
train_test_sub=rbind(train_sub, test_sub)
dim(train_test_sub)
[1] 10299     1


###Extracts only the measurements on the mean and standard deviation for each measurement.


extract=grep("mean\\(\\)|std\\(\\)", feature[ ,2])
length(extract)
train_test_feature= train_test[ ,extract]
dim(train_test_feature)
[1] 10299    66

#####Uses descriptive activity names to name the activities in the data set

label=read.table("activity_labels.txt")
dim(label)
new_label=label[train_test_y[ ,1],2]
class(new_label)
lab=as.data.frame(new_label)
names(lab)="activity"
names(train_test_sub)="Subject"
head(train_test_sub)

######Appropriately labels the data set with descriptive variable names. 

final_data=cbind(train_test_feature, lab, train_test_sub)
dim(final_data)
write.table(final_data, "merged_data.txt")

##########From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

sub_len=length(table(train_test_sub))
activ_len=length(table(train_test_y))
col_len <- dim(final_data)[2]
result <- matrix(NA, nrow=sub_len*activ_len, ncol=col_len)
dim(result)
result <- as.data.frame(result)
> dim(result)
colnames(result) <- colnames(final_data)
row <- 1
for(i in 1:sub_len) {
   for(j in 1:activ_len) {
         result[row, 1] <- sort(unique(train_test_sub)[, 1])[i]
         result[row, 2] <- lab[j, 2]
         bool1 <- i == final_data$Subject
         bool2 <- lab[j, 2] == final_data$activity
         result[row, 3:col_len] <- colMeans(final_data[bool1&bool2, 3:col_len])
         row <- row + 1
     }
 }


}
head(result)
write.table(result, "data_with_means.txt", row.names=FALSE)









