library(readxl)
library(ggplot2)
library("scales")

Values <- read_excel ("data/EsperancaVida.xlsx")



# belgica, paises baixos, eslovaquia

Anos <- Values[6:66,1]

colnames(Anos)<- c("Year")

BelgicaHomem <- Values[6:66, 41]

colnames(BelgicaHomem)<- c("Expectancy")

BaixosHomem <- Values[6:66,60]

colnames(BaixosHomem)<- c("Value2")


EsloHomem <- Values[6:66,46]

colnames(EsloHomem)<- c("Value3")


BelgicaMulher <- Values[6:66, 75]

colnames(BelgicaMulher)<- c("Value4")


BaixosMulher <- Values[6:66,94]
colnames(BaixosMulher)<- c("Value5")


EsloMulher <- Values[6:66, 80]

colnames(EsloMulher)<- c("Value6")


# cor = Pais, x = ano, distinguir = mulher, y = valor

Total <- data.frame( Year = Anos,
                      y1 = BelgicaHomem, y2 = BelgicaMulher, y3 = BaixosHomem, y4 = BaixosMulher, y5 = EsloHomem, y6 = EsloMulher)

ggplot(Total , aes(Year))+ 
  geom_point(aes(y = Expectancy), color = "black") +
  geom_point(aes(y = Value2), color = "red") +
  geom_point(aes(y = Value3), color = "green") +
  geom_point(aes(y = Value4), color = "blue") +
  geom_point(aes(y = Value5), color = "purple") +
  geom_point(aes(y = Value6), color = "brown") +

