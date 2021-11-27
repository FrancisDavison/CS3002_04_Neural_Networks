#CS3002_04_Neural_Networks_Instructions
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

#install.packages("neuralnet")
library(neuralnet)

#Define input and output data for OR gate
#OR gate input data
trainin=rbind(c(1,1),c(1,-1),c(-1,1),c(-1,-1))
#OR gate output data
trainout=rbind(1,1,1,0)
#Combined OR gate data
ORdat=cbind(trainout,trainin)

#Setting up single binary perceptron with two inputs and one output, using neuralnet to train it
#Fit neural network with no hidden layers
set.seed(2)
NN=neuralnet(ORdat[,1]~.,ORdat[,-1],hidden=0,threshold=0.001,stepmax=1e+05,linear.output=FALSE)
#visualise the neurat net
plot(NN)

#Check weights
NN$weights

#Use commpute to see if the network respioonds to input signal (1,1)
testin=rbind(c(1,1))
predict_testNN=compute(NN,testin)

#Activate output neuron
predict_testNN$net.result

#Calculate descrete class by thresholding at 0.5 and printing result
predict_out=as.numeric(predict_testNN$net.result>0.5)
print(predict_out)

#present a number of inputs as a sequence and get outputs as a sequence as well
#set up input sequence
testin=rbind(c(1,1),c(1,-1),c(-1,1),c(-1,-1))
predict_testNN=compute(NN,testin)
predict_testNN$neurons
predict_testNN$net.result
predict_out=as.numeric(predict_testNN$net.result>0.5)
predict_out

#Set up 2 layer neuralnetwork to solve XOR problem with two hidden layers, each with 3 neurons in it and one output layer using neuralnet
#XOR gate input data
trainin=rbind(c(1,1),c(1,-1),c(-1,1),c(-1,-1))
#XOR gate output data
trainout=rbind(0,1,1,0)
#Combined XOR gate data
XORdat=cbind(trainout,trainin)

#train neural network on the XOR data
set.seed(2)
NN=neuralnet(XORdat[,1]~.,XORdat[,-1], hidden=c(3,3),threshold=0.001,stepmax=1e+05,linear.output=FALSE)

#Now simulate using the same inputs used to train it
testin=rbind(c(1,1),c(1,-1),c(-1,1),c(-1,-1))
testout=rbind(0,1,1,0)

predict_testNN=compute(NN,testin)
predict_testNN$neurons
predict_testNN$net.result
predict_out=as.numeric(predict_testNN$net.result>0.5)
predict_out
plot(NN)