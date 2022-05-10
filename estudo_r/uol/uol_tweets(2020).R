library(dplyr)
library(skimr)

uol=read.csv("/home/aus/Área de Trabalho/jupyter/pratica_dados-main/tweets_uol.csv")
skim(uol)

#porcentagem é usado um aolicativo
uol%>%
  group_by(source)%>%
  summarise(
    numero_tweets=n()
  )%>%
  mutate(
    numero_tweets_pct=numero_tweets/sum(numero_tweets)*100
  )

uol%>%
  summarise(
    media_likes=mean(favorite_count),
    media_ret=mean(retweet_count)
  )

uol%>%
  filter(favorite_count>1000)%>%
  summarise(numero_tweets=n())

#os com maior curtidas do uol
uol%>%
  arrange(desc(retweet_count))%>%
  slice_head(n=3)%>%
  select(screen_name,text,retweet_count)

uol%>%
  arrange(desc(favorite_count))%>%
  slice_head(n=3)%>%
  select(screen_name,text,favorite_count)

#numero de palavras usadas no tweets
uol%>%
  mutate(intervalo=cut(display_text_width#contador de palavras
                       ,seq(0, 280, 20)))%>%
  group_by(intervalo)%>%
  summarise(numero_tweets=n())
