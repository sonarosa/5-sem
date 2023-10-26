# Load the mtcars dataset from the mtcars.csv file
mtcars_data <- read.csv("mtcars.csv")

# Create a scatterplot with different colors for "cyl" and a smooth line
plot(mpg ~ disp, data = mtcars_data, pch = mtcars_data$cyl, col = mtcars_data$cyl,
     xlab = "Displacement (cu.in.)", ylab = "Miles per Gallon (mpg)",
     main = "Scatterplot of mpg vs disp by cyl",
     xlim = c(0, max(mtcars_data$disp) + 50), ylim = c(0, max(mtcars_data$mpg) + 10))

# Add a smooth line
lines(lowess(mtcars_data$disp, mtcars_data$mpg), col = "blue")

# Create a legend
legend("topright", legend = unique(mtcars_data$cyl), col = 1:3, pch = unique(mtcars_data$cyl), title = "cyl")
