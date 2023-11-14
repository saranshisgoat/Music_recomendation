# Install glmnet
install.packages("glmnet") #logistic regression
# Install rpart
install.packages("rpart") #rpart
# Install randomForest
install.packages("randomForest")  #randomForest
# Load packages
library(glmnet)
library(rpart)
library(randomForest)

install.packages("caret")
library(caret)

# Assume 'target' is your target variable, and you have selected features for modeling
# Replace 'selected_features' with the actual features you want to use in your models
selected_features <- c("source_system_tab", "source_screen_name", "source_type", "other_features")
# Split the data
train_split <- split_data_frame(train)
validation_split <- split_data_frame(train_split$train_set)

# Convert categorical variables to dummy variables
# Assuming 'target' is the name of your response variable
target <- "target"

# Create dummy variables using caret
dummy_formula <- as.formula(paste(target, "~ .", sep = ""))
dummy_data <- dummyVars(dummy_formula, data = train_split$train_set[, ..selected_features])

# Apply the dummy variables to the training set
train_dummies <- predict(dummy_data, newdata = train_split$train_set)

# Apply the dummy variables to the validation set
validation_dummies <- predict(dummy_data, newdata = train_split$test_set)
- predict(dummy_data, newdata = train_split$test_set)


# Train Logistic Regression
logistic_model <- glmnet(train_dummies[, -1], validation_split$train_set$target, family = "binomial")
logistic_predictions <- predict(logistic_model, newx = validation_dummies[, -1], type = "response")
logistic_auc <- auc(roc(validation_split$test_set$target, logistic_predictions))

# Train Decision Tree
library(rpart)
tree_model <- rpart(target ~ ., data = validation_split$train_set, method = "class")
tree_predictions <- predict(tree_model, validation_split$test_set, type = "prob")[, 2]
tree_auc <- auc(roc(validation_split$test_set$target, tree_predictions))

# Train Random Forest
library(randomForest)
forest_model <- randomForest(target ~ ., data = validation_split$train_set)
forest_predictions <- predict(forest_model, validation_split$test_set, type = "response")
forest_auc <- auc(roc(validation_split$test_set$target, forest_predictions))

# Compare model performance
model_performance <- data.frame(
  Model = c("Logistic Regression", "Decision Tree", "Random Forest"),
  AUC = c(logistic_auc, tree_auc, forest_auc)
)

print(model_performance)
