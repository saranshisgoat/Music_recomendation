# Function to split a data frame into training and test sets
split_data_frame <- function(data, test_proportion = 0.2, seed = 123) {
  set.seed(seed)
  
  total_rows <- nrow(data)
  test_size <- round(test_proportion * total_rows)
  test_indices <- sample(1:total_rows, size = test_size)
  
  train_set <- data[-test_indices, ]
  test_set <- data[test_indices, ]
  
  return(list(train_set = train_set, test_set = test_set))
}

# Usage example:
train_split <- split_data_frame(train)
# You can access the training set with train_split$train_set
# You can access the test set with train_split$test_set
# Usage for other data frames, e.g., songs:
songs_split <- split_data_frame(songs)
# You can access the training set with songs_split$train_set
# You can access the test set with songs_split$test_set
