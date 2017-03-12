# daily means for met data
# version 1.0
# alistair mcconnell

# subsetting
met13 <- subset(met_all, met_all$Year == 2013)
met14 <- subset(met_all, met_all$Year == 2014)
met15 <- subset(met_all, met_all$Year == 2015)


# aggregate daily sums
met13sum <- met13
met13sum$Date <- NULL
met13sum <- aggregate(met13sum, by = list(met13sum$DoY), FUN = sum, na.rm = T)


# plots!
# daily albedo 2013
r13 <- ggplot(met13_daily,
              aes(DoY, `Net_radiation_Wm-2`)) +
  geom_line(colour = "orange", size = 1, na.rm = T) +
  theme_bw() +
  scale_x_continuous(expand = c(0, 0),
                     limits = c(0, 365),
                     breaks = c(50, 100, 150, 200, 250, 300, 350)) +
  scale_y_continuous(expand = c(0, 0),
                     limits = c(-150, 250)) +
  geom_vline(xintercept = 142, linetype = "dashed") +
  geom_vline(xintercept = 292, linetype = "dashed") +
  geom_hline(yintercept = 0) +
  theme(axis.text.x = element_text(size=12,
                                   margin = margin(10,0,0,0, "pt")),
        axis.text.y = element_text(size=12,
                                   margin = margin(0,10,0,10, "pt")),
        axis.title = element_text(size=12),
        axis.ticks.length = unit(-5, "points"),
        panel.border = element_rect(size = 2)) +
  annotate("text", x = 13, y = 230, label = "(2013)", fontface = 2)

# daily albedo 2014
r14 <- ggplot(met14_daily,
              aes(DoY, `Net_radiation_Wm-2`)) +
  geom_line(colour = "orange", size = 1, na.rm = T) +
  theme_bw() +
  scale_x_continuous(expand = c(0, 0),
                     limits = c(0, 365),
                     breaks = c(50, 100, 150, 200, 250, 300, 350)) +
  scale_y_continuous(expand = c(0, 0),
                     limits = c(-150, 250)) +
  geom_vline(xintercept = 130, linetype = "dashed") +
  geom_vline(xintercept = 269, linetype = "dashed") +
  geom_hline(yintercept = 0) +
  theme(axis.text.x = element_text(size=12,
                                   margin = margin(10,0,0,0, "pt")),
        axis.text.y = element_text(size=12,
                                   margin = margin(0,10,0,10, "pt")),
        axis.title = element_text(size=12),
        axis.ticks.length = unit(-5, "points"),
        panel.border = element_rect(size = 2)) +
  annotate("text", x = 13, y = 230, label = "(2014)", fontface = 2)

# daily albedo 2015
r15 <- ggplot(met15_daily,
              aes(DoY, `Net_radiation_Wm-2`)) +
  geom_line(colour = "orange", size = 1, na.rm = T) +
  theme_bw() +
  scale_x_continuous(expand = c(0, 0),
                     limits = c(0, 365),
                     breaks = c(50, 100, 150, 200, 250, 300, 350)) +
  scale_y_continuous(expand = c(0, 0),
                     limits = c(-150, 250)) +
  geom_vline(xintercept = 148, linetype = "dashed") +
  geom_vline(xintercept = 275, linetype = "dashed") +
  geom_hline(yintercept = 0) +
  theme(axis.text.x = element_text(size=12,
                                   margin = margin(10,0,0,0, "pt")),
        axis.text.y = element_text(size=12,
                                   margin = margin(0,10,0,10, "pt")),
        axis.title = element_text(size=12),
        axis.ticks.length = unit(-5, "points"),
        panel.border = element_rect(size = 2)) +
  annotate("text", x = 13, y = 230, label = "(2015)", fontface = 2)

# subplots
r <- subplot(r13, r14, r15,
             nrows = 3,
             shareX = T,
             titleX = F,
             titleY = T) 
# print
r

# remove variables if desired
# rm(a, a13, a14, a15, met13_daily, met14_daily, met15_daily)