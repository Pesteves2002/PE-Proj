library(ggplot2)
library(openxlsx)
library(gganimate)


mortes <- read.xlsx("./data/MortesPortugal.xlsx")

graph2 <- ggplot(data = mortes, aes(x = date, y = new_deaths)) +
    geom_line() +
    geom_point(colour = "blue") +
    transition_reveal(along = date)