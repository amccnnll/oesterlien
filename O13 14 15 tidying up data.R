# tidying up the data

O13 <- as.data.frame(Oesterlien_C_R_2013)
O13[] <- lapply(O13, function(x) ifelse(x < -1000, NA, x))

O13$NEE_f <- Oesterlien_C_R_2013$NEE_f


minny <- -50

O13$NEE_f[O13$NEE_f < minny] = NA

O13$NEEqual <- O13$NEE * O13$NEE_fqc



libraryO15 <- as.data.frame(Oesterlien_C_R_2015)
O15[] <- lapply(O13, function(x) ifelse(x < -1000, NA, x))