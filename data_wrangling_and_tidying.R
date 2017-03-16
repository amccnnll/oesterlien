# data wrangling for eddy data
# version 1.0
# alistair mcconnell

seasons_13 = c(76, 141, 230, 281)
seasons_14 = c(89, 129, 225, 268)
seasons_15 = c(104, 147, 226, 275)

Oesterlien_C_R_2013[Oesterlien_C_R_2013 == -10000] <- NA
Oesterlien_C_R_2013[Oesterlien_C_R_2013 == -9999] <- NA

Oesterlien_C_R_2013[Oesterlien_C_R_2013 < -1000] <- NA

Oesterlien_C_R_2014[Oesterlien_C_R_2014 == -10000] <- NA
Oesterlien_C_R_2014[Oesterlien_C_R_2014 == -9999] <- NA

Oesterlien_C_R_2015[Oesterlien_C_R_2015 == -10000] <- NA
Oesterlien_C_R_2015[Oesterlien_C_R_2015 == -9999] <- NA

### means
daily13_mean <- aggregate(daily13, by = list(daily13$DoY), FUN = mean, na.rm = T)
daily14_mean <- aggregate(daily14, by = list(daily14$DoY), FUN = mean, na.rm = T)
daily15_mean <- aggregate(daily15, by = list(daily15$DoY), FUN = mean, na.rm = T)


### 2013
Oesterlien_C_R_2013$season <- "winter"
Oesterlien_C_R_2013 <- transform(Oesterlien_C_R_2013, season = ifelse(DoY >= 76, "spring", season))
Oesterlien_C_R_2013 <- transform(Oesterlien_C_R_2013, season = ifelse(DoY >= 141, "summer", season))
Oesterlien_C_R_2013 <- transform(Oesterlien_C_R_2013, season = ifelse(DoY >= 230, "autumn", season))
Oesterlien_C_R_2013 <- transform(Oesterlien_C_R_2013, season = ifelse(DoY >= 281, "winter", season))

CX13$GPP_f <- CX13$GPP_f * -1
CX13$season <- "winter"
CX13 <- transform(CX13, season = ifelse(DoY >= 76, "spring", season))
CX13 <- transform(CX13, season = ifelse(DoY >= 141, "summer", season))
CX13 <- transform(CX13, season = ifelse(DoY >= 230, "autumn", season))
CX13 <- transform(CX13, season = ifelse(DoY >= 281, "winter", season))

x13$season <- "winter"
x13 <- transform(x13, season = ifelse(DoY >= 76, "spring", season))
x13 <- transform(x13, season = ifelse(DoY >= 141, "summer", season))
x13 <- transform(x13, season = ifelse(DoY >= 230, "autumn", season))
x13 <- transform(x13, season = ifelse(DoY >= 281, "winter", season))

x14$season <- "winter"
x14 <- transform(x14, season = ifelse(DoY >= 89, "spring", season))
x14 <- transform(x14, season = ifelse(DoY >= 129, "summer", season))
x14 <- transform(x14, season = ifelse(DoY >= 225, "autumn", season))
x14 <- transform(x14, season = ifelse(DoY >= 268, "winter", season))

x15$season <- "winter"
x15 <- transform(x15, season = ifelse(DoY >= 104, "spring", season))
x15 <- transform(x15, season = ifelse(DoY >= 147, "summer", season))
x15 <- transform(x15, season = ifelse(DoY >= 226, "autumn", season))
x15 <- transform(x15, season = ifelse(DoY >= 375, "winter", season))

met13_daily$season <- "winter"
met13_daily <- transform(met13_daily, season = ifelse(DoY >= 76, "spring", season))
met13_daily <- transform(met13_daily, season = ifelse(DoY >= 141, "summer", season))
met13_daily <- transform(met13_daily, season = ifelse(DoY >= 230, "autumn", season))
met13_daily <- transform(met13_daily, season = ifelse(DoY >= 281, "winter", season))

met13$season <- "winter"
met13 <- transform(met13, season = ifelse(DoY >= 76, "spring", season))
met13 <- transform(met13, season = ifelse(DoY >= 141, "summer", season))
met13 <- transform(met13, season = ifelse(DoY >= 230, "autumn", season))
met13 <- transform(met13, season = ifelse(DoY >= 281, "winter", season))

