am.palette <- colorRampPalette(brewer.pal(11, 'RdYlBu'), space='Lab')

# am.palette(11)
1         #A50026
2         #D73026
3         #F36C43
4         #FDAD60
5         #FEDF90
6         #FFFFBF
7         #DFF2F8
8         #ABD8E9
9         #73ACD1
10        #4574B3
11        #313594
  

x <- X2015_soilprofile_30mins 

x$Day <- yday(x$Date)

x2 <- aggregate(Temp ~ Day + Depth, data = x, FUN= "mean")

# IMPORTANT - need to add na.rm so depth 20 isn't removed?

write.csv(dat, file = "2015_soilprofile_dailymeanFINAL_int.csv")

x2 <- aggregate(Temp ~ Day + Depth, data = x, FUN= "mean")

#############################################
##                                         ##
##                                         ##
##                                         ##
#############################################

#O13$dailyNEE_30 <- O13$NEE_f * 60 * 30 *12 / 1000000
daily13 <- Oesterlien_C_R_2013
daily13$Date <- NULL

daily13$NEE_30 <- daily13$NEE_f * 30 * 60 * 12 / 1000000
#daily13_mean <- aggregate(daily13, by = list(daily13$DoY), FUN = "mean", na.rm = T)
=======
daily13_mean <- aggregate(daily13, by = list(daily13$DoY), FUN = "mean", na.rm = T)
>>>>>>> 92783b1be08099231c2432104c5d09afed830446
daily13_sum <- aggregate(daily13, by = list(daily13$DoY), FUN = "sum", na.rm = T)

daily13_sum$DoY <- daily13_sum$DoY / 48
daily13_sum$Year <- daily13_sum$Year / 48
daily13_sum$Hour <- daily13_sum$Hour / 48
<<<<<<< HEAD

daily_sum <- ggplot(daily13_sum, aes(DoY, NEE_30)) +
=======

### check this:
O13$dailyNEE_30 <- O13$NEE_f * 60 * 30 *12 / 1000000
O13c <- aggregate(O13, by = list(O13$DoY), FUN = "sum")
O13c$DoY <- O13c$DoY / 48


daily_sum <- ggplot(O13c, aes(DoY, dailyNEE_30)) +
>>>>>>> 92783b1be08099231c2432104c5d09afed830446
  
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

library(plotly)

ax <- list(showgrid = F,
           ticks = "inside",
           tick0 = 0,
           dtick= 50,
           linewidth = 2,
           fixedrange = T,
           mirror = T,
           title = "day of year",
           range = c(0, 365))

ay <- list(showgrid = F,
           linewidth = 2,
           fixedrange = T,
           mirror = F,
           title = "Daily NEE",
           range = c(-0.065, 0.065))

ay2 <- list(showgrid = F,
            linewidth = 2,
            fixedrange = T,
            overlaying = "y",
            side = "right",
            title = "cumulative NEE",
            range = c(-50, 50))

p <- plot_ly() %>%
  
  add_trace(x = O13c$DoY,
            y = O13c$dailyNEE_30,
            mode = 'markers',
            color = ) %>%
  
  add_lines(x = O13$DoY,
            y = O13$NEE_cumu,
            yaxis = "y2") %>%
  
  layout(xaxis = ax,
         yaxis = ay,
         yaxis2 = ay2,
         showlegend = F,
         hoverinfo = "none") %>%
  
  config(displayModeBar = F)

p
