# Step 3: Exploratory Data Analysis (EDA)
# Exploratory Data Analysis (EDA) is an important step in understanding your dataset and gaining insights before proceeding with modeling or analysis.
summary(train)
library(ggplot2)
# Example: Bar plot of source types
ggplot(train, aes(x = source_type)) + 
  geom_bar(fill = "green") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Count of Source Types", x = "Source Type", y = "Count")
library(corrplot)

# Example: Count of listening events by year
train$year <- year(train$registration_init_time)
event_counts <- train %>%
  group_by(year) %>%
  summarise(count = n())

ggplot(event_counts, aes(x = year, y = count)) +
  geom_line() +
  labs(title = "Listening Events Over Time", x = "Year", y = "Count")
# Load necessary libraries
if (!require(ggplot2)) install.packages("ggplot2")
if (!require(dplyr)) install.packages("dplyr")
if (!require(corrplot)) install.packages("corrplot")

library(ggplot2)
library(dplyr)
library(corrplot)

# Additional EDA
# Example: Bar plot of gender distribution in the 'members' dataset
gender_counts <- members %>%
  group_by(gender) %>%
  summarise(count = n()) %>%
  filter(!is.na(gender))

ggplot(gender_counts, aes(x = gender, y = count)) +
  geom_bar(stat = "identity", fill = "blue") +
  labs(title = "Gender Distribution in Members", x = "Gender", y = "Count")


# Example: Correlation plot for numerical variables in the 'train' dataset
train_numeric <- train %>%
  select(target)

corr_matrix <- cor(train_numeric)
corrplot(corr_matrix, type = "upper", method = "color")
# Load necessary libraries
library(ggplot2)

# Group data and calculate counts
source_system_tab_counts <- table(train$source_system_tab)
source_system_tab_data <- data.frame(
  Source_System_Tab = names(source_system_tab_counts),
  Count = as.numeric(source_system_tab_counts)
)

# Sort data by count in descending order
source_system_tab_data <- source_system_tab_data[order(source_system_tab_data$Count, decreasing = TRUE), ]

# Load necessary libraries
library(ggplot2)

# Group data and calculate counts
source_system_tab_counts <- table(train$source_system_tab)
source_system_tab_data <- data.frame(
  Source_System_Tab = names(source_system_tab_counts),
  Count = as.numeric(source_system_tab_counts)
)

# Sort data by count in descending order
source_system_tab_data <- source_system_tab_data[order(source_system_tab_data$Count, decreasing = TRUE), ]

# Create a bar plot
ggplot(source_system_tab_data, aes(x = Source_System_Tab, y = Count)) +
  geom_bar(stat = "identity", fill = "blue") +
  labs(title = "Distribution of Source System Tab", x = "Source System Tab", y = "Count") +
  theme_minimal()  # Adjust the theme as needed
# Display the plot


# Load necessary libraries
library(ggplot2)

# Group data by 'source_system_tab' and calculate the mean of 'target'
repeat_df <- aggregate(target ~ source_system_tab, data = train, FUN = mean)

# Sort the data by 'Target' in descending order
repeat_df <- repeat_df[order(repeat_df$target, decreasing = TRUE), ]

# Create a bar plot
ggplot(repeat_df, aes(x = source_system_tab, y = target)) +
  geom_bar(stat = "identity", fill = "blue") +
  labs(title = "Source System Tab vs. Target", x = "Source System Tab", y = "Target") +
  theme_minimal()  # Adjust the theme as needed
# Display the plot

# Group data by 'source_type' and calculate the mean of 'target'
Type <- aggregate(target ~ source_type, data = train, FUN = mean)

# Sort the data by 'Target' in descending order
Type <- Type[order(Type$target, decreasing = TRUE), ]

# Create a bar plot
ggplot(Type, aes(x = source_type, y = target)) +
  geom_bar(stat = "identity", fill = "blue") +
  labs(title = "Source Type vs. Target", x = "Source Type", y = "Target") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1) )  # Rotate x-axis labels

# Display the plot

# Group data by 'source_type' and calculate the mean of 'target'
Type <- aggregate(target ~ source_type, data = train, FUN = mean)

# Sort the data by 'Target' in descending order
Type <- Type[order(Type$target, decreasing = TRUE), ]

# Create a bar plot
ggplot(Type, aes(x = source_type, y = target)) +
  geom_bar(stat = "identity", fill = "blue") +
  labs(title = "Source Type vs. Target", x = "Source Type", y = "Target") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))  # Rotate x-axis labels

# Display the plot


