set.seed(595)

lambda <- 1.37

confidence <- 0.91

n <- 1234 

rexp(m,1.37)

deviation <- sqrt(1/(lambda^2))

# Intervalo de confiança

# CI = confidence * (standart deviation/sqrt(n))


CIcalc <- function()
{
    return (confidence* (deviation/sqrt(n)))
  
  
}

# Média da amplitude dos intervalos de confiança


result <- CIcalc()