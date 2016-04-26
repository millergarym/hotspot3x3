library("lattice")
library("dplyr")

fname = "entries_20160426.csv"

# setwd("~/Google Drive/UTS - C&C/20160324 - hotspot - 3x3")

source("prepare.R")

png( "boxplot-exercise.png"  )
bwplot( qtime ~ branch  | loopid , horizontal = FALSE, data = e2)
dev.off()

png( "boxplot-exercise-withhelp.png"  )
bwplot( qfromhelptime ~ branch  | loopid , horizontal = FALSE, data = e3)
dev.off()
