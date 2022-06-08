set.seed(595)
lambda <- 1.37
m <-650
n <- 1234
confidence <- 0.91
alfa <- 1 - confidence
a <- qnorm(1 - alfa/2)

media <- 0
for (i in 1:m)
{
  vector<- rexp(n,lambda)
  mean_value = 1/mean(vector)
  calc <- 2 * (a / sqrt(n)) * mean_value
  media <- media + calc
}
result <- media / m
result
