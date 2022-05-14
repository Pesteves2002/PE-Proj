library(ggplot2)
set.seed(361)

lambda <- 0.01
confidence <- 0.98
m <- 650

# Intervalo de confiança

# CI = confidence * (standart deviation/sqrt(n))
CIcalc <- function(vector)
{
  len <- length(vector)
  sd_vec <- sd(vector)
  value <- qt((confidence + 1)/2, df = n - 1)
  return (value * sd_vec/sqrt(len)*2)
}


index <- numeric()
values <- numeric()

for (i in 1:150)
{
  media <- 0
  n <- i * 100
  for (l in 1:m){
  vector<- rexp(n,lambda)
  calc <- CIcalc(vector)
  media <- media + calc
  }
  media <- media/m
  index <- append(index,n)
  values <- append(values,media)
  
}

table <- cbind(index,values)
df <- data.frame(table)

ggplot(df, aes(x=index, y=values )) +  geom_line(stat="identity", position=position_dodge())+
  labs(title="Mean value of Amplitude from n = 100 to n = 5000", x= "Value of n", y = "Mean value of Amplitude")

