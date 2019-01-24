#==================== AMS.METEORS.ORG ====================#

##########################################################
######### Iniciando la extracci�n de informaci�n #########
##########################################################

# Se asigna la p�gina de ams.meteors.org/firelogs
webpage<- 'https://www.amsmeteors.org/about/'

webpage <- read_html(webpage)

# Extrayendo contenido en la clase About AMS
contenidoWebNoticia <- html_nodes(webpage,'.post-2')

# Pasando la info a texto
textoNoticia <- html_text(contenidoWebNoticia)

# Viendo a priori la info en la variable textoNoticia
print(textoNoticia)

# Pregunta: �Qu� representa el \n?

# Eliminando los \n,comillas("),puntos(.) y comas(,) del texto
textoNoticia <- gsub("\n","",textoNoticia)
textoNoticia <- gsub("\"","",textoNoticia)
textoNoticia <- gsub("[.]","",textoNoticia)
textoNoticia <- gsub(",","",textoNoticia)

# Viendo a priori la info en la variable textoNoticia
print(textoNoticia)

# Separando las palabras por espacio
splitEspacioNoticia <- strsplit(textoNoticia," ")[[1]]

# Pasando todas las palabras a min�sculas
splitEspacioNoticia <- tolower(splitEspacioNoticia)

# Contando palabras
unlistNoticias<-unlist(splitEspacioNoticia)
tablaPalabras<-table(unlistNoticias)

# Pasando la informaci�n a un data frame
dfPalabrasNoticia <- as.data.frame(tablaPalabras)

# Almacenando la informaci�n en CSV
write.csv(dfPalabrasNoticia, file="PalabrasNoticia.csv")

# o en un txt
write.table(dfPalabrasNoticia, file="PalabrasNoticia.txt")