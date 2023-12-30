
fig2 <- deg_htp2 %>% mutate(Tratamiento = factor(case_when(
  Tratamiento == "AN" ~ "Atenuación natural", 
  Tratamiento == "bioest" ~ "Bioestimulación",
  Tratamiento == "bs" ~ "Biosurfactante",
  Tratamiento == "P26" ~ "Bioaumentación (P26)"), levels = c("Atenuación natural", "Biosurfactante", "Bioaumentación (P26)", "Bioestimulación"))) %>% 
  ggplot(aes(Tiempo, HTP, fill =Tratamiento)) +
  geom_bar(stat = "identity", position = "dodge")+
  geom_hline(yintercept = 10000) + 
  scale_x_continuous(breaks = c(0, 29, 57, 85, 113, 139))+
  xlab("Tiempo (días)")+
  ylab("HTP (mg/kg)")

fig2

