library(ggplot2)

set.seed(1222)

samples <- 1520

# Choose value for n
 n  <- 2
# n <- 30
# n <- 84

lower <- 11
upper <- 15

media <- numeric()

for (x in 1:samples)
{
  value <- runif(n,lower,upper)
  
  mean_value <- MediaCalq(value)
  
  media <- append(media,mean_value)
  
}

expected <- (lower + upper)/2
variance <- 1/12 * (upper - lower)^2


df <- data.frame(media)

ggplot(df, aes(x=media)) + geom_histogram(colour = "black", 
                                          fill = "white") + stat_function(fun =function(media) dnorm(media , mean = expected, sd = variance))



MediaCalq <- function(x)
{
  sum <- 0
  num <- 0
  for (el in x)
  {
    sum <- sum + el
    num <- num +1
  }
  return (sum / num)
}

