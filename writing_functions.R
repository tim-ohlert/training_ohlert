airtemps <- c(212,3,78,32)


fahr_to_celsius <- function(fahr) {
    (fahr - 32) * 5/9 
}


celsius_airtemps <- fahr_to_celsius(airtemps)



celsius_to_fahrenheit <- function(cel) {
  ((cel / 5) * 9) + 32
}


celsius_to_fahrenheit(celsius_airtemps)



convert_temps <- function(fahr) {
  celsius <- (fahr - 32) *5/9
  kelvin <- celsius * 273.15
  
  list(fahr = fahr, celsius = celsius, kelvin = kelvin)
}

temp_series <- convert_temps(seq(-100,100,10))
temps_df <- data.frame(temp_series)


convert_temps(airtemps)

custom_theme <- function(base_size = 9) {
  ggplot2::theme(
    axis.ticks       = ggplot2::element_blank(),
    text             = ggplot2::element_text(family = 'Helvetica', color = 'gray30', size = base_size),
    plot.title       = ggplot2::element_text(size = ggplot2::rel(1.25), hjust = 0.5, face = 'bold'),
    panel.background = ggplot2::element_blank(),
    legend.position  = 'right',
    panel.border     = ggplot2::element_blank(),
    panel.grid.minor = ggplot2::element_blank(),
    panel.grid.major = ggplot2::element_line(colour = 'grey90', size = .25),
    legend.key       = ggplot2::element_rect(colour = NA, fill = NA),
    axis.line        = ggplot2::element_blank()
  )
}

ggplot(temps_df, mapping=aes(x=fahr, y=celsius, color=kelvin)) +
  geom_point() +
  custom_theme(10)

setwd("..")
getwd()


library(devtools)
library(usethis)
library(roxygen2)
setwd('..')
create_package("mytools")
