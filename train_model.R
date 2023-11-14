install.packages(c("glmnet", "pROC"))
# Train Logistic Regression
library(glmnet)
library(pROC)

# Assuming 'target' is the name of your response variable
target <- "target"

# Create dummy variables using caret
dummy_formula <- as.formula(paste(target, "~ .", sep = ""))
dummy_data <- dummyVars(dummy_formula, data = train_split$train_set[, ..selected_features])

# Apply the dummy variables to the training set
train_dummies <- predict(dummy_data, newdata = train_split$train_set)

# Apply the dummy variables to the validation set
validation_dummies <- predict(dummy_data, newdata = train_split$test_set)

# Train Logistic Regression
logistic_model <- glmnet(train_dummies[, -1], as.factor(train_split$train_set$target), family = "binomial")
logistic_predictions <- predict(logistic_model, newx = validation_dummies[, -1], type = "response")
logistic_auc <- auc(roc(as.numeric(train_split$test_set$target), as.numeric(logistic_predictions)))

# Print AUC for logistic regression
cat("Logistic Regression AUC:", logistic_auc, "\n")

# Optionally, save the logistic model to a file
saveRDS(logistic_model, file = "C:\\Users\\smaha\\OneDrive\\Documents\\Music Recomendation in R\\logistic_regression_model\\logistic_model.rds")
