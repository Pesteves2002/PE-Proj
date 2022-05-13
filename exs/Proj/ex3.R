library(readxl)
library(ggplot2)

Values <- read_excel ("data/QualidadeARO3.xlsx")

Almada <- Values[,"Laranjeiro-Almada"]
Entrecampos <- Values[,"Entrecampos"]
colnames(Almada)<- c("Valores")
colnames(Entrecampos)<- c("Valores")

Entrecampos$Valores <- as.numeric(Entrecampos$Valores)

m <- rbind(Almada,Entrecampos)
df <- data.frame("Locations" = rep(c("Laranjeiro-Almada","Entrecampos"), each=8784),"Valores" = m)

ggplot(df, aes(x=Valores, color=Locations, fill=Locations)) + geom_histogram(bins=200,alpha=0.2, position="identity")+
  labs(title="Frequency values of Ozone in Entrecampos and Laranjeiro-Almada in 2020",x="Values (Ozone Levels)", y = "Frequency")
