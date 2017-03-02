# daily means for met data
# version 1.0
# alistair mcconnell

# aggregate daily meanss
met13_daily <- aggregate(met13, by = list(met13$DoY), FUN = mean, na.rm = T)
met13_daily$Group.1 <- NULL

met14_daily <- aggregate(met14, by = list(met14$DoY), FUN = mean, na.rm = T)
met14_daily$Group.1 <- NULL

met15_daily <- aggregate(met15, by = list(met15$DoY), FUN = mean, na.rm = T)
met15_daily$Group.1 <- NULL

# plots!
# daily albedo 2013
a13 <- ggplot(met13_daily,
              aes(DoY,
                  Albedo)) +
  geom_point() +
  theme_bw() +
  scale_x_continuous(expand = c(0, 0)) +
  scale_y_continuous(expand = c(0, 0)) +
  geom_vline(xintercept = 142, linetype = "dashed") +
  geom_vline(xintercept = 292, linetype = "dashed")

# daily albedo 2014
a14 <- ggplot(met14_daily,
              aes(DoY,
                  Albedo)) +
  geom_point() +
  theme_bw() +
  scale_x_continuous(expand = c(0, 0)) +
  scale_y_continuous(expand = c(0, 0)) +
  geom_vline(xintercept = 130, linetype = "dashed") +
  geom_vline(xintercept = 269, linetype = "dashed")

# daily albedo 2014
a15 <- ggplot(met15_daily,
              aes(DoY,
                  Albedo)) +
  geom_point() +
  theme_bw() +
  scale_x_continuous(expand = c(0, 0)) +
  scale_y_continuous(expand = c(0, 0)) +
  geom_vline(xintercept = 148, linetype = "dashed") +
  geom_vline(xintercept = 275, linetype = "dashed")

# subplots
a <- subplot(a13, a14, a15,
             nrows = 3,
             shareX = T,
             titleX = F,
             titleY = F,
             title = "Albedo",
             margin = 1) 
# print
a

# remove variables if desired
# rm(a, a13, a14, a15, met13_daily, met14_daily, met15_daily)