#CS3002_04_Neural_Networks_XOR
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

#XOR gate input/output data
XORdat=cbind((trainout=rbind(0,1,1,0)),(trainin=rbind(c(1,1),c(1,-1),c(-1,1),c(-1.-1))))

#fit neural network with no hidden layers
set.seed(2) #Not sure what this does
NN=neuralnet(XORdat[,1]~., XORdat[,-1], hidden=c(3,2), threshold=0.001, stepmax=1e+05,linear.output=FALSE)
#hidden layers error lowest at c(3,2)
#Threshold is the percepteron activation value
#Stepmax is the maximum number of steps for training
#linear output FALSE=Classification method, TRUE=Regression method (more accurate)

#Present inputs and outputs as sequence
#Set up input sequence
testinseq=trainin
predict_testNN=compute(NN,testinseq)
predict_out=as.numeric(predict_testNN$net.result>0.5)
predict_out
plot(NN)

#Assessed excercise answer:
#If the hidden layers is left at 0, the network will not be able to learn the weights correctly, however it learns the weights with the lowest error at hidden layers (3,2)