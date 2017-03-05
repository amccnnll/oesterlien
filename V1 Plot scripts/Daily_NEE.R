# daily means for Eddy data
# version 1.0
# alistair mcconnell


#O13$dailyNEE_30 <- O13$NEE_f * 60 * 30 *12 / 1000000
daily13 <- Oesterlien_C_R_2013
daily13$Date <- NULL

daily13$NEE_30 <- daily13$NEE_f * 30 * 60 * 12 / 1000000
#daily13_mean <- aggregate(daily13, by = list(daily13$DoY), FUN = "mean", na.rm = T)
daily13_sum <- aggregate(daily13, by = list(daily13$DoY), FUN = "sum", na.rm = T)

daily13_sum$DoY <- daily13_sum$DoY / 48
daily13_sum$Year <- daily13_sum$Year / 48
daily13_sum$Hour <- daily13_sum$Hour / 48

daily_sum <- ggplot(daily13_sum, aes(DoY, NEE_30)) +
  
  geom_segment(xend = daily13_sum$DoY, yend = 0, colour = "#313594", size = 1) +
  
  geom_smooth(color = "#F36C43", method = "loess", span = 0.1, se = F) +
  
  theme_bw() +
  
  scale_x_continuous(expand = c(0, 0),
                     breaks = pretty(daily13_sum$DoY, n = 10)) +
  
  scale_y_continuous(expand = c(0,0),
                     limits = c(-3, 1.5),
                     breaks = pretty(daily13_sum$NEE_30, n = 5)) +
  
  theme(axis.text.x = element_text(size=12,
                                   margin = margin(10,0,0,0, "pt")),
        axis.text.y = element_text(size=12,
                                   margin = margin(0,10,0,10, "pt")),
        axis.title = element_text(size=12),
        axis.ticks.length = unit(-5, "points"),
        panel.border = element_rect(size = 2))
daily_sum

###
