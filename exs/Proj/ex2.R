library(readxl)
library(ggplot2)
library("scales")

Values <- read_excel ("data/EsperancaVida.xlsx")



# belgica, paises baixos, eslovaquia

Anos <- Values[48:65,1]
Anos <- lapply(Anos, as.double)


BelgicaHomem <- Values[48:65, 41]
BelgicaHomem <- lapply(BelgicaHomem,as.double)

BaixosHomem <- Values[48:65,60]
BaixosHomem <- lapply(BaixosHomem,as.double)

EsloHomem <- Values[48:65,46]
EsloHomem <- lapply(EsloHomem,as.double)

BelgicaMulher <- Values[48:65, 75]
BelgicaMulher <- lapply(BelgicaMulher,as.double)

BaixosMulher <- Values[48:65,94]
BaixosMulher <- lapply(BaixosMulher,as.double)

EsloMulher <- Values[48:65, 80]
EsloMulher <- lapply(EsloMulher,as.double)


# cor = Pais, x = ano, distinguir = mulher, y = valor

Total <- data.frame( Anos,BelgicaHomem, BelgicaMulher, BaixosHomem, BaixosMulher, EsloHomem, EsloMulher)

colnames(Total) <- c("Year", "Expectancy", "Belgium-F", "Netherlands-M", "Netherlands-F", "Slovakia-M", "Slovakia-F" )



ggplot(Total , aes(x = Year))+ 
  geom_point(aes(y = Expectancy), color = "black") +
  geom_point(aes(y = Total[,3]), color = "red") +
  geom_point(aes(y = Total[,4]), color = "green") +
  geom_point(aes(y = Total[,5]), color = "blue") +
  geom_point(aes(y = Total[,6]), color = "purple") +
  geom_point(aes(y = Total[,7]), color = "brown") 


