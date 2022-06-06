set.seed(595)
library("Rmisc")
lambda <- 1.37
m <-650
n <- 1234
confidence <- 0.91
media <- 0

for (i in 1:m)
{
  vector<- rexp(n,lambda)
  calc <- CI(vector, confidence)

  media <- media + abs(calc["upper"] - calc["lower"])
}

# Média da amplitude dos intervalos de confiança


result <- media / m

result