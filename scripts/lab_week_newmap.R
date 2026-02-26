india_map<-leaflet()%>%
  addTiles()%>%
  setView(lng=78.9629,lat=20.5937,zoom=5)

#sample data with top cities of India
cities_data<-data.frame(
  city=c("Mumbai","Delhi","Bangalore","Hyderabad","Chennai","Kozhikode"),
  lat = c(19.0760, 28.6139, 12.9716, 17.3850, 13.0827, 11.2588),
  lng = c(72.8777,  77.2090,  77.5946,  78.4867, 80.2707, 75.7804),
  population = c(20400000,16700000,12400000,10400000,10000000,609224),
  state = c("Maharashtra","Delhi","Karnataka","Telangana","Tamil Nadu","Kerala")
  
)
india_map<-india_map%>%
  addCircleMarkers(
    data=cities_data,
    lng=~lng,
    lat=~lat,
    radius=~sqrt(population)*0.01,
    color="lightpink",
    fillOpacity = 0.7,
    popup=~paste("City: ",city,"<br>Population: ",population,"<br>State: ",state)
  )
india_map

