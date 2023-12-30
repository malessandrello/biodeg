library(dplyr)
library(ggplot2)
library(patchwork)

save(deg_htp2, file ="robjects/deg_htp2.rda")
fig2 <- deg_htp2 %>% mutate(Tratamiento = factor(case_when(
  Tratamiento == "AN" ~ "Atenuación natural", 
  Tratamiento == "bioest" ~ "Bioestimulación",
  Tratamiento == "bs" ~ "Biosurfactante",
  Tratamiento == "P26" ~ "Bioaumentación (P26)"), levels = c("Atenuación natural", "Biosurfactante", "Bioaumentación (P26)", "Bioestimulación"))) %>% 
  ggplot(aes(Tiempo, HTP, fill =Tratamiento)) +
  geom_bar(stat = "identity", position = "dodge", show.legend = FALSE)+
  geom_hline(yintercept = 10000) + 
  scale_x_continuous(breaks = c(0, 29, 57, 85, 113, 139))+
  xlab(NULL)+
  ylab("HTP (mg/kg)")

fig3 <- deg_htp2 %>% mutate(Tratamiento = factor(case_when(
  Tratamiento == "AN" ~ "Atenuación natural", 
  Tratamiento == "bioest" ~ "Bioestimulación",
  Tratamiento == "bs" ~ "Biosurfactante",
  Tratamiento == "P26" ~ "Bioaumentación (P26)"), levels = c("Atenuación natural", "Biosurfactante", "Bioaumentación (P26)", "Bioestimulación"))) %>% 
  ggplot(aes(Tiempo, `UFC/g`, fill =Tratamiento)) +
  geom_bar(stat = "identity", position = "dodge")+
  scale_x_continuous (breaks = c(0, 29, 57, 85, 113, 139))+
  scale_y_continuous(trans ="log10")+
  theme(legend.position = "bottom")+
  xlab("Tiempo (días)")+
  ylab("UFC/g") 

fig4 <- fig2/fig3

ggsave(fig2, file = "figs/fig2.png")
ggsave(fig3, file = "figs/fig3.png")
ggsave(fig4, file = "figs/fig4.png")





