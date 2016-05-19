library(maps)
library(fields)

## Read in the data
lifespan <- read.csv(file = "lifeexpectancy.clean.csv")
names(lifespan) <- c("Country", paste("Life Expectancy, ", c(1950, 1975, 2000), sep = ""))

#Function
color.groups <- function(z, col = rainbow_hcl(50),
                         zlim = c(min(z, na.rm = TRUE), max(z, na.rm = TRUE))){
  breaks <- seq(zlim[1], zlim[2], length = length(col) + 1)
  zgroups <- cut(z, breaks = breaks, labels = FALSE, include.lowest = TRUE)
  return(col[zgroups])
}

## This matches up country names in the file to those needed to make a map
## Not all regions in the map have data, hence the warnings
country.to.map <- match.map("world", as.character(lifespan$Country))

## Color palette for lifespan: blue is low, red is high
col <- tim.colors(20); zlim <- range(lifespan[,-1], na.rm = TRUE)

## Make a directory to put the plots in
system("mkdir plots")

## Make a plot for each year in the dataset
for(i in 2:ncol(lifespan)){
  pdf(file = paste("plots/lifespans", i, "pdf", sep = "."), height = 8, width = 10)
  map("world", fill = TRUE,
      col = color.groups(lifespan[country.to.map, i], col = col, zlim = zlim))
  title(main = names(lifespan)[i])
  image.plot(add = TRUE, legend.only = TRUE, horizontal = TRUE,
             col = col, zlim = zlim, legend.args = list(side = 1, line = 2, text = "Years"))
  dev.off()
}
