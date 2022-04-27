library(readxl)
library(ggplot2)

Values <- read_excel ("data/QualidadeARO3.xlsx")

Almada <- Values[,"Laranjeiro-Almada"]
Entrecampos <- Values[,"Entrecampos"]

colnames(Almada)<- c("Valores")
colnames(Entrecampos)<- c("Valores")

Entrecampos$Valores <- as.numeric(Entrecampos$Valores)

m <- rbind(Almada,Entrecampos)

df <- data.frame("loc" = rep(c("Laranjeiro-Almada","Entrecampos"), each=8784),
                "Valores" = m)

ggplot(df, aes(x=Valores, color=loc)) + geom_histogram(bins=400,alpha=0.5, position="identity",fill="white")



