#Step 2: Data Preprocessing
#Data preprocessing includes handling missing values, transforming data types, and preparing the data for analysis and modeling.
#Load necessary libraries
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