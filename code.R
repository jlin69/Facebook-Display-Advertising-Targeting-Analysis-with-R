#INSERT CODE HERE
#set working directory
setwd("/Users/jiayuanlin/Desktop/GBA 424/3/Case/FB")

#load the data
dataSet <- read.csv('HW2 Data.csv')


#Apply predict function to predict click per dollar 
#2C
dataSet$predict <- predict(lm(formula = clickPerDollar ~ factor(category)*ageMean+ 
             factor(category)*factor(placement) + factor(adType) + factor(body), data = dataSet))

#Add score 
#predict* 0.011
dataSet$score <- dataSet$predict*0.011



#Yes or No 
dataSet$Yes <- dataSet$X
for (i in c(1:length(dataSet$X))){
    if (dataSet$score[i]> 1.1){
      dataSet$Yes[i] <- "Yes"
    }
    else{
      dataSet$Yes[i] <- "No"
    }
}


#New database only contains "yes"
dataYes <- dataSet[dataSet$Yes == "Yes",]
length(dataYes$Yes)


write.csv(dataYes,"C:/Users/luyuz/Documents/Rochester/Fall B/GBA424_Analytics Design and Applications/Assignment#3/mydata.csv",row.names = FALSE)
