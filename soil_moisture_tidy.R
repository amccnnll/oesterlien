# making soil moisture data TIDY compliant and aggregating into daily means per year
# version 1.0
# alistair mcconnell

# gather soil moisture by depth
soil_moisture <- gather(soil_moisture,
                        "depth",
                        "soilmoisture",
                        c(SM10, SM20, SM30),
                        na.rm = T,
                        convert = F,
                        factor_key = F)

# convert to numeric depth
soil_moisture$depth[soil_moisture$depth == "SM10"] <- 10
soil_moisture$depth[soil_moisture$depth == "SM20"] <- 20
soil_moisture$depth[soil_moisture$depth == "SM30"] <- 30

# split into years
sm13 <- subset(soil_moisture, soil_moisture$Year == 2013)
sm14 <- subset(soil_moisture, soil_moisture$Year == 2014)
sm15 <- subset(soil_moisture, soil_moisture$Year == 2015)

# aggregate into daily means
sm13_daily <- aggregate(sm13, by = list(sm13$DoY, sm13$depth), FUN = mean, na.rm = T)
sm14_daily <- aggregate(sm14, by = list(sm14$DoY, sm14$depth), FUN = mean, na.rm = T)
sm15_daily <- aggregate(sm15, by = list(sm15$DoY, sm15$depth), FUN = mean, na.rm = T)

# cut the fat
sm13_daily$DoY <- NULL
sm13_daily$depth <- NULL
sm13_daily$Year <- NULL
sm13_daily$Hour <- NULL
sm13_daily$Date <- NULL
sm14_daily$DoY <- NULL
sm14_daily$depth <- NULL
sm14_daily$Year <- NULL
sm14_daily$Hour <- NULL
sm14_daily$Date <- NULL
sm15_daily$DoY <- NULL
sm15_daily$depth <- NULL
sm15_daily$Year <- NULL
sm15_daily$Hour <- NULL
sm15_daily$Date <- NULL

# rename aggregated columns
names(sm13_daily)[names(sm13_daily)=="Group.1"] <- "DoY"
names(sm13_daily)[names(sm13_daily)=="Group.2"] <- "depth"
names(sm14_daily)[names(sm14_daily)=="Group.1"] <- "DoY"
names(sm14_daily)[names(sm14_daily)=="Group.2"] <- "depth"
names(sm15_daily)[names(sm15_daily)=="Group.1"] <- "DoY"
names(sm15_daily)[names(sm15_daily)=="Group.2"] <- "depth"

# convert to numeric
sm13_daily$depth <- as.numeric(sm13_daily$depth)
sm14_daily$depth <- as.numeric(sm14_daily$depth)
sm15_daily$depth <- as.numeric(sm15_daily$depth)

sm13_daily$soilmoisture <- as.numeric(sm13_daily$soilmoisture)
sm14_daily$soilmoisture <- as.numeric(sm14_daily$soilmoisture)
sm15_daily$soilmoisture <- as.numeric(sm15_daily$soilmoisture)

sm13_daily$DoY <- as.numeric(sm13_daily$DoY)
sm14_daily$DoY <- as.numeric(sm14_daily$DoY)
sm15_daily$DoY <- as.numeric(sm15_daily$DoY)
