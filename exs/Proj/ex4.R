library(readxl)
library(ggplot2)

Values <- read_excel ("data/Utentes.xlsx")


IMC <- Values["IMC"]
TAD <- Values["TAD"]

df <- data.frame(IMC,TAD)

ggplot (df, aes(x = IMC, y = TAD)) + geom_point() +geom_smooth(method=lm, se=FALSE, fullrange=TRUE)
