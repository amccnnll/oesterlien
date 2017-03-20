# NEE facet by Rnet
# alistair mcconne
# østerlien p1
# 13/03/2017

# data wranglin' yeehaw!
Oesterlien_C_R_2013 <- Oesterlien_C_R_2013[1:17520,]

prime13 <- data.frame(Oesterlien_C_R_2013$Year, Oesterlien_C_R_2013$DoY, Oesterlien_C_R_2013$Hour, CX13$NEE_f, Oesterlien_C_R_2013$season, Oesterlien_C_R_2013$Tair_f, met13$Net_radiation_Wm.2, X2013SoilTemp$Temp, met13$Air_pressure_mbar, met13$Wind_speed_avg_ms.1, met13$Soil_moisture_10.cm_vol, Oesterlien_C_R_2013$Ustar, CX13$GPP_f, CX13$Reco, met13$Shortwave_incoming_radiation_Wm.2, met13$Shortwave_net_radiation_Wm.2, met13$Longwave_incoming_radiation_Wm.2, met13$Longwave_net_radiation_Wm.2, met13$Wind.direction_degrees, CX13$H_f, CX13$LE_f, CX13$Tsoil_f, met13$Shortwave_net_radiation_Wm.2, met13$Longwave_net_radiation_Wm.2)

setnames(prime13, c("Year", "DoY", "hour", "NEE", "season", "Tair", "Rnet", "Tsoil", "Airp", "Wind_s", "Soil_m", "ustar", "GPP", "Reco", "SW_in", "SW_net", "LW_in", "LW_net", "Wind_dir", "H", "LE", "Tground", "SWnet", "LWnet"))

prime13$NEE_gC_30 <- prime13$NEE * 60 * 30 * 12 / 1000000

prime13_by_season <- aggregate.data.frame(prime13, by = list(prime13$season, prime13$hour), FUN = mean, na.rm = T)

prime13_by_season$season <- NULL
names(prime13_by_season)[1]<-"season"
prime13_by_season$hour <- NULL
names(prime13_by_season)[2]<-"hour"

prime13_suspect <- ggplot(prime13_by_season) +
                   geom_line(aes(hour, Reco), colour = "darkslateblue") +
                   geom_line(aes(hour, GPP), colour = "darkturquoise") +
                   geom_line(aes(hour, NEE), colour = "orangered") +
                   theme_bw() + 
                   scale_x_continuous(expand = c(0, 0),
                                    limits = c(0, 23.5),
                                    breaks = c(0, 6, 12, 18, 23.5),
                                    labels = c("0", "6", "12", "18", "24")) +
                   scale_y_continuous(expand = c(0, 0)) +
                   facet_grid(. ~ season) +
                   theme(panel.spacing = unit(1, "lines"))
  

prime13_suspect

### Rnet
prime13_suspect2 <- ggplot(prime13_by_season) +
  geom_line(aes(hour, Rnet), colour = "darkslateblue") +
  geom_line(aes(hour, SWnet), colour = "darkturquoise") +
  geom_line(aes(hour, LWnet), colour = "orangered") +
  geom_hline(yintercept = 0) +
  theme_bw() + 
  scale_x_continuous(expand = c(0, 0),
                     limits = c(0, 23.5),
                     breaks = c(0, 6, 12, 18, 23.5),
                     labels = c("0", "6", "12", "18", "24")) +
  scale_y_continuous(expand = c(0, 0)) +
  facet_grid(. ~ season) +
  theme(panel.spacing = unit(1, "lines"))


prime13_suspect2

#base plot




######
# 2014
######

Oesterlien_C_R_2014 <- Oesterlien_C_R_2014[1:17520,]

prime14 <- data.frame(Oesterlien_C_R_2014$Year, Oesterlien_C_R_2014$DoY, Oesterlien_C_R_2014$Hour, Oesterlien_C_R_2014$NEE_f, Oesterlien_C_R_2014$season, Oesterlien_C_R_2014$Tair_f, met14$Net_radiation_Wm.2, Oesterlien_C_R_2014$Tsoil, met14$Air_pressure_mbar, met14$Wind_speed_avg_ms.1, met14$Soil_moisture_10.cm_vol, Oesterlien_C_R_2014$Ustar, Oesterlien_C_R_2014$GPP_f, Oesterlien_C_R_2014$Reco, met14$Shortwave_incoming_radiation_Wm.2, met14$Shortwave_net_radiation_Wm.2, met14$Longwave_incoming_radiation_Wm.2, met14$Longwave_net_radiation_Wm.2, met14$Wind.direction_degrees, Oesterlien_C_R_2014$H_f, Oesterlien_C_R_2014$LE_f, Oesterlien_C_R_2014$Tsoil_f, met14$Shortwave_net_radiation_Wm.2, met14$Longwave_net_radiation_Wm.2)

setnames(prime14, c("Year", "DoY", "hour", "NEE", "season", "Tair", "Rnet", "Tsoil", "Airp", "Wind_s", "Soil_m", "ustar", "GPP", "Reco", "SW_in", "SW_net", "LW_in", "LW_net", "Wind_dir", "H", "LE", "Tground", "SWnet", "LWnet"))

