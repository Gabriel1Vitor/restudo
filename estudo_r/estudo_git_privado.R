#para buscar daset direto na pasta
df_state=read.csv(file.choose())
df_state[3:5,5:2]
str(df_state)

#para ler excel"xlsx"
install.packages("readxl")
library(readxl)
read_excel()

# um analise de datasets inteiros
install.packages("skimr")
library(skimr)

skim(df_state)

#acesar base de dados(pre-sets) do r
data()

#existe base de dados em bibliotecas tambem 
data(package="dplyr")
library(dplyr)
starwars

#graficos mais detalhados
install.packages("ggplot2")


