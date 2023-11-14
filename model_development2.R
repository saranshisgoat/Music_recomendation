# Step 6: Model Development - Logistic Regression
# Assuming 'target' is the column you want to predict
target <- "target"

# Create a formula for logistic regression
formula <- as.formula(paste(target, "~ .", sep = ""))

# Train the logistic regression model
logistic_model <- glm(formula, data = train_set, family = binomial)

# Step 7: Model Evaluation (on the validation set)
# Note: Make sure to replace 'validation_set' with the actual name of your validation set
predictions <- predict(logistic_model, newdata = validation_set, type = "response")
predicted_classes <- ifelse(predictions > 0.5, 1, 0)

# Evaluate the model (you can use various metrics)
conf_matrix <- confusionMatrix(table(predicted_classes, validation_set$target))
accuracy <- conf_matrix$overall["Accuracy"]

# Save the logistic model to the specified directory
saveRDS(logistic_model, file = "C:\\Users\\smaha\\OneDrive\\Documents\\Music Recomendation in R\\logistic_regression_model\\logistic_model.rds")

# Load the saved logistic model
loaded_logistic_model <- readRDS("C:\\Users\\smaha\\OneDrive\\Documents\\Music Recomendation in R\\logistic_regression_model\\logistic_model.rds")
# Now 'loaded_logistic_model' can be used for predictions


