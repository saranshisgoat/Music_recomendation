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
train <- fread("C:\\Users\\smaha\\OneDrive\\Documents\\Music Recomendation in R\\data\\train.csv\\train.csv")
test <- fread("C:\\Users\\smaha\\OneDrive\\Documents\\Music Recomendation in R\\data\\test.csv\\test.csv")
songs<- fread("C:\\Users\\smaha\\OneDrive\\Documents\\Music Recomendation in R\\data\\songs.csv\\songs.csv")
song_extra_info <- fread("C:\\Users\\smaha\\OneDrive\\Documents\\Music Recomendation in R\\data\\song_extra_info.csv\\song_extra_info.csv")
sample_submission <- fread("C:\\Users\\smaha\\OneDrive\\Documents\\Music Recomendation in R\\data\\sample_submission.csv\\sample_submission.csv")
members <- fread("C:\\Users\\smaha\\OneDrive\\Documents\\Music Recomendation in R\\data\\members.csv\\members.csv")

head(train)
head(test)
head(songs)
head(song_extra_info)
head(sample_submission)
head(members)
