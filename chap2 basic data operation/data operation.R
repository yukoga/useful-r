# use R.utils package to get sample csv data from web site.
library(R.utils)
dir.create("data/dataexpo2009", recursive = TRUE)
download.file("http://stat-computing.org/dataexpo/2009/2008.csv.bz2", "data/dataexpo2009/2008.csv.bz2")
bunzip2("data/dataexpo2009/2008.csv.bz2")
system.time(al.2008.df <- read.csv("data/dataexpo2009/2008.csv", as.is = TRUE))

# use readr package to read csv file.
library('readr')
system.time(al.2008.readr <- read_csv("data/dataexpo2009/2008.csv"))
head(al.2008.readr)
class(al.2008.readr)
sapply(al.2008.readr, class)

# get data from BigQuery using bigrquery package.
library('bigrquery')
project <- "gcp-jp"
sql <- "SELECT gaLandingPagePath, gaDate, AVG(gaBounceRate) AS avg.BounceRate 
FROM [98177472.landing_pages] GROUP BY gaLandingPagePath, gaDate"
bqdf <- query_exec(sql, project = project)

# using dplyr
library('dplyr')
bq.tbl <- tbl_df(bqdf)
filter(bq.tbl, avg_BounceRate > 10, avg_BounceRate < 20)
bq1020data <- select(filter(bq.tbl, avg_BounceRate > 10, avg_BounceRate < 20), avg_BounceRate)
summary(bq1020data$avg_BounceRate)
#bq1020hist <- hist(bq1020data$avg_BounceRate, breaks=20)
#bqhist <- hist(bq.tbl$avg_BounceRate, breaks=100)
arrange(bq.tbl, desc(avg_BounceRate))
arrange(bq1020data, desc(avg_BounceRate))
