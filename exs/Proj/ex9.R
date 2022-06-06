library(ggplot2)
library("Rmisc")
set.seed(361)

lambda <- 0.01
confidence <- 0.98
m <- 650

index <- numeric()
values <- numeric()

for (i in 1:50)
{
  media <- 0
  n <- i * 100
  for (l in 1:m){
  vector<- rexp(n,lambda)
  calc <- CI(vector,confidence)
  media <- media + abs(calc["upper"] - calc["lower"])
  }
  media <- media/m
  index <- append(index,n)
  values <- append(values,media)
  
}

table <- cbind(index,values)
df <- data.frame(table)

ggplot(df, aes(x=index, y=values )) +  geom_line(stat="identity", position=position_dodge(),color="blue")+
  labs(title="Mean value of Amplitude from n = 100 to n = 5000", x= "Value of n", y = "Mean value of Amplitude")

