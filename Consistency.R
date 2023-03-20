#----------------------------------
# consistency of the empirical mean
#----------------------------------

library(ggplot2)
library(ggjoy)

# generate artificial data with know values of parameters
set.seed(2023)
mu <- 0
sigma <- 1
n1 <- 100 ; n2 <- 1000 ; n3 <- 10000

data1 <- rnorm(n1, mu, sigma)
data2 <- rnorm(n2, mu, sigma)
data3 <- rnorm(n3, mu, sigma)

# distribution using estimators
dat1 <- rnorm(n1, mean(data1), sqrt(var(x)/n1))
dat2 <- rnorm(n2, mean(data2), sqrt(var(x)/n2))
dat3 <- rnorm(n3, mean(data3), sqrt(var(x)/n3))

# create data frame
d1<-data.frame(y = rep('n=50',n1), x = dat1)
d2<-data.frame(y = rep('n=500',n2), x = dat2)
d3<-data.frame(y = rep('n=5000',n3), x = dat3)
df<-rbind(d1, d2, d3)

# plot
ggplot(df, aes(x=x, y=y)) +
  geom_joy(scale = 2, alpha = 0.4) +
  scale_y_discrete(expand=c(0.05, 0)) +
  geom_vline(xintercept=0, color = "red", size=1) +
  scale_x_continuous(expand=c(0.05, 0.05)) +
  labs(title = 'Consistency of estimators',
       subtitle = 'Empirical mean -  the standard deviation shrinks as the sample size increases',
       y="density", x="estimated data") +
  theme(axis.text=element_text(size=8),
        axis.title=element_text(size=8),
        plot.subtitle=element_text(size=9, face="italic", color="darkred"),
        panel.background = element_rect(fill = "white", colour = "grey50"),
        panel.grid.major = element_line(colour = "grey90"))

#----
# end
#----
