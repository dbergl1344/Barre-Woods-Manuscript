# Package ID: knb-lter-hfr.18.36 Cataloging System:https://pasta.edirepository.org.
# Data set title: Barre Woods Soil Warming Experiment at Harvard Forest since 2001.
# Data set creator:  Serita Frey -  
# Data set creator:  Jerry Melillo -  
# Contact:    - Information Manager Harvard Forest  - hf-im@lists.fas.harvard.edu
# Stylesheet v2.15 for metadata conversion into program: John H. Porter, Univ. Virginia, jporter@virginia.edu      
# Uncomment the following lines to have R clear previous work, or set a working directory
# rm(list=ls())      

# setwd("C:/users/my_name/my_dir")       



options(HTTPUserAgent="EDI_CodeGen")


inUrl1  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-hfr/18/36/774d42b1fa9bb7e2ae36254dfc6ede1f" 
infile1 <- tempfile()
try(download.file(inUrl1,infile1,method="curl",extra=paste0(' -A "',getOption("HTTPUserAgent"),'"')))
if (is.na(file.size(infile1))) download.file(inUrl1,infile1,method="auto")


dt1 <-read.csv(infile1,header=F 
               ,skip=1
               ,sep=","  
               , col.names=c(
                 "date",     
                 "year",     
                 "month",     
                 "day",     
                 "treatment",     
                 "plot",     
                 "ch4",     
                 "n2o",     
                 "temp2",     
                 "temp5"    ), check.names=TRUE)

unlink(infile1)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

# attempting to convert dt1$date dateTime string to R date structure (date or POSIXct)                                
tmpDateFormat<-"%Y-%m-%d"
tmp1date<-as.Date(dt1$date,format=tmpDateFormat)
# Keep the new dates only if they all converted correctly
if(nrow(dt1[dt1$date != "",]) == length(tmp1date[!is.na(tmp1date)])){dt1$date <- tmp1date } else {print("Date conversion failed for dt1$date. Please inspect the data and do the date conversion yourself.")}                                                                    

if (class(dt1$month)!="factor") dt1$month<- as.factor(dt1$month)
if (class(dt1$day)!="factor") dt1$day<- as.factor(dt1$day)
if (class(dt1$treatment)!="factor") dt1$treatment<- as.factor(dt1$treatment)
if (class(dt1$plot)!="factor") dt1$plot<- as.factor(dt1$plot)
if (class(dt1$ch4)=="factor") dt1$ch4 <-as.numeric(levels(dt1$ch4))[as.integer(dt1$ch4) ]               
if (class(dt1$ch4)=="character") dt1$ch4 <-as.numeric(dt1$ch4)
if (class(dt1$n2o)=="factor") dt1$n2o <-as.numeric(levels(dt1$n2o))[as.integer(dt1$n2o) ]               
if (class(dt1$n2o)=="character") dt1$n2o <-as.numeric(dt1$n2o)
if (class(dt1$temp2)=="factor") dt1$temp2 <-as.numeric(levels(dt1$temp2))[as.integer(dt1$temp2) ]               
if (class(dt1$temp2)=="character") dt1$temp2 <-as.numeric(dt1$temp2)
if (class(dt1$temp5)=="factor") dt1$temp5 <-as.numeric(levels(dt1$temp5))[as.integer(dt1$temp5) ]               
if (class(dt1$temp5)=="character") dt1$temp5 <-as.numeric(dt1$temp5)

# Convert Missing Values to NA for non-dates

dt1$month <- as.factor(ifelse((trimws(as.character(dt1$month))==trimws("NA")),NA,as.character(dt1$month)))
dt1$day <- as.factor(ifelse((trimws(as.character(dt1$day))==trimws("NA")),NA,as.character(dt1$day)))
dt1$treatment <- as.factor(ifelse((trimws(as.character(dt1$treatment))==trimws("NA")),NA,as.character(dt1$treatment)))
dt1$plot <- as.factor(ifelse((trimws(as.character(dt1$plot))==trimws("NA")),NA,as.character(dt1$plot)))
dt1$ch4 <- ifelse((trimws(as.character(dt1$ch4))==trimws("NA")),NA,dt1$ch4)               
suppressWarnings(dt1$ch4 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$ch4))==as.character(as.numeric("NA"))),NA,dt1$ch4))
dt1$n2o <- ifelse((trimws(as.character(dt1$n2o))==trimws("NA")),NA,dt1$n2o)               
suppressWarnings(dt1$n2o <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$n2o))==as.character(as.numeric("NA"))),NA,dt1$n2o))
dt1$temp2 <- ifelse((trimws(as.character(dt1$temp2))==trimws("NA")),NA,dt1$temp2)               
suppressWarnings(dt1$temp2 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$temp2))==as.character(as.numeric("NA"))),NA,dt1$temp2))
dt1$temp5 <- ifelse((trimws(as.character(dt1$temp5))==trimws("NA")),NA,dt1$temp5)               
suppressWarnings(dt1$temp5 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$temp5))==as.character(as.numeric("NA"))),NA,dt1$temp5))


# Here is the structure of the input data frame:
str(dt1)                            
attach(dt1)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(date)
summary(year)
summary(month)
summary(day)
summary(treatment)
summary(plot)
summary(ch4)
summary(n2o)
summary(temp2)
summary(temp5) 
# Get more details on character variables

summary(as.factor(dt1$month)) 
summary(as.factor(dt1$day)) 
summary(as.factor(dt1$treatment)) 
summary(as.factor(dt1$plot))
detach(dt1)               



inUrl2  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-hfr/18/36/4033a1f4ea7d15d9754cd6fac7905576" 
infile2 <- tempfile()
try(download.file(inUrl2,infile2,method="curl",extra=paste0(' -A "',getOption("HTTPUserAgent"),'"')))
if (is.na(file.size(infile2))) download.file(inUrl2,infile2,method="auto")


dt2 <-read.csv(infile2,header=F 
               ,skip=1
               ,sep=","  
               , col.names=c(
                 "tree",     
                 "date",     
                 "species",     
                 "plot",     
                 "n_per",     
                 "lignin_per",     
                 "cellulose_per"    ), check.names=TRUE)

unlink(infile2)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt2$tree)!="factor") dt2$tree<- as.factor(dt2$tree)                                   
# attempting to convert dt2$date dateTime string to R date structure (date or POSIXct)                                
tmpDateFormat<-"%Y-%m-%d"
tmp2date<-as.Date(dt2$date,format=tmpDateFormat)
# Keep the new dates only if they all converted correctly
if(nrow(dt2[dt2$date != "",]) == length(tmp2date[!is.na(tmp2date)])){dt2$date <- tmp2date } else {print("Date conversion failed for dt2$date. Please inspect the data and do the date conversion yourself.")}                                                                    

if (class(dt2$species)!="factor") dt2$species<- as.factor(dt2$species)
if (class(dt2$plot)!="factor") dt2$plot<- as.factor(dt2$plot)
if (class(dt2$n_per)=="factor") dt2$n_per <-as.numeric(levels(dt2$n_per))[as.integer(dt2$n_per) ]               
if (class(dt2$n_per)=="character") dt2$n_per <-as.numeric(dt2$n_per)
if (class(dt2$lignin_per)=="factor") dt2$lignin_per <-as.numeric(levels(dt2$lignin_per))[as.integer(dt2$lignin_per) ]               
if (class(dt2$lignin_per)=="character") dt2$lignin_per <-as.numeric(dt2$lignin_per)
if (class(dt2$cellulose_per)=="factor") dt2$cellulose_per <-as.numeric(levels(dt2$cellulose_per))[as.integer(dt2$cellulose_per) ]               
if (class(dt2$cellulose_per)=="character") dt2$cellulose_per <-as.numeric(dt2$cellulose_per)

# Convert Missing Values to NA for non-dates

