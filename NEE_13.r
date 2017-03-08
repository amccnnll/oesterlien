# NEE from Eddy data
# version 1.0
# alistair mcconnell

# see Daily_NEE.R for data subsetting

# define colour palette
nee.palette <- colorRampPalette(brewer.pal(11, 'RdBu'), space='Lab')

# data wrangling: average over 30 minutes, convert to gC, cumulate sums
Oesterlien_C_R_2013$NEE_f_gC_30 <- Oesterlien_C_R_2013$NEE_f / 1000000 * 60 * 30 * 12
Oesterlien_C_R_2013$NEE_f_gC_cumu <- cumsum(Oesterlien_C_R_2013$NEE_f_gC_30)

# cumulative NEE plots
ccumugC13 <- ggplot(Oesterlien_C_R_2013, aes(x = DoY, y = NEE_f_gC_cumu)) +

             geom_vline(xintercept = 142,
                        color = "black",
                        linetype = "dashed") +
             geom_vline(xintercept = 292,
                        color = "black",
                        linetype = "dashed") +
             geom_hline(yintercept = 0,
                        color = "black") +
             geom_smooth(color = "red",
                         method = "loess",
                         span = 0.1) +
             theme_bw() +
             xlab("") +
             ylab(bquote('Cumulative NEE [gC '~m^-2~']')) +
             scale_x_continuous(expand = c(0, 0),
                                breaks = pretty(O13$DoY, n = 10)) +
                                scale_y_continuous(expand = c(0,0),
                                                   limits = c(-50, 50)) +

             theme(axis.text.x = element_text(size = 12,
                                              margin = margin(10,0,0,0, "pt")),
                    axis.text.y = element_text(size = 12,
                                               margin = margin(0,10,0,0, "pt")),
                    axis.title = element_text(size = 12),
                    axis.ticks.length = unit(-5, "points"),
                    panel.border = element_rect(size = 2)) +

             annotate("text", x = 8, y = 185, label = "(b)", fontface = 2)

  #annotate("text", x = 340, y = -80, label = "-34.23 gC / year", fontface = 1)

ccumugC13
