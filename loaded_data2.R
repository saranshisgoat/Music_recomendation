#Step 1: Data Collection
# Load necessary libraries (if not already installed)
install.packages("data.table")
install.packages("lubridate")
install.packages("ggplot2")
install.packages("corrplot")
library(data.table)
library(lubridate)


# Read data
#We use the fread function from the data.table library to read CSV files. It's efficient for reading large datasets.
#We use the lubridate library to parse date columns. 
#We convert the "registration_init_time" and "expiration_date" columns to date format using the ymd function.
train <- fread("C:\\Users\\smaha\\OneDrive\\Documents\\Music Recomendation in R\\kkbox-music-recommendation-challenge\\train.csv\\train.csv")
test <- fread("C:\\Users\\smaha\\OneDrive\\Documents\\Music Recomendation in R\\kkbox-music-recommendation-challenge\\test.csv\\test.csv")
songs<- fread("C:\\Users\\smaha\\OneDrive\\Documents\\Music Recomendation in R\\kkbox-music-recommendation-challenge\\songs.csv\\songs.csv")
song_extra_info <- fread("C:\\Users\\smaha\\OneDrive\\Documents\\Music Recomendation in R\\kkbox-music-recommendation-challenge\\song_extra_info.csv\\song_extra_info.csv")
sample_submission <- fread("C:\\Users\\smaha\\OneDrive\\Documents\\Music Recomendation in R\\kkbox-music-recommendation-challenge\\sample_submission.csv\\sample_submission.csv")
members <- fread("C:\\Users\\smaha\\OneDrive\\Documents\\Music Recomendation in R\\kkbox-music-recommendation-challenge\\members.csv\\members.csv")

head(train)
head(test)
head(songs)
head(song_extra_info)
head(sample_submission)
head(members)

#Step 2: Data Preprocessing
#Data preprocessing includes handling missing values, transforming data types, and preparing the data for analysis and modeling.
# Load necessary libraries
library(dplyr)

# Data Preprocessing for the train dataset
train <- train %>%
  # Handle missing values (if any)
  na.omit() %>%
  # Ensure data consistency (convert data types if necessary)
  mutate(
    msno = as.factor(msno),
    song_id = as.factor(song_id),
    source_system_tab = as.factor(source_system_tab),
    source_screen_name = as.factor(source_screen_name),
    source_type = as.factor(source_type)
  )

# Data Preprocessing for the test dataset
test <- test %>%
  na.omit() %>%
  mutate(
    msno = as.factor(msno),
    song_id = as.factor(song_id),
    source_system_tab = as.factor(source_system_tab),
    source_screen_name = as.factor(source_screen_name),
    source_type = as.factor(source_type)
  )

# Data Preprocessing for the songs dataset
songs <- songs %>%
  na.omit() %>%
  mutate(
    song_id = as.factor(song_id),
    song_length = as.integer(song_length),
    genre_ids = as.factor(genre_ids),
    artist_name = as.factor(artist_name),
    composer = as.factor(composer),
    lyricist = as.factor(lyricist)
  )

# Data Preprocessing for the song_extra_info dataset
song_extra_info <- song_extra_info %>%
  na.omit() %>%
  mutate(
    song_id = as.factor(song_id),
    name = as.factor(name),
    isrc = as.factor(isrc)
  )

# Data Preprocessing for the members dataset
members <- members %>%
  na.omit() %>%
  mutate(
    msno = as.factor(msno),
    city = as.integer(city),
    bd = as.integer(bd),
    gender = as.factor(gender),
    registered_via = as.factor(registered_via),
    registration_init_time = as.Date(as.character(registration_init_time), format = "%Y%m%d"),
    expiration_date = as.Date(as.character(expiration_date), format = "%Y%m%d")
  )
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