dt2$tree <- as.factor(ifelse((trimws(as.character(dt2$tree))==trimws("NA")),NA,as.character(dt2$tree)))
dt2$species <- as.factor(ifelse((trimws(as.character(dt2$species))==trimws("NA")),NA,as.character(dt2$species)))
dt2$plot <- as.factor(ifelse((trimws(as.character(dt2$plot))==trimws("NA")),NA,as.character(dt2$plot)))
dt2$n_per <- ifelse((trimws(as.character(dt2$n_per))==trimws("NA")),NA,dt2$n_per)               
suppressWarnings(dt2$n_per <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$n_per))==as.character(as.numeric("NA"))),NA,dt2$n_per))
dt2$lignin_per <- ifelse((trimws(as.character(dt2$lignin_per))==trimws("NA")),NA,dt2$lignin_per)               
suppressWarnings(dt2$lignin_per <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$lignin_per))==as.character(as.numeric("NA"))),NA,dt2$lignin_per))
dt2$cellulose_per <- ifelse((trimws(as.character(dt2$cellulose_per))==trimws("NA")),NA,dt2$cellulose_per)               
suppressWarnings(dt2$cellulose_per <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$cellulose_per))==as.character(as.numeric("NA"))),NA,dt2$cellulose_per))


# Here is the structure of the input data frame:
str(dt2)                            
attach(dt2)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(tree)
summary(date)
summary(species)
summary(plot)
summary(n_per)
summary(lignin_per)
summary(cellulose_per) 
# Get more details on character variables

summary(as.factor(dt2$tree)) 
summary(as.factor(dt2$species)) 
summary(as.factor(dt2$plot))
detach(dt2)               



inUrl3  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-hfr/18/36/9967b5716716078674fdd9755f9d5f1f" 
infile3 <- tempfile()
try(download.file(inUrl3,infile3,method="curl",extra=paste0(' -A "',getOption("HTTPUserAgent"),'"')))
if (is.na(file.size(infile3))) download.file(inUrl3,infile3,method="auto")


dt3 <-read.csv(infile3,header=F 
               ,skip=1
               ,sep=","  
               , col.names=c(
                 "datetime",     
                 "doy",     
                 "year",     
                 "time",     
                 "ctrl_av",     
                 "p1_av",     
                 "p2_av",     
                 "p3_av",     
                 "p4_av",     
                 "p5_av",     
                 "p6_av",     
                 "p7_av",     
                 "p8_av",     
                 "p9_av",     
                 "p10_av"    ), check.names=TRUE)

unlink(infile3)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

# attempting to convert dt3$datetime dateTime string to R date structure (date or POSIXct)                                
tmpDateFormat<-"%Y-%m-%dT%H:%M" 
tmp3datetime<-as.POSIXct(dt3$datetime,format=tmpDateFormat)
# Keep the new dates only if they all converted correctly
if(nrow(dt3[dt3$datetime != "",]) == length(tmp3datetime[!is.na(tmp3datetime)])){dt3$datetime <- tmp3datetime } else {print("Date conversion failed for dt3$datetime. Please inspect the data and do the date conversion yourself.")}                                                                    

if (class(dt3$doy)=="factor") dt3$doy <-as.numeric(levels(dt3$doy))[as.integer(dt3$doy) ]               
if (class(dt3$doy)=="character") dt3$doy <-as.numeric(dt3$doy)
if (class(dt3$time)!="factor") dt3$time<- as.factor(dt3$time)
if (class(dt3$ctrl_av)=="factor") dt3$ctrl_av <-as.numeric(levels(dt3$ctrl_av))[as.integer(dt3$ctrl_av) ]               
if (class(dt3$ctrl_av)=="character") dt3$ctrl_av <-as.numeric(dt3$ctrl_av)
if (class(dt3$p1_av)=="factor") dt3$p1_av <-as.numeric(levels(dt3$p1_av))[as.integer(dt3$p1_av) ]               
if (class(dt3$p1_av)=="character") dt3$p1_av <-as.numeric(dt3$p1_av)
if (class(dt3$p2_av)=="factor") dt3$p2_av <-as.numeric(levels(dt3$p2_av))[as.integer(dt3$p2_av) ]               
if (class(dt3$p2_av)=="character") dt3$p2_av <-as.numeric(dt3$p2_av)
if (class(dt3$p3_av)=="factor") dt3$p3_av <-as.numeric(levels(dt3$p3_av))[as.integer(dt3$p3_av) ]               
if (class(dt3$p3_av)=="character") dt3$p3_av <-as.numeric(dt3$p3_av)
if (class(dt3$p4_av)=="factor") dt3$p4_av <-as.numeric(levels(dt3$p4_av))[as.integer(dt3$p4_av) ]               
if (class(dt3$p4_av)=="character") dt3$p4_av <-as.numeric(dt3$p4_av)
if (class(dt3$p5_av)=="factor") dt3$p5_av <-as.numeric(levels(dt3$p5_av))[as.integer(dt3$p5_av) ]               
if (class(dt3$p5_av)=="character") dt3$p5_av <-as.numeric(dt3$p5_av)
if (class(dt3$p6_av)=="factor") dt3$p6_av <-as.numeric(levels(dt3$p6_av))[as.integer(dt3$p6_av) ]               
if (class(dt3$p6_av)=="character") dt3$p6_av <-as.numeric(dt3$p6_av)
if (class(dt3$p7_av)=="factor") dt3$p7_av <-as.numeric(levels(dt3$p7_av))[as.integer(dt3$p7_av) ]               
if (class(dt3$p7_av)=="character") dt3$p7_av <-as.numeric(dt3$p7_av)
if (class(dt3$p8_av)=="factor") dt3$p8_av <-as.numeric(levels(dt3$p8_av))[as.integer(dt3$p8_av) ]               
if (class(dt3$p8_av)=="character") dt3$p8_av <-as.numeric(dt3$p8_av)
if (class(dt3$p9_av)=="factor") dt3$p9_av <-as.numeric(levels(dt3$p9_av))[as.integer(dt3$p9_av) ]               
if (class(dt3$p9_av)=="character") dt3$p9_av <-as.numeric(dt3$p9_av)
if (class(dt3$p10_av)=="factor") dt3$p10_av <-as.numeric(levels(dt3$p10_av))[as.integer(dt3$p10_av) ]               
if (class(dt3$p10_av)=="character") dt3$p10_av <-as.numeric(dt3$p10_av)

# Convert Missing Values to NA for non-dates

