print('HOLI DESDE ANALISIS')
# Punto 1 -----------------------------------------------------------------

titanic_all$Pclass %>% table()
table(titanic_all$Pclass, titanic_all$Survived)


t1 <- round(prop.table(table(titanic_all$Pclass, titanic_all$Survived),margin=1)*100, 2)

t2 <- round(prop.table(table(titanic_all$Pclass, titanic_all$Survived),margin=2)*100, 2)

titanic_all$Survived <- factor(titanic_all$Survived, labels = c("No", "Sí"))
titanic_filtered <- subset(titanic_all, Survived %in% c("Sí", "No"))


# Grafico 1: ---------------------------------------------------------------
#El grafico muestra el numero de personas que sobrevieron y los que no de cada clase  


p1 <- ggplot(titanic_filtered, aes(x = Pclass, fill = Survived)) +
  geom_bar(position = "dodge") +
  labs(title = "Numero de personas que sobrevieron respecto a su clase",
       x = "Clase resgitrada de la persona",
       y = "Numero de supervivientes ") +
  scale_fill_manual(values = c("No" = "#5CA3EB", "Sí" = "#29C1EA"), name = "Sobrevivió") +  # Personalizar colores
  theme_minimal()



# Grafico 2: --------------------------------------------------------------
#El grafico muestra de cada clase, que porcentaje de sobrevivientes y no sobrevientes fueron registrados 

p2 <- ggplot(titanic_filtered, aes(x = Pclass, fill = Survived)) +
  geom_bar(position = "fill") +
  coord_flip()+
  labs(title = "% de sobrevientes respecto a la Clase",
       x = "Clase social registrada",
       y = "Proporción de personas") +
  scale_fill_manual(values = c("No" = "#5CA3EB", "Sí" = "#29C1EA"), name = "Sobrevivió") +  # Personalizar colores
  theme_minimal()


# Grafico 3: --------------------------------------------------------------

titanic_all$Pclass<- factor(titanic_all$Pclass, labels = c('Alto', "Medio",'Bajo'))
titanic_filtered_2 <- subset(titanic_all, Pclass %in% c('Alto', "Medio",'Bajo'))
titanic_filtered_2 <- titanic_filtered_2[!is.na(titanic_filtered_2$Survived), ]


p3 <- ggplot(titanic_filtered_2, aes(x = Survived, fill = Pclass)) +
  geom_bar(position = "stack") +
  coord_flip()+
  labs(title = "# de sobrevientes respecto a la Clase",
       x = "Sobrevivientes",
       y = "Numero de personas") +
  scale_fill_manual(values = c("Alto" = "#5CA3EB", "Medio" = "#29C1EA", 'Bajo'= '#8AE3EA'), name = "Clase") +  # Personalizar colores
  theme_minimal()


# Grafico 4 (Edades): -----------------------------------------------------

titanic_age <- titanic_all[!is.na(titanic_all$Age), ]

titanic_age <- titanic_all %>% filter(!is.na(Survived))


p4 <- ggplot(titanic_age, aes(x = Age, fill = Survived)) +
  geom_histogram(data = subset(titanic_age), 
                 binwidth = 5,
                 position = 'stack', 
                 color = 'white',
                 alpha = 0.5) +  # Color para los que sobrevivieron
  labs(x = 'Edad',
       y = 'Número',
       title = 'Intervalos de edad cada 5 años',
       caption = 'Medido en años') +
  scale_fill_manual(values = c('No' = '#2A89DB', 'Sí' = '#69CBDC'), name = "Sobrevivió") +  # Personalizar los colores de la leyenda
  theme()

