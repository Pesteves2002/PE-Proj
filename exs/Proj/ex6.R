library(ggplot2)
library("Rmisc")

set.seed(1771)

samples <- 950

# Choose value for n
# n  <- 2
#n <- 30
n <- 84

lower <- 10
upper <- 14

media <- numeric()

for (m in 1:samples)
{
  value <- runif(n,lower,upper)
  
  mean_value <- mean(value)
  
  media <- append(media,mean_value)
  
}

expected <- (lower + upper)/2
variance <- 1/12 * (upper - lower)^2

df <- data.frame(media)

ggplot(df, aes(x=media )) +
  geom_histogram(aes(y = ..density..),colour = "black", fill = "white") +
  stat_function(fun = dnorm, args = list(mean = expected, sd = (sqrt(variance/n)))) +
  labs(title=paste("Mean value of Uniform Distribution (n=",toString(n),")"), x = "Value", y = "Density")

