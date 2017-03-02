# heat map of NEE from Østerlien 2013
# version 1.0
# alistair mcconnell

# define colour palette
nee.palette <- colorRampPalette(brewer.pal(11, 'RdBu'), space = "Lab")

# plot the heatmap
# make sure O13 is set in the global environment
NEE_heatmap_13 <- ggplot(O13, aes(x = DoY,
                                  y = Hour,
                                  fill = NEE_f)) +
  geom_tile() +
  
  scale_fill_gradientn(colours = nee.palette(100),
                       na.value = "grey",
                       breaks=c(-10, -8, -6, -4, -2, 0, 2, 4, 6, 8),
                       limits=c(-10, 8)) +
  
  geom_vline(xintercept = 144, color = "black", linetype = "dashed", size = 1) +
  
  theme_bw() +
  
  xlab("") +
  
  ylab("Hour of day") +
  
  scale_x_continuous(expand = c(0,0),
                     breaks = pretty(O13$DoY, n = 10)) +
  
  scale_y_continuous(expand = c(0,0),
                     limits = c(0,24),
                     breaks = c(0,6,12,18,24)) +
  
  theme(axis.text.x = element_text(size=12, margin = margin(10,0,0,0, "pt")),
        axis.text.y = element_text(size=12, margin = margin(0,10,0,0, "pt")),
        axis.title = element_text(size=12),
        axis.ticks.length = unit(-5, "points"),
        axis.ticks = element_line(size = 1),
        panel.border = element_rect(size = 2)) +
  
  annotate("text", x = 8, y = 23, label = "(a)", fontface = 2)

# set colourbar to mach plot height
panel_height = unit(1,"npc") - sum(ggplotGrob(hmnee)[["heights"]][-3]) - unit(1,"line")

NEE_heatmap_13 <- NEE_heatmap_13 + guides(fill= guide_colourbar(barheight = panel_height,
                                                                title = bquote('NEE ['*mu~ 'mol' ~CO[2]~ m^-2~s^-1*']'),
                                                                title.position = "right",
                                                                ticks = F,
                                                                title.theme = element_text(angle = 90),
                                                                title.hjust = 0.5,
                                                                draw.ulim = F,
                                                                draw.llim = F))

# draw the plot
NEE_heatmap_13