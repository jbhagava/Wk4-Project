library(dplyr)

testdir = "~/Jaya/R Work/Data Science Specialization/R Intro/UCI HAR Dataset/test"
traindir = "~/Jaya/R Work/Data Science Specialization/R Intro/UCI HAR Dataset/train"
  setwd(testdir)
  testdata <- read.table("X_test.txt")
  testdatal <- read.table("y_test.txt")
  subtest <-read.table("subject_test.txt")
  alabels <- read.table("activity_labels.txt")
  
  setwd(traindir)
  traindata <- read.table("X_train.txt")
  traindatal <- read.table("y_train.txt")
  subtrain <-read.table("subject_train.txt")
  labelstrain <- inner_join(traindatal, alabels, by="V1")
  labelstest <- inner_join(testdatal, alabels, by="V1")
  
  
  #merge test and train data (labels and subject) - (1)
  mlabels <- rbind(labelstest, labelstrain)
  msubject <-rbind(subtest,subtrain)
  colnames(msubject) <-"Subject"
  
  #add descriptive features and subject to the dataset - (3)
  colnames(mlabels)[colnames(mlabels) == "V2"] <- "Activity" # Rename column
  mdata <-rbind(testdata,traindata)
  #mdata <- cbind(mdata,mlabels$Activity)
  #colnames(mdata)[colnames(mdata) == "mlabels$Activity"] <- "Activity" # Rename column
  #mdata <- cbind(mdata,msubject)
  #add descriptive features to the dataset - (4)
  features <-read.table("features.txt")
  
  cn<-features$V2
  colnames(mdata) <-cn
  
  #data using mean and standard deviation - 2)
  mdatas <-select(mdata, contains('mean()'), contains('std'))
  mdatas <-cbind(mdatas,mlabels$Activity)
  colnames(mdatas)[colnames(mdatas) == "mlabels$Activity"] <- "Activity" # Rename column
  mdatas <- cbind(mdatas,msubject)
  
  #create independent data set 
  
  fdata <-mdatas %>%
    group_by(Subject,Activity) %>%
    drop_na() %>%
    summarize(across(where(is.numeric), mean, .names = "mean_{col}"))
  
  hm <-"~/Jaya/R Work/Data Science Specialization/R Intro"
  setwd(hm)
  
  write.table(fdata, file="Project4.txt",row.name=FALSE)
  
  
  
  
  