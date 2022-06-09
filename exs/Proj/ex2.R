library(readxl)
library(ggplot2)
library("scales")

Values <- read_excel ("data/EsperancaVida.xlsx")

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

Total <- data.frame( Anos,BelgicaHomem, BelgicaMulher, BaixosHomem, BaixosMulher, EsloHomem, EsloMulher)
colnames(Total) <- c("Year", "Belgium_M", "Belgium_F", "Netherlands_M", "Netherlands_F", "Slovakia_M", "Slovakia_F" )

ggplot(Total , aes(x = Year))+ 
  geom_line(aes(y = Belgium_M, color = "Belgium Male")) +
  geom_line(aes(y = Belgium_F, color = "Belgium Female")) +
  geom_line(aes(y = Netherlands_M, color = "Netherlands Male")) +
  geom_line(aes(y = Netherlands_F, color = "Netherlands Female") )+
  geom_line(aes(y = Slovakia_M, color = "Slovakia Male")) +
  geom_line(aes(y = Slovakia_F, color = "Slovakia Female") )+
  scale_color_manual(name = "Countries", values = c('Belgium Male' = 'black', 'Belgium Female' = 'red',
                                                  'Netherlands Male' ='green','Netherlands Female' = 'blue',
                                                  'Slovakia Male' = 'purple', 'Slovakia Female'='brown')) +
  labs(title = "Life expectancy of Belgium, Netherlands and Slovakia",x = "Year" , y = "Life Expectancy")
