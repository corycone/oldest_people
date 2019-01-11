library(xlsx)
library(ggplot2)
data <- read.xlsx("data/oldest_working.xlsx", sheetName = "Sheet1")


plot <- ggplot(data, aes(x = reorder(Name, X.), Age)) +
  geom_point(size = 3, color = "#be94be") +
  #the below geom_text looks terrible. May try to fix later on, so leaving code for now.
  #geom_text(aes(label=Age), size = 2, hjust=.45, vjust=-3, alpha = .8, color = "#64a164") +
  geom_segment( aes(x=Name, xend=Name, y=108, yend=Age), color = "#be94be") +
  theme_light() +
  ylim(108,123) +
  labs(title = "How old were the oldest people in the world at time of death?", 
       x = "Name", 
       y = "Age") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1, size = 8, color = "#be94be")) +
  theme(panel.grid.major.x = element_blank(),
        panel.border = element_blank(),
        axis.ticks.x = element_blank(),
        panel.grid = element_blank(),
        legend.position="none",
        #axis.text.x = element_blank(), #leaving this here temporarily.
        plot.margin = margin(1,1,1,1, "cm"))
          

plot
