library(tidyverse)
library(gridExtra)

#load in data
DF.Off.skill <- read.csv("derived_data/Off.Skill.csv")
DF.Off.strength <- read.csv("derived_data/Off.Strength.csv")
DF.Def.skill <- read.csv("derived_data/Def.Skill.csv")
DF.Def.strength <- read.csv("derived_data/Def.Strength.csv")

#graph 1

g1 <- ggplot(DF.Off.skill, mapping = aes(x = combine40yd, y = pick, color = position)) +     geom_point(alpha = .5) +
  xlab("40 Time") +
  ylab("Pick") +
  labs(color = "Position", title = "Offense") +
  xlim(4, 5.2) +
  theme(legend.position = c(0, 1),
        legend.justification = c(0, 1))

g3 <- ggplot(DF.Def.skill, mapping = aes(x = combine40yd, y = pick, color = position)) +     geom_point(alpha = .5) +
  xlab("40 Time") +
  ylab("Pick") +
  labs(color = "Position", title = "Defense") +
  xlim(4, 5.2) +
  theme(legend.position = c(0, 1),
        legend.justification = c(0, 1))

Graph1 <- grid.arrange(g1, g3, nrow=1)
ggsave("derived_graphs/Off.Def.40s.png", plot = Graph1)


#graph 2

g5 <- ggplot(DF.Off.skill, aes(weight)) +
  geom_density(aes(color=position), alpha=.5) +
  xlim(170, 400) +
  xlab("Weights") +
  ylab("") +
  labs(color="Position") +
  theme(legend.position = c(0, 1),
        legend.justification = c(0, 1))

g6 <- ggplot(DF.Off.strength, aes(weight)) +
  geom_density(aes(color=position), alpha=.5) +
  xlim(170,400) +
  xlab("Weights") +
  ylab("") +
  labs(color="Position") +
  theme(legend.position = c(0, 1),
        legend.justification = c(0, 1))

Graph2 <- grid.arrange(g5, g6, nrow=1, top = "Weight Distribution by Position (Offense)")
ggsave("derived_graphs/Off.Weights.png", plot = Graph2)
