
# Getting and Cleaning Data - Course Project

# 1. Load required package
library(dplyr)

# 2. Set the data directory
data_dir <- "UCI HAR Dataset"

# 3. Read activity labels and feature names
activity_labels <- read.table(
  file.path(data_dir, "activity_labels.txt"),
  col.names = c("activity_id", "activity_name")
)

features <- read.table(
  file.path(data_dir, "features.txt"),
  col.names = c("feature_id", "feature_name")
)

# 4. Select measurements on the mean and standard deviation
selected_features <- grepl(
  "-(mean|std)\\(",
  features$feature_name
)

feature_names <- features$feature_name[selected_features]

# 5. Read training data
X_train <- read.table(
  file.path(data_dir, "train", "X_train.txt")
)

y_train <- read.table(
  file.path(data_dir, "train", "y_train.txt")
)

subject_train <- read.table(
  file.path(data_dir, "train", "subject_train.txt")
)

# 6. Read test data
X_test <- read.table(
  file.path(data_dir, "test", "X_test.txt")
)

y_test <- read.table(
  file.path(data_dir, "test", "y_test.txt")
)

subject_test <- read.table(
  file.path(data_dir, "test", "subject_test.txt")
)

# 7. Assign descriptive feature names
names(X_train) <- features$feature_name
names(X_test) <- features$feature_name

# 8. Extract the selected measurements
X_train <- X_train[, selected_features]
X_test <- X_test[, selected_features]

# 9. Merge the training and test datasets
X <- rbind(X_train, X_test)

y <- c(
  as.vector(as.matrix(y_train)),
  as.vector(as.matrix(y_test))
)

subject <- c(
  as.vector(as.matrix(subject_train)),
  as.vector(as.matrix(subject_test))
)

# 10. Replace activity codes with descriptive activity names
activity <- activity_labels$activity_name[
  match(y, activity_labels$activity_id)
]

# 11. Create the combined dataset
data <- data.frame(
  subject = subject,
  activity = activity,
  X,
  check.names = FALSE
)

# 12. Use descriptive variable names
names(data) <- gsub("-", "_", names(data))
names(data) <- gsub("\\(\\)", "", names(data))

# 13. Group data by subject and activity
grouped_data <- group_by(data, subject, activity)

# 14. Calculate the average of each measurement variable
measurement_names <- names(data)[-(1:2)]

tidy_data <- grouped_data %>%
  summarise(
    across(
      all_of(measurement_names),
      ~ mean(.x, na.rm = TRUE)
    ),
    .groups = "drop"
  )

# 15. Export the final tidy dataset
write.table(
  tidy_data,
  file = "tidy_data.txt",
  row.names = FALSE
)

# 16. Display the dimensions of the final dataset
print(dim(tidy_data))
