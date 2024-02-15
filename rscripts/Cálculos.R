library(dplyr)
library(tidyverse)


#Se obtienen los valores iniciales de la concentración de HTP y se calcula su promedio
inicial <- deg_htp2 %>% filter(Tiempo == 0) %>% pull(HTP)

t0 <- mean(inicial)

#Se obtienen valores finales de la concentración de HTP para cada tratamiento


finalAN <- deg_htp2 %>% filter(Tiempo == 139 & Tratamiento == "AN") %>% pull(HTP)

finalBS <- deg_htp2 %>% filter(Tiempo == 139 & Tratamiento == "bs") %>% pull(HTP)

finalBioEst <- deg_htp2 %>% filter(Tiempo == 139 & Tratamiento == "bioest") %>% pull(HTP)

finalP26 <- deg_htp2 %>% filter(Tiempo == 139 & Tratamiento == "P26") %>% pull(HTP)


#Se crean variables para el cálculo de intervalos de confianza 95%

finalBIO <- c(finalBS, finalP26, finalBioEst) # Concentraciones finales de tratamientos biológicos, se consideran como réplicas los distintos tratamientos porque no evidenciaron diferencias.

avgBIO<- mean(finalBIO) # su promedio

N <- length(finalBIO) # número de réplicas

desvest <- sd(finalBIO) # su desviación estándar

moe <- qt(0.975, df = N-1) * desvest/sqrt(N) #margen de error de las concentraciones finales para el tratamiento con fertilizante usando una distribución t.

moe_perc <- moe/avgBIO*100 #margen de error en %

finalAN1 <- c(finalAN, finalAN + moe_perc*finalAN/100, finalAN - moe_perc*finalAN/100)# concentraciones finales del tratamiento AN. Se considera una variación de más/menos moe_perc obtenida para los tratamientos BIO

avgAN <- mean(finalAN1) # promedio de concentraciones finales del tratamiento atenuación natural.

desvestAN <- sd(finalAN1) # su desviación estándar

moeAN <- qt(0.975, df = N-1) * desvestAN/sqrt(N) # su margen de error

lim_supBIO <- avgBIO + moe #límite superior del intervalo de confianza 95% para los tratamientos con fertilizante

lim_infBIO <- avgBIO - moe # límite inferior del intervalo de confianza 95% para esos tratamientos

lim_supAN <- avgAN + moeAN # límite superior del intervalo de confianza 95% para el tratamiento de atenuación natural

lim_infAN <- avgAN - moeAN # límite inferior del intervalo de confianza 95% para el tratamiento de atenuación natural


#Datos adicionales

dBIO <- t0 - avgBIO
dAN <- t0 - avgAN

dBIO_perc <- dBIO/t0 * 100
dAN_perc <- dAN/t0 * 100

t.test(finalAN1, finalBIO) # test t para la determinación del valor de p y del intervalo de confianza 95% de la diferencia entre las concentraciones finales de los tratamientos con fertilizante y atenuación natural.


#Construcción de tabla con resultados

Bioestimulación <- c(avgBIO,lim_infBIO, lim_supBIO, dBIO, dBIO_perc)

Atenuación_natural <- c(avgAN, lim_infAN, lim_supAN, dAN, dAN_perc) 

datos_finales <- data.frame(Bioestimulación, Atenuación_natural)

row.names(datos_finales) <- c("Concentración final HTP (mg/kg)", "Límite inferior 95% confianza (mg/kg)", "Límite superiror 95% confianza (mg/kg)", "Degradación de HTP (mg/kg)", "Degradación de HTP (%)")

datos_finales <- round(datos_finales, 0)

datos_finales

t.test(finalBIO)