dt3$doy <- ifelse((trimws(as.character(dt3$doy))==trimws("NA")),NA,dt3$doy)               
suppressWarnings(dt3$doy <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$doy))==as.character(as.numeric("NA"))),NA,dt3$doy))
dt3$time <- as.factor(ifelse((trimws(as.character(dt3$time))==trimws("NA")),NA,as.character(dt3$time)))
dt3$ctrl_av <- ifelse((trimws(as.character(dt3$ctrl_av))==trimws("NA")),NA,dt3$ctrl_av)               
suppressWarnings(dt3$ctrl_av <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$ctrl_av))==as.character(as.numeric("NA"))),NA,dt3$ctrl_av))
dt3$p1_av <- ifelse((trimws(as.character(dt3$p1_av))==trimws("NA")),NA,dt3$p1_av)               
suppressWarnings(dt3$p1_av <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$p1_av))==as.character(as.numeric("NA"))),NA,dt3$p1_av))
dt3$p2_av <- ifelse((trimws(as.character(dt3$p2_av))==trimws("NA")),NA,dt3$p2_av)               
suppressWarnings(dt3$p2_av <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$p2_av))==as.character(as.numeric("NA"))),NA,dt3$p2_av))
dt3$p3_av <- ifelse((trimws(as.character(dt3$p3_av))==trimws("NA")),NA,dt3$p3_av)               
suppressWarnings(dt3$p3_av <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$p3_av))==as.character(as.numeric("NA"))),NA,dt3$p3_av))
dt3$p4_av <- ifelse((trimws(as.character(dt3$p4_av))==trimws("NA")),NA,dt3$p4_av)               
suppressWarnings(dt3$p4_av <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$p4_av))==as.character(as.numeric("NA"))),NA,dt3$p4_av))
dt3$p5_av <- ifelse((trimws(as.character(dt3$p5_av))==trimws("NA")),NA,dt3$p5_av)               
suppressWarnings(dt3$p5_av <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$p5_av))==as.character(as.numeric("NA"))),NA,dt3$p5_av))
dt3$p6_av <- ifelse((trimws(as.character(dt3$p6_av))==trimws("NA")),NA,dt3$p6_av)               
suppressWarnings(dt3$p6_av <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$p6_av))==as.character(as.numeric("NA"))),NA,dt3$p6_av))
dt3$p7_av <- ifelse((trimws(as.character(dt3$p7_av))==trimws("NA")),NA,dt3$p7_av)               
suppressWarnings(dt3$p7_av <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$p7_av))==as.character(as.numeric("NA"))),NA,dt3$p7_av))
dt3$p8_av <- ifelse((trimws(as.character(dt3$p8_av))==trimws("NA")),NA,dt3$p8_av)               
suppressWarnings(dt3$p8_av <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$p8_av))==as.character(as.numeric("NA"))),NA,dt3$p8_av))
dt3$p9_av <- ifelse((trimws(as.character(dt3$p9_av))==trimws("NA")),NA,dt3$p9_av)               
suppressWarnings(dt3$p9_av <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$p9_av))==as.character(as.numeric("NA"))),NA,dt3$p9_av))
dt3$p10_av <- ifelse((trimws(as.character(dt3$p10_av))==trimws("NA")),NA,dt3$p10_av)               
suppressWarnings(dt3$p10_av <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$p10_av))==as.character(as.numeric("NA"))),NA,dt3$p10_av))


# Here is the structure of the input data frame:
str(dt3)                            
attach(dt3)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(datetime)
summary(doy)
summary(year)
summary(time)
summary(ctrl_av)
summary(p1_av)
summary(p2_av)
summary(p3_av)
summary(p4_av)
summary(p5_av)
summary(p6_av)
summary(p7_av)
summary(p8_av)
summary(p9_av)
summary(p10_av) 
# Get more details on character variables

summary(as.factor(dt3$time))
detach(dt3)               



inUrl4  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-hfr/18/36/326d32c64ccd7337a0f88b91db895e55" 
infile4 <- tempfile()
try(download.file(inUrl4,infile4,method="curl",extra=paste0(' -A "',getOption("HTTPUserAgent"),'"')))
if (is.na(file.size(infile4))) download.file(inUrl4,infile4,method="auto")


dt4 <-read.csv(infile4,header=F 
               ,skip=1
               ,sep=","  
               , col.names=c(
                 "datetime",     
                 "year",     
                 "doy",     
                 "time",     
                 "tdr1",     
                 "tdr2",     
                 "tdr3",     
                 "tdr4",     
                 "tdr5",     
                 "tdr6",     
                 "tdr7",     
                 "tdr8",     
                 "tdr9",     
                 "tdr10",     
                 "tdr11",     
                 "tdr12",     
                 "probeset"    ), check.names=TRUE)

unlink(infile4)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

# attempting to convert dt4$datetime dateTime string to R date structure (date or POSIXct)                                
tmpDateFormat<-"%Y-%m-%dT%H:%M" 
tmp4datetime<-as.POSIXct(dt4$datetime,format=tmpDateFormat)
# Keep the new dates only if they all converted correctly
if(nrow(dt4[dt4$datetime != "",]) == length(tmp4datetime[!is.na(tmp4datetime)])){dt4$datetime <- tmp4datetime } else {print("Date conversion failed for dt4$datetime. Please inspect the data and do the date conversion yourself.")}                                                                    

if (class(dt4$doy)=="factor") dt4$doy <-as.numeric(levels(dt4$doy))[as.integer(dt4$doy) ]               
if (class(dt4$doy)=="character") dt4$doy <-as.numeric(dt4$doy)
if (class(dt4$time)!="factor") dt4$time<- as.factor(dt4$time)
if (class(dt4$tdr1)=="factor") dt4$tdr1 <-as.numeric(levels(dt4$tdr1))[as.integer(dt4$tdr1) ]               
if (class(dt4$tdr1)=="character") dt4$tdr1 <-as.numeric(dt4$tdr1)
if (class(dt4$tdr2)=="factor") dt4$tdr2 <-as.numeric(levels(dt4$tdr2))[as.integer(dt4$tdr2) ]               
if (class(dt4$tdr2)=="character") dt4$tdr2 <-as.numeric(dt4$tdr2)
if (class(dt4$tdr3)=="factor") dt4$tdr3 <-as.numeric(levels(dt4$tdr3))[as.integer(dt4$tdr3) ]               
if (class(dt4$tdr3)=="character") dt4$tdr3 <-as.numeric(dt4$tdr3)
if (class(dt4$tdr4)=="factor") dt4$tdr4 <-as.numeric(levels(dt4$tdr4))[as.integer(dt4$tdr4) ]               
if (class(dt4$tdr4)=="character") dt4$tdr4 <-as.numeric(dt4$tdr4)
if (class(dt4$tdr5)=="factor") dt4$tdr5 <-as.numeric(levels(dt4$tdr5))[as.integer(dt4$tdr5) ]               
if (class(dt4$tdr5)=="character") dt4$tdr5 <-as.numeric(dt4$tdr5)
if (class(dt4$tdr6)=="factor") dt4$tdr6 <-as.numeric(levels(dt4$tdr6))[as.integer(dt4$tdr6) ]               
if (class(dt4$tdr6)=="character") dt4$tdr6 <-as.numeric(dt4$tdr6)
if (class(dt4$tdr7)=="factor") dt4$tdr7 <-as.numeric(levels(dt4$tdr7))[as.integer(dt4$tdr7) ]               
if (class(dt4$tdr7)=="character") dt4$tdr7 <-as.numeric(dt4$tdr7)
if (class(dt4$tdr8)=="factor") dt4$tdr8 <-as.numeric(levels(dt4$tdr8))[as.integer(dt4$tdr8) ]               
if (class(dt4$tdr8)=="character") dt4$tdr8 <-as.numeric(dt4$tdr8)
if (class(dt4$tdr9)=="factor") dt4$tdr9 <-as.numeric(levels(dt4$tdr9))[as.integer(dt4$tdr9) ]               
if (class(dt4$tdr9)=="character") dt4$tdr9 <-as.numeric(dt4$tdr9)
if (class(dt4$tdr10)=="factor") dt4$tdr10 <-as.numeric(levels(dt4$tdr10))[as.integer(dt4$tdr10) ]               
if (class(dt4$tdr10)=="character") dt4$tdr10 <-as.numeric(dt4$tdr10)
if (class(dt4$tdr11)=="factor") dt4$tdr11 <-as.numeric(levels(dt4$tdr11))[as.integer(dt4$tdr11) ]               
if (class(dt4$tdr11)=="character") dt4$tdr11 <-as.numeric(dt4$tdr11)
if (class(dt4$tdr12)=="factor") dt4$tdr12 <-as.numeric(levels(dt4$tdr12))[as.integer(dt4$tdr12) ]               
if (class(dt4$tdr12)=="character") dt4$tdr12 <-as.numeric(dt4$tdr12)
if (class(dt4$probeset)!="factor") dt4$probeset<- as.factor(dt4$probeset)

# Convert Missing Values to NA for non-dates

