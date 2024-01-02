library(dplyr)
library(ggplot2)
save(temp_data, file ="robjects/temp_data.rda")
temp_data1 <- temp_data %>% mutate(Mes = case_when(
  días<30 ~ "Mes 1", 
  between(días, 30,60)~ "Mes 2", 
  between(días, 60,90)~"Mes 3", 
  between(días,90,120)~"Mes 4",
  días>120 ~ "Mes 5"), 
  Temperaturas = case_when(
  between(TEMP, -5, 15) ~ "Temperaturas menores a 15 °C", 
  TEMP>15 ~ "Temperaturas mayores a 15 °C"),
  día_mes = case_when(
    Mes == "Mes 1" ~ días,
    Mes == "Mes 2" ~ días - 30,
    Mes == "Mes 3" ~ días - 60,
    Mes == "Mes 4" ~ días-90,
    Mes == "Mes 5" ~ días -120))

fig1 <- temp_data1 %>% filter(Mes %in% c("Mes 1", "Mes 2", "Mes 3", "Mes 4", "Mes 5")) %>%
  ggplot(aes(día_mes, TEMP, col = Temperaturas))+
  geom_point(show.legend = FALSE) + facet_wrap(~Mes)

fig1 <- fig1 + xlab("Tiempo (días)") + ylab("Temperaturas (°C)")
ggsave("fig1.png", plot = fig1)


temps <- temp_data1 %>% filter(días <60)%>% pull(TEMP)

quantile(temps, seq(0, 1, 0.1))




 














