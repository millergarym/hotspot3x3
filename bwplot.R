library("lattice")
library("dplyr")


setwd("~/Google Drive/UTS - C&C/20160324 - hotspot - 3x3")

# # e <- read.csv("entries__first_after_excel.csv")
# bwplot( e$qtime ~ e$loopid | e$branch * e$help , horizontal=FALSE)
# e2 <- filter( e, help == 0)
# bwplot( e2$qtime ~ e2$loopid | e2$branch , horizontal = FALSE )
# 
# e2 <- mutate( e2, Q = paste( "Q", loopid, sep="") )
# branch <- factor( e2$branch , levels=c(1,2,3), labels = c("R1C1", "EH1", "EH2"))
# bwplot( e2$qtime ~ branch  | e2$loopid , horizontal = FALSE )
# bwplot( e2$qtime ~ branch  | e2$Q , horizontal = FALSE )

fname = "entries_20160405-2.csv"
e <- read.csv( fname )
e$survey_start <- strptime(e$survey_start, "%Y-%m-%d %H:%M:%OS")
e$qstart <- strptime(e$qstart, "%Y-%m-%d %H:%M:%OS")
e$qend <- strptime(e$qend, "%Y-%m-%d %H:%M:%OS")
e$qfirst <- strptime(e$qfirst, "%Y-%m-%d %H:%M:%OS")
e$help_time <- strptime(e$help_time, "%Y-%m-%d %H:%M:%OS")
e <- mutate(e, qtime = as.numeric(qend-qstart))
e <- mutate(e, qreadingtime = as.numeric(qfirst-qstart))
e$loopid <- as.numeric( gsub("Q", "" , e$loopid) )
e$branch <- factor( e$branch , levels=c(1,2,3), labels = c("R1C1", "EH1", "EH2"))
e$loopid <- factor( e$loopid, levels=seq(1,19), labels = paste("Q", seq(1,19), sep=""))

e2 <- subset(e, is.na(help_time))
bwplot( qtime ~ branch  | loopid , horizontal = FALSE, data = e2)

e3 <- subset(e, !is.na(help_time))
e3 <- mutate(e3, qfromhelptime = as.numeric(help_time-qstart))
bwplot( qfromhelptime ~ branch  | loopid , horizontal = FALSE, data = e3)
