# Step 5: Data Splitting
set.seed(123)
train_split <- split_data_frame(train)
train_set <- train_split$train_set
validation_set <- train_split$test_set