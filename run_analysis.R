#download the data   (optional)
#fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(fileUrl,destfile="E:/CursoGetData/project/Dataset.zip")
#set the working diretory
#setwd("E:/CursoGetData/project/")
##unzip the data
unzip("Dataset.zip")
makeTidy<-function(){
  #read the data
  #test
  x_test<-read.table("./UCI HAR Dataset/test/X_test.txt")
  y_test<-read.table("./UCI HAR Dataset/test/y_test.txt")
  sub_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
  #train
  x_train<-read.table("./UCI HAR Dataset/train/X_train.txt")
  y_train<-read.table("./UCI HAR Dataset/train/y_train.txt")
  sub_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")
  ###load names file
  nome<-read.table("./UCI HAR Dataset/features.txt")
  nome<-as.character(nome$V2)
  ##intermediate dataFrames
  dat<-rbind(x_train, x_test)
  act<-rbind(y_train, y_test)
  sub<-rbind(sub_train, sub_test)
  names(sub)<-"subject"
  ##assign names to main data
  names(dat)<-nome
  ##pick the mean and std
  my_dataFrame<-dat[,sort(union(grep(c("mean"),nome),grep(c("std"),nome)))]
  ##now create a vector with activity labels
  activity<-numeric(length(act$V1))
  for ( i in 1:length(activity)){
    var<-act$V1[i]
    if (var==1){
      activity[i]<-"WALKING"
    }else if (var==2){
      activity[i]<-"WALKING_UPSTAIRS"
    }else if (var==3){
      activity[i]<-"WALKING_DOWNSTAIRS"
    }else if (var==4){
      activity[i]<-"SITTING"
    }else if (var==5){
      activity[i]<-"STANDING"
    }else{
      activity[i]<-"LAYING"
    }
  }
  ###now bind to form the final data Frame
  saida<-cbind(my_dataFrame,activity,sub)
  return(saida)
}
##cal the function to create a data frame to step 4
DatFrame<-makeTidy()
#now step 5
library(plyr)
averages<- ddply(DatFrame, .(subject, activity), function(x) colMeans(x[, 1:79]))
write.table(averages, "averages.txt", row.name=FALSE)


