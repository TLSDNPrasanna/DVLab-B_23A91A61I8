library(leaflet)
my_map<-leaflet()%>%
  addTiles()%>%
  setView(lng=0,lat=0,zoom=2)
data<-data.frame(
  lng=c(0,10,20),
  lat=c(0,15,-10),
  value=c(100,200,150)
)

my_map<-my_map%>%
  addCircleMarkers(
    data=data,
    lng=~lng,
    lat=~lat,
    radius=~sqrt(value)*2,
    color="red",
    fillOpacity=0.7,
    popup=~paste("Value: ",value)
  )
my_map