dt4$doy <- ifelse((trimws(as.character(dt4$doy))==trimws("NA")),NA,dt4$doy)               
suppressWarnings(dt4$doy <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$doy))==as.character(as.numeric("NA"))),NA,dt4$doy))
dt4$time <- as.factor(ifelse((trimws(as.character(dt4$time))==trimws("NA")),NA,as.character(dt4$time)))
dt4$tdr1 <- ifelse((trimws(as.character(dt4$tdr1))==trimws("NA")),NA,dt4$tdr1)               
suppressWarnings(dt4$tdr1 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$tdr1))==as.character(as.numeric("NA"))),NA,dt4$tdr1))
dt4$tdr2 <- ifelse((trimws(as.character(dt4$tdr2))==trimws("NA")),NA,dt4$tdr2)               
suppressWarnings(dt4$tdr2 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$tdr2))==as.character(as.numeric("NA"))),NA,dt4$tdr2))
dt4$tdr3 <- ifelse((trimws(as.character(dt4$tdr3))==trimws("NA")),NA,dt4$tdr3)               
suppressWarnings(dt4$tdr3 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$tdr3))==as.character(as.numeric("NA"))),NA,dt4$tdr3))
dt4$tdr4 <- ifelse((trimws(as.character(dt4$tdr4))==trimws("NA")),NA,dt4$tdr4)               
suppressWarnings(dt4$tdr4 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$tdr4))==as.character(as.numeric("NA"))),NA,dt4$tdr4))
dt4$tdr5 <- ifelse((trimws(as.character(dt4$tdr5))==trimws("NA")),NA,dt4$tdr5)               
suppressWarnings(dt4$tdr5 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$tdr5))==as.character(as.numeric("NA"))),NA,dt4$tdr5))
dt4$tdr6 <- ifelse((trimws(as.character(dt4$tdr6))==trimws("NA")),NA,dt4$tdr6)               
suppressWarnings(dt4$tdr6 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$tdr6))==as.character(as.numeric("NA"))),NA,dt4$tdr6))
dt4$tdr7 <- ifelse((trimws(as.character(dt4$tdr7))==trimws("NA")),NA,dt4$tdr7)               
suppressWarnings(dt4$tdr7 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$tdr7))==as.character(as.numeric("NA"))),NA,dt4$tdr7))
dt4$tdr8 <- ifelse((trimws(as.character(dt4$tdr8))==trimws("NA")),NA,dt4$tdr8)               
suppressWarnings(dt4$tdr8 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$tdr8))==as.character(as.numeric("NA"))),NA,dt4$tdr8))
dt4$tdr9 <- ifelse((trimws(as.character(dt4$tdr9))==trimws("NA")),NA,dt4$tdr9)               
suppressWarnings(dt4$tdr9 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$tdr9))==as.character(as.numeric("NA"))),NA,dt4$tdr9))
dt4$tdr10 <- ifelse((trimws(as.character(dt4$tdr10))==trimws("NA")),NA,dt4$tdr10)               
suppressWarnings(dt4$tdr10 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$tdr10))==as.character(as.numeric("NA"))),NA,dt4$tdr10))
dt4$tdr11 <- ifelse((trimws(as.character(dt4$tdr11))==trimws("NA")),NA,dt4$tdr11)               
suppressWarnings(dt4$tdr11 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$tdr11))==as.character(as.numeric("NA"))),NA,dt4$tdr11))
dt4$tdr12 <- ifelse((trimws(as.character(dt4$tdr12))==trimws("NA")),NA,dt4$tdr12)               
suppressWarnings(dt4$tdr12 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$tdr12))==as.character(as.numeric("NA"))),NA,dt4$tdr12))
dt4$probeset <- as.factor(ifelse((trimws(as.character(dt4$probeset))==trimws("NA")),NA,as.character(dt4$probeset)))


# Here is the structure of the input data frame:
str(dt4)                            
attach(dt4)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(datetime)
summary(year)
summary(doy)
summary(time)
summary(tdr1)
summary(tdr2)
summary(tdr3)
summary(tdr4)
summary(tdr5)
summary(tdr6)
summary(tdr7)
summary(tdr8)
summary(tdr9)
summary(tdr10)
summary(tdr11)
summary(tdr12)
summary(probeset) 
# Get more details on character variables

summary(as.factor(dt4$time)) 
summary(as.factor(dt4$probeset))
detach(dt4)               



inUrl5  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-hfr/18/36/9f2b8f2d779c1cccfab53f7e99f6fc03" 
infile5 <- tempfile()
try(download.file(inUrl5,infile5,method="curl",extra=paste0(' -A "',getOption("HTTPUserAgent"),'"')))
if (is.na(file.size(infile5))) download.file(inUrl5,infile5,method="auto")


dt5 <-read.csv(infile5,header=F 
               ,skip=1
               ,sep=","  
               , col.names=c(
                 "date",     
                 "year",     
                 "month",     
                 "day",     
                 "plot",     
                 "treatment",     
                 "nh4",     
                 "no3"    ), check.names=TRUE)

unlink(infile5)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

# attempting to convert dt5$date dateTime string to R date structure (date or POSIXct)                                
tmpDateFormat<-"%Y-%m-%d"
tmp5date<-as.Date(dt5$date,format=tmpDateFormat)
# Keep the new dates only if they all converted correctly
if(nrow(dt5[dt5$date != "",]) == length(tmp5date[!is.na(tmp5date)])){dt5$date <- tmp5date } else {print("Date conversion failed for dt5$date. Please inspect the data and do the date conversion yourself.")}                                                                    

if (class(dt5$month)!="factor") dt5$month<- as.factor(dt5$month)
if (class(dt5$day)!="factor") dt5$day<- as.factor(dt5$day)
if (class(dt5$plot)!="factor") dt5$plot<- as.factor(dt5$plot)
if (class(dt5$treatment)!="factor") dt5$treatment<- as.factor(dt5$treatment)
if (class(dt5$nh4)=="factor") dt5$nh4 <-as.numeric(levels(dt5$nh4))[as.integer(dt5$nh4) ]               
if (class(dt5$nh4)=="character") dt5$nh4 <-as.numeric(dt5$nh4)
if (class(dt5$no3)=="factor") dt5$no3 <-as.numeric(levels(dt5$no3))[as.integer(dt5$no3) ]               
if (class(dt5$no3)=="character") dt5$no3 <-as.numeric(dt5$no3)

# Convert Missing Values to NA for non-dates

dt5$month <- as.factor(ifelse((trimws(as.character(dt5$month))==trimws("NA")),NA,as.character(dt5$month)))
dt5$day <- as.factor(ifelse((trimws(as.character(dt5$day))==trimws("NA")),NA,as.character(dt5$day)))
dt5$plot <- as.factor(ifelse((trimws(as.character(dt5$plot))==trimws("NA")),NA,as.character(dt5$plot)))
dt5$treatment <- as.factor(ifelse((trimws(as.character(dt5$treatment))==trimws("NA")),NA,as.character(dt5$treatment)))
dt5$nh4 <- ifelse((trimws(as.character(dt5$nh4))==trimws("NA")),NA,dt5$nh4)               
suppressWarnings(dt5$nh4 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$nh4))==as.character(as.numeric("NA"))),NA,dt5$nh4))
dt5$no3 <- ifelse((trimws(as.character(dt5$no3))==trimws("NA")),NA,dt5$no3)               
suppressWarnings(dt5$no3 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$no3))==as.character(as.numeric("NA"))),NA,dt5$no3))


# Here is the structure of the input data frame:
str(dt5)                            
attach(dt5)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(date)
summary(year)
summary(month)
summary(day)
summary(plot)
summary(treatment)
summary(nh4)
summary(no3) 
# Get more details on character variables

summary(as.factor(dt5$month)) 
summary(as.factor(dt5$day)) 
summary(as.factor(dt5$plot)) 
summary(as.factor(dt5$treatment))
detach(dt5)               



