library(datasets)
head(iris)

#Categorical Variable
plot(iris$Species)

#Qualitative Variable
plot(iris$Petal.Length)

#Quant Pair
plot(iris$Petal.Length, iris$Petal.Width)

#Cat and Quant
plot(iris$Species, iris$Petal.Width)

plot(iris)

plot(iris$Petal.Length, iris$Petal.Width,
	col = "#cc0000",
	pch = 19,
	main = "Iris: Petal Length vs.Petal Width",
	xlab = "Petal Length",
	ylab = "Petal Width")

#Bar Graphs
head(mtcars)

cylinders <- table(mtcars$cyl)
barplot(cylinders)
plot(cylinders)

#Histogram:
#things to see in a histogram:
#shape: symm, skewed, unimodal, bimodal
#gaps: empty spaces in distribution
#outliers
#symmetry

#histograms for different quantitative variables
hist(iris$Sepal.Length)
hist(iris$Sepal.Width)
hist(iris$Petal.Length)
hist(iris$Petal.Width)

#For specific rows:
hist(iris$Petal.Width [iris$Species == "setosa"],
	xlim = c(0, 3),
	breaks = 9,
	main = "Petal Width for Setosa",
	xlab = "",,
	col = "red")

hist(iris$Petal.Width [iris$Species == "versicolor"],
	xlim = c(0, 3),
	breaks = 9,
	main = "Petal Width for Versicolor",
	xlab = "",,
	col = "purple")

hist(iris$Petal.Width [iris$Species == "virginica"],
	xlim = c(0, 3),
	breaks = 9,
	main = "Petal Width for Virginica",
	xlab = "",,
	col = "blue")

#Scatterplot

#To see if association between variables is linear
#Checking spread
#Outliers

#Checking univariate dist:
hist(mtcars$wt)
hist(mtcars$mpg)

plot(mtcars$wt, mtcars$mpg)

#Overlaying plots

hist(lynx,
     breaks = 14,
     freq = FALSE,
     col = "thistle1",
     main = paste("Hist", "1821-1934"),
     xlab = "Number of Lynx Trapped")

#Adding a normal distribution
curve(dnorm(x, mean = mean(lynx), sd = sd(lynx)),
	col = "thistle4",
	lwd = 2,
	add = TRUE)

lines(density(lynx), col = "blue", lwd = 2)
lines(density(lynx, adjust = 3, col = "Purple", lwd = 2)

#Add a rug plot
rug(lynx, lwd = 2, col = "gray")

#describe
#For quantitative variables only
describe(iris$Sepal.Length)






