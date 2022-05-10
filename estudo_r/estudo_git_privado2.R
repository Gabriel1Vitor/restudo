library(dplyr)
data("starwars")

#forma nativa para separar uma palavra de uma coluna
starwars[starwars$homeworld=="Tatooine"&!is.na(starwars$homeworld),]

#mesmo comando so que dplyr
starwars %>%
   filter(homeworld=="Tatooine")

#filtrando duas palavras
starwars %>%
  filter(homeworld=="Tatooine",species=="Droid")

#escolhendo dodas as linhas com NA da tabela
starwars %>%
  filter(is.na(homeworld))

#todas as linhas dos humanos e androides 
starwars %>%
  filter(species %in% c("Human","Droid"))

#todas as linhas menos os humanos e androides
starwars %>%
  filter(!species %in% c("Human","Droid"))

#tranformaçao de altuda em cm para metros
starwars %>%
   mutate(
    height=height/100
   )

starwars %>%
  mutate(
   peso_100=ifelse(mass> 100,"Sim","Nao")
  )%>%
    #select no final so seleciona na tabela,os nomes escritos  
   select(name,mass,peso_100)

#substituiçao dos NA da coluna 
starwars %>%
  mutate(
    hair_color=ifelse(is.na(hair_color),"desconhecido",hair_color),
    .keep="none")#parametro de onde fica a coluna apos se chamada

starwars %>%
  mutate(
    peso_100=ifelse(mass> 100,"Sim","Nao"),
    .before="name")#na frente da coluna escrita

starwars %>%
  mutate(
    peso_100=ifelse(mass> 100,"Sim","Nao"),
    .after="name"#atras da coluna
  )

#do menor para o maior da coluna selecionada
starwars %>%
  arrange(height)

#do maior do menor
starwars %>%
  arrange(-height)

#decrescente
starwars %>%
  arrange(desc(height))

starwars %>%
  arrange(hair_color,height)

#pega as primeiras linhas 
starwars %>%
  arrange(height)%>%
  slice_head(n=3)

#ultimas
starwars %>%
  filter(!is.na(height))%>%
  arrange(height)%>%
  slice_tail(n=3)

#aleatorio
starwars%>%
  slice_sample(n=9)

#dplyr considera o NA como menor medida
starwars%>%
  summarise(#resuma tabela
    personagem=n(),
    altura_media= mean(height),
    menor_massa=min(mass)
  )

starwars%>%
  summarise(
    personagem=n(),
    altura_media= mean(height,
                       na.rm=T),#tira o NA da tabela
    menor_massa=min(mass,na.rm=T)
  )

#uma forma de conta quantas vezes uma palavra aparece
starwars%>%
  group_by(eye_color)%>%
  summarise(personagem=n())

starwars%>%
  group_by(species)%>%
  summarise(
    altura_media=mean(height,na.rm=T)
  )

starwars%>%
  group_by(hair_color)%>%
  summarise(personagem=n())

starwars%>%
  group_by(species)%>%
  summarise(personagem=n())%>%
  filter(species%in% c("Human","Droid"))
