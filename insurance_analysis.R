install.packages("tidyverse")
library(tidyverse)

getwd()
ins <- read.csv('insurance_new.csv')
ins

attach(ins)

# exploratory data analysis
summary(ins)

hist(charges)
hist(bmi)
hist(age)

boxplot(charges ~ region)
boxplot(charges ~ smoker)
boxplot(charges ~ children)
boxplot(charges ~ sex)

plot(charges ~ age)
plot(charges ~ bmi)

# statistical analysis
df1 <- ins %>%
  select(smoker, charges)
t.test(data=df1, charges ~ smoker)

summary(lm(charges ~ age))
summary(lm(charges ~ bmi))
summary(lm(charges ~ children))

# data visualization
library(ggplot2)
ggplot(data=ins, aes(x=age, y=charges))+geom_point()

# comparing relationship between age and charges relative to smoking status
ggplot(data=ins, aes(x=age, y=charges, col=smoker))+geom_point()+geom_smooth(method=lm)+facet_wrap(~smoker)

# comparing relationship between age and charges relative to geographical region 
ggplot(data=ins, aes(x=age, y=charges, col=region))+geom_point()+geom_smooth(method=lm)+facet_wrap(~region)

# comparing relationship between age and 
ggplot(data=ins, aes(x=age, y=charges, col=children))+geom_point()+geom_smooth(method=lm)+facet_wrap(~children)