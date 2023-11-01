movies <- read.csv(file.choose()) 
head(movies)

# Editing the column names
colnames(movies) <- c("Film", "Genre", "CriticRating", "AudienceRating", "BudgetMillions", "Year")
head(movies)
tail(movies)
str(movies)
summary(movies)

# Converting data into factors
factor(movies$Year)
movies$Year <- factor(movies$Year)

summary(movies)
str(movies)

# Aesthetics. The function is aes
library(ggplot2)
# Aesthetics and Geometry
ggplot(data=movies, aes(x=CriticRating, y= AudienceRating)) +
  geom_point()

# Add colour
ggplot(data=movies, aes(x=CriticRating, y= AudienceRating, colour=Genre)) +
  geom_point()

#Using size
ggplot(data=movies, aes(x=CriticRating, y= AudienceRating, colour=Genre, size=BudgetMillions)) +
  geom_point()

# Plotting with layers

p <- ggplot(data=movies, aes(x=CriticRating, y= AudienceRating, colour=Genre, size=BudgetMillions)) 

# using points
p + geom_point()

# Using Lines

p + geom_line()

# Overiding aesthetics

p + geom_point(aes(size=CriticRating))
p + geom_point(aes(colour=BudgetMillions))


# Example
p + geom_point(aes(x=BudgetMillions)) + 
  xlab("Budget Millions $$$")

# Example 
p + geom_line() + geom_point()

# Example
p + geom_line(size=0) + geom_point()


# Mapping vs Setting
r <- ggplot(data=movies, aes(x=CriticRating, y= AudienceRating))
r + geom_point()
r + geom_point(aes(colour=Genre))

#Setting
r + geom_point(colour="Dark Green")

# Histogram and density charts

s <- ggplot(data=movies, aes(x=BudgetMillions))
s + geom_histogram(bindwidth=10)

# add colours
s + geom_histogram(bindwidth=10, aes(fill=Genre))
# add a border line
s + geom_histogram(bindwidth=10, aes(fill=Genre), colour="Black")

#use of density charts
s + geom_density(aes(fill=Genre))
s + geom_density(aes(fill=Genre), position="stack")

# Starting layer tips

t <- ggplot(data=movies, aes(x=AudienceRating))
t + geom_histogram(bindwidth=10, fill="White", colour = "Blue")

# Statiscal transformation

?geom_smooth
u <- ggplot(data=movies, aes(x=CriticRating, y= AudienceRating, 
                             colour=Genre))
u + geom_point()

u + geom_point() + geom_smooth(fill=NA)

# BOXPLOTS

u <- ggplot(data=movies, aes(x=Genre, y= AudienceRating, 
                             colour=Genre))
u + geom_boxplot()
u + geom_boxplot(size=1.2)

#tip
u + geom_boxplot(size=1.2,alpha=0.5) + geom_jitter()

# Using Facets

v <- ggplot(data=movies, aes(x=BudgetMillions))
v + geom_histogram(bindwidth=10, aes(fill=Genre), 
                   colour = "Black") + facet_grid(Genre~., scales="free")

# scatter plots
w <- ggplot(data=movies, aes(x=CriticRating, y= AudienceRating, 
                             colour=Genre))
w + geom_point(size=3) +
  facet_grid(Genre~.)

w + geom_point(size=3) +
  facet_grid(.~Year)

w + geom_point(size=3) +
  facet_grid(Genre~Year)

w + geom_point(size=3) +
  geom_smooth() +
  facet_grid(Genre~Year)

w + geom_point(aes(size=BudgetMillions)) +
  geom_smooth() +
  facet_grid(Genre~Year)

# Coordinates
# Setting limits

m <- ggplot(data=movies, aes(x=CriticRating, y= AudienceRating, 
                             size=BudgetMillions, colour=Genre))

m + geom_point() + 
  xlim(50,100) + 
  ylim(50,100)

n <- ggplot(data=movies, aes(x=BudgetMillions))
n + geom_histogram(bindwidth=10, aes(fill=Genre), 
                   colour = "Black") + 
  coord_cartesian(ylim=c(0,50))

w + geom_point(aes(size=BudgetMillions)) +
  geom_smooth() +
  facet_grid(Genre~Year) +
  coord_cartesian(ylim=c(0,100))

# Themes

o <- ggplot(data=movies, aes(x=BudgetMillions))
h <- o + geom_histogram(bindwidth=10, aes(fill=Genre), 
                   colour = "Black") 
h
# Axes labels
h + 
  xlab("Money Axis") +
  ylab("Number of Movies") +  
  theme(axis.title.x = element_text(colour="Dark Green", size=30),
        axis.title.y = element_text(colour="Red", size=30))

# tick mark formatting
h + 
  xlab("Money Axis") +
  ylab("Number of Movies") +  
  theme(axis.title.x = element_text(colour="Dark Green", size=30),
        axis.title.y = element_text(colour="Red", size=30),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size=20))

# legend formatting

h + 
  xlab("Money Axis") +
  ylab("Number of Movies") +  
  theme(axis.title.x = element_text(colour="Dark Green", size=30),
        axis.title.y = element_text(colour="Red", size=30),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size=20),
        legend.title = element_text(size=30),
        legend.text = element_text(size=20),
        legend.position = c(1,1),
        legend.justification = c(1,1))

# title
h + 
  xlab("Money Axis") +
  ylab("Number of Movies") + 
  ggtitle("Movie Budget Distribution") +
  theme(axis.title.x = element_text(colour="Dark Green", size=30),
        axis.title.y = element_text(colour="Red", size=30),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size=20),
        legend.title = element_text(size=30),
        legend.text = element_text(size=20),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        
        plot.title = element_text(colour="DarkBlue", 
                                  size=40, family="Courier"))
