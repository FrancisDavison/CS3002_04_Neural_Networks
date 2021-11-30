#CS3002_04_Neural_networks_Wine_Net
if((Sys.info()["nodename"])=="JANEWAY")
{
  setwd("C:\\Users\\Janeway\\Dropbox\\Github\\CS3002_CS3002_04_Neural_Networks")
  print("Working Directory set to C:\\Users\\Janeway\\Dropbox\\Github\\CS3002_04_Neural_Networks")
}
if((Sys.info()["nodename"])=="PICARD")
{
  setwd("C:\\Users\\Picard\\Dropbox\\Github\\CS3002_CS3002_04_Neural_Networks")
  print("Working directory set to C:\\Users\\Picard\\Dropbox\\Github\\CS3002_04_Neural_Networks")
}

#import and setup data
WineData=read.csv(".\\WineDataTrim.csv") #Uses trimmed csv containing only needed values. Crazy unpredictable and un fixable errors occur when trying to select columns from Winedata2
WineClass=WineData[,1]-1 #Select first column and subtract 1 from each value to make values in range 0-1 not 1-2
WineValue=WineData[,-1] #Select everything except forst column as WineVale

#Noramlise the values in WineDataTrim
WineValueNorm <- (WineValue-min(WineValue))/(max(WineValue)-min(WineValue)) #Normalise values (See notebook for explanation)

#set up test and  training sets
WineDataNorm <- (cbind(WineClass, WineValueNorm)) #cbind Class and Values back to one dataframe, then randomise with sample, then select rows 1:73 for training
WineDataNormRand=WineDataNorm[sample(130,130),]
WineDataTrain=WineDataNormRand[1:65,]
WineDataTest=WineDataNormRand[66:130,]

library(neuralnet) #imports neuralnet library

#set up neural nets
set.seed(2)
NN=neuralnet(WineDataTrain[,1]~., WineDataTrain[,-1], hidden=c(3,4,3),threshold=0.001,stepmax=1e+05,linear.output=FALSE, rep=3)
#accuracy highest and error GENERALLY lowest with hidden layers 3,4,3
#Increasing rep(epochs) will decrease the error and increase the accuracy, however this seems to be pseudo random as the error can be as high as 1+ sometimes

predict_testNN=compute(NN,WineDataTest)
predict_out=as.numeric(predict_testNN$net.result>0.5)
ncorrect=sum(predict_out==WineDataTest[,1])
n=length(WineDataTest[,1])
accuracy=ncorrect/n
print(accuracy)
plot(NN)