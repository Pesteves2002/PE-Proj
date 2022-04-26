set.seed(273)

dist <- rexp(162,0.13)

# funcao de distribuicao para x maior q 3

dist <- function(x)
{
    if (x < 0 )
      return (0)
  
    return (1 - exp(-x * 0.13))
  
}

value <-  (1 - dist(4))

# Valor teórico = Valor esperado (?)

expected <- 1/0.13

# Result

result <- value- expected

