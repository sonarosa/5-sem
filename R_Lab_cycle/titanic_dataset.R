# Load necessary libraries
library(titanic)  # If the dataset is not loaded, install.packages("titanic") and then library(titanic)
library(dplyr)
library(ggplot2)
library(survival)

# Load the Titanic dataset
data("titanic_train")
titanic_data <- as.data.frame(titanic_train)

# Display the structure of the dataset
str(titanic_data)

# Basic summary statistics
summary(titanic_data)

# Explore missing values
sapply(titanic_data, function(x) sum(is.na(x)))

# Data Visualization

# Survival rate by class
ggplot(titanic_data, aes(x = Pclass, fill = factor(Survived))) +
  geom_bar(position = "dodge") +
  labs(title = "Survival Rate by Class",
       x = "Class",
       y = "Count",
       fill = "Survived")

# Survival rate by gender
ggplot(titanic_data, aes(x = Sex, fill = factor(Survived))) +
  geom_bar(position = "dodge") +
  labs(title = "Survival Rate by Gender",
       x = "Gender",
       y = "Count",
       fill = "Survived")

# Survival rate by age
ggplot(titanic_data, aes(x = Age, fill = factor(Survived))) +
  geom_histogram(bins = 30, position = "dodge", alpha = 0.7) +
  labs(title = "Survival Rate by Age",
       x = "Age",
       y = "Count",
       fill = "Survived")

# Advanced Statistical Analysis

# Kaplan-Meier survival curve by class
survfit_obj <- survfit(Surv(time = titanic_data$Age, event = titanic_data$Survived) ~ titanic_data$Pclass)
summary(survfit_obj)
plot(survfit_obj, main = "Kaplan-Meier Survival Curve by Class")

# Log-rank test for survival by class
survdiff_obj <- survdiff(Surv(time = titanic_data$Age, event = titanic_data$Survived) ~ titanic_data$Pclass)
summary(survdiff_obj)

# Cox proportional hazards model
cox_model <- coxph(Surv(Age, Survived) ~ Pclass + Sex + Fare, data = titanic_data)
summary(cox_model)
