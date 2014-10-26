#Setting the working dir
setwd("C:/Users/Nino/R Kurs/Getting and Cleaning Data/Project/UCI HAR Dataset")

#Loading the train datasets
x_test<-read.table("./test/x_test.txt",header=F)
y_test<-read.table("./test/y_test.txt",header=F)
subject_test<-read.table("./test/subject_test.txt",header=F)
activitylab <- as.character(read.table("activity_labels.txt", header=F)[,2])

for(i in 1:6){
  y_test[y_test==i]<-activitylab[i]
  
}
#Column binding the subject test files, and the two datasets with one another
testDfr<-cbind(subject_test,y_test,x_test)

#Loading the testing datasets 
x_train<-read.table("./train/x_train.txt",header=F)
y_train<-read.table("./train/y_train.txt",header=F)
subject_train<-read.table("./train/subject_train.txt",header=F)

for(i in 1:6){
  y_train[y_train==i]<-activitylab[i]
  
}

#Column binding like before all datasets to one.
trainDfr<-cbind(subject_train,y_train,x_train)

#row binding the two complete datasets
mergeDfr<-rbind(testDfr,trainDfr)

#Name the columns of the merged dataset
names(mergeDfr)
dir()
features<-read.table("features.txt",header=F)
class(features)
colnames(mergeDfr)<-c("Subjects","Activity",as.character(features[,2]))

#Which columns contain SD and Mean variables
StandDfr<-grep("std",c("subject", "activity", as.character(features[,2])))
MeanDfr<-grep("mean",c("subject", "activity", as.character(features[,2])))


#Create the new tidy dataset
MeanstdDfr<-mergeDfr[,c(1,2,StandDfr,MeanDfr)]

#Create the final tidy dataset which gives means for each variable,activitiy and subject
TidyData<-matrix(NA,nr=180,nc=81)
k <- 1
for(i in 1:30){
  for(j in 1:6){
    sub1 <- MeanstdDfr[MeanstdDfr[,1]==i,] 
    TidyData[k,1] <- i
    TidyData[k,2] <- activitylab[j]
    TidyData[k,3:81] <- colMeans(sub1[which(sub1[,2]==activitylab[j]),][,3:81]) 
    k <- k+1
  }
}

#Give Colnames to TidyData
colnames(TidyData)<-colnames(MeanstdDfr)

#Create a tabel with the finished dataset

write.table(TidyData,file="TidyDataset.txt",row.name=F)


