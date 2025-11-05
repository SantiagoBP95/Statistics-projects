
test <- read_csv('../inputs/originals /test.csv')
train <- read_csv('../inputs/originals /train (1).csv')

names(test)
names(train)


titanic_all <- bind_rows(test, train) #dataset unificada 

save(titanic_all, file='../inputs/prepocessed /titanic.Rdata')


