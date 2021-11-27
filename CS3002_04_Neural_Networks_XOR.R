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

#===Define input and output data for XOR gate===
#XOR gate input/output data
XORdat=cbind((trainout=rbind(0,1,1,0)),(trainin=rbind(c(1,1),c(1,-1),c(-1,1),c(-1.-1))))

#fit neural network with no hidden layers
set.seed(2)
NN=neuralnet(XORdat[,1]~., XORdat[,-1], hidden=0, threshold=0.001, stepmax=1e+05,linear.output=FALSE)
#Visualise the neural net
plot(NN)

#check weights and biases
NN$weights

#test to see if network responds to input signal (1,1) with compute
testin=rbind(c(1,1))
predict_testNN=compute(NN,testin)

#activate output neuron
predict_testNN$net.result

#calculate discreet class by thresholding at 0.5
predict_out=as.numeric(predict_testNN$net.result>0.5)
print(predict_out)

#Present inputs and outputs as sequence
#Set up input sequence
testinseq=trainin
predict_testNN=compute(NN,testinseq)
predict_testNN$neurons
predict_testNN$net.result
predict_out=as.numeric(predict_testNN$net.result>0.5)
predict_out

#Assessed excercise answer:
#It didn't learn the input correctly. It behaves exactly the same as the OR network, just with way higher errors