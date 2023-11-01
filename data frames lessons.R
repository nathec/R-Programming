# reading files on R

stats <- read.csv(file.choose()) 
stats

#Set the working directory and read the data from there
getwd()

# Exploring your data set
#number of rows & columns
nrow(stats)
ncol(stats)

# Exploring head and tail
head(stats)
tail(stats)
# You can give a number of head and tail of the table you want to see
head(stats, n=10)
tail(stats, n=8)
#structure of data
str(stats)
# runif -means random variables distributed uniformly 
# rnorm - mean random variables distributed normaly

# summary
summary(stats)

# Using the $ dollar sign
head(stats)
#finding data using specific row number and column
stats[3, 3]
stats[3, "Birth rate"]
# the dollar sign is used to retrieve the values in a column
stats$Internet.users
stats$Internet.users[2]
levels(stats$Income.Group)

# Basic Operations
stats[1:10,]
stats[3:9,]

# Multiplying columns
stats$Birth.rate * stats$Internet.users

# Adding a column
stats$Mycalc <- stats$Birth.rate * stats$Internet.users
head(stats)

# removing a column
stats$Mycalc <- NULL
head(stats)


# Filtering data frames
head(stats)
stats$Internet.users < 2
filter <- stats$Internet.users < 2
stats[filter,]
# Filtering the birth rates greater than 40
stats[stats$Birth.rate > 40, ]
# Filtering data of birth rates greater than 40 and internet access less than 2
stats[stats$Birth.rate > 40 & stats$Internet.users < 2, ]
# Filtering data to see countries with high income
stats[stats$Income.Group == "High income", ]
# Filtering with country name
stats[stats$Country.Name == "Malta", ]

#Introduction to qplot
# 1. Check whether you have ggplot 2

install.packages("ggplot2")
library("ggplot2")

?qplot
qplot(data = stats, x = Internet.users)

qplot(data = stats, x = Income.Group, y = Birth.rate)
qplot(data = stats, x = Income.Group, y = Birth.rate, size=I(3), colour= I("blue"))
qplot(data = stats, x = Income.Group, y = Birth.rate, geom="boxplot")

# Visualizing
qplot(data = stats, x = Internet.users, y = Birth.rate, 
      colour = I("red"), size=I(4))
# Visualizing with income as the colour group
qplot(data = stats, x = Internet.users, y = Birth.rate, 
      colour = Income.Group, size=I(4))

#Creating a new data frame
mydf <- data.frame(Countries_2012_Dataset, Codes_2012_Dataset, 
                   Regions_2012_Dataset)
mydf
head(mydf)
#changing column names
colnames(mydf) <- c("Country", "Code", "Region")
head(mydf)
# ANOTHER WAY OF CHANGING COLUMN NAMES IS BY 
# mydf <- data.frame(Country = Countries_2012_Dataset, Code = Codes_2012_Dataset, Region = Regions_2012_Dataset)


# Merging data frame

merged <- merge(stats, mydf, by.x = "Country.Code", by.y = "Code")
head(merged)

# removing duplicates such as country and country.name
merged$Country <- NULL
str(merged)

qplot(data = merged, x = Internet.users, y = Birth.rate)
qplot(data = merged, x = Internet.users, y = Birth.rate, colour=Region)

# Shapes
qplot(data = merged, x = Internet.users, y = Birth.rate, colour=Region,
      size=I(5), shape=I(17))
# Shape numbers are up to 25

# Transparency (alpha = I(0.7) this is from 0-1)
qplot(data = merged, x = Internet.users, y = Birth.rate, colour=Region,
      size=I(5), shape=I(17), alpha=I(0.7))

# Title
qplot(data = merged, x = Internet.users, y = Birth.rate, colour=Region,
      size=I(5), shape=I(17), alpha=I(0.7), 
      main="Birth Rate vs Internet Users")

