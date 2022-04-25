library(ggplot2)


comp <- c(5.1, 4.9, 4.7)
larg <- c(3.5, 3.0, 3.2)
df1 <- data.frame(comp, larg)
ggplot(data = df, aes(x = comp, y = larg)) +
    geom_line()
ggplot(data = df, aes(x = comp, y = larg)) +
    geom_point()
spec <- rep("a", 3)
cbind(df1, spec)
df1 <- cbind(df1, spec)
str(df1)

compr <- c(6.1, 6.9, 6.7)
larg <- c(4.5, 4.0, 4.2)
spec <- rep("b", 3)
df2 <- data.frame(compr, larg, spec)

df <- rbind(df1, df2)
colnames(df1)
colnames(df2) <- colnames(df1)
df <- rbind(df1, df2)
ggplot(data = df, aes(x = comp, y = larg)) +
    geom_point(aes(color = spec, shape = spec))
ggplot(data = df, aes(x = comp, y = larg)) +
    geom_boxplot(aes(fill = spec))