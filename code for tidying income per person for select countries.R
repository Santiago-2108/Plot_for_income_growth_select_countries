library(tidyverse)
library(dplyr)
library(dslabs)
library(ggplot2)
library(ggthemes)
data(gapminder)
world_income <- read.csv(file="income_per_person_gdppercapita_ppp_inflation_adjusted.csv")
print(world_income)
new_income<- world_income %>% pivot_longer(c(X1800:X2040),names_to = "year",values_to = "income")
new_income
tidy_year<-parse_number(new_income$year)
final_new_income<-new_income %>% mutate(year=tidy_year)
final_new_income
countries<- c("Ghana","Nigeria","Rwanda","United States")
years <- c(1910,1920,1930,1940,1950,1960,1970,1980,1990,2000,2010,2020)
d<-final_new_income%>%filter(country%in%countries & year%in%years)
d1 <- d %>% ggplot(aes(year,income,color=country,group=country))
d2 <- d1 + geom_line(size=1)+scale_y_log10()+theme_economist_white()
d3 <- d2 + ggtitle("INCOME GROWTH ACROSS TIME")+ylab("income_per_person_gdppercapita_ppp_inflation_adjusted")+xlab("time")

d3

