nee.palette <- colorRampPalette(rev(brewer.pal(11, "RdBu")), space='Lab')

# Remeber to set dat

dat <- x15
dat2 <- x14
dat3 <- x13

# dimensions

w1 <- 1200
h1 <- 300

# axes layout

axx <- list(showgrid = F,
            autotick = F,
            ticks = "outside",
            tick0 = 0,
            dtick= 30,
            ticklen = 4,
            linecolor = "black",
            linewidth = 2,
            fixedrange = T,
            mirror = T,
            title = "day of year")

axx2 <- list(showgrid = F,
            autotick = F,
            ticks = "",
            showticklabels = F,
            linecolor = "black",
            linewidth = 2,
            fixedrange = T,
            mirror = T)

axy <- list(showgrid = F,
            autorange = "reversed",
            autotick = F,
            ticks = "",
            tick0 = 0,
            dtick= 20,
            linecolor = "black",
            linewidth = 2,
            fixedrange = T,
            mirror = T)

axy2 <- list(showgrid = F,
            autorange = "reversed",
            autotick = F,
            ticks = "",
            tick0 = 0,
            dtick= 20,
            linecolor = "black",
            linewidth = 2,
            fixedrange = T,
            mirror = T,
            title = "depth below surface (cm)")

# colorbar layout

colbz <- list(yanchor = "middle",
              lenmode = "fraction",
              titleside = "right",
              title = "temperature (<sup>o</sup>C)",
              len = 1,
              ticks = "",
              tick0 = 15,
              dtick = 5,
              outlinecolor = "black",
              outlinewidth = 1,
              thickness = 20,
              xpad = 0,
              ypad = 0,
              tickfont = list(size = 10))

# 1st attempt at plotly heatmap

# PLOT 1 ------------

p1 <- plot_ly(x = dat$DoY,
             y = dat$Depth,
             z = dat$Temp,
             zmax = 15,
             zmin = -15,
             type = "heatmap",
             colorbar = colbz,
             colors = nee.palette(100),
             autocolorscale = F,
             hoverinfo = "none") %>%

     config(displayModeBar = F) %>%

     layout(yaxis = axy,
            xaxis = axx)

# PLOT 2 ------------

p2 <- plot_ly(x = dat2$DoY,
             y = dat2$Depth,
             z = dat2$Temp,
             zmax = 15,
             zmin = -15,
             type = "heatmap",
             colorbar = colbz,
             colors = nee.palette(100),
             autocolorscale = F,
             hoverinfo = "none") %>%

     config(displayModeBar = F) %>%

     layout(yaxis = axy2,
            xaxis = axx2)

# PLOT 3 -------------

p3 <- plot_ly(x = dat3$DoY,
             y = dat3$Depth,
             z = dat3$Temp,
             zmax = 15,
             zmin = -15,
             type = "heatmap",
             colorbar = colbz,
             colors = nee.palette(100),
             autocolorscale = F,
             hoverinfo = "none") %>%

     config(displayModeBar = F) %>%

     layout(yaxis = axy,
            xaxis = axx2)

# subplot displayed from top to bottom

p <- subplot(p3, p2, p1,
             nrows = 3,
             titleX = T,
             titleY = T) 

p



#%>%
#  
#  layout(annotations = list(list(x = 0.005,
#                                 y = 1,
#                                 text = "<b>2013</b>",
#                                 showarrow = F,
#                                 xref = "paper",
#                                 yref = "paper",
#                                 xanchor = "left",
#                                 yanchor = "left",
#                                 font = list(size = 12)),
#                            list(x = 0.005,
#                                 y = 0.6,
#                                 text = "<b>2014</b>",
#                                 showarrow = F,
#                                 xref = "paper",
#                                 yref = "paper",
#                                 xanchor = "left",
#                                 yanchor = "left",
#                                 font = list(size = 12)),
#                            list(x = 0.005,
#                                 y = 0.23,
#                                 text = "<b>2015</b>",
#                                 showarrow = F,
#                                 xref = "paper",
#                                 yref = "paper",
#                                 xanchor = "left",
#                                 yanchor = "left",
#                                 font = list(size = 12))))
#p
