# My first knitr document
Karel Machacek

## Loading and preprocessing the data

download the data, unzip them and plot the histogram

```{r}
# set working directory
setwd("C:\\private\\private_karel\\karel\\Coursera\\reproducible_research")
getwd()
set the URL for file download
fileURL="https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2Factivity.zip"
# download the zip file
download.file(fileURL,"file.zip")
# unzip the zipfile
unzip("file.zip")
# list.files(".")
# read the zipfile
filecontent <- read.csv("activity.csv")
# just some debug code
# head(filecontent)
# tail(filecontent)

### What is mean total number of steps taken per day?

# aggregate
agg_filecontent <- aggregate( steps ~ date, data = filecontent, FUN=sum, na.rm=TRUE)
# hisotgram of total steps taken per day
hist(agg_filecontent$steps, breaks=60)
```

print mean and median of steps taken each day
```{r}
# mean of steps taken each day
mean(agg_filecontent$steps)
# median of steps taken each day
median(agg_filecontent$steps)
``

plot the graph of steps per interval
```{r}
### What is the average daily activity pattern?
agg_filecontent2 <- aggregate ( steps ~ interval, data = filecontent, FUN = mean, na.rm = TRUE)
plot(agg_filecontent2$interval, agg_filecontent2$steps, type = "l")
```

print maximum number of average steps
```{r}
# interval with maximum number of average steps
sapply(agg_filecontent2, max, na.rm = TRUE)
```

### Imputing missing values
# total number of NA values
sum(is.na(filecontent$steps))


