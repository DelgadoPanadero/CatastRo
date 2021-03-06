\name{getRC_distance}
\alias{getRC_distance}

\title{Interface to query Consulta_RCCOOR_Distancia}

\description{Returns the Cadastral Reference of the state as well as the direction (municipality, street and number) given its coordinates and the reference system. In case that there is not any cadastral reference in the exact point, the function returns all the cadastral references in a square 50 meters long centered in the current point.}
\usage{
getRC_distance(lat, lon, SRS)
}
%- maybe also 'usage' for other objects documented here. 
\arguments{
  \item{lat}{Latitude coordinate.}
  \item{lon}{Longitude coortinate.}
  \item{SRS}{The reference system used for the coordinates. A list of all the allowed references system is given in References.}

}

\value{
A list with the the direction of the state and the cadastral reference.
}
\references{
\url{http://ovc.catastro.meh.es/ovcservweb/OVCSWLocalizacionRC/OVCCoordenadas.asmx?op=Consulta_RCCOOR_Distancia}
}
\author{
Angel Delgado Panadero.
}

\examples{

direction <- getRC_distance(38.6196566583596,-3.45624183836806)
print(direction)    

}
