set.seed(273)

lambda <- 0.13
n <- 162
num <- 3

amostra <- rexp(n,lambda)

# funcao de distribuicao para x maior q 3

dist <- ecdf(amostra);

calc_prob <- function(x)
{
    if (x < 0 )
      return (0)
  
    return (1 - exp(-x * lambda))
  
}

estimated <-  (1 - calc_prob(num))

# Valor teórico = Valor esperado (?)

theoric <- 1/0.13

# Result

result <- abs(estimated - theoric)

# result = 7,0152508

