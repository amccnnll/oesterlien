# daily means for soil moisture
# version 1.0
# alistair mcconnell

# NOTE - the legend isn't working...

# set colours
sm_col <- colorRampPalette(brewer.pal(3, "Dark2"), space="Lab")


# plots!
# daily soil moisture 2013
s13 <- ggplot(sm13_daily, aes(DoY, soilmoisture, colour = as.factor(depth))) +
  geom_line(size = 1, na.rm = T) +
  scale_color_manual(breaks = c("10", "20", "30"), values = sm_col(3)) +

  theme_bw() +
  scale_x_continuous(expand = c(0, 0),
                     limits = c(0, 365),
                     breaks = c(50, 100, 150, 200, 250, 300, 350)) +
  scale_y_continuous(expand = c(0, 0),
                     limits = c(0, 100),
                     breaks = c(0, 20, 40, 60, 80, 100)) +
  geom_vline(xintercept = 142, linetype = "dashed") +
  geom_vline(xintercept = 292, linetype = "dashed") +
  theme(axis.text.x = element_text(size=12,
                                   margin = margin(10,0,0,0, "pt")),
        axis.text.y = element_text(size=12,
                                   margin = margin(0,10,0,10, "pt")),
        axis.title = element_text(size=12),
        axis.ticks.length = unit(-5, "points"),
        panel.border = element_rect(size = 2)) +
  annotate("text", x = 13, y = 95, label = "(2013)", fontface = 2) +
  guides(colour = F)

# daily soil moisture 2014
s14 <- ggplot(sm14_daily, aes(DoY, soilmoisture, colour = as.factor(depth))) +
  geom_line(size = 1, na.rm = T) +
  scale_color_manual(breaks = c("10", "20", "30"), values = sm_col(3)) +
  
  theme_bw() +
  scale_x_continuous(expand = c(0, 0),
                     limits = c(0, 365),
                     breaks = c(50, 100, 150, 200, 250, 300, 350)) +
  scale_y_continuous(expand = c(0, 0),
                     limits = c(0, 100),
                     breaks = c(0, 20, 40, 60, 80, 100)) +
  geom_vline(xintercept = 130, linetype = "dashed") +
  geom_vline(xintercept = 269, linetype = "dashed") +
  theme(axis.text.x = element_text(size=12,
                                   margin = margin(10,0,0,0, "pt")),
        axis.text.y = element_text(size=12,
                                   margin = margin(0,10,0,10, "pt")),
        axis.title = element_text(size=12),
        axis.ticks.length = unit(-5, "points"),
        panel.border = element_rect(size = 2)) +
  annotate("text", x = 13, y = 95, label = "(2014)", fontface = 2) +
  guides(colour = F)

# daily soil moisture 2015
s15 <- ggplot(sm15_daily, aes(DoY, soilmoisture, colour = as.factor(depth))) +
  geom_line(size = 1, na.rm = T) +
  scale_color_manual(breaks = c("10", "20", "30"), values = sm_col(3)) +
  
  theme_bw() +
  scale_x_continuous(expand = c(0, 0),
                     limits = c(0, 365),
                     breaks = c(50, 100, 150, 200, 250, 300, 350)) +
  scale_y_continuous(expand = c(0, 0),
                     limits = c(0, 100),
                     breaks = c(0, 20, 40, 60, 80, 100)) +
  geom_vline(xintercept = 148, linetype = "dashed") +
  geom_vline(xintercept = 275, linetype = "dashed") +
  theme(axis.text.x = element_text(size=12,
                                   margin = margin(10,0,0,0, "pt")),
        axis.text.y = element_text(size=12,
                                   margin = margin(0,10,0,10, "pt")),
        axis.title = element_text(size=12),
        axis.ticks.length = unit(-5, "points"),
        panel.border = element_rect(size = 2)) +
  annotate("text", x = 13, y = 95, label = "(2015)", fontface = 2) +
  guides(colour = F) #guide_legend(title = "depth (cm)",
                          #     title.position = "right",
                           #    ticks = F,
                            #   title.theme = element_text(angle = 90),
                             #  title.hjust = 0.5,
                              # draw.ulim = F,
                               #draw.llim = F))

# subplots
s <- subplot(s13, s14, s15,
             nrows = 3,
             shareX = T,
             titleX = F,
             titleY = F) 
# print
s