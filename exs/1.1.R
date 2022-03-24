
pesobici <- c(
    4.3, 6.8, 9.2, 7.2, 8.7, 8.6, 6.6, 5.2, 8.1, 10.9,
    7.4, 4.5, 3.8, 7.6, 6.8, 7.8, 8.4, 7.5, 10.5, 6.0,
    7.7, 8.1, 7.0, 8.2, 8.4, 8.8, 6.7, 8.2, 9.4, 7.7,
    6.3, 7.7, 9.1, 7.9, 7.9, 9.4, 8.2, 6.7, 8.2, 6.5
)

summary(pesobici)
mean(pesobici)
median(pesobici)
var(pesobici)
sd(pesobici)
range(pesobici)

# b)
quantile(pesobici, c(0.25, 0.5, 0.75))
IQR(pesobici)
quantile(pesobici, type = 1)
quantile(pesobici, type = 2)
?quantile

# c)
quantile(pesobici, 0.68)

# d)
stem(pesobici)
table(pesobici)
table(cut(pesobici, breaks = c(3, 4, 5, 6, 7, 8, 9, 10, 11), right = F))

# e)
par(mfrow = c(1, 2))
hist(pesobici, col = "red")
hist(pesobici, plot = FALSE)
boxplot(pesobici, col = "red", main = "Boxplot of pesocaes")
boxplot(pesobici, plot = FALSE)
?hist
?boxplot
# outliers
pesobici[(pesobici < quantile(pesobici, 0.25, type = 2) - IQR(pesobici, type = 2) * 1.5) | (pesobici > quantile(pesobici, 0.75, type = 2) + IQR(pesobici, type = 2) * 1.5)]