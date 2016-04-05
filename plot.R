library("lattice")
library("dplyr")

fname = "entries_20160406.csv"

# setwd("~/Google Drive/UTS - C&C/20160324 - hotspot - 3x3")

source("prepare.R")

bwplot( qtime ~ branch  | loopid , horizontal = FALSE, data = e2)
bwplot( qfromhelptime ~ branch  | loopid , horizontal = FALSE, data = e3)