daily13_mean$season <- "winter"
daily13_mean <- transform(daily13_mean, season = ifelse(DoY >= 76, "spring", season))
daily13_mean <- transform(daily13_mean, season = ifelse(DoY >= 141, "summer", season))
daily13_mean <- transform(daily13_mean, season = ifelse(DoY >= 230, "autumn", season))
daily13_mean <- transform(daily13_mean, season = ifelse(DoY >= 281, "winter", season))

### 2014
Oesterlien_C_R_2014$season <- "winter"
Oesterlien_C_R_2014 <- transform(Oesterlien_C_R_2014, season = ifelse(DoY >= 89, "spring", season))
Oesterlien_C_R_2014 <- transform(Oesterlien_C_R_2014, season = ifelse(DoY >= 129, "summer", season))
Oesterlien_C_R_2014 <- transform(Oesterlien_C_R_2014, season = ifelse(DoY >= 225, "autumn", season))
Oesterlien_C_R_2014 <- transform(Oesterlien_C_R_2014, season = ifelse(DoY >= 268, "winter", season))

met14_daily$season <- "winter"
met14_daily <- transform(met14_daily, season = ifelse(DoY >= 89, "spring", season))
met14_daily <- transform(met14_daily, season = ifelse(DoY >= 129, "summer", season))
met14_daily <- transform(met14_daily, season = ifelse(DoY >= 225, "autumn", season))
met14_daily <- transform(met14_daily, season = ifelse(DoY >= 268, "winter", season))

met14$season <- "winter"
met14 <- transform(met14, season = ifelse(DoY >= 89, "spring", season))
met14 <- transform(met14, season = ifelse(DoY >= 129, "summer", season))
met14 <- transform(met14, season = ifelse(DoY >= 225, "autumn", season))
met14 <- transform(met14, season = ifelse(DoY >= 268, "winter", season))

daily14_mean$season <- "winter"
daily14_mean <- transform(daily14_mean, season = ifelse(DoY >= 89, "spring", season))
daily14_mean <- transform(daily14_mean, season = ifelse(DoY >= 129, "summer", season))
daily14_mean <- transform(daily14_mean, season = ifelse(DoY >= 225, "autumn", season))
daily14_mean <- transform(daily14_mean, season = ifelse(DoY >= 268, "winter", season))

### 2015
Oesterlien_C_R_2015$season <- "winter"
Oesterlien_C_R_2015 <- transform(Oesterlien_C_R_2015, season = ifelse(DoY >= 104, "spring", season))
Oesterlien_C_R_2015 <- transform(Oesterlien_C_R_2015, season = ifelse(DoY >= 147, "summer", season))
Oesterlien_C_R_2015 <- transform(Oesterlien_C_R_2015, season = ifelse(DoY >= 226, "autumn", season))
Oesterlien_C_R_2015 <- transform(Oesterlien_C_R_2015, season = ifelse(DoY >= 275, "winter", season))

met15_daily$season <- "winter"
met15_daily <- transform(met15_daily, season = ifelse(DoY >= 104, "spring", season))
met15_daily <- transform(met15_daily, season = ifelse(DoY >= 147, "summer", season))
met15_daily <- transform(met15_daily, season = ifelse(DoY >= 226, "autumn", season))
met15_daily <- transform(met15_daily, season = ifelse(DoY >= 275, "winter", season))

met15$season <- "winter"
met15 <- transform(met15, season = ifelse(DoY >= 104, "spring", season))
met15 <- transform(met15, season = ifelse(DoY >= 147, "summer", season))
met15 <- transform(met15, season = ifelse(DoY >= 226, "autumn", season))
met15 <- transform(met15, season = ifelse(DoY >= 275, "winter", season))

daily15_mean$season <- "winter"
daily15_mean <- transform(daily15_mean, season = ifelse(DoY >= 104, "spring", season))
daily15_mean <- transform(daily15_mean, season = ifelse(DoY >= 147, "summer", season))
daily15_mean <- transform(daily15_mean, season = ifelse(DoY >= 226, "autumn", season))
daily15_mean <- transform(daily15_mean, season = ifelse(DoY >= 275, "winter", season))