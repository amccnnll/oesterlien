x <- X2015_soilprofile_30mins 

x$Day <- yday(x$Date)

x2 <- aggregate(Temp ~ Day + Depth, data = x, FUN= "mean")

# IMPORTANT - need to add na.rm so depth 20 isn't removed?

write.csv(dat, file = "2015_soilprofile_dailymeanFINAL_int.csv")