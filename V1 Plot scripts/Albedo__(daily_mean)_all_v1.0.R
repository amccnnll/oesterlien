# daily means for met data
# version 1.0
# alistair mcconnell

# aggregate daily meanss
met13_daily <- aggregate(met13, by = list(met13$DoY), FUN = mean, na.rm = T)
met13_daily$Group.1 <- NULL
met13_daily$Albedo[met13_daily$Albedo > 1] <- NA

met14_daily <- aggregate(met14, by = list(met14$DoY), FUN = mean, na.rm = T)
met14_daily$Group.1 <- NULL
met14_daily$Albedo[met14_daily$Albedo > 1] <- NA


met15_daily <- aggregate(met15, by = list(met15$DoY), FUN = mean, na.rm = T)
met15_daily$Group.1 <- NULL
met15_daily$Albedo[met15_daily$Albedo > 1] <- NA


# plots!
# daily albedo 2013
a13 <- ggplot(met13_daily,
              aes(DoY, Albedo)) +
  geom_point(colour = "#313594", na.rm = T) +
  theme_bw() +
  scale_x_continuous(expand = c(0, 0),
                     limits = c(0, 365),
                     breaks = c(50, 100, 150, 200, 250, 300, 350)) +
  scale_y_continuous(expand = c(0, 0),
                     limits = c(0, 1),
                     breaks = c(0, 0.25, 0.5, 0.75, 1),
                     labels = c(0, "", 0.5, "", 1)) +
  geom_vline(xintercept = 142, linetype = "dashed") +
  geom_vline(xintercept = 292, linetype = "dashed") +
  theme(axis.text.x = element_text(size=12,
                                   margin = margin(10,0,0,0, "pt")),
        axis.text.y = element_text(size=12,
                                   margin = margin(0,10,0,10, "pt")),
        axis.title = element_text(size=12),
        axis.ticks.length = unit(-5, "points"),
        panel.border = element_rect(size = 2)) +
  annotate("text", x = 13, y = 0.9, label = "(2013)", fontface = 2)

# daily albedo 2014
a14 <- ggplot(met14_daily,
              aes(DoY, Albedo)) +
  geom_point(colour = "#313594", na.rm = T) +
  theme_bw() +
  scale_x_continuous(expand = c(0, 0),
                     limits = c(0, 365),
                     breaks = c(50, 100, 150, 200, 250, 300, 350)) +
  scale_y_continuous(expand = c(0, 0),
                     limits = c(0, 1),
                     breaks = c(0, 0.25, 0.5, 0.75, 1),
                     labels = c(0, "", 0.5, "", 1)) +
  geom_vline(xintercept = 130, linetype = "dashed") +
  geom_vline(xintercept = 269, linetype = "dashed") +
  theme(axis.text.x = element_text(size=12,
                                   margin = margin(10,0,0,0, "pt")),
        axis.text.y = element_text(size=12,
                                   margin = margin(0,10,0,10, "pt")),
        axis.title = element_text(size=12),
        axis.ticks.length = unit(-5, "points"),
        panel.border = element_rect(size = 2)) +
  annotate("text", x = 13, y = 0.9, label = "(2014)", fontface = 2)

# daily albedo 2015
a15 <- ggplot(met15_daily,
              aes(DoY, Albedo)) +
  geom_point(colour = "#313594", na.rm = T) +
  theme_bw() +
  scale_x_continuous(expand = c(0, 0),
                     limits = c(0, 365),
                     breaks = c(50, 100, 150, 200, 250, 300, 350)) +
  scale_y_continuous(expand = c(0, 0),
                     limits = c(0, 1),
                     breaks = c(0, 0.25, 0.5, 0.75, 1),
                     labels = c(0, "", 0.5, "", 1)) +
  geom_vline(xintercept = 148, linetype = "dashed") +
  geom_vline(xintercept = 275, linetype = "dashed") +
  theme(axis.text.x = element_text(size=12,
                                   margin = margin(10,0,0,0, "pt")),
        axis.text.y = element_text(size=12,
                                   margin = margin(0,10,0,10, "pt")),
        axis.title = element_text(size=12),
        axis.ticks.length = unit(-5, "points"),
        panel.border = element_rect(size = 2)) +
  annotate("text", x = 13, y = 0.9, label = "(2015)", fontface = 2)

# subplots
a <- subplot(a13, a14, a15,
             nrows = 3,
             shareX = T,
             titleX = F,
             titleY = F) 
# print
a

# remove variables if desired
# rm(a, a13, a14, a15, met13_daily, met14_daily, met15_daily)