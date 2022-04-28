set.seed(191)

lambda <- 0.58

confidence <- 0.97

deviation <- sqrt(1/(lambda^2))


# Intervalo de confiança

# CI = confidence * (standart deviation/sqrt(n))

CIcalc <- function(lower, upper)
{
  return (confidence* (deviation/sqrt(n))*2 +  upper - lower)
}

CalcError <- function(els, mean)
{
  error <- 0
  n <- 0
  for (el in els)
  {
    error <- error + (el - mean)^2
    n <- n +1
  }
  error <- sqrt(error/(n-1))
  print(error)
  return(error)
  
}

index <- numeric()
values <- numeric()
infected <- numeric()


for (i in 1:25)
{
  numbers <- numeric()
  media <- 0
  n <- i * 100
  for (m in 1:900){
    
    a<- rexp(n,0.58)
    upper <- max(a)
    lower <- min(a)
    calc <- CIcalc(lower,upper)
    error <-  CalcError(a, mean(a))
    if (error  == 0.1) {
      a<- rexp(n,0.38)
      upper <- max(a)
      lower <- min(a)
      calc <- CIcalc(lower,upper)
      infected <- append(infected,1)
    }
    else {
      infected <- append(infected,0)
      }
    media <- media + calc
  }
  media <- media /900
  index <- append(index,n)
  values <- append(values,media)
  
}

table <- cbind(index,values,infected)

df <- data.frame(table)

ggplot(df, aes(x=index, y=values, fill= infected)) +  geom_bar(stat="identity", position=position_dodge())


# epsilon = sqrt(((sum (xi - m+edia)^2)/(n-1))/n)

