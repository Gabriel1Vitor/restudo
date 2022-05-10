india=read.csv('/home/aus/Área de Trabalho/jupyter/india_populaçao/india_population.csv')
g<-india['Population']
sum(india['Population'])
india[3:4,5:9]
g$Year=india['Year']


library(skimr)
skim(india)

#sumario  
summary(india)

#pode escolher coluna ou a tabela inteira para somar,minimo,maximo,mean,median
?sum
mean(india)
min(india$Population)
