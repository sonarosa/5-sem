# Load the mtcars dataset from the mtcars.csv file
mtcars_data <- read.csv("mtcars.csv")

# Create a bar plot of the number of cylinders with different colors for "am"
barplot(table(mtcars_data$cyl, mtcars_data$am),
        beside = TRUE,
        col = c("red", "blue"),
        xlab = "Number of Cylinders",
        ylab = "Count",
        main = "Number of Cylinders by Transmission Type",
        names.arg = unique(mtcars_data$cyl))

# Add a legend
legend("topright", legend = unique(mtcars_data$am), fill = c("red", "blue"), title = "Transmission Type")
