getCOOR <- function(RC, SRS= '', Province = '',Municipality = ''){
  
  ua <- user_agent(paste0("CatastRo", " (https://github.com/DelgadoPanadero/CatastRo)"))
  url <- 'http://ovc.catastro.meh.es/ovcservweb/OVCSWLocalizacionRC/OVCCoordenadas.asmx/Consulta_CPMRC'

  query.parms <- list(Provincia=Province,
                      Municipio=Municipality,
                      SRS=SRS,
                      RC=RC)
  res <- GET(url, query = query.parms, ua)
  stop_for_status(res)
  res <- xmlToList(xmlParse(res))
  
  
  if(is.null(res$lerr$err$des)){
    
    res <- list('coord' = as.numeric(c(res$coordenadas$coord$geo$ycen,
                                       res$coordenadas$coord$geo$xcen)),
                'SRS'=res$coordenadas$coord$geo$srs)
  }
  
  else{
    stop(res$lerr$err$des)
  }
res
}