inUrl6  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-hfr/18/36/eb3e3a99a13de56fdd3bfb424131d7e5" 
infile6 <- tempfile()
try(download.file(inUrl6,infile6,method="curl",extra=paste0(' -A "',getOption("HTTPUserAgent"),'"')))
if (is.na(file.size(infile6))) download.file(inUrl6,infile6,method="auto")


dt6 <-read.csv(infile6,header=F 
               ,skip=1
               ,sep=","  
               , col.names=c(
                 "year",     
                 "month",     
                 "treatment",     
                 "plot",     
                 "sum_ion",     
                 "nh4",     
                 "no3"    ), check.names=TRUE)

unlink(infile6)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt6$month)!="factor") dt6$month<- as.factor(dt6$month)
if (class(dt6$treatment)!="factor") dt6$treatment<- as.factor(dt6$treatment)
if (class(dt6$plot)!="factor") dt6$plot<- as.factor(dt6$plot)
if (class(dt6$sum_ion)=="factor") dt6$sum_ion <-as.numeric(levels(dt6$sum_ion))[as.integer(dt6$sum_ion) ]               
if (class(dt6$sum_ion)=="character") dt6$sum_ion <-as.numeric(dt6$sum_ion)
if (class(dt6$nh4)=="factor") dt6$nh4 <-as.numeric(levels(dt6$nh4))[as.integer(dt6$nh4) ]               
if (class(dt6$nh4)=="character") dt6$nh4 <-as.numeric(dt6$nh4)
if (class(dt6$no3)=="factor") dt6$no3 <-as.numeric(levels(dt6$no3))[as.integer(dt6$no3) ]               
if (class(dt6$no3)=="character") dt6$no3 <-as.numeric(dt6$no3)

# Convert Missing Values to NA for non-dates

dt6$month <- as.factor(ifelse((trimws(as.character(dt6$month))==trimws("NA")),NA,as.character(dt6$month)))
dt6$treatment <- as.factor(ifelse((trimws(as.character(dt6$treatment))==trimws("NA")),NA,as.character(dt6$treatment)))
dt6$plot <- as.factor(ifelse((trimws(as.character(dt6$plot))==trimws("NA")),NA,as.character(dt6$plot)))
dt6$sum_ion <- ifelse((trimws(as.character(dt6$sum_ion))==trimws("NA")),NA,dt6$sum_ion)               
suppressWarnings(dt6$sum_ion <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt6$sum_ion))==as.character(as.numeric("NA"))),NA,dt6$sum_ion))
dt6$nh4 <- ifelse((trimws(as.character(dt6$nh4))==trimws("NA")),NA,dt6$nh4)               
suppressWarnings(dt6$nh4 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt6$nh4))==as.character(as.numeric("NA"))),NA,dt6$nh4))
dt6$no3 <- ifelse((trimws(as.character(dt6$no3))==trimws("NA")),NA,dt6$no3)               
suppressWarnings(dt6$no3 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt6$no3))==as.character(as.numeric("NA"))),NA,dt6$no3))


# Here is the structure of the input data frame:
str(dt6)                            
attach(dt6)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(year)
summary(month)
summary(treatment)
summary(plot)
summary(sum_ion)
summary(nh4)
summary(no3) 
# Get more details on character variables

summary(as.factor(dt6$month)) 
summary(as.factor(dt6$treatment)) 
summary(as.factor(dt6$plot))
detach(dt6)               



inUrl7  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-hfr/18/36/6f307eb9dfd8291d8826d69d73c18d27" 
infile7 <- tempfile()
try(download.file(inUrl7,infile7,method="curl",extra=paste0(' -A "',getOption("HTTPUserAgent"),'"')))
if (is.na(file.size(infile7))) download.file(inUrl7,infile7,method="auto")


dt7 <-read.csv(infile7,header=F 
               ,skip=1
               ,sep=","  
               , col.names=c(
                 "datetime",     
                 "date",     
                 "year",     
                 "month",     
                 "day",     
                 "time",     
                 "treatment",     
                 "plot",     
                 "co2",     
                 "cm2",     
                 "cm4",     
                 "moisture",     
                 "measurement"    ), check.names=TRUE)

unlink(infile7)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt7$datetime)!="factor") dt7$datetime<- as.factor(dt7$datetime)                                   
# attempting to convert dt7$date dateTime string to R date structure (date or POSIXct)                                
tmpDateFormat<-"%Y-%m-%d"
tmp7date<-as.Date(dt7$date,format=tmpDateFormat)
# Keep the new dates only if they all converted correctly
if(nrow(dt7[dt7$date != "",]) == length(tmp7date[!is.na(tmp7date)])){dt7$date <- tmp7date } else {print("Date conversion failed for dt7$date. Please inspect the data and do the date conversion yourself.")}                                                                    

if (class(dt7$month)!="factor") dt7$month<- as.factor(dt7$month)
if (class(dt7$day)!="factor") dt7$day<- as.factor(dt7$day)
if (class(dt7$treatment)!="factor") dt7$treatment<- as.factor(dt7$treatment)
if (class(dt7$plot)!="factor") dt7$plot<- as.factor(dt7$plot)
if (class(dt7$co2)=="factor") dt7$co2 <-as.numeric(levels(dt7$co2))[as.integer(dt7$co2) ]               
if (class(dt7$co2)=="character") dt7$co2 <-as.numeric(dt7$co2)
if (class(dt7$cm2)=="factor") dt7$cm2 <-as.numeric(levels(dt7$cm2))[as.integer(dt7$cm2) ]               
if (class(dt7$cm2)=="character") dt7$cm2 <-as.numeric(dt7$cm2)
if (class(dt7$cm4)=="factor") dt7$cm4 <-as.numeric(levels(dt7$cm4))[as.integer(dt7$cm4) ]               
if (class(dt7$cm4)=="character") dt7$cm4 <-as.numeric(dt7$cm4)
if (class(dt7$moisture)=="factor") dt7$moisture <-as.numeric(levels(dt7$moisture))[as.integer(dt7$moisture) ]               
if (class(dt7$moisture)=="character") dt7$moisture <-as.numeric(dt7$moisture)
if (class(dt7$measurement)!="factor") dt7$measurement<- as.factor(dt7$measurement)

# Convert Missing Values to NA for non-dates

dt7$datetime <- as.factor(ifelse((trimws(as.character(dt7$datetime))==trimws("NA")),NA,as.character(dt7$datetime)))
dt7$month <- as.factor(ifelse((trimws(as.character(dt7$month))==trimws("NA")),NA,as.character(dt7$month)))
dt7$day <- as.factor(ifelse((trimws(as.character(dt7$day))==trimws("NA")),NA,as.character(dt7$day)))
dt7$treatment <- as.factor(ifelse((trimws(as.character(dt7$treatment))==trimws("NA")),NA,as.character(dt7$treatment)))
dt7$plot <- as.factor(ifelse((trimws(as.character(dt7$plot))==trimws("NA")),NA,as.character(dt7$plot)))
dt7$co2 <- ifelse((trimws(as.character(dt7$co2))==trimws("NA")),NA,dt7$co2)               
suppressWarnings(dt7$co2 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt7$co2))==as.character(as.numeric("NA"))),NA,dt7$co2))
dt7$cm2 <- ifelse((trimws(as.character(dt7$cm2))==trimws("NA")),NA,dt7$cm2)               
suppressWarnings(dt7$cm2 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt7$cm2))==as.character(as.numeric("NA"))),NA,dt7$cm2))
dt7$cm4 <- ifelse((trimws(as.character(dt7$cm4))==trimws("NA")),NA,dt7$cm4)               
suppressWarnings(dt7$cm4 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt7$cm4))==as.character(as.numeric("NA"))),NA,dt7$cm4))
dt7$moisture <- ifelse((trimws(as.character(dt7$moisture))==trimws("NA")),NA,dt7$moisture)               
suppressWarnings(dt7$moisture <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt7$moisture))==as.character(as.numeric("NA"))),NA,dt7$moisture))
dt7$measurement <- as.factor(ifelse((trimws(as.character(dt7$measurement))==trimws("NA")),NA,as.character(dt7$measurement)))


# Here is the structure of the input data frame:
str(dt7)                            
attach(dt7)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(datetime)
summary(date)
summary(year)
summary(month)
summary(day)
summary(time)
summary(treatment)
summary(plot)
summary(co2)
summary(cm2)
summary(cm4)
summary(moisture)
summary(measurement) 
# Get more details on character variables

summary(as.factor(dt7$datetime)) 
summary(as.factor(dt7$month)) 
summary(as.factor(dt7$day)) 
summary(as.factor(dt7$treatment)) 
summary(as.factor(dt7$plot)) 
summary(as.factor(dt7$measurement))
detach(dt7)               



inUrl8  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-hfr/18/36/af4a1bcc000f05e0c71e2f2ca59d2ff2" 
infile8 <- tempfile()
try(download.file(inUrl8,infile8,method="curl",extra=paste0(' -A "',getOption("HTTPUserAgent"),'"')))
if (is.na(file.size(infile8))) download.file(inUrl8,infile8,method="auto")


dt8 <-read.csv(infile8,header=F 
               ,skip=1
               ,sep=","  
               , col.names=c(
                 "treeid",     
                 "date",     
                 "species",     
                 "plot",     
                 "subplot",     
                 "dbh"    ), check.names=TRUE)

unlink(infile8)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt8$treeid)!="factor") dt8$treeid<- as.factor(dt8$treeid)                                   
# attempting to convert dt8$date dateTime string to R date structure (date or POSIXct)                                
tmpDateFormat<-"%Y-%m-%d"
tmp8date<-as.Date(dt8$date,format=tmpDateFormat)
# Keep the new dates only if they all converted correctly
if(nrow(dt8[dt8$date != "",]) == length(tmp8date[!is.na(tmp8date)])){dt8$date <- tmp8date } else {print("Date conversion failed for dt8$date. Please inspect the data and do the date conversion yourself.")}                                                                    

if (class(dt8$species)!="factor") dt8$species<- as.factor(dt8$species)
if (class(dt8$plot)!="factor") dt8$plot<- as.factor(dt8$plot)
if (class(dt8$subplot)!="factor") dt8$subplot<- as.factor(dt8$subplot)
if (class(dt8$dbh)=="factor") dt8$dbh <-as.numeric(levels(dt8$dbh))[as.integer(dt8$dbh) ]               
if (class(dt8$dbh)=="character") dt8$dbh <-as.numeric(dt8$dbh)

# Convert Missing Values to NA for non-dates

dt8$treeid <- as.factor(ifelse((trimws(as.character(dt8$treeid))==trimws("NA")),NA,as.character(dt8$treeid)))
dt8$species <- as.factor(ifelse((trimws(as.character(dt8$species))==trimws("NA")),NA,as.character(dt8$species)))
dt8$plot <- as.factor(ifelse((trimws(as.character(dt8$plot))==trimws("NA")),NA,as.character(dt8$plot)))
dt8$subplot <- as.factor(ifelse((trimws(as.character(dt8$subplot))==trimws("NA")),NA,as.character(dt8$subplot)))
dt8$dbh <- ifelse((trimws(as.character(dt8$dbh))==trimws("NA")),NA,dt8$dbh)               
suppressWarnings(dt8$dbh <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt8$dbh))==as.character(as.numeric("NA"))),NA,dt8$dbh))


# Here is the structure of the input data frame:
str(dt8)                            
attach(dt8)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(treeid)
summary(date)
summary(species)
summary(plot)
summary(subplot)
summary(dbh) 
# Get more details on character variables

summary(as.factor(dt8$treeid)) 
summary(as.factor(dt8$species)) 
summary(as.factor(dt8$plot)) 
summary(as.factor(dt8$subplot))
detach(dt8)               



inUrl9  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-hfr/18/36/3f7f08aa9207ff1bd3ac7aa9321a9263" 
infile9 <- tempfile()
try(download.file(inUrl9,infile9,method="curl",extra=paste0(' -A "',getOption("HTTPUserAgent"),'"')))
if (is.na(file.size(infile9))) download.file(inUrl9,infile9,method="auto")


dt9 <-read.csv(infile9,header=F 
               ,skip=1
               ,sep=","  
               , col.names=c(
                 "year",     
                 "treatment",     
                 "species",     
                 "basket_num",     
                 "basket_type",     
                 "mass"    ), check.names=TRUE)

unlink(infile9)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt9$treatment)!="factor") dt9$treatment<- as.factor(dt9$treatment)
if (class(dt9$species)!="factor") dt9$species<- as.factor(dt9$species)
if (class(dt9$basket_num)!="factor") dt9$basket_num<- as.factor(dt9$basket_num)
if (class(dt9$basket_type)!="factor") dt9$basket_type<- as.factor(dt9$basket_type)
if (class(dt9$mass)=="factor") dt9$mass <-as.numeric(levels(dt9$mass))[as.integer(dt9$mass) ]               
if (class(dt9$mass)=="character") dt9$mass <-as.numeric(dt9$mass)

# Convert Missing Values to NA for non-dates

dt9$treatment <- as.factor(ifelse((trimws(as.character(dt9$treatment))==trimws("NA")),NA,as.character(dt9$treatment)))
dt9$species <- as.factor(ifelse((trimws(as.character(dt9$species))==trimws("NA")),NA,as.character(dt9$species)))
dt9$basket_num <- as.factor(ifelse((trimws(as.character(dt9$basket_num))==trimws("NA")),NA,as.character(dt9$basket_num)))
dt9$basket_type <- as.factor(ifelse((trimws(as.character(dt9$basket_type))==trimws("NA")),NA,as.character(dt9$basket_type)))
dt9$mass <- ifelse((trimws(as.character(dt9$mass))==trimws("NA")),NA,dt9$mass)               
suppressWarnings(dt9$mass <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt9$mass))==as.character(as.numeric("NA"))),NA,dt9$mass))


# Here is the structure of the input data frame:
str(dt9)                            
attach(dt9)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(year)
summary(treatment)
summary(species)
summary(basket_num)
summary(basket_type)
summary(mass) 
# Get more details on character variables

summary(as.factor(dt9$treatment)) 
summary(as.factor(dt9$species)) 
summary(as.factor(dt9$basket_num)) 
summary(as.factor(dt9$basket_type))
detach(dt9)               



inUrl10  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-hfr/18/36/67bbbf1f2b6a160d6a618769373bf29d" 
infile10 <- tempfile()
try(download.file(inUrl10,infile10,method="curl",extra=paste0(' -A "',getOption("HTTPUserAgent"),'"')))
if (is.na(file.size(infile10))) download.file(inUrl10,infile10,method="auto")


dt10 <-read.csv(infile10,header=F 
                ,skip=1
                ,sep=","  
                , col.names=c(
                  "year",     
                  "treeid",     
                  "species",     
                  "treatment",     
                  "n_per",     
                  "c_per",     
                  "c_n",     
                  "d13c",     
                  "d15n",     
                  "p_per",     
                  "n_p"    ), check.names=TRUE)

unlink(infile10)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt10$treeid)!="factor") dt10$treeid<- as.factor(dt10$treeid)
if (class(dt10$species)!="factor") dt10$species<- as.factor(dt10$species)
if (class(dt10$treatment)!="factor") dt10$treatment<- as.factor(dt10$treatment)
if (class(dt10$n_per)=="factor") dt10$n_per <-as.numeric(levels(dt10$n_per))[as.integer(dt10$n_per) ]               
if (class(dt10$n_per)=="character") dt10$n_per <-as.numeric(dt10$n_per)
if (class(dt10$c_per)=="factor") dt10$c_per <-as.numeric(levels(dt10$c_per))[as.integer(dt10$c_per) ]               
if (class(dt10$c_per)=="character") dt10$c_per <-as.numeric(dt10$c_per)
if (class(dt10$c_n)=="factor") dt10$c_n <-as.numeric(levels(dt10$c_n))[as.integer(dt10$c_n) ]               
if (class(dt10$c_n)=="character") dt10$c_n <-as.numeric(dt10$c_n)
if (class(dt10$d13c)=="factor") dt10$d13c <-as.numeric(levels(dt10$d13c))[as.integer(dt10$d13c) ]               
if (class(dt10$d13c)=="character") dt10$d13c <-as.numeric(dt10$d13c)
if (class(dt10$d15n)=="factor") dt10$d15n <-as.numeric(levels(dt10$d15n))[as.integer(dt10$d15n) ]               
if (class(dt10$d15n)=="character") dt10$d15n <-as.numeric(dt10$d15n)
if (class(dt10$p_per)=="factor") dt10$p_per <-as.numeric(levels(dt10$p_per))[as.integer(dt10$p_per) ]               
if (class(dt10$p_per)=="character") dt10$p_per <-as.numeric(dt10$p_per)
if (class(dt10$n_p)=="factor") dt10$n_p <-as.numeric(levels(dt10$n_p))[as.integer(dt10$n_p) ]               
if (class(dt10$n_p)=="character") dt10$n_p <-as.numeric(dt10$n_p)

# Convert Missing Values to NA for non-dates

dt10$treeid <- as.factor(ifelse((trimws(as.character(dt10$treeid))==trimws("NA")),NA,as.character(dt10$treeid)))
dt10$species <- as.factor(ifelse((trimws(as.character(dt10$species))==trimws("NA")),NA,as.character(dt10$species)))
dt10$treatment <- as.factor(ifelse((trimws(as.character(dt10$treatment))==trimws("NA")),NA,as.character(dt10$treatment)))
dt10$n_per <- ifelse((trimws(as.character(dt10$n_per))==trimws("NA")),NA,dt10$n_per)               
suppressWarnings(dt10$n_per <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$n_per))==as.character(as.numeric("NA"))),NA,dt10$n_per))
dt10$c_per <- ifelse((trimws(as.character(dt10$c_per))==trimws("NA")),NA,dt10$c_per)               
suppressWarnings(dt10$c_per <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$c_per))==as.character(as.numeric("NA"))),NA,dt10$c_per))
dt10$c_n <- ifelse((trimws(as.character(dt10$c_n))==trimws("NA")),NA,dt10$c_n)               
suppressWarnings(dt10$c_n <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$c_n))==as.character(as.numeric("NA"))),NA,dt10$c_n))
dt10$d13c <- ifelse((trimws(as.character(dt10$d13c))==trimws("NA")),NA,dt10$d13c)               
suppressWarnings(dt10$d13c <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$d13c))==as.character(as.numeric("NA"))),NA,dt10$d13c))
dt10$d15n <- ifelse((trimws(as.character(dt10$d15n))==trimws("NA")),NA,dt10$d15n)               
suppressWarnings(dt10$d15n <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$d15n))==as.character(as.numeric("NA"))),NA,dt10$d15n))
dt10$p_per <- ifelse((trimws(as.character(dt10$p_per))==trimws("NA")),NA,dt10$p_per)               
suppressWarnings(dt10$p_per <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$p_per))==as.character(as.numeric("NA"))),NA,dt10$p_per))
dt10$n_p <- ifelse((trimws(as.character(dt10$n_p))==trimws("NA")),NA,dt10$n_p)               
suppressWarnings(dt10$n_p <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$n_p))==as.character(as.numeric("NA"))),NA,dt10$n_p))


# Here is the structure of the input data frame:
str(dt10)                            
attach(dt10)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(year)
summary(treeid)
summary(species)
summary(treatment)
summary(n_per)
summary(c_per)
summary(c_n)
summary(d13c)
summary(d15n)
summary(p_per)
summary(n_p) 
# Get more details on character variables

summary(as.factor(dt10$treeid)) 
summary(as.factor(dt10$species)) 
summary(as.factor(dt10$treatment))
detach(dt10)               



inUrl11  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-hfr/18/36/513ac15ad8ed36f3c0692f9001b4c0f6" 
infile11 <- tempfile()
try(download.file(inUrl11,infile11,method="curl",extra=paste0(' -A "',getOption("HTTPUserAgent"),'"')))
if (is.na(file.size(infile11))) download.file(inUrl11,infile11,method="auto")


dt11 <-read.csv(infile11,header=F 
                ,skip=1
                ,sep=","  
                , col.names=c(
                  "date",     
                  "tree",     
                  "plot",     
                  "species",     
                  "year",     
                  "doy",     
                  "budbreak"    ), check.names=TRUE)

unlink(infile11)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

# attempting to convert dt11$date dateTime string to R date structure (date or POSIXct)                                
tmpDateFormat<-"%Y-%m-%d"
tmp11date<-as.Date(dt11$date,format=tmpDateFormat)
# Keep the new dates only if they all converted correctly
if(nrow(dt11[dt11$date != "",]) == length(tmp11date[!is.na(tmp11date)])){dt11$date <- tmp11date } else {print("Date conversion failed for dt11$date. Please inspect the data and do the date conversion yourself.")}                                                                    

if (class(dt11$tree)!="factor") dt11$tree<- as.factor(dt11$tree)
if (class(dt11$plot)!="factor") dt11$plot<- as.factor(dt11$plot)
if (class(dt11$species)!="factor") dt11$species<- as.factor(dt11$species)
if (class(dt11$doy)=="factor") dt11$doy <-as.numeric(levels(dt11$doy))[as.integer(dt11$doy) ]               
if (class(dt11$doy)=="character") dt11$doy <-as.numeric(dt11$doy)
if (class(dt11$budbreak)=="factor") dt11$budbreak <-as.numeric(levels(dt11$budbreak))[as.integer(dt11$budbreak) ]               
if (class(dt11$budbreak)=="character") dt11$budbreak <-as.numeric(dt11$budbreak)

# Convert Missing Values to NA for non-dates

dt11$tree <- as.factor(ifelse((trimws(as.character(dt11$tree))==trimws("NA")),NA,as.character(dt11$tree)))
dt11$plot <- as.factor(ifelse((trimws(as.character(dt11$plot))==trimws("NA")),NA,as.character(dt11$plot)))
dt11$species <- as.factor(ifelse((trimws(as.character(dt11$species))==trimws("NA")),NA,as.character(dt11$species)))
dt11$doy <- ifelse((trimws(as.character(dt11$doy))==trimws("NA")),NA,dt11$doy)               
suppressWarnings(dt11$doy <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt11$doy))==as.character(as.numeric("NA"))),NA,dt11$doy))
dt11$budbreak <- ifelse((trimws(as.character(dt11$budbreak))==trimws("NA")),NA,dt11$budbreak)               
suppressWarnings(dt11$budbreak <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt11$budbreak))==as.character(as.numeric("NA"))),NA,dt11$budbreak))


# Here is the structure of the input data frame:
str(dt11)                            
attach(dt11)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(date)
summary(tree)
summary(plot)
summary(species)
summary(year)
summary(doy)
summary(budbreak) 
# Get more details on character variables

summary(as.factor(dt11$tree)) 
summary(as.factor(dt11$plot)) 
summary(as.factor(dt11$species))
detach(dt11)               



inUrl12  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-hfr/18/36/a93b9896884caf2779c31902039b2d85" 
infile12 <- tempfile()
try(download.file(inUrl12,infile12,method="curl",extra=paste0(' -A "',getOption("HTTPUserAgent"),'"')))
if (is.na(file.size(infile12))) download.file(inUrl12,infile12,method="auto")


dt12 <-read.csv(infile12,header=F 
                ,skip=1
                ,sep=","  
                , col.names=c(
                  "year",     
                  "species",     
                  "treatment",     
                  "basket_num",     
                  "basket_type",     
                  "c_per",     
                  "n_per",     
                  "c_n",     
                  "p_per",     
                  "n_p"    ), check.names=TRUE)

unlink(infile12)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt12$species)!="factor") dt12$species<- as.factor(dt12$species)
if (class(dt12$treatment)!="factor") dt12$treatment<- as.factor(dt12$treatment)
if (class(dt12$basket_num)!="factor") dt12$basket_num<- as.factor(dt12$basket_num)
if (class(dt12$basket_type)!="factor") dt12$basket_type<- as.factor(dt12$basket_type)
if (class(dt12$c_per)=="factor") dt12$c_per <-as.numeric(levels(dt12$c_per))[as.integer(dt12$c_per) ]               
if (class(dt12$c_per)=="character") dt12$c_per <-as.numeric(dt12$c_per)
if (class(dt12$n_per)=="factor") dt12$n_per <-as.numeric(levels(dt12$n_per))[as.integer(dt12$n_per) ]               
if (class(dt12$n_per)=="character") dt12$n_per <-as.numeric(dt12$n_per)
if (class(dt12$c_n)=="factor") dt12$c_n <-as.numeric(levels(dt12$c_n))[as.integer(dt12$c_n) ]               
if (class(dt12$c_n)=="character") dt12$c_n <-as.numeric(dt12$c_n)
if (class(dt12$p_per)=="factor") dt12$p_per <-as.numeric(levels(dt12$p_per))[as.integer(dt12$p_per) ]               
if (class(dt12$p_per)=="character") dt12$p_per <-as.numeric(dt12$p_per)
if (class(dt12$n_p)=="factor") dt12$n_p <-as.numeric(levels(dt12$n_p))[as.integer(dt12$n_p) ]               
if (class(dt12$n_p)=="character") dt12$n_p <-as.numeric(dt12$n_p)

# Convert Missing Values to NA for non-dates

dt12$species <- as.factor(ifelse((trimws(as.character(dt12$species))==trimws("NA")),NA,as.character(dt12$species)))
dt12$treatment <- as.factor(ifelse((trimws(as.character(dt12$treatment))==trimws("NA")),NA,as.character(dt12$treatment)))
dt12$basket_num <- as.factor(ifelse((trimws(as.character(dt12$basket_num))==trimws("NA")),NA,as.character(dt12$basket_num)))
dt12$basket_type <- as.factor(ifelse((trimws(as.character(dt12$basket_type))==trimws("NA")),NA,as.character(dt12$basket_type)))
dt12$c_per <- ifelse((trimws(as.character(dt12$c_per))==trimws("NA")),NA,dt12$c_per)               
suppressWarnings(dt12$c_per <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt12$c_per))==as.character(as.numeric("NA"))),NA,dt12$c_per))
dt12$n_per <- ifelse((trimws(as.character(dt12$n_per))==trimws("NA")),NA,dt12$n_per)               
suppressWarnings(dt12$n_per <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt12$n_per))==as.character(as.numeric("NA"))),NA,dt12$n_per))
dt12$c_n <- ifelse((trimws(as.character(dt12$c_n))==trimws("NA")),NA,dt12$c_n)               
suppressWarnings(dt12$c_n <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt12$c_n))==as.character(as.numeric("NA"))),NA,dt12$c_n))
dt12$p_per <- ifelse((trimws(as.character(dt12$p_per))==trimws("NA")),NA,dt12$p_per)               
suppressWarnings(dt12$p_per <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt12$p_per))==as.character(as.numeric("NA"))),NA,dt12$p_per))
dt12$n_p <- ifelse((trimws(as.character(dt12$n_p))==trimws("NA")),NA,dt12$n_p)               
suppressWarnings(dt12$n_p <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt12$n_p))==as.character(as.numeric("NA"))),NA,dt12$n_p))


# Here is the structure of the input data frame:
str(dt12)                            
attach(dt12)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(year)
summary(species)
summary(treatment)
summary(basket_num)
summary(basket_type)
summary(c_per)
summary(n_per)
summary(c_n)
summary(p_per)
summary(n_p) 
# Get more details on character variables

summary(as.factor(dt12$species)) 
summary(as.factor(dt12$treatment)) 
summary(as.factor(dt12$basket_num)) 
summary(as.factor(dt12$basket_type))
detach(dt12)               



inUrl13  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-hfr/18/36/c32478f5279ed231b76509b53a3d0357" 
infile13 <- tempfile()
try(download.file(inUrl13,infile13,method="curl",extra=paste0(' -A "',getOption("HTTPUserAgent"),'"')))
if (is.na(file.size(infile13))) download.file(inUrl13,infile13,method="auto")


dt13 <-read.csv(infile13,header=F 
                ,skip=1
                ,sep=","  
                , col.names=c(
                  "date",     
                  "plot",     
                  "subplot",     
                  "horizon",     
                  "som",     
                  "whc"    ), check.names=TRUE)

unlink(infile13)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

# attempting to convert dt13$date dateTime string to R date structure (date or POSIXct)                                
tmpDateFormat<-"%Y-%m-%d"
tmp13date<-as.Date(dt13$date,format=tmpDateFormat)
# Keep the new dates only if they all converted correctly
if(nrow(dt13[dt13$date != "",]) == length(tmp13date[!is.na(tmp13date)])){dt13$date <- tmp13date } else {print("Date conversion failed for dt13$date. Please inspect the data and do the date conversion yourself.")}                                                                    

if (class(dt13$plot)!="factor") dt13$plot<- as.factor(dt13$plot)
if (class(dt13$subplot)!="factor") dt13$subplot<- as.factor(dt13$subplot)
if (class(dt13$horizon)!="factor") dt13$horizon<- as.factor(dt13$horizon)
if (class(dt13$som)=="factor") dt13$som <-as.numeric(levels(dt13$som))[as.integer(dt13$som) ]               
if (class(dt13$som)=="character") dt13$som <-as.numeric(dt13$som)
if (class(dt13$whc)=="factor") dt13$whc <-as.numeric(levels(dt13$whc))[as.integer(dt13$whc) ]               
if (class(dt13$whc)=="character") dt13$whc <-as.numeric(dt13$whc)

# Convert Missing Values to NA for non-dates

dt13$plot <- as.factor(ifelse((trimws(as.character(dt13$plot))==trimws("NA")),NA,as.character(dt13$plot)))
dt13$subplot <- as.factor(ifelse((trimws(as.character(dt13$subplot))==trimws("NA")),NA,as.character(dt13$subplot)))
dt13$horizon <- as.factor(ifelse((trimws(as.character(dt13$horizon))==trimws("NA")),NA,as.character(dt13$horizon)))
dt13$som <- ifelse((trimws(as.character(dt13$som))==trimws("NA")),NA,dt13$som)               
suppressWarnings(dt13$som <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt13$som))==as.character(as.numeric("NA"))),NA,dt13$som))
dt13$whc <- ifelse((trimws(as.character(dt13$whc))==trimws("NA")),NA,dt13$whc)               
suppressWarnings(dt13$whc <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt13$whc))==as.character(as.numeric("NA"))),NA,dt13$whc))


# Here is the structure of the input data frame:
str(dt13)                            
attach(dt13)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(date)
summary(plot)
summary(subplot)
summary(horizon)
summary(som)
summary(whc) 
# Get more details on character variables

summary(as.factor(dt13$plot)) 
summary(as.factor(dt13$subplot)) 
summary(as.factor(dt13$horizon))
detach(dt13)               





