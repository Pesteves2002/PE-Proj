dataGALP = read.csv("./data/GALP.tsv", header=TRUE, sep="", dec=",")
dataGALP = dataGALP[,5]
dataGALP=ts(dataGALP)
ts.plot(dataGALP, xlab="Period: 2019-2021", ylab="Price", main="Closing Values Share Prices (GALP
ENERGIA)")
logreturnGALP = as.ts(diff(log(dataGALP)))
ts.plot(logreturnGALP, xlab="Period: 2019-2021", ylab="log-returns", main="Log-RETURNS (GALP
ENERGIA)")