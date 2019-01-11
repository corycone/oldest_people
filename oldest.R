library(xlsx)
library(ggplot2)
data <- read.xlsx("data/oldest_working.xlsx", sheetName = "Sheet1")


plot <- ggplot(data, aes(x = reorder(Name, X.), Age)) +
  geom_point(size = 3, color = "Skyblue") +
  #geom_text(aes(label=Died), size = 2, hjust=.35, vjust=-1) +
  geom_segment( aes(x=Name, xend=Name, y=108, yend=Age), color = "Skyblue") +
  theme_light() +
  ylim(108,123) +
  labs(title = "How old were the oldest people in the world at time of death?", 
       x = "Name", 
       y = "Age") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1, size = 8)) +
  theme(panel.grid.major.x = element_blank(),
        panel.border = element_blank(),
        axis.ticks.x = element_blank(),
        panel.grid = element_blank(),
        legend.position="none",
        #axis.text.x = element_blank(),
        plot.margin = margin(1,1,1,1, "cm"))
          

plot
