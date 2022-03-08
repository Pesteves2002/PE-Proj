dataGALP = read.csv("./data/GALP.tsv", header=TRUE, sep="", dec=",")
dataGALP = dataGALP[,5]
dataGALP=ts(dataGALP)
ts.plot(dataGALP, xlab="Period: 2019-2021", ylab="Price", main="Closing Values Share Prices (GALP
ENERGIA)")
logreturnGALP = as.ts(diff(log(dataGALP)))
ts.plot(logreturnGALP, xlab="Period: 2019-2021", ylab="log-returns", main="Log-RETURNS (GALP
ENERGIA)")

logreturnGALP = as.ts(diff(log(dataGALP)))
par(mfrow=c(2,2))
hist(dataGALP, main="Histogram Closing Prices")
hist(logreturnGALP, main="Histogram Log-Returns")
dGALP=density(dataGALP)
plot(dGALP, xlab="", main="Kernel Density of Closing Prices")
polygon(dGALP, col="blue")
dlogGALP=density(logreturnGALP)
plot(dlogGALP, xlab="", main="Kernel Density of Log-Returns")
polygon(dlogGALP, col="blue")

par(mfrow=c(1,2))
boxplot(dataGALP, col="blue", ylab="Price")
boxplot(logreturnGALP, col="red", ylab="log-returns")

dataEDP = read.csv("./data/EDP.tsv", header=TRUE, sep="", dec=",")


jointGALPEDP=cbind(dataGALP, dataEDP)
jointGALPEDP.ts=ts(jointGALPEDP)
ts.plot(jointGALPEDP.ts, xlab="Period: 2019-2021", ylab="Price", main="Closing Values Share Prices (GALP,
EDP)")
lines(jointGALPEDP.ts[,1], col="red")
lines(jointGALPEDP.ts[,2], col="blue")
legend("topright", legend=c("GALP", "EDP"), col=c("red", "blue"), lty=1)

dataGALP = read.csv("./data/GALP.tsv", header=TRUE, sep="", dec=",")
dataEDP = read.csv("./data/EDP.tsv", header=TRUE, sep="", dec=",")
dataMOTAENGIL =read.csv("./data/MOTA ENGIL.tsv", header=TRUE, sep="", dec=",")
dataNOS = read.csv("./data/NOS.tsv", header=TRUE, sep="", dec=",")
dataNOVABASE = read.csv("./data/NOVABASE.tsv", header=TRUE, sep="", dec=",")
dataGALP = dataGALP[,5]
dataEDP = dataEDP[,5]
dataMOTAENGIL = dataMOTAENGIL[,5]
dataNOS = dataNOS[,5]
dataNOVABASE = dataNOVABASE[,5]
dataGALP=ts(dataGALP)
dataEDP=ts(dataEDP)
dataMOTAENGIL=ts(dataMOTAENGIL)
dataNOS=ts(dataNOS)
dataNOVABASE=ts(dataNOVABASE)
jointGEMNN=cbind(dataGALP, dataEDP, dataMOTAENGIL, dataNOS, dataNOVABASE)
jointGEMNN.ts=ts(jointGEMNN)
ts.plot(jointGEMNN.ts, xlab="Period: 2019-2021", ylab="Price", main="Closing Values Share Prices (GALP,
EDP, MOTA, NOS, NOVABASE)")
lines(jointGEMNN.ts[,1], col="red")
lines(jointGEMNN.ts[,2], col="blue")
lines(jointGEMNN.ts[,3], col="green")
lines(jointGEMNN.ts[,4], col="black")
lines(jointGEMNN.ts[,5], col="orange")
legend("topright", legend=c("GALP", "EDP", "MOTA ENGIL", "NOS", "NOVABASE"), col=c("red", "blue",
"green", "black", "orange"), lty=1)
