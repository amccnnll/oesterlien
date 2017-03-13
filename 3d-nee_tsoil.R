library(scatterplot3d)

prime_by_summer <- subset(prime_by_season, prime_by_season$season == "summer")


a <-  scatterplot3d(data = prime_by_summer,
                    x = Rnet,
                    y = Tsoil,
                    z = NEE_f,
                    color = hour,
                    main = "Summer")

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

ptest2 <- plot_ly(prime_by_summer, x = ~hour, y = ~Tsoil, z = ~Rnet, 
                  marker = list(size = 3, color = ~NEE_f, colorscale = "Viridis", showscale = T))

ptest2 <- ptest2 + add_markers(opacity = 0.6))
ptest2