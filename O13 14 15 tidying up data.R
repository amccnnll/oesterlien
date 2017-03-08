# daily means for Eddy data
# version 1.0
# alistair mcconnell

# tidying up the data
Oesterlien_C_R_2013[Oesterlien_C_R_2013 == -9999] <- NA
Oesterlien_C_R_2013[Oesterlien_C_R_2013 == -10000] <- NA

Oesterlien_C_R_2014[Oesterlien_C_R_2014 == -9999] <- NA
Oesterlien_C_R_2014[Oesterlien_C_R_2014 == -10000] <- NA
Oesterlien_C_R_2014[Oesterlien_C_R_2014 == "NA0"] <- NA
Oesterlien_C_R_2014$Ustar <- as.numeric(Oesterlien_C_R_2014$Ustar)

Oesterlien_C_R_2015[Oesterlien_C_R_2015 == -9999] <- NA
Oesterlien_C_R_2015[Oesterlien_C_R_2015 == -10000] <- NA

# random shit
O13 <- as.data.frame(Oesterlien_C_R_2013)
O13[] <- lapply(O13, function(x) ifelse(x < -1000, NA, x))

O13$NEE_f <- Oesterlien_C_R_2013$NEE_f


minny <- -50

O13$NEE_f[O13$NEE_f < minny] = NA

O13$NEEqual <- O13$NEE * O13$NEE_fqc



libraryO15 <- as.data.frame(Oesterlien_C_R_2015)
O15[] <- lapply(O13, function(x) ifelse(x < -1000, NA, x))