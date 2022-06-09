library(ggplot2)

set.seed(191)

lambda1 <- 0.58
lambda2 <- 0.38
confidence <- 0.97
m <- 900
perc <- 0.1

alfa <- 1 - confidence
a <- qnorm(1 - alfa/2)

index <- numeric()
values_non_contaminated <- numeric()
values_contaminated <- numeric()


for (n in seq(from = 100 , to = 2500, by =100))
  {
  num_inf = n * perc
  ampls_non_contaminated <- 0
  ampls_contaminated <- 0
  for (i in 1:m) 
  {
    non_contaminated <- rexp(n,lambda1)
    contaminated <- rexp(num_inf,lambda2)
    contaminated <- c(contaminated, non_contaminated[(num_inf+1):n])
    
    mean_value_non_contaminated = 1/mean(non_contaminated)
    mean_value_contaminated = 1/mean(contaminated)
    
    calc_non_contaminated<- 2 * (a / sqrt(n)) * mean_value_non_contaminated

    calc_contaminated<-  2* (a / sqrt(n)) * mean_value_contaminated

    ampls_non_contaminated <- ampls_non_contaminated + calc_non_contaminated
    ampls_contaminated <- ampls_contaminated + calc_contaminated
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
  geom_line(aes(y = values_non_contaminated, color = "Non Contaminated")) +
  geom_line(aes(y = values_contaminated, color = "Contaminated")) +
  scale_color_manual(name = "Status", values = c('Non Contaminated' = 'green', 'Contaminated' = 'red')) +
  labs(title = "Mean value of Amplitude from n = 100 to n = 2500 of Contaminated and Non-Contaminated",x = "Value of n" , y = "Mean value of Amplitude")
