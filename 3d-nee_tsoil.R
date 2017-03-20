library(scatterplot3d)

prime_by_summer <- subset(prime_by_season, prime_by_season$season == "summer")


a <-  with(prime_by_summer, {
  scatterplot3d(Rnet,   # x axis
                Tsoil,     # y axis
                NEE_f,    # z axis
                main="Summer")
})

prime_by_spring <- subset(prime_by_season, prime_by_season$season == "spring")

b <- with(prime_by_spring, {
  scatterplot3d(Rnet,   # x axis
                Tsoil,     # y axis
                NEE_f,    # z axis
                main="Spring")
})

prime_by_autumn <- subset(prime_by_season, prime_by_season$season == "autumn")

c <- ( with(prime_by_autumn, {
  scatterplot3d(Rnet,   # x axis
                Tsoil,     # y axis
                NEE_f,    # z axis
                main="autumn")
}) )

prime_by_winter <- subset(prime_by_season, prime_by_season$season == "winter")

d <- with(prime_by_winter, {
  scatterplot3d(Rnet,   # x axis
                Tsoil,     # y axis
                NEE_f,    # z axis
                main="Winter")
})

prime3d <- grid.arrange(a, b, c, d, ncol = 2)
prime3d

ptest2 <- plot_ly(prime_by_summer, x = ~Tsoil, y = ~Rnet, z = ~NEE_f, 
                  marker = list(size = 3, color = ~hour, colorscale = "Viridis", showscale = F))

ptest2 <- ptest2 + add_markers(opacity = 0.6))
ptest2