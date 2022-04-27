set.seed(595)

lambda <- 1.37

confidence <- 0.91

n <- 1234 


deviation <- sqrt(1/(lambda^2))



# Intervalo de confiança

# CI = confidence * (standart deviation/sqrt(n))


media <- 0

for (i in 1:650)
{
  a<- rexp(n,1.37)
  upper <- max(a)
  lower <- min(a)
  calc <- CIcalc(lower,upper)
  media <- media + calc
  
}




CIcalc <- function(lower, upper)
{
    return (confidence* (deviation/sqrt(n))*2 +  upper - lower)
  
  
}

# Média da amplitude dos intervalos de confiança


result <- media / 650

