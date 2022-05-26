library(ggplot2)
library("Rmisc")

set.seed(191)

lambda1 <- 0.58
lambda2 <- 0.38
confidence <- 0.97
m <- 900
perc <- 0.1
# Intervalo de confiança
# CI = confidence * (standart deviation/sqrt(n))
CIcalc <- function(vector)
{
  len <- length(vector)
  sd_vec <- sd(vector)
  value <- qt((confidence + 1)/2, df = n - 1)
  return (value * sd_vec/sqrt(len)*2)
}

index <- numeric()
values_non_infected <- numeric()
values_infected <- numeric()


for (n in seq(from = 100 , to = 2500, by =100))
  {
  num_inf = n * perc
  ampls_infected <- 0
  ampls_non_infected <- 0
  for (i in 1:m) 
  {
    non_infected <- rexp(n,lambda1)
    infected <- rexp(num_inf,lambda2)
    infected <- c(infected, non_infected[(num_inf+1):n])
    
    
    CI_non_infected <- CIcalc(non_infected)
    CI_infected <- CIcalc(infected)
    ampls_infected <- ampls_infected + CI_infected  
    ampls_non_infected <- ampls_non_infected + CI_non_infected
  }
    index <- append(index,n)
    ampls_non_infected <- ampls_non_infected/m
    ampls_infected <- ampls_infected/m
    
    values_non_infected <- append(values_non_infected,ampls_non_infected )
    values_infected <- append(values_infected,ampls_infected )

  }
  

table <- cbind(index,values_non_infected,values_infected)

df <- data.frame(table)

ggplot(df, aes(x=index)) + 
  geom_line(aes(y = values_non_infected, color = "Non Infected")) +
  geom_line(aes(y = values_infected, color = "Infected")) +
  scale_color_manual(name = "Status", values = c('Non Infected' = 'green', 'Infected' = 'red')) +
  labs(title = "Mean value of Amplitude from n = 100 to n = 2500 of infected and non-infected",x = "Value of n" , y = "Mean value of Amplitude")


