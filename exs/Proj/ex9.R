set.seed(361)

lambda <- 0.01

confidence <- 0.98

deviation <- sqrt(1/(lambda^2))


# Intervalo de confiança

# CI = confidence * (standart deviation/sqrt(n))

CIcalc <- function(lower, upper)
{
  return (confidence* (deviation/sqrt(n))*2 +  upper - lower)
  
  
}

index <- numeric()
values <- numeric()

for (i in 1:50)
{
  media <- 0
  n <- i * 100
  for (m in 1:650){
    
  a<- rexp(n,1.37)
  upper <- max(a)
  lower <- min(a)
  calc <- CIcalc(lower,upper)
  media <- media + calc
  }
  media <- media /650
  index <- append(index,n)
  values <- append(values,media)
  
}

table <- cbind(index,values)

df <- data.frame(table)

ggplot(df, aes(x=index, y=values )) +  geom_bar(stat="identity", position=position_dodge())
