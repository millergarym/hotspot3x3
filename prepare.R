json2time <- function(d) {
  val <- strptime(d, "%Y-%m-%d %H:%M:%OS") %>% as.numeric()
  return(val)
}

e <- read.csv( fname )
e %>%
  mutate( survey_start = json2time( survey_start ) ) %>%
  mutate( qstart       = json2time( qstart ) ) %>%
  mutate( qend         = json2time( qend ) ) %>%
  mutate( qfirst       = json2time( qfirst ) ) %>%
  mutate( help_time    = json2time( help_time ) ) %>%
  mutate( qtime        = as.numeric(qend-qstart) ) %>%
  mutate( qreadingtime = as.numeric(qfirst-qstart) ) %>%
  mutate( loopid       = as.numeric( gsub("Q", "" , loopid))) %>%
  mutate( branch       = factor( branch , levels=c(1,2,3), labels = c("R1C1", "EH1", "EH2"))) %>%
  mutate( loopid       = factor( loopid, levels=seq(1,19), labels = paste("Q", seq(1,19), sep=""))) ->
e

e %>%
  filter( is.na(help_time) ) ->
e2  

e %>%
  filter( !is.na(help_time) ) %>%
  mutate(qfromhelptime = as.numeric(help_time-qstart)) ->
e3
