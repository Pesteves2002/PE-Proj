library(readxl)
library(ggplot2)

Values <- read_excel ("data/ResiduosPerCapita.xlsx")
colnames(Values)<- c("Countries","2004","2018")

Data2004 <- Values[,"2004"]
Data2018 <- Values[,3]
Chipre2004 <- as.numeric(Data2004[11,])
Chipre2018 <- as.numeric(Data2018[11,])
Polonia2004 <- as.numeric(Data2004[29,])
Polonia2018 <- as.numeric(Data2018[29,])
Luxemburgo2004 <- as.numeric(Data2004[26,])
Luxemburgo2018 <- as.numeric(Data2018[26,])

ChipreValues <- cbind(Chipre2004,Chipre2018)
PoloniaValues <- cbind(Polonia2004,Polonia2018)
LuxemburgoValues <- cbind(Luxemburgo2004,Luxemburgo2018)

ShowValues <- rbind(ChipreValues,PoloniaValues,LuxemburgoValues)
countries <- c(rep("Chipre",2), rep("Polonia", 2), rep("Luxemburgo",2))
year <- rep(c("2004","2018"),3)
rownames(ShowValues) <- c("Chipre", "Polonia", "Luxemburgo")

Total <- data.frame(Year = rep(c("2004","2018"), each = 3),
                   Country = rep(c("Cyprus","Poland", "Luxembourg"),2),
                   Residue= c(Chipre2004,Polonia2004,Luxemburgo2004,Chipre2018,Polonia2018,Luxemburgo2018))

ggplot(Total, aes(x= Country, y =Residue, fill= Year)) + geom_bar(stat="identity", position=position_dodge())+
labs(title="Residue per Capita in 2004 and 2018",x="Countries", y = "Residue per Capita")
