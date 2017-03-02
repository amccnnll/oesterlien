# simple interpolation

dat <- X13b

T_i <- na.approx(dat$Temp)

T_i <- as.numeric(T_i)

dat$Temp <- T_i


# k$z <- as.numeric(na.approx(k$z))