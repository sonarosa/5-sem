# Read the Iris dataset from the CSV file
iris_data <- read.csv("iris.csv")

# Display the structure of the dataset
str(iris_data)

# Basic summary statistics
summary(iris_data)

# Pairwise scatterplots
pairs(iris_data[, 1:4], pch = 16, col = as.numeric(iris_data$variety),
      main = "Pairwise Scatterplots of Iris Features",
      labels = iris_data$variety)

# Boxplots by variety
par(mfrow = c(2, 2))
for (i in 1:4) {
  boxplot(iris_data[, i] ~ iris_data$variety,
          main = paste("Boxplot of", names(iris_data)[i], "by Variety"),
          xlab = "Variety",
          ylab = names(iris_data)[i])
}
par(mfrow = c(1, 1))
#################################################################################
# Read the Iris dataset from the CSV file
iris_data <- read.csv("iris.csv")

# Perform ANOVA for sepal lengths by variety
anova_result <- aov(sepal.length ~ variety, data = iris_data)

# Display ANOVA table
summary(anova_result)
################################################################################
# Read the Iris dataset from the CSV file
iris_data <- read.csv("iris.csv")

# Convert 'variety' to factor if it's not already
iris_data$variety <- as.factor(iris_data$variety)

# Create a pair plot
pairs(iris_data[, 1:4], pch = 16, col = as.numeric(iris_data$variety),
      main = "Pairwise Scatterplot Matrix of Iris Features",
      labels = iris_data$variety)
