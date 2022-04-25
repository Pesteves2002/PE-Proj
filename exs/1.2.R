read.table("./data/ex2.dat", header = T)
cotinina <- read.table("./data/ex2.dat", header = T)
classes <- cotinina$classes
faFum <- cotinina$faFumadores
faNFum <- cotinina$faNFumadores
frFum <- faFum / 1539
frNFum <- faNFum / 3445
write.table(cbind(faFum, frFum, faNFum, frNFum))

matplot(matrix(c(cumsum(frFum), cumsum(frNFum)), length(frFum), 2),
    type = "l",
    ylab = "Distrib Freqs Cotinina", xlab = "Classes"
)

# b)
par(mfrow = c(2, 2))
barplot(faFum,
    names.arg = classes, main = "Fumadores", col = "gray",
    ylab = "Freq. Absol. Cotinina"
)
barplot(faNFum, names.arg = classes, main = "Nao Fumadores", ylab = "Freq. Absol. Cotinina", col = "black")
barplot(matrix(c(faFum / 1539, faNFum / 3445), 2, 8, byrow = T),
    beside = F, names.arg = classes,
    main = "Cotinina", ylab = "Freqs. Relat.", legend = c("Fumadores", "Nao Fumadores")
)
barplot(matrix(c(faFum / 1539, faNFum / 3445), 2, 8, byrow = T),
    beside = T, names.arg = classes,
    main = "Cotinina", ylab = "Freqs. Relat.", legend = c("Fumadores", "Nao Fumadores")
)

par(mfrow = c(1, 2))
pie(faFum / 1539, labels = classes)
pie(faNFum / 3445, labels = classes)
