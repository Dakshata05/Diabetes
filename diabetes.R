#loading packages
#install.packages("FSelector")
#install.packages("rpart")
#install.packages("caret" , dependencies = TRUE)
#install.packages("dplyr")
#install.packages("rpart.plot")
#install.packages("data.tree")
#install.packages("caTools")

library(FSelector)
library(rpart)
library(caret)
library(rpart.plot)
library(dplyr)
library(data.tree)
library(caTools)
library(ElemStatLearn)
df=read.csv("diabetes_data_upload.csv")
df
#ff
#selecting only meaningful columns for prediction
df <- select(df,class,visual.blurring,sudden.weight.loss,Gender,Age)
#df <- mutate(df,visual.blurring=as.numeric(visual.blurring),class=as.numeric(class),sudden.weight.loss=as.numeric(sudden.weight.loss))

# spliting into train data and testing data
set.seed(123)
sample= sample.split(df$visual.blurring,sudden,SplitRatio= .70)
train = subset(df,sample==TRUE)
test = subset(df, sample == FALSE)
train
#train_label = file[1:469,2]
#test_label = file[470:569,2]

# Training and Decision Tree Classifier
tree<- rpart(visual.blurring,sudden ~.,data = train)

#Predictions
tree.visual.blurring.sudden.predicted <- predict(tree, test,type='class')

#Confusion Matrix for evaluting the model
confusionMatrix(tree.visual.blurring.sudden.predicted,test$visual.blurring.sudden)
