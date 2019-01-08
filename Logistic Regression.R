#logistic regression
library(datasets)
ir_data<- iris
head(ir_data)
str(ir_data)
levels(ir_data$Species)
#check for NA values
sum(is.na(ir_data))
#take only 2 of the Species values since logistic regression is a binary classifier
ir_data<-ir_data[1:100,]
#define the test (training) and control (testing) groups
set.seed(100)
samp<-sample(1:100,80)
ir_test<-ir_data[samp,]
ir_ctrl<-ir_data[-samp,]
#look at data plots
library(ggplot2); library(GGally)
ggpairs(ir_test)
#fit the data
y<-ir_test$Species; x<-ir_test$Sepal.Length
glfit<-glm(y~x, family = 'binomial')
summary(glfit)
#look at the predicted values
newdata<- data.frame(x=ir_ctrl$Sepal.Length)
predicted_val<-predict(glfit, newdata, type="response")
prediction<-data.frame(ir_ctrl$Sepal.Length, ir_ctrl$Species,predicted_val)
prediction
qplot(prediction[,1], round(prediction[,3]), col=prediction[,2], xlab = 'Sepal Length', ylab = 'Prediction using Logistic Reg.')
