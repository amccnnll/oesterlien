# NEE from Eddy data
# version 1.0
# alistair mcconnell

# see Daily_NEE.R for data subsetting

# define colour palette
nee.palette <- colorRampPalette(brewer.pal(11, 'RdBu'), space = 'Lab')

# data wrangling: average over 30 minutes, convert to gC, cumulate sums
Oesterlien_C_R_2013$NEE_f_gC_30 <- Oesterlien_C_R_2013$NEE_f / 1000000 * 60 * 30 * 12
Oesterlien_C_R_2013$NEE_f_gC_cumu <- cumsum(Oesterlien_C_R_2013$NEE_f_gC_30)

Oesterlien_C_R_2014$NEE_f_gC_30 <- Oesterlien_C_R_2014$NEE_f / 1000000 * 60 * 30 * 12
Oesterlien_C_R_2014$NEE_f_gC_cumu <- cumsum(Oesterlien_C_R_2014$NEE_f_gC_30)
Oesterlien_C_R2014$NEE_cumu_roll <- rollapply(data = Oesterlien_C_R2014$NEE_f_gC_cumu, width = 7, FUN = mean, partial = T)

# cumulative NEE plots
ccumugC13 <- ggplot(Oesterlien_C_R_2013, aes(x = DoY, y = NEE_f_gC_cumu)) +

             geom_hline(yintercept = 0,
                        color = "black") +

             geom_line(color = "red",
                       size = 1) +
             geom_line(data = Oesterlien_C_R_2014,
                       aes(x = DoY, y = NEE_f_gC_cumu),
                       colour = "blue",
                       size = 1) +

             theme_bw() +
             xlab("") +
             ylab(bquote('Cumulative NEE [gC '~m^-2~']')) +

             scale_x_continuous(expand = c(0, 0),
                                breaks = pretty(O13$DoY, n = 10)) +
             scale_y_continuous(expand = c(0,0),
                                limits = c(-100, 50)) +

             theme(axis.text.x = element_text(size = 12,
                                              margin = margin(10,0,0,0, "pt")),
                    axis.text.y = element_text(size = 12,
                                               margin = margin(0,10,0,0, "pt")),
                    axis.title = element_text(size = 12),
                    axis.ticks.length = unit(-5, "points"),
                    panel.border = element_rect(size = 2)) +

             annotate("text",
                      x = 15,
                      y = 40,
                      label = "--- 2013",
                      colour = "red",
                      fontface = 2) +
             annotate("text",
                      x = 15,
                      y = 30,
                      label = "--- 2014",
                      colour = "blue",
                      fontface = 2)


  #annotate("text", x = 340, y = -80, label = "-34.23 gC / year", fontface = 1)

ccumugC13
