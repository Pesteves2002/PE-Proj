
mortdata <- read.csv("./data/ex3.csv", sep = ";", header = TRUE)
head(mortdata)
colnames(mortdata)
# paises<-colnames(mortdata)

install.packages("psych", dependencies = TRUE)
library("psych")
describe(mortdata)
head(describe(mortdata))

# b)
mortdata5 <- mortdata[c(2, 5, 14, 26, 28, 34)]
head(mortdata5)
summary(mortdata5)

par(mfrow = c(2, 3))
boxplot(mortdata[, 2], main = "UE27", ylab = "Taxa de mortalidade infantil")
boxplot(mortdata[, 5], main = "Alemanha", ylab = "Taxa de mortalidade infantil")
boxplot(mortdata[, 14], main = "Espanha", ylab = "Taxa de mortalidade infantil")
boxplot(mortdata[, 26], main = "Holanda", ylab = "Taxa de mortalidade infantil")
boxplot(mortdata[, 28], main = "Portugal", ylab = "Taxa de mortalidade infantil")
boxplot(mortdata[, 34], main = "Reino Unido", ylab = "Taxa de mortalidade infantil")

dev.new()
boxplot(mortdata[, 2], mortdata[, 5], mortdata[, 14], mortdata[, 26], mortdata[, 28], mortdata[, 34],
    ylab = "Taxa de mortalidade infantil"
)

dev.new()
par(mfrow = c(2, 3))
hist(mortdata[, 2], main = "UE27", xlab = "Taxa de mortalidade infantil", col = "darkmagenta")
hist(mortdata[, 5], main = "Alemanha", xlab = "Taxa de mortalidade infantil")
hist(mortdata[, 14], main = "Espanha", xlab = "Taxa de mortalidade infantil")
hist(mortdata[, 26], main = "Holanda", xlab = "Taxa de mortalidade infantil")
hist(mortdata[, 28], main = "Portugal", xlab = "Taxa de mortalidade infantil")
hist(mortdata[, 34], main = "Reino Unido", xlab = "Taxa de mortalidade infantil")

# c)
matplot(matrix(c(mortdata[2, c(2, 5, 14, 26, 28, 34)], mortdata[59, c(2, 5, 14, 26, 28, 34)]), 6, 2),
    type = "l",
    ylab = "Taxa media de mortalidade infantil", xlab = "1961 e 2018"
)


# d)
apply(mortdata[59, -c(1:4)], 1, mean)
apply(mortdata[59, -1], 1, median)
apply(mortdata[59, -1], 1, var)
apply(mortdata[59, -1], 1, sd) / apply(mortdata[59, -1], 1, mean)
# cvtaxa=sdtaxa/taxamedia

# e)

plot(mortdata[, 1], mortdata$PT,
    main = "Evolucao da mortalidade infantil em Pt",
    ylab = "Taxa Media", xlab = "anos", col = "red", pch = 16
) # type="l")
points(mortdata[, 1], mortdata$UE27, col = "blue", pch = 16)
leg_cols <- c("red", "blue")
leg_sym <- c(16, 16)
leg_lab <- c("Portugal", "UE")
legend(x = "topright", col = leg_cols, pch = leg_sym, legend = leg_lab, bty = "n")


# f)
read.table("ex3f.dat", header = TRUE)
pib2018 <- read.table("ex3f.dat", header = TRUE)$TaxaPIB

plot(pib2018, mortdata$PT[-c(1, 60)],
    xlab = "PIB: Taxa de crescimento real",
    ylab = "Taxa media de mortalidade infantil (1961 a 2018)"
)

cor(pib2018, mortdata$PT[-c(1, 60)])