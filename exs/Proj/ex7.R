set.seed(1207)

samples <- 6230
size <- 47
p <- 0.89
n <- 2

media <- numeric()


for (x in 1:samples)
{
  dist <- rbinom(size,n,p)
  median_value <- mean(dist)
  media <- append(media, median_value)
}

result <- mean(media)

expected <- n * p

result <- abs(result - expected)

result

# Média das médias
# Valor esperado - E[x] = np

