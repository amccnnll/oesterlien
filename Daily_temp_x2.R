# daily means for Eddy data
# version 1.0
# alistair mcconnell


# PLOTS
# 2013
daily_temps13 <- ggplot() +
  
  geom_line(data = daily13_mean, aes(x = DoY, y = Tair), colour = "blue", size = 1, alpha = 0.65) +
  geom_line(data = x13, aes(x = DoY, y = Temp), colour = "brown", size = 1, alpha = 0.65) +
  
  #geom_smooth(method = "loess", span = 0.075, colour = "red", se = F) +
  
  theme_bw() +
  
  geom_vline(xintercept = c(76, 141, 230, 280),
             color = "black",
             linetype = "dashed",
             alpha = 0.5) +
  
  geom_hline(yintercept = 0,
             color = "black") +
  
  scale_x_continuous(expand = c(0, 0),
                     limits = c(0, 365),
                     breaks = c(50, 100, 150, 200, 250, 300, 350),
                     labels = c(50, 100, 150, 200, 250, 300, 350)) +
  
  scale_y_continuous(expand = c(0,0),
                     limits = c(-4, 2),
                     breaks = c(-4, -3, -2, -1, 0, 1, 2)) +
  
  ylab("") +
  xlab("") +
  
  theme(axis.text.x = element_text(size=12,
                                   margin = margin(10,0,0,0, "pt")),
        axis.text.y = element_text(size=12,
                                   margin = margin(0,10,0,10, "pt")),
        axis.title = element_text(size=12),
        axis.ticks.length = unit(-5, "points"),
        panel.border = element_rect(size = 2)) +
  
  annotate("text", x = 14, y =1.5, label = "(2013)", fontface = 2)

# 2014

daily_temps14 <- ggplot(daily14_sum, aes(DoY, NEE_30)) +
  
  geom_segment(xend = daily14_sum$DoY, yend = 0, colour = "#314594") +
  
  geom_line(data = daily14_sum, aes(x = DoY, y = NEE_roll), colour = "red", size = 1, alpha = 0.65) +
  
  #geom_smooth(method = "loess", span = 0.075, colour = "red", se = F) +
  
  theme_bw() +
  
  geom_vline(xintercept = c(89, 129, 225, 268),
             color = "black",
             linetype = "dashed",
             alpha = 0.5) +
  
  geom_hline(yintercept = 0,
             color = "black") +
  
  scale_x_continuous(expand = c(0, 0),
                     limits = c(0, 365),
                     breaks = c(50, 100, 150, 200, 250, 300, 350),
                     labels = c(50, 100, 150, 200, 250, 300, 350)) +
  
  scale_y_continuous(expand = c(0,0),
                     limits = c(-4, 2),
                     breaks = c(-4, -3, -2, -1, 0, 1, 2)) +
  
  ylab("") +
  xlab("") +
  
  theme(axis.text.x = element_text(size=12,
                                   margin = margin(10,0,0,0, "pt")),
        axis.text.y = element_text(size=12,
                                   margin = margin(0,10,0,10, "pt")),
        axis.title = element_text(size=12),
        axis.ticks.length = unit(-5, "points"),
        panel.border = element_rect(size = 2)) +
  
  annotate("text", x = 14, y = 1.5, label = "(2014)", fontface = 2)

# 2015

daily_temps15 <- ggplot(daily15_sum, aes(DoY, NEE_30)) +
  
  geom_segment(xend = daily15_sum$DoY, yend = 0, colour = "#315594") +
  
  geom_line(data = daily15_sum, aes(x = DoY, y = NEE_roll), colour = "red", size = 1, alpha = 0.65) +
  
  #geom_smooth(method = "loess", span = 0.1, colour = "red", se = F) +
  
  theme_bw() +
  
  geom_vline(xintercept = c(104, 147, 226, 275),
             color = "black",
             linetype = "dashed",
             alpha = 0.5) +
  
  geom_hline(yintercept = 0,
             color = "black") +
  
  scale_x_continuous(expand = c(0, 0),
                     limits = c(0, 365),
                     breaks = c(50, 100, 150, 200, 250, 300, 350)) +
  
  scale_y_continuous(expand = c(0,0),
                     limits = c(-4, 2),
                     breaks = c(-4, -3, -2, -1, 0, 1, 2)) +
  
  ylab("") +
  xlab("DoY") +
  
  theme(axis.text.x = element_text(size=12,
                                   margin = margin(10,0,0,0, "pt")),
        axis.text.y = element_text(size=12,
                                   margin = margin(0,10,0,10, "pt")),
        axis.title = element_text(size=12),
        axis.ticks.length = unit(-5, "points"),
        panel.border = element_rect(size = 2)) +
  
  annotate("text", x = 14, y = 1.5, label = "(2015)", fontface = 2)

# subplots

daily_temps <- grid.arrange(arrangeGrob(daily_temps13,
                                      daily_temps14,
                                      daily_temps15,
                                      ncol = 1,
                                      left = textGrob("Temperature (C)"),
                                                      rot = 90,
                                                      vjust = 0.5,
                                                      hjust = 0.5)))
daily_nee
