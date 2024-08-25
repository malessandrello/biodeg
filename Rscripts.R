library(dplyr)
library(ggplot2)
library(readxl)


Datos <- read_xlsx("...Datos.xlsx")

AN <- Datos %>% filter(Tratamiento == "AN")

gAN <- AN %>% ggplot(aes(`tiempo de retención`, Área)) + geom_line() + facet_wrap(~ Tiempo)

f <- Datos %>% filter(Tratamiento == "F")

gf <- f %>% ggplot(aes(`tiempo de retención`, Área)) + geom_line() + facet_wrap(~ Tiempo)

BS <- Datos %>% filter(Tratamiento == "BS")

gBS <- BS %>% ggplot(aes(`tiempo de retención`, Área)) + geom_line() + facet_wrap(~ Tiempo)

BA <- Datos %>% filter(Tratamiento == "BA")

gBA <- BA %>% ggplot(aes(`tiempo de retención`, Área)) + geom_line() + facet_wrap(~ Tiempo)

AN0 <- Datos %>% filter(Tratamiento == "AN" & Tiempo == 0) %>% ggplot(aes(`tiempo de retención`, Área)) + geom_line()

AN1 <- Datos %>% filter(Tratamiento == "AN" & Tiempo == 1) %>% ggplot(aes(`tiempo de retención`, Área)) + geom_line()

AN2 <- Datos %>% filter(Tratamiento == "AN" & Tiempo == 2) %>% ggplot(aes(`tiempo de retención`, Área)) + geom_line()

AN3 <- Datos %>% filter(Tratamiento == "AN" & Tiempo == 3) %>% ggplot(aes(`tiempo de retención`, Área)) + geom_line()

AN4 <- Datos %>% filter(Tratamiento == "AN" & Tiempo == 4) %>% ggplot(aes(`tiempo de retención`, Área)) + geom_line()

AN5 <- Datos %>% filter(Tratamiento == "AN" & Tiempo == 5) %>% ggplot(aes(`tiempo de retención`, Área)) + geom_line()

gf0 <- Datos %>% filter(Tratamiento == "F" & Tiempo == 0) %>% ggplot(aes(`tiempo de retención`, Área)) + geom_line()

gf1 <- Datos %>% filter(Tratamiento == "F" & Tiempo == 1) %>% ggplot(aes(`tiempo de retención`, Área)) + geom_line()

gf2 <- Datos %>% filter(Tratamiento == "F" & Tiempo == 2) %>% ggplot(aes(`tiempo de retención`, Área)) + geom_line()

gf3 <- Datos %>% filter(Tratamiento == "F" & Tiempo == 3) %>% ggplot(aes(`tiempo de retención`, Área)) + geom_line()

gf4 <- Datos %>% filter(Tratamiento == "F" & Tiempo == 4) %>% ggplot(aes(`tiempo de retención`, Área)) + geom_line()

gf5 <- Datos %>% filter(Tratamiento == "F" & Tiempo == 5) %>% ggplot(aes(`tiempo de retención`, Área)) + geom_line()

gBS0 <- Datos %>% filter(Tratamiento == "BS" & Tiempo == 0) %>% ggplot(aes(`tiempo de retención`, Área)) + geom_line()

gBS1 <- Datos %>% filter(Tratamiento == "BS" & Tiempo == 1) %>% ggplot(aes(`tiempo de retención`, Área)) + geom_line()

gBS2 <- Datos %>% filter(Tratamiento == "BS" & Tiempo == 2) %>% ggplot(aes(`tiempo de retención`, Área)) + geom_line()

gBS3 <- Datos %>% filter(Tratamiento == "BS" & Tiempo == 3) %>% ggplot(aes(`tiempo de retención`, Área)) + geom_line()

gBS4 <- Datos %>% filter(Tratamiento == "BS" & Tiempo == 4) %>% ggplot(aes(`tiempo de retención`, Área)) + geom_line()

gBS5 <- Datos %>% filter(Tratamiento == "BS" & Tiempo == 5) %>% ggplot(aes(`tiempo de retención`, Área)) + geom_line()

gBA0 <- Datos %>% filter(Tratamiento == "BA" & Tiempo == 0) %>% ggplot(aes(`tiempo de retención`, Área)) + geom_line()

gBA1 <- Datos %>% filter(Tratamiento == "BA" & Tiempo == 1) %>% ggplot(aes(`tiempo de retención`, Área)) + geom_line()

gBA2 <- Datos %>% filter(Tratamiento == "BA" & Tiempo == 2) %>% ggplot(aes(`tiempo de retención`, Área)) + geom_line()

gBA3 <- Datos %>% filter(Tratamiento == "BA" & Tiempo == 3) %>% ggplot(aes(`tiempo de retención`, Área)) + geom_line()

gBA4 <- Datos %>% filter(Tratamiento == "BA" & Tiempo == 4) %>% ggplot(aes(`tiempo de retención`, Área)) + geom_line()

gBA5 <- Datos %>% filter(Tratamiento == "BA" & Tiempo == 5) %>% ggplot(aes(`tiempo de retención`, Área)) + geom_line()


tiem0 <- Datos %>% filter(Tiempo == 0) %>% ggplot(aes(`tiempo de retención`, Área)) + geom_line() + facet_wrap(~ Tratamiento)

tiem1 <- Datos %>% filter(Tiempo == 1) %>% ggplot(aes(`tiempo de retención`, Área)) + geom_line() + facet_wrap(~ Tratamiento)

tiem2 <- Datos %>% filter(Tiempo == 2) %>% ggplot(aes(`tiempo de retención`, Área)) + geom_line() + facet_wrap(~ Tratamiento)

tiem3 <- Datos %>% filter(Tiempo == 3) %>% ggplot(aes(`tiempo de retención`, Área)) + geom_line() + facet_wrap(~ Tratamiento)

tiem4 <- Datos %>% filter(Tiempo == 4) %>% ggplot(aes(`tiempo de retención`, Área)) + geom_line() + facet_wrap(~ Tratamiento)

tiem5 <- Datos %>% filter(Tiempo == 5) %>% ggplot(aes(`tiempo de retención`, Área)) + geom_line() + facet_wrap(~ Tratamiento)


tiem5







