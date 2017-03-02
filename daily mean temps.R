x <- X2015_soilprofile_30mins 

x$Day <- yday(x$Date)

x2 <- aggregate(Temp ~ Day + Depth, data = x, FUN= "mean")

# IMPORTANT - need to add na.rm so depth 20 isn't removed?

write.csv(dat, file = "2015_soilprofile_dailymeanFINAL_int.csv")

x2 <- aggregate(Temp ~ Day + Depth, data = x, FUN= "mean")


O13$dailyNEE_30 <- O13$NEE_f * 60 * 30 *12 / 1000000
O13c <- aggregate(O13, by = list(O13$DoY), FUN = "sum")
O13c$DoY <- O13c$DoY / 48

daily_sum <- ggplot(O13c, aes(DoY, dailyNEE_30)) +
  
             geom_segment(xend = O13c$DoY, yend = 0, colour = "blue", size = 1) +
        
             geom_smooth(color = "red", method = "loess", span = 0.1, se = F) +
  
             theme_bw() +
  
             scale_x_continuous(expand = c(0, 0),
                                breaks = pretty(O13$DoY, n = 10)) +
  
             scale_y_continuous(expand = c(0,0)) +
  
             theme(axis.text.x=element_text(size=12, margin = margin(10,0,0,0, "pt")),
                   axis.text.y=element_text(size=12, margin = margin(0,10,0,0, "pt")),
                   axis.title=element_text(size=12),
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
            mode = 'markers') %>%
  
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
