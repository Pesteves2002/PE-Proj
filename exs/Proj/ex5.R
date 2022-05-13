set.seed(273)

lambda <- 0.13
n <- 162
num <- 3

values <- rexp(n, lambda)
T <- 1 - pexp(num, rate = lambda)
E <- 1 - ecdf(values)(num)
abs(T - E)
