#----Learning some plotly----
#----Load Packages----
library(tidyverse)
library(data.table)
library(plotly)

#----Loading Data----
raptor <- fread("data/modern_RAPTOR_by_player.csv") %>%
  filter(season == 2019,
         mp > 500)

#----Basic Charts----

fig <- plot_ly(data=raptor, x = ~raptor_offense, y = ~raptor_defense, size = ~mp, text = ~paste(player_name))

p <- raptor %>%
  ggplot(aes(x = raptor_offense, y = raptor_defense, text = player_name)) +
  geom_point(col = "dodgerblue", alpha = "0.5")
#this conversion works pretty well for situations where the direct approach is tricky
ggplotly(p, tooltip = "text")

#plotly website has all the good tips: https://plotly.com/r/hover-text-and-formatting/

#----Elite----

raptor_elite <- fread("data/modern_RAPTOR_by_player.csv") %>%
  filter(mp > 500,
         raptor_total > 7)

fig2 <- plot_ly(data = raptor_elite, x = ~raptor_offense, y = ~raptor_defense, size = ~mp, name = ~player_name)
fig2

