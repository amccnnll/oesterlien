# daily means for Eddy data
# version 1.0
# alistair mcconnell


#daily means and/or sums
# 2013
daily13 <- Oesterlien_C_R_2013
daily13$Date <- NULL

daily13$NEE_30 <- daily13$NEE_f * 30 * 60 * 12 / 1000000
#daily13_mean <- aggregate(daily13, by = list(daily13$DoY), FUN = "mean", na.rm = T)
daily13_sum <- aggregate(daily13, by = list(daily13$DoY), FUN = "sum", na.rm = T)

daily13_sum$DoY <- daily13_sum$DoY / 48
daily13_sum$Year <- daily13_sum$Year / 48
daily13_sum$Hour <- daily13_sum$Hour / 48
daily13_sum$overlap <- doy_index$overlap
daily13_sum$NEE_roll <- rollapply(data = daily13_sum$NEE_30, width = 7, FUN = mean, partial = T)
daily13_sum$NEE_roll[1:3] <- NA
daily13_sum$NEE_roll[363:365] <- NA

# copy above to other dates, thicken red line, and/or different line colours for single graphic...
# all three on one + all three on one zoomed to overlap

# 2014
daily14 <- Oesterlien_C_R_2014
daily14$Date <- NULL

daily14$NEE_30 <- daily14$NEE_f * 30 * 60 * 12 / 1000000
#daily14_mean <- aggregate(daily14, by = list(daily14$DoY), FUN = "mean", na.rm = T)
daily14_sum <- aggregate(daily14, by = list(daily14$DoY), FUN = "sum", na.rm = T)

daily14_sum$DoY <- daily14_sum$DoY / 48
daily14_sum$Year <- daily14_sum$Year / 48
daily14_sum$Hour <- daily14_sum$Hour / 48
daily14_sum$overlap <- doy_index$overlap
daily14_sum$DoY <- doy_index$fourteen
daily14_sum$NEE_roll <- rollapply(data = daily14_sum$NEE_30, width = 7, FUN = mean, partial = T)
daily14_sum$NEE_roll[1:3] <- NA
daily14_sum$NEE_roll[221:222] <- NA

# 2015
daily15 <- Oesterlien_C_R_2015
daily15$Date <- NULL

daily15$NEE_30 <- daily15$NEE_f * 30 * 60 * 12 / 1000000
#daily15_mean <- aggregate(daily15, by = list(daily15$DoY), FUN = "mean", na.rm = T)
daily15_sum <- aggregate(daily15, by = list(daily15$DoY), FUN = "sum", na.rm = T)

daily15_sum$DoY <- daily15_sum$DoY / 48
daily15_sum$Year <- daily15_sum$Year / 48
daily15_sum$Hour <- daily15_sum$Hour / 48
daily15_sum$overlap <- doy_index$overlap
daily15_sum$DoY <- doy_index$fifteen
daily15_sum$NEE_roll <- rollapply(data = daily15_sum$NEE_30, width = 7, FUN = mean, partial = T)
daily15_sum$NEE_roll[193] <- NA
daily15_sum$NEE_roll[363:365] <- NA

# PLOTS
# 2013
daily_nee13 <- ggplot(daily13_sum, aes(DoY, NEE_30)) +

  geom_segment(xend = daily13_sum$DoY, yend = 0, colour = "#313594") +

  geom_line(data = daily13_sum, aes(x = DoY, y = NEE_roll), colour = "red", size = 1, alpha = 0.65) +

  #geom_smooth(method = "loess", span = 0.075, colour = "red", se = F) +

  theme_bw() +

  scale_x_continuous(expand = c(0, 0),
                     limits = c(0, 365),
                     breaks = c(50, 100, 150, 200, 250, 300, 350),
                     labels = c("", "", "", "", "", "", "")) +

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

daily_nee14 <- ggplot(daily14_sum, aes(DoY, NEE_30)) +

  geom_segment(xend = daily14_sum$DoY, yend = 0, colour = "#314594") +

  geom_line(data = daily14_sum, aes(x = DoY, y = NEE_roll), colour = "red", size = 1, alpha = 0.65) +

  #geom_smooth(method = "loess", span = 0.075, colour = "red", se = F) +

  theme_bw() +

  scale_x_continuous(expand = c(0, 0),
                     limits = c(0, 365),
                     breaks = c(50, 100, 150, 200, 250, 300, 350),
                     labels = c("", "", "", "", "", "", "")) +

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

daily_nee15 <- ggplot(daily15_sum, aes(DoY, NEE_30)) +

  geom_segment(xend = daily15_sum$DoY, yend = 0, colour = "#315594") +

  geom_line(data = daily15_sum, aes(x = DoY, y = NEE_roll), colour = "red", size = 1, alpha = 0.65) +

  #geom_smooth(method = "loess", span = 0.1, colour = "red", se = F) +

  theme_bw() +

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

daily_nee <- grid.arrange(arrangeGrob(daily_nee13,
                                      daily_nee14,
                                      daily_nee15,
                                      ncol = 1,
                                      left = textGrob(expression("NEE" ~ (gC ~ m^{-2} ~ d^{-1})),
                                                                 rot = 90,
                                                                 vjust = 0.5,
                                                                 hjust = 0.5)))
daily_nee
