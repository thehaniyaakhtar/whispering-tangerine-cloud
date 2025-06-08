# Print a message to the console
print("Welcome to R!")

# Assign a string to a variable
textToPrint <- "this is some text to print"

# Print the contents of a variable
textToPrint

# Count the number of characters in "aSentence"
nchar(textToPrint)

# Concatenate "textToPrint" and "textToPrint"
c(textToPrint, textToPrint)

#Check the data type of "textToPrint"
str(textToPrint)

#numeric variables:
num <- 65

#checking type of object:
class(num)

#to convert data type to numeric
x <- "45.6"
as.numeric(x)

as.character()
as.logical()
as.integer()

num * as.numeric(x)

#Logical Operators

"a" == "b" #FALSE
5 == 5 #TRUE
"6" == 6 #TRUE
#coerce both sides to the same data type before comparing

#VECTORS
#list of data that is all of the same data type

#creating a vector:
vectorList <- c(1, 2, 3, 6.7, 8, 9)
vectorList

#Operations on Vectors:
5 * vectorList
vectorList + 1

#Accessing numbers in the list
vectorList[1]

#for 2D vectors
vectorList[r, c]

#TIDYVERSE

library(tidyverse)
#it is a package in R, collection of functions

#Reading data in R
chocolateData <- read_csv("../input/flavors_of_cacao.csv")

#specific top most/ bottom most data entries
head(chocolateData, 5)
tail(chocolateData, 7)

chocolateData[6, 4]

#6th row contents:
chocolateData[6, ]

#w out the comma, you only get the 6th column:
chocolateData[6]


#Removing certain rows
chocolateData <- chocolateData[-1, ] #removes the first row

#removing unwanted characters from column names and replacing spacces with _
names(chocolateData) <- gsub("[[:space:]+]", "_", names(chocolateData))

#accessing only certain col from the table
head(chocolateData$Rating)

#converting % 
chocolateData$Percent <- sappply(chocolateData$Percent, function(x) gsub("%", "", x))
#letting R convert data type into appropriate types
chocolateData <- type_convert(chocolateData)
#checking data type
str(chocolateData)

#Summarizing data using average and std dev:
chocolateData %>%
	summarise(avgRating = mean(Rating),
		    sdRating = sd(Rating))
#= is used within arguments

#Grouping data before summarizing
chocolateData %>%
	group_by(Review_Date) %>% #Pipe operator: passes result to next function ("and then")
	summarise(avgRating = mean(Rating),
		    sdRating = sd(Rating))

#applying functions to multiple cols at once
summarise(across(col_name, function))
#all columns:
summarise(across(everything(),..)
#applying mean to all columns
summarise(across(everything(), mean))

#applying only to specific cols:
summarise(across(c("col1", "cols2"),...))

summarise(across(c("Age", "Score", list(avg=mean, sd=sd)))

summarise(across(where(is.numeric), mean))

#plotting data
cocoa_plot <- ggplot(cocoa_Summary, aes(x = col, y = col)) +
	geom_line(color = "darkblue") +
	geom_point() + 
	ggtitle("title")
print(cocoa_plot)

#aes defines x and y axes
#geom_line adds line plot to chart
#geo_point adds individual data points to the plot



