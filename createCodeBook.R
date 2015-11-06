library(dplyr)

tidySet <- readRDS("./data/tidySet.RDS")


str(tidySet)


a<-data.frame(varname=colnames(tidySet))
b<-read.table("./data/UCI HAR Dataset/features.txt",
              stringsAsFactors=F)
colnames(b) <- c ("varID", "varnameOri")
b$varname <- make.names(b$varnameOri)

c<-left_join(a,b,by="varname")
c<-select(c,varname, varnameOri)

sink("cb.txt")
c[3:68,]
sink()

as.data.frame(list.files(, "R$"))
as.data.frame(list.files(, "md$"))
