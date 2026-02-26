AirPassengers # loading the Dataset

?AirPassengers # about the Dataset

class(AirPassengers) # type of Dataset
View(AirPassengers)

ap_df<-data.frame(
  year = time(AirPassengers),
  passengers=as.numeric(AirPassengers)
) 

ap_df_months <- data.frame(
  year= floor(time(AirPassengers)),
  month=cycle(time(AirPassengers)),
  passengers=as.numeric(AirPassengers)
)

ap_df_months
plot(AirPassengers)

plot(AirPassengers,
     type='l',
     lwd=2,
     main="Analysis of AirPassengers dataset",
     xlab="Time Span",
     ylab="Passengers",
     col= "red",
     col.main="orange"
)    

points(AirPassengers,
       type='o',
       pch=17,
       col="darkgreen",
       main="Analysis of AirPassengers dataset",
       xlab="Time Span",
       ylab="Passengers",
       col.main="orange",
       
)
grid()
# ?plot

###GGPLOT
library(ggplot2)
ggplot(ap_df,
       aes(x=year,y=passengers))+
  geom_line(color="blue",linewidth=0.5)+
  labs(
    title="Trend Analysis of Air Passengers",
    caption="Using Air Passengers dataset",
    subtitle="From 1949 to 1960",
    x="Months",
    y="No.of Passengers"
  )+
  geom_point(color="pink")+
  geom_smooth(se=FALSE,color="orange")
theme_minimal()