#dados pre-intalados o r
data(mtcars)
help("mtcars")

#como chama-los
mtcars

#mesmo forma que help
?hist
hist(mtcars$mpg)

#graficos de q-q(quantil-quantil ou "scatter")
?qqnorm
qqnorm(mtcars$mpg)

#para colocar a linha linear q-q
?qqline
qqline(mtcars$mpg)

#tabela de frequencia
?table
table(mtcars$gear)

#grafico de barras
barplot(mtcars$gear)

#tabela de frequencia de dados continuos
?cut
cut(mtcars$mpg,5)
cut(mtcars$mpg,seq(10,35,5))

#para criar intervalos em barras
barplot(table(cut(mtcars$mpg,seq(10,35,5))))