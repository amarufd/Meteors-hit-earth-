#==================== AMS.METEORS.ORG ====================#

##########################################################
##### Iniciando la extracción de información general #####
##########################################################
library(rvest)

# Se asigna la página de ams.meteors.org/firelogs
webpage<- 'https://www.amsmeteors.org/about/'

webpage <- read_html(webpage)

# Extrayendo contenido en la clase About AMS
contenidoWebaboutus <- html_nodes(webpage,'.post-2')

# Pasando la info a texto
textoNoticia <- html_text(contenidoWebaboutus)

# Viendo a priori la info en la variable textoNoticia
print(textoNoticia)

# Eliminando los \n,comillas("),puntos(.) y comas(,) del texto
textoNoticia <- gsub("\n","",textoNoticia)
textoNoticia <- gsub("\"","",textoNoticia)
textoNoticia <- gsub("[.]","",textoNoticia)
textoNoticia <- gsub(",","",textoNoticia)
textoNoticia <- gsub("-","",textoNoticia)
textoNoticia <- gsub("'","",textoNoticia)
textoNoticia <- gsub(":","",textoNoticia)
textoNoticia <- gsub(";","",textoNoticia)

# Viendo a priori la info en la variable textoNoticia
print(textoNoticia)

# Separando las palabras por espacio
splitEspacioNoticia <- strsplit(textoNoticia," ")[[1]]

# Pasando todas las palabras a minúsculas
splitEspacioNoticia <- tolower(splitEspacioNoticia)

# Contando palabras
unlistNoticias<-unlist(splitEspacioNoticia)
tablaPalabras<-table(unlistNoticias)

# Pasando la información a un data frame
dfPalabrasNoticia <- as.data.frame(tablaPalabras)

# Almacenando la información en CSV
write.csv(dfPalabrasNoticia, file="PalabrasNoticia.csv")

# o en un txt
write.table(dfPalabrasNoticia, file="PalabrasNoticia.txt")

##########################################################
######## Iniciando la extracción de avistamientos ########
##########################################################

# Se asigna la página de ams.meteors.org/firelogs
Fireball<- 'https://www.amsmeteors.org/members/imo_view/browse_events?country=-1&year=2018&num_report=-99'

Fireball <- read_html(Fireball)

# Extrayendo contenido en la clase Registro general
tabla <- html_nodes(Fireball,".table-responsive")

# Extrayendo contenido en la clase registro de avistamientos
tablainfo <- html_nodes(tabla,"table")

# Extraccion informacion tabla 
tabla1 <- html_table(tablainfo)

# Viendo a priori la info en la variable textoNoticia
print(tabla1)

# Eliminando los \n,comillas("),puntos(.) y comas(,) del texto
registro <- gsub("\n","",registro2)
registro <- gsub("\"","",registro2)
registro <- gsub("[.]","",registro2)
registro <- gsub(",","",registro2)
registro <- gsub("-","",registro2)
registro <- gsub("'","",registro2)
registro <- gsub(":","",registro2)
registro <- gsub(";","",registro2)

# Viendo a priori la info en la variable textoNoticia
print(registro)

