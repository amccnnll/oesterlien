# data wrangling for eddy data
# version 1.0
# alistair mcconnell

Oesterlien_C_R_2013[Oesterlien_C_R_2013 == -10000] <- NA
Oesterlien_C_R_2013[Oesterlien_C_R_2013 == -9999] <- NA

Oesterlien_C_R_2014[Oesterlien_C_R_2014 == -10000] <- NA
Oesterlien_C_R_2014[Oesterlien_C_R_2014 == -9999] <- NA

Oesterlien_C_R_2015[Oesterlien_C_R_2015 == -10000] <- NA
Oesterlien_C_R_2015[Oesterlien_C_R_2015 == -9999] <- NA

### 2013

Oesterlien_C_R_2013$season <- "winter"

Oesterlien_C_R_2013 <- transform(Oesterlien_C_R_2013, season = ifelse(DoY >= 77, "spring", season))

Oesterlien_C_R_2013 <- transform(Oesterlien_C_R_2013, season = ifelse(DoY >= 143, "summer", season))

Oesterlien_C_R_2013 <- transform(Oesterlien_C_R_2013, season = ifelse(DoY >= 227, "autumn", season))

Oesterlien_C_R_2013 <- transform(Oesterlien_C_R_2013, season = ifelse(DoY >= 281, "winter", season))

### 2014

Oesterlien_C_R_2014$season <- "winter"

Oesterlien_C_R_2014 <- transform(Oesterlien_C_R_2014, season = ifelse(DoY >= 90, "spring", season))

Oesterlien_C_R_2014 <- transform(Oesterlien_C_R_2014, season = ifelse(DoY >= 130, "summer", season))

Oesterlien_C_R_2014 <- transform(Oesterlien_C_R_2014, season = ifelse(DoY >= 226, "autumn", season))

Oesterlien_C_R_2013 <- transform(Oesterlien_C_R_2013, season = ifelse(DoY >= 269, "winter", season))

### 2015

Oesterlien_C_R_2015$season <- "winter"

Oesterlien_C_R_2015 <- transform(Oesterlien_C_R_2015, season = ifelse(DoY >= 105, "spring", season))

Oesterlien_C_R_2015 <- transform(Oesterlien_C_R_2015, season = ifelse(DoY >= 148, "summer", season))

Oesterlien_C_R_2015 <- transform(Oesterlien_C_R_2015, season = ifelse(DoY >= 217, "autumn", season))

Oesterlien_C_R_2015 <- transform(Oesterlien_C_R_2015, season = ifelse(DoY >= 276, "winter", season))