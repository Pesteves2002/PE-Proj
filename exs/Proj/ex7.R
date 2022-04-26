set.seed(1207)

media <- numeric()


for (x in 1:6230)
{
  a <- rbinom(2,47,0.89)
  valor <- (a[1] + a[2])/2
  media <- append(media, valor)
}

result <- 0

for (value in media)
{
  result <- result + value 
}

result <- result / 6230


expected <- 2*0.89

resposta <- result - expected

# Média das médias
# Valor esperado - E[x] = np

