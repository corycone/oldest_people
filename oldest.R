library(xlsx)
library(ggplot2)

data <- read.xlsx("data/Oldest_Person_Titleholders.xlsx", sheetName = "Sheet1")

#71.5 baseline
plot <- ggplot(data, aes(x = reorder(Name, -X.), Age)) +
  geom_point(aes(color = Sex), size = 1.8) +
  geom_text(aes(label=paste(format(Age),"years"),vjust = .35, hjust = -.2), size = 2, alpha = 1, color = "#151515") +
  geom_text(aes(label=ifelse(Died == "N/A", "still living ", paste("died:", format(Died))), vjust = .45, hjust = .6, y=69), size = 2, alpha = 1, color = "#151515") +
  geom_segment( aes(x=Name, xend=Name, y=71.5, yend=Age, color = Sex), size = 1) +
  theme_light() +
  ylim(69,123) +
  labs(title = "World's Oldest Person Titleholders Since 1955", 
       x = "Titleholder", 
       y = "Age of Death",
       caption = "Source: Gerontology Research Group - http://www.grg.org/Adams/C.HTM") +
  theme(axis.text.x = element_text(color = "#151515", angle = 0, hjust = 1, size = 7),
        axis.text.y = element_text(angle = 0, hjust = 1, size = 7, color = "#151515"),
        panel.border = element_blank(),
        axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank(),
        panel.grid = element_blank(),
        plot.title = element_text(color = "#151515", size = 14),
        axis.title.x = element_text(color = "#151515", size = 9),
        axis.title.y = element_text(color = "#151515", size = 9),
        plot.caption=element_text(size = 7, color = "#151515"),
        legend.position="right",
        plot.margin = margin(1,1,1,1, "cm")) +
  #scale_colour_brewer(palette = "Blues") +
  coord_flip()


plot

