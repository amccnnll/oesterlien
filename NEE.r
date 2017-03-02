hm.palette <- colorRampPalette(brewer.pal(11, 'RdBu'), space='Lab')

hmnee <- ggplot(O13, aes(x = DoY,
                         y = Hour,
                         fill = NEE_f)) +
  
  geom_tile() +
  
  scale_fill_gradientn(colours = hm.palette(1000),
                       na.value = "grey",
                       breaks=c(-10, -8, -6, -4, -2, 0, 2, 4, 6, 8),
                       limits=c(-10, 8)) +
  
  geom_vline(xintercept = 144, color = "black", linetype = "dashed", size = 1) +
  
  theme_bw() +
  
  xlab("") +
  
  ylab("Hour of day") +
  
  scale_x_continuous(expand=c(0,0),
                     breaks = pretty(O13$DoY, n = 10)) +
  
  scale_y_continuous(expand=c(0,0),
                     limits = c(0,24),
                     breaks = c(0,6,12,18,24)) +
  
  theme(axis.text.x = element_text(size=12, margin = margin(10,0,0,0, "pt")),
        axis.text.y = element_text(size=12, margin = margin(0,10,0,0, "pt")),
        axis.title = element_text(size=12),
        #panel.background = element_rect(fill = "grey95"),
        axis.ticks.length = unit(-5, "points"),
        axis.ticks = element_line(size = 1),
        #axis.line = element_line(size = 1),
        panel.border = element_rect(size = 2)) +
  
  annotate("text", x = 8, y = 23, label = "(a)", fontface = 2)

###
  
panel_height = unit(1,"npc") - sum(ggplotGrob(hmnee)[["heights"]][-3]) - unit(1,"line")

hmnee <- hmnee + guides(fill= guide_colourbar(barheight = panel_height,
                              title = bquote('NEE ['*mu~ 'mol' ~CO[2]~ m^-2~s^-1*']'),
                              title.position = "right",
                              ticks = F,
                              title.theme = element_text(angle = 90),
                              title.hjust = 0.5,
                              draw.ulim = F,
                              draw.llim = F))
hmnee

# + theme(legend.key.height = unit(0.15, "npc"), legend.title.align = -0.15)



######

#### CUMU NEE

O13$NEE_f_g30 <- O13$NEE_f / 1000000 * 30 * 60 * 12
O13$NEE_cumu <- cumsum(O13$NEE_f_g30)

O13$NEE_f_g30raw <- O13$NEE / 1000000 * 30 * 60 * 12
O13$NEE_f_g30raw[is.na(O13$NEE_f_g30raw)] <- 0
O13$NEE_cumu_raw <- cumsum(O13$NEE_f_g30raw)


cumunee <- ggplot(O13, aes(x = DoY,
                           y = NEE_cumu)) +
  
  #geom_line() +
  geom_vline(xintercept = 144, color = "black", linetype = "dashed") +
  geom_hline(yintercept = 0, color = "black") +
  geom_smooth(color = "red", method = "loess", span = 0.1) +
  #geom_smooth(data = O13, aes(x = DoY, y = NEE_cumu_raw), color = "blue", method = "loess", span = 0.1) +
  
  theme_bw() +
  
  xlab("Day of year 2013") +
  
  ylab(bquote('Cumulative NEE [gC '~m^-2~']')) +
  
  scale_x_continuous(expand = c(0, 0),
                     breaks = pretty(O13$DoY, n = 10)) +
  
  scale_y_continuous(expand = c(0,0),
                     limits = c(-50, 50)) +
  
  theme(axis.text.x=element_text(size=12, margin = margin(10,0,0,0, "pt")),
        axis.text.y=element_text(size=12, margin = margin(0,10,0,0, "pt")),
        axis.title=element_text(size=12),
        axis.ticks.length = unit(-5, "points"),
        panel.border = element_rect(size = 2)) +
  
  annotate("text", x = 8, y = 185, label = "(b)", fontface = 2)
  #annotate("text", x = 340, y = -80, label = "-34.23 gC / year", fontface = 1)

cumunee

## GRID

gA <- hmnee
gB <- cumunee
gC <- daily_sum

ptest <- subplot(gA, gB, gC,
                 nrows = 3,
                 titleX = T,
                 titleY = T
)