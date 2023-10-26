# Load the iris dataset from the iris.csv file
iris_data <- read.csv("iris.csv")

# Create a scatterplot of Sepal.Length and Petal.Length with labels and a title
plot(iris_data$sepal_length, iris_data$petal_length,
     xlab = "Sepal Length", ylab = "Petal Length",
     main = "Scatterplot of Sepal Length vs Petal Length")

# Define colors and point characters for each species
species_colors <- c("setosa" = "red", "versicolor" = "blue", "virginica" = "green")
species_pch <- c("setosa" = 1, "versicolor" = 2, "virginica" = 3)

# Loop through unique species and add points with colors
for (species in unique(iris_data$species)) {
  subset_data <- iris_data[iris_data$species == species, ]
  points(subset_data$sepal_length, subset_data$petal_length, col = species_colors[species], pch = species_pch[species])
}

# Add a legend
legend("topright", legend = unique(iris_data$species), col = species_colors, pch = species_pch, title = "Species")
