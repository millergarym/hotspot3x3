library("lattice")
library("dplyr")

fname = "entries_20160406.csv"

# setwd("~/Google Drive/UTS - C&C/20160324 - hotspot - 3x3")

source("prepare")

library(utils) 
Sweave("etl-plot.Rnw")
tools::texi2dvi("etl-plot.tex", pdf=TRUE)


