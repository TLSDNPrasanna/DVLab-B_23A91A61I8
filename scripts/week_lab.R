library(leaflet)
# the basic leaflet widget shows an empty map widget with no tiles or markers
map<-leaflet()
# adding tiles to the map
# by default , if no arguments are passed , it creates a open street map
map<-leaflet()%>%addTiles()
#adding markers to the map . we locating Delhi
map<-leaflet()%>%addTiles()%>%addMarkers(lng=77.1025,lat=28.7041,popup="Delhi,India")
map<-leaflet()%>%addTiles()%>%addMarkers(lng=82.07,lat=17.09,popup="Aditya University,AP")
map<-leaflet()%>%addTiles()%>%addMarkers(lng=82.07,lat=21.09,popup="place asked for")
# print map widget
map