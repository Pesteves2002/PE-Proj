library(ggplot2)
library("Rmisc")

set.seed(191)

lambda1 <- 0.58
lambda2 <- 0.38
confidence <- 0.97
m <- 900
perc <- 0.1

index <- numeric()
values_non_contaminated <- numeric()
values_contaminated <- numeric()


for (n in seq(from = 100 , to = 2500, by =100))
  {
  num_inf = n * perc
  ampls_contaminated <- 0
  ampls_non_contaminated <- 0
  for (i in 1:m) 
  {
    non_contaminated <- rexp(n,lambda1)
    contaminated <- rexp(num_inf,lambda2)
    contaminated <- c(contaminated, non_contaminated[(num_inf+1):n])
    
    
    CI_non_contaminated <- CI(non_contaminated,confidence)
    CI_contaminated <- CI(contaminated,confidence)
    ampls_contaminated <- ampls_contaminated + abs(CI_contaminated["upper"] - CI_contaminated["lower"])   
    ampls_non_contaminated <- ampls_non_contaminated + abs(CI_non_contaminated["upper"] - CI_non_contaminated["lower"]) 
  }
    index <- append(index,n)
    ampls_non_contaminated <- ampls_non_contaminated/m
    ampls_contaminated <- ampls_contaminated/m
    
    values_non_contaminated <- append(values_non_contaminated,ampls_non_contaminated )
    values_contaminated <- append(values_contaminated,ampls_contaminated )

  }
  

table <- cbind(index,values_non_contaminated,values_contaminated)

df <- data.frame(table)

ggplot(df, aes(x=index)) + 
  geom_line(aes(y = values_non_contaminated, color = "Non contaminated")) +
  geom_line(aes(y = values_contaminated, color = "contaminated")) +
  scale_color_manual(name = "Status", values = c('Non contaminated' = 'green', 'contaminated' = 'red')) +
  labs(title = "Mean value of Amplitude from n = 100 to n = 2500 of contaminated and non-contaminated",x = "Value of n" , y = "Mean value of Amplitude")


