set.seed(595)

lambda <- 1.37

confidence <- 0.91
alfa <- 1 - confidence

n <- 1234 
m <- 650

value <- qt((confidence + 1)/2, df = n - 1)

deviation <- sqrt(1/(lambda^2))

# Intervalo de confiança

# CI = confidence * (standart deviation/sqrt(n))

# calcula o sd, o tamanho, media,
CIcalc <- function(vector)
{
  len <- length(vector)
  sd_vec <- sd(vector)

    return (value * sd_vec/sqrt(len)*2)
}

media <- 0

for (i in 1:m)
{
  vector<- rexp(n,lambda)
  calc <- CIcalc(vector)
  media <- media + calc
}

# Média da amplitude dos intervalos de confiança


result <- media / m

result

qnorm(1 - alfa/2,lower.tail = FALSE)

