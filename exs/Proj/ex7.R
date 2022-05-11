set.seed(1207)

samples <- 6230
size <- 47
p <- 0.89
n <- 2

media <- numeric()


for (x in 1:samples)
{
  dist <- rbinom(n,size,p)
  median_value <- median(dist)
  media <- append(media, median_value)
}

result <- median(media)

expected <- n * p

result <- abs(result - expected)

# Média das médias
# Valor esperado - E[x] = np

