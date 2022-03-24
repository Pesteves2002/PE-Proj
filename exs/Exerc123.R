#Exercicio 1.1
#a)

pesobici<-c(4.3,6.8,9.2,7.2,8.7,8.6,6.6,5.2,8.1,10.9,
7.4,4.5,3.8,7.6,6.8,7.8,8.4,7.5,10.5,6.0,
7.7,8.1,7.0,8.2,8.4,8.8,6.7,8.2,9.4,7.7,
6.3,7.7,9.1,7.9,7.9,9.4,8.2,6.7,8.2,6.5)

summary(pesobici)
mean(pesobici)
median(pesobici)
var(pesobici)
sd(pesobici)
range(pesobici)

#b)
quantile(pesobici,c(0.25,0.5,0.75))
IQR(pesobici)
quantile(pesobici,type=1)
quantile(pesobici,type=2)
?quantile

#c)
quantile(pesobici,0.68)

#d)
stem(pesobici)
table(pesobici)
table(cut(pesobici,breaks=c(3,4,5,6,7,8,9,10,11),right=F))

#e)
par(mfrow=c(1,2))
hist(pesobici, col="red")
hist(pesobici, plot=FALSE)
boxplot(pesobici, col="red", main="Boxplot of pesocaes")
boxplot(pesobici, plot=FALSE)
?hist
?boxplot
#outliers
pesobici[(pesobici<quantile(pesobici,0.25,type=2)-IQR(pesobici,type=2)*1.5)|(pesobici>quantile(pesobici,0.75,type=2)+IQR(pesobici,type=2)*1.5)]


#Exercicio 1.2.
#a)
read.table("ex2.dat",header=T)
cotinina=read.table("ex2.dat",header=T)
classes=cotinina$classes
faFum<-cotinina$faFumadores
faNFum<-cotinina$faNFumadores
frFum<-faFum/1539
frNFum<-faNFum/3445
write.table(cbind(faFum,frFum,faNFum,frNFum))

matplot(matrix(c(cumsum(frFum),cumsum(frNFum)),length(frFum),2),type="l",
ylab="Distrib Freqs Cotinina",xlab="Classes")

#b)
par(mfrow=c(2,2))
barplot(faFum,names.arg=classes,main="Fumadores",col="gray",
ylab="Freq. Absol. Cotinina")
barplot(faNFum,names.arg=classes,main="Nao Fumadores",ylab="Freq. Absol. Cotinina",col="black")
barplot(matrix(c(faFum/1539,faNFum/3445),2,8,byrow=T),beside=F,names.arg=classes,
	main="Cotinina",ylab="Freqs. Relat.",legend=c("Fumadores", "Nao Fumadores"))
barplot(matrix(c(faFum/1539,faNFum/3445),2,8,byrow=T),beside=T,names.arg=classes,
	main="Cotinina",ylab="Freqs. Relat.",legend=c("Fumadores", "Nao Fumadores"))

par(mfrow=c(1,2))
pie(faFum/1539,labels=classes)
pie(faNFum/3445,labels=classes)



#Exercicio 1.3.
#a)
mortdata<-read.csv("ex3.csv",sep=";", header=TRUE)
head(mortdata)
colnames(mortdata)
#paises<-colnames(mortdata)

#install.packages("psych")
library("psych")
describe(mortdata)
head(describe(mortdata))

#b) 
mortdata5=mortdata[c(2,5,14,26,28,34)]
head(mortdata5)
summary(mortdata5)

par(mfrow=c(2,3))
	boxplot(mortdata[,2], main = "UE27", ylab = "Taxa de mortalidade infantil")
	boxplot(mortdata[,5], main = "Alemanha", ylab = "Taxa de mortalidade infantil" )
	boxplot(mortdata[,14], main = "Espanha", ylab = "Taxa de mortalidade infantil" )
	boxplot(mortdata[,26], main = "Holanda", ylab = "Taxa de mortalidade infantil" )
	boxplot(mortdata[,28], main = "Portugal", ylab = "Taxa de mortalidade infantil" )
	boxplot(mortdata[,34], main = "Reino Unido", ylab = "Taxa de mortalidade infantil" )

dev.new()
boxplot(mortdata[,2],mortdata[,5],mortdata[,14],mortdata[,26],mortdata[,28],mortdata[,34],
	ylab = "Taxa de mortalidade infantil")

dev.new()
par(mfrow=c(2,3))
	hist(mortdata[,2], main = "UE27", xlab = "Taxa de mortalidade infantil", col="darkmagenta")
	hist(mortdata[,5], main = "Alemanha", xlab = "Taxa de mortalidade infantil" )
	hist(mortdata[,14], main = "Espanha", xlab = "Taxa de mortalidade infantil" )
	hist(mortdata[,26], main = "Holanda", xlab = "Taxa de mortalidade infantil" )
	hist(mortdata[,28],  main = "Portugal", xlab = "Taxa de mortalidade infantil" )
	hist(mortdata[,34], main = "Reino Unido", xlab = "Taxa de mortalidade infantil" )

#c)
matplot(matrix(c(mortdata[2,c(2,5,14,26,28,34)],mortdata[59,c(2,5,14,26,28,34)]),6,2),type="l",
	ylab="Taxa media de mortalidade infantil",xlab="1961 e 2018")


#d)
apply(mortdata[59,-c(1:4)],1,mean)
apply(mortdata[59,-1],1,median)
apply(mortdata[59,-1],1,var)
apply(mortdata[59,-1],1,sd)/apply(mortdata[59,-1],1,mean)
#cvtaxa=sdtaxa/taxamedia

#e)

plot(mortdata[,1],mortdata$PT, main="Evolucao da mortalidade infantil em Pt",
	ylab="Taxa Media", xlab="anos",col="red", pch=16)# type="l")
	points(mortdata[,1],mortdata$UE27, col="blue", pch=16)
	leg_cols <- c("red", "blue")
	leg_sym <- c(16, 16)
	leg_lab <- c("Portugal", "UE")
	legend(x = "topright", col = leg_cols, pch = leg_sym, legend = leg_lab, bty = "n")


#f)
read.table("ex3f.dat", header=TRUE)
pib2018<-read.table("ex3f.dat", header=TRUE)$TaxaPIB

plot(pib2018,mortdata$PT[-c(1,60)],xlab="PIB: Taxa de crescimento real",
	ylab="Taxa media de mortalidade infantil (1961 a 2018)")

cor(pib2018,mortdata$PT[-c(1,60)])

######  Exemplos: data frame & ggplot

comp<-c(5.1,4.9,4.7)
larg<-c(3.5,3.0,3.2)
df1=data.frame(comp,larg)
ggplot(data=df,aes(x=comp,y=larg))+geom_line()
ggplot(data=df,aes(x=comp,y=larg))+geom_point()
spec<-rep("a",3)
cbind(df1,spec)
df1=cbind(df1,spec)
str(df1)

compr<-c(6.1,6.9,6.7)
larg<-c(4.5,4.0,4.2)
spec<-rep("b",3)
df2=data.frame(compr,larg,spec)

df=rbind(df1,df2)
colnames(df1)
colnames(df2)<-colnames(df1)
df=rbind(df1,df2)
ggplot(data=df,aes(x=comp,y=larg))+geom_point(aes(color=spec,shape=spec))
ggplot(data=df,aes(x=comp,y=larg))+geom_boxplot(aes(fill=spec))






