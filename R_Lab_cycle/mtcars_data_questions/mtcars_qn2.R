# Load the mtcars dataset from the mtcars.csv file
mtcars_data <- read.csv("mtcars.csv")

# Create a bar plot with different colors for "am"
barplot(table(mtcars_data$cyl, mtcars_data$am),
        beside = TRUE,
        col = c("blue", "red"),
        main = "Bar Plot of Cylinders by Transmission Type",
        xlab = "Cylinders",
        ylab = "Frequency",
        names.arg = unique(mtcars_data$cyl),
        legend.text = unique(mtcars_data$am),
        args.legend = list(title = "Transmission Type", x = "topright"))

# Adding a legend
legend("topright", legend = unique(mtcars_data$am), fill = c("blue", "red"), title = "Transmission Type")
