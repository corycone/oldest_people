library(xlsx)
library(ggplot2)

data <- read.xlsx("data/Oldest_Person_Titleholders.xlsx", sheetName = "Sheet1")


plot <- ggplot(data, aes(x = reorder(Name, X.), Age)) +
  geom_point(size = 1.7, color = "Gray") +
  #geom_text for age at end of segment.
  geom_text(aes(label=paste(format(Age),"years"),vjust = .17, hjust = -.2), size = 2, alpha = 1, color = "#151515") +
  #geom_text to add a row for date of death next to the name.
  geom_text(aes(label=ifelse(Died == "N/A", "still living ", paste("died:", format(Died))), vjust = .6, hjust = .5, y=107), size = 2, alpha = 1, color = "#151515") +
  geom_segment( aes(x=Name, xend=Name, y=108, yend=Age), color = "Gray", size = 1) +
  theme_light() +
  ylim(107,123) +
  labs(title = "World's Oldest Person Titleholders Since 1955", 
       x = "Titleholder", 
       y = "Age of Death",
       caption = "Source: Gerontology Research Group - http://www.grg.org/Adams/C.HTM") +
    theme(axis.text.x = element_text(angle = 0, hjust = 1, color = "#151515", size = 7),
        axis.text.y = element_text(angle = 0, hjust = 1, size = 7, color = "#151515"),
        panel.grid.major.x = element_blank(),
        panel.border = element_blank(),
        axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank(),
        panel.grid = element_blank(),
        plot.title = element_text(color = "#151515"),
        axis.title.x = element_text(color = "#151515"),
        axis.title.y = element_text(color = "#151515"),
        plot.caption=element_text(size = 7, color = "Light Gray"),
        plot.margin = margin(1,1,1,1, "cm")) +
  coord_flip()
          

plot

