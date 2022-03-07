### Some examples of Graphs in R
### Additional examples for Chapter 8

## First the whole code for a scatterplot with labels


# library (maybe you need to install it first!)
library(ggplot2)

# Keep 30 first rows in the mtcars natively available dataset
data=head(mtcars, 30)

# 1/ add text with geom_text, use nudge to nudge the text
## borrowed from https://www.r-graph-gallery.com/275-add-text-labels-with-ggplot2.html
## There are lots of resources on line for graphing 
ggplot(data, aes(x=wt, y=mpg)) +
  geom_point() + # Show dots
  geom_text(
    label=rownames(data), 
    nudge_x = 0.25, nudge_y = 0.25, 
    check_overlap = T
  )

## Simplify by removing most of the code 
ggplot(data, aes(x=wt, y=mpg)) +
  geom_point() 
  )

## Add labels but don't nudge them
ggplot(data, aes(x=wt, y=mpg)) +
  geom_point() + # Show dots
  geom_text(
    label=rownames(data)
  )

## scatter plots show correlation
## Miles per gallon appears related to vehicle weight

### More care examples from the internet
### Add a line of best fit to suggest a linear relationship between two variables
# load package and data
library(ggplot2)
data(mpg, package="ggplot2") # alternate source: "http://goo.gl/uEeRGu")

## start by setting the dataframe and the x and y variables
g <- ggplot(mpg, aes(cty, hwy))
## next customize the visuals
# Scatterplot
g + geom_point() + 
  geom_smooth(method="lm", se=F) +
  labs(subtitle="mpg: city vs highway mileage", 
       y="hwy", 
       x="cty", 
       title="Scatterplot with overlapping points", 
       caption="Source: midwest")


## Simpler version wiht only points
g + geom_point()

## Question 2 in Chapter 8 homework is to create a bar chart by group, using the net promoter score airline data
## Let's do something like that here

summary(mpg)
mpg$manufacturer
## we could group cars by manufacturer

## geom_col() makes vertical bar charts 
ggplot(mpg)+aes(x=manufacturer, y=cty) + geom_col()
## pull a tip from textbook pag 165 and rotate the axis labels
ggplot(mpg)+aes(x=manufacturer, y=cty) + geom_col() +
    theme(axis.text.x = element_text(angle=90,hjust=1))


## Question 5 for Chapter 8 is to make a scatter plot with specific values for x and y axis
ggplot(mpg)+aes(x=hwy, y=cty) + geom_point()
## that's about the simples scatter plot we can make
## What if I want to add a title? 

## search "How to add a title to a graph in ggplot"
## First result is great!
## http://environmentalcomputing.net/plotting-with-ggplot-adding-titles-and-axis-names/


graph_object <- ggplot(mpg)+aes(x=hwy, y=cty) + geom_point()
graph_object + ggtitle("Miles Per Gallon City Versus Highway")

## What if I want to make nicer axis labels?
## same website has great examples 
graph_object + labs(y="City MPG", x = "Highway MPG")

## Put it all together 
ggplot(mpg)+aes(x=hwy, y=cty) + geom_point() + 
  ggtitle("Miles Per Gallon City Versus Highway") +
  labs(y="City MPG", x = "Highway MPG")
