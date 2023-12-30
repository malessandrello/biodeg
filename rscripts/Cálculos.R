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
moe <- qt(0.975, 2) * desvest/sqrt(N) #margen de error usando una distribución t.
moe_perc <- moe/avgBIO*100 #margen de error en %
finalAN1 <- c(finalAN, finalAN + moe_perc*finalAN/100, finalAN - moe_perc*finalAN/100)# concentraciones finales del tratamiento AN. Se considera una variación de más/menos moe_perc obtenida para los tratamientos BIO
avgAN <- mean(finalAN1) 

lim_supBIo <- avgBIO + moe
lim_infBIO <- avgBIO - moe

lim_supAN <- avgAN + moe
lim_infAN <- avgAN - moe

t.test(finalAN1, finalBIO)

lim_supBIo
lim_infBIO

lim_supAN
lim_infAN



















