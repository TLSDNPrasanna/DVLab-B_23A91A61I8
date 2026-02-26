library(leaflet)
library(dplyr)
# draw map
leaflet()%>%
  # 1st file
  addTiles(group="One")%>%
  #2nd file
  addProviderTiles(providers$Esri.WorldImagery,group="Two")%>%
  #1st marker
  addMarkers(lng=25.505206,lat=65.9767231,group="mark1")%>%
  #2nd marker
  addMarkers(lng=45.445206,lat=45.5327231,group="mark2")%>%
  # layer controls
  addLayersControl(baseGroups = c("One","Two"),
                   overlayGroups= c("mark1","mark2"),
                   options=layersControlOptions(collapsed=FALSE))
