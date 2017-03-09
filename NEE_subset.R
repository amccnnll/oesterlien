# NEE from Eddy data
# version 1.0
# alistair mcconnell

# SUBSET MAMA JAMA
OCR13ov <- subset(Oesterlien_C_R_2013, Oesterlien_C_R_2013$DoY >= 193)
OCR13ov <- subset(OCR13ov, OCR13ov$DoY <= 222)

OCR14ov <- subset(Oesterlien_C_R_2014, Oesterlien_C_R_2014$DoY >= 193)
OCR14ov <- subset(OCR13ov, OCR13ov$DoY <= 222)

OCR15ov <- subset(Oesterlien_C_R_2015, Oesterlien_C_R_2015$DoY >= 193)
OCR15ov <- subset(OCR13ov, OCR13ov$DoY <= 222)

# define colour palette
nee.palette <- colorRampPalette(brewer.pal(11, 'RdBu'), space = 'Lab')

# data wrangling: average over 30 minutes, convert to gC, cumulate sums
OCR13ov$NEE_f_gC_30 <- OCR13ov$NEE_f / 1000000 * 60 * 30 * 12
OCR13ov$NEE_f_gC_cumu <- cumsum(OCR13ov$NEE_f_gC_30)
OCR13ov$NEE_f_gC_1hr <- rollapply( data = OCR13ov$NEE_f_gC_30, width = 48, FUN = mean, partial = T )
OCR13ov$DD <- as.numeric( OCR13ov$DoY + (OCR13ov$Hour / 12) )

OCR14ov$NEE_f_gC_30 <- OCR14ov$NEE_f / 1000000 * 60 * 30 * 12
OCR14ov$NEE_f_gC_cumu <- cumsum(OCR14ov$NEE_f_gC_30)
OCR14ov$DD <- as.numeric( OCR14ov$DoY + (OCR14ov$Hour / 12) )

OCR15ov$NEE_f_gC_30 <- OCR15ov$NEE_f / 1000000 * 60 * 30 * 12
OCR15ov$NEE_f_gC_cumu <- cumsum(OCR15ov$NEE_f_gC_30)
OCR15ov$DD <- as.numeric( OCR15ov$DoY + (OCR15ov$Hour / 12) )


# cumulative NEE plots
OV_NEEall <- ggplot() +

             geom_hline(yintercept = 0,
                        color = "black") +

             geom_segment(data = OCR13ov,
                               aes(x = DD,
                                   y = NEE_f_gC_1hr,
                                   xend = DD,
                                   yend = 0),
                       colour = "red",
                       alpha = 0.25) +
  
             geom_point(data = OCR14ov,
                               aes(x = DD,
                                   y = NEE_f_gC_30),
                       colour = "blue",
                       size = 1,
                       alpha = 0.25) +

              geom_point(data = OCR15ov,
                                aes(x = DD,
                                    y = NEE_f_gC_30),
                        colour = "green",
                        size = 1,
                        alpha = 0.25) +

             theme_bw() +
             xlab("") +
             #ylab(bquote('NEE [gC '~m^-2~ min^-1 ']')) +

             scale_x_continuous(expand = c(0, 0),
                                limits = c(193, 222)) +
             scale_y_continuous(expand = c(0, 0),
                                limits = c(-0.1, 0.1)) +

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
                      fontface = 2) +
             annotate("text",
                      x = 15,
                      y = 30,
                      label = "--- 2015",
                      colour = "green",
                      fontface = 2)

# print
OV_NEEall
