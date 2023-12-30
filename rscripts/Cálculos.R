library(dplyr)
library(tidyverse)

AN <- deg_htp2 %>% filter(Tratamiento == "AN") %>% select(HTP)
BS <- deg_htp2 %>% filter(Tratamiento == "bs") %>% select(HTP)
BioEst <- deg_htp2 %>% filter(Tratamiento == "bioest") %>% select(HTP)
P26 <- deg_htp2 %>% filter(Tratamiento == "P26") %>% select(HTP)

inicial <- deg_htp2 %>% filter(Tiempo == 0) %>% pull(HTP)

t0 <- mean(inicial)

finalAN <- deg_htp2 %>% filter(Tiempo == 139 & Tratamiento == "AN") %>% pull(HTP)

finalBS <- deg_htp2 %>% filter(Tiempo == 139 & Tratamiento == "bs") %>% pull(HTP)

finalBioEst <- deg_htp2 %>% filter(Tiempo == 139 & Tratamiento == "bioest") %>% pull(HTP)

finalP26 <- deg_htp2 %>% filter(Tiempo == 139 & Tratamiento == "P26") %>% pull(HTP)



dAN<-t0 - finalAN
dBS<-t0 - finalBS
dBioEst<-t0 - finalBioEst
dP26<-t0 - finalP26

finalt <- c(finalBS, finalBioEst, finalP26)
finald<- c(dBS, dBioEst, dP26)
avg<- mean(finald)
length(finald)
sd(finald)
moe <- qt(0.975, 2) * sd(finald)/sqrt(length(finald))
avg + moe
avg - moe
t0 - (avg - moe)














