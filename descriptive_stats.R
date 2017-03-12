daily13_mean$NEEday <- daily13_mean$NEE_f * 60 * 60 * 24 / 1000000 * 12
daily14_mean$NEEday <- daily14_mean$NEE_f * 60 * 60 * 24 / 1000000 * 12
daily15_mean$NEEday <- daily15_mean$NEE_f * 60 * 60 * 24 / 1000000 * 12


STATS13m <- aggregate(daily13_mean, by = list(daily13_mean$season), FUN = mean, na.rm = T)
STATS14m <- aggregate(daily14_mean, by = list(daily14_mean$season), FUN = mean, na.rm = T)
STATS15m <- aggregate(daily15_mean, by = list(daily15_mean$season), FUN = mean, na.rm = T)

STATS13sd <- aggregate(daily13_mean, by = list(daily13_mean$season), FUN = sd, na.rm = T)
STATS14sd <- aggregate(daily14_mean, by = list(daily14_mean$season), FUN = sd, na.rm = T)
STATS15sd <- aggregate(daily15_mean, by = list(daily15_mean$season), FUN = sd, na.rm = T)

metSTATS13m <- aggregate(met13_daily, by = list(met13_daily$season), FUN = mean, na.rm = T)
metSTATS14m <- aggregate(met14_daily, by = list(met14_daily$season), FUN = mean, na.rm = T)
metSTATS15m <- aggregate(met15_daily, by = list(met15_daily$season), FUN = mean, na.rm = T)

metSTATS13sd <- aggregate(met13_daily, by = list(met13_daily$season), FUN = sd, na.rm = T)
metSTATS14sd <- aggregate(met14_daily, by = list(met14_daily$season), FUN = sd, na.rm = T)
metSTATS15sd <- aggregate(met15_daily, by = list(met15_daily$season), FUN = sd, na.rm = T)





###

write.csv(daily13_sum, file = "daily13_sum.csv")
write.csv(daily14_sum, file = "daily14_sum.csv")
write.csv(daily15_sum, file = "daily15_sum.csv")

write.csv(met13_daily, file = "met13_daily.csv")
write.csv(met14_daily, file = "met14_daily.csv")
write.csv(met15_daily, file = "met15_daily.csv")