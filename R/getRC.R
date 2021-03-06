getRC <- function(lat,lon,SRS = 'EPSG:4230'){
  
  ua <- user_agent(paste0("CatastRo", " (https://github.com/DelgadoPanadero/CatastRo)"))
  url <- 'http://ovc.catastro.meh.es/ovcservweb/OVCSWLocalizacionRC/OVCCoordenadas.asmx/Consulta_RCCOOR'
  
  query.parms <- list(Coordenada_X=lon,Coordenada_Y=lat,SRS=SRS)
  res <- GET(url, query = query.parms, ua)
  stop_for_status(res)
  res <- xmlToList(xmlParse(res))
  
  if(is.null(res$coordenadas$coord$ldt)){stop('NO EXISTE ESE REGISTRO')}
  else{
    pattern <- '\\d{5}.*{9}'
    string <- res$coordenadas$coord$ldt
     res <- list(address = paste(gsub(pattern = pattern,replacement = '', x = as.vector(strsplit(string, split = ' '))[[1]]),collapse = ' '),
              RC = grep(pattern = pattern, x = as.vector(strsplit(string, split = ' '))[[1]],value = T))
  }
  res
}