prime14$NEE_gC_30 <- prime14$NEE * 60 * 30 * 12 / 1000000

prime14_by_season <- aggregate.data.frame(prime14, by = list(prime14$season, prime14$hour), FUN = mean, na.rm = T)

prime14_by_season$season <- NULL
names(prime14_by_season)[1]<-"season"
prime14_by_season$hour <- NULL
names(prime14_by_season)[2]<-"hour"

######
# 2015
######

Oesterlien_C_R_2015 <- Oesterlien_C_R_2015[1:17520,]

prime15 <- data.frame(Oesterlien_C_R_2015$Year, Oesterlien_C_R_2015$DoY, Oesterlien_C_R_2015$Hour, Oesterlien_C_R_2015$NEE_f, Oesterlien_C_R_2015$season, Oesterlien_C_R_2015$Tair_f, met15$Net_radiation_Wm.2, Oesterlien_C_R_2015$Tsoil, met15$Air_pressure_mbar, met15$Wind_speed_avg_ms.1, met15$Soil_moisture_10.cm_vol, Oesterlien_C_R_2015$Ustar, Oesterlien_C_R_2015$GPP_f, Oesterlien_C_R_2015$Reco, met15$Shortwave_incoming_radiation_Wm.2, met15$Shortwave_net_radiation_Wm.2, met15$Longwave_incoming_radiation_Wm.2, met15$Longwave_net_radiation_Wm.2, met15$Wind.direction_degrees, Oesterlien_C_R_2015$H_f, Oesterlien_C_R_2015$LE_f, Oesterlien_C_R_2015$Tsoil_f, met15$Shortwave_net_radiation_Wm.2, met15$Longwave_net_radiation_Wm.2)

setnames(prime15, c("Year","DoY", "hour", "NEE", "season", "Tair", "Rnet", "Tsoil", "Airp", "Wind_s", "Soil_m", "ustar", "GPP", "Reco", "SW_in", "SW_net", "LW_in", "LW_net", "Wind_dir", "H", "LE", "Tground", "SWnet", "LWnet"))

prime15$NEE_gC_30 <- prime15$NEE * 60 * 30 * 12 / 1000000

prime15_by_season <- aggregate.data.frame(prime15, by = list(prime15$season, prime15$hour), FUN = mean, na.rm = T)

prime15_by_season$season <- NULL
names(prime15_by_season)[1]<-"season"
prime15_by_season$hour <- NULL
names(prime15_by_season)[2]<-"hour"

prime14_by_season$GPP <- prime14_by_season$GPP * -1
prime15_by_season$GPP <- prime15_by_season$GPP * -1


primesX <- rbind(prime13_by_season, prime14_by_season, prime15_by_season)

primesX$NEE_30 <- primesX$NEE * 60 * 30 * 12 / 1000000
primesX$GPP_30 <- primesX$GPP * 60 * 30 * 12 / 1000000
primesX$Reco_30 <- primesX$Reco * 60 * 30 * 12 / 1000000



######
# plot
######

ggplot(primesX) +
  geom_line(aes(hour, Rnet, colour = "Rnet"), size = 1) +
  geom_line(aes(hour, SWnet, colour = "SWnet"), size = 1) +
  geom_line(aes(hour, LWnet, colour = "LWnet"), size = 1) +
  scale_color_manual("",
                     breaks = c("Rnet", "SWnet", "LWnet"),
                     values = c("Rnet" = "orangered2", "SWnet" = "darkturquoise", "LWnet" = "darkslateblue")) +
  geom_hline(yintercept = 0) +
  theme_bw() + 
  scale_x_continuous(expand = c(0, 0),
                     limits = c(0, 23.5),
                     breaks = c(0, 6, 12, 18, 23.5),
                     labels = c("0", "6", "12", "18", "24")) +
  scale_y_continuous(expand = c(0, 0)) +
  facet_grid(Year ~ season) +
  ylab("Radiation (W m-2)") +
  theme(panel.spacing = unit(1, "lines"),
        legend.position = "bottom",
        panel.border = element_rect(size = 2))


#####

# OFF GRID

df <- prime13
df <- df %>% dplyr::select(-season, -hour, -H, -LE, -Soil_m, -SW_in, -SW_net, -LW_in, -LW_net, -NEE, -GPP, -Reco, -Tair, -Tsoil, -Tground, -Airp, -ustar, -Wind_dir, -Wind_s, everything())

df13 <- aggregate.data.frame(df, by = list(df$season, df$hour), FUN = mean, na.rm = T)

df13$season <- NULL
names(df13)[1] <-"season"
df13$hour <- NULL
names(df13)[2]<-"hour"

df1 <- subset(df13, df13$season == "spring")
df2 <- subset(df13, df13$season == "summer")
df3 <- subset(df13, df13$season == "autumn")
df4 <- subset(df13, df13$season == "winter")

df1$DoY <- NULL
df1$NEE_gC_30 <- NULL
df2$DoY <- NULL
df2$NEE_gC_30 <- NULL
df3$DoY <- NULL
df3$NEE_gC_30 <- NULL
df4$DoY <- NULL
df4$NEE_gC_30 <- NULL