library(scatterplot3d)
with(df2, {
  scatterplot3d(X2,   # x axis
                Y2,     # y axis
                wind_dir    # z axis
                )
})

library(ggplot2)
library(ggsubplot)

# Make up some data
set.seed(955)
dat <- data.frame(cond = rep(c("A", "B"), each=5000),
                  xvar = c(rep(1:20,250) + rnorm(5000,sd=5),rep(16:35,250) + rnorm(5000,sd=5)),
                  yvar = c(rep(1:20,250) + rnorm(5000,sd=5),rep(16:35,250) + rnorm(5000,sd=5)))


# Scatterplot with subplots (simple)
ggplot(dat, aes(x=xvar, y=yvar)) +
  geom_point(shape=1) +
  geom_subplot2d(aes(xvar, yvar,
                     subplot = geom_bar(aes(rep("dummy", length(xvar)), ..count..))), bins = c(15,15), ref = NULL, width = rel(0.8), ply.aes = FALSE)

###

df4 <- df2
exclude <- c(-10:10)
df4<- df2 %>% filter(!(X %in% exclude))

ptest2 <- plot_ly(df4, x = ~X, y = ~Y, z = ~wind_dir, 
             marker = list(size = 3, color = ~wind_speed, colorscale = "Viridis", showscale = F)) %>%
  add_markers(opacity = 0.6) %>%
  layout(scene = list(xaxis = list(title = 'X'),
                      yaxis = list(title = 'Y'),
                      zaxis = list(title = 'Z'))
        )
ptest2