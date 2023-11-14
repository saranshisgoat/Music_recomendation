# Install and load the 'caret' package
install.packages("caret")
library(caret)

# Define the data frames to apply one-hot encoding
data_frames <- list(train, test, songs, song_extra_info, sample_submission, members)

# Perform one-hot encoding for 'source_type' in all data frames
for (df in data_frames) {
  dummies <- dummyVars(~ source_type, data = df)
  df_dummies <- predict(dummies, newdata = df)
  df <- cbind(df, df_dummies)  # Add the new dummy variables to the data frame
}

# Check the first few rows of the modified data frames
head(train)
head(test)
head(songs)
head(song_extra_info)
head(sample_submission)
head(members)

# Example: Label encoding 'gender' in the 'members' data frame
members$gender <- as.integer(factor(members$gender))
# Example: Impute missing values in 'age' with the median in the 'members' data frame
members$age_group[is.na(members$age_group)] <- median(members$age_group, na.rm = TRUE)
# Example: Create a binary flag for 'is_male' based on the 'gender' column in the 'members' data frame
members$is_male <- ifelse(members$gender == "male", 1, 0)
# Example: Create an 'age_group' feature based on the 'age' column in the 'members' data frame
members$age_group <- ifelse(members$age < 18, "under 18", ifelse(members$age < 30, "18-29", "30+"))
