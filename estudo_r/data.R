#biblioteca simplifica e ajuda no uso de horas e dias
library(lubridate)

library(dplyr)
uol=read.csv("/home/aus/Área de Trabalho/jupyter/pratica_dados-main/tweets_uol.csv")
data="05-10-2020"

#uma forma para ver qual o tipo de informaçao
str(data)

#tranformaçao do pacote
ld=dmy(data)

#a forma natural do r
d=as.Date(data,format="%m-%d-%Y")

#so funciona de 2000 para frente
data2="04-10-00"
ld2=mdy(data2)

#pode escolher o mes,dia,ano
day(ld2)

#qual a semana do ano 
week(ld2)

#se é uma segunda,terça e etc...
weekdays(ld2)

data3="12-09-1903 21:02:12"

# tranformaçao tanto do dia e hora
ldh=dmy_hms(data3)

# mostra a hora ,minutos e segundos
hour(ldh)

#tranformaçao em um dataset inteiro
uol%>%
  mutate(created_at=ymd_hms(created_at)
         )%>%
  select(created_at)%>%
  slice_tail(n=5)


uol%>%
  mutate(created_at=ymd_hms(created_at),
         hora_publicado=hour(created_at)
  )%>%
  group_by(hora_publicado)%>%
  summarise(
    numero_tweets=n()
  )%>%
  arrange(desc(numero_tweets))