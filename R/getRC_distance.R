library(httr)
library(XML)

getRC_distance <- function(X,Y,SRS = 'EPSG:4230'){
  
  ua <- user_agent(paste0("castastRo", " (https://github.com/DelgadoPanadero/CatastRo)"))
  url <- 'http://ovc.catastro.meh.es/ovcservweb/OVCSWLocalizacionRC/OVCCoordenadas.asmx/Consulta_RCCOOR_Distancia'
  
  query.parms <- list(Coordenada_X=X,Coordenada_Y=Y,SRS=SRS)
  res <- GET(url, query = query.parms, ua)
  stop_for_status(res)
  res <- xmlToList(xmlParse(res))
  
  if(is.null(res$coordenadas_distancias$coordd$lpcd$pcd$ldt)){stop('NO EXISTE ESE REGISTRO')}
  else{res$coordenadas_distancias$coordd$lpcd$pcd$ldt}
}