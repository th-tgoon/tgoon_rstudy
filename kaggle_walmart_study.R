library(tidyverse)
library(tidymodels)
library(lubridate)
library(skimr)
library(magrittr)

setwd("~/Rstudy")

train <- read.csv("./tgoon_rstudy/train.csv")
test <- read.csv("./tgoon_rstudy/test.csv")
view(train)
view(test)

# Size of data 
dim(train)
dim(test)

# train
names(train)
names(test)

# test
test %>% head() 


# all data combine
 all_data <- as.tibble(bind_rows(train, test))
 tail(all_data)
 #if you use 'rbind', it will make error because of NA row

all_data <- all_data %>% janitor::clean_names()

names(all_data) 

all_data %>% head()
all_data %>% skim()
dim(all_data)
all_data %>% 
  mutate(year = year(date),
         month = month(date)) %>% 
  select(-c(date)) -> all_data2

all_data2 %>% head()


walmart_recipe <-
  recipe(weekly_sales ~ .,
         data = all_data2) %>%
  step_normalize(all_numeric(),-all_outcomes())
walmart_recipe

walmart_recipe <- prep(walmart_recipe, training = all_data2)
walmart_recipe

all_data2 <- bake(walmart_recipe, 
                  new_data = all_data2)
names(all_data2)
head(all_data2)
view(all_data2)

# train, test
train_index <- seq_len(nrow(train)) #1부터가 아닌 중간부터 train데이터인 벡터도 찾아냄
train2 <- all_data2[train_index,]
test2 <- all_data2[-train_index,]

train2 %>% dim()

lm_mode <- 
  linear_reg() %>% 
  set_engine("lm")

lm_form_fit <- 
  lm_mode %>% 
  fit(weekly_sales ~., data=train2)

lm_form_fit

result <- predict(lm_form_fit, new_data = test2)

subfile <- read.csv("./tgoon_rstudy/sampleSubmission.csv")
subfile$Weekly_Sales <- result$.pred

subfile %>% head()

write.csv(subfile, row.names = FALSE, 
          "./tgoon_rstudy/baseline-lm-04232021.csv")  
  
  
  
  