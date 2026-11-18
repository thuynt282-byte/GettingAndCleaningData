# CodeBook – Getting and Cleaning Data Project

## 1. Project Description

This project uses the Human Activity Recognition Using Smartphones (UCI HAR) Dataset.

The purpose is to prepare a tidy dataset from smartphone accelerometer and gyroscope measurements collected from 30 volunteers performing six different activities.

## 2. Original Data Source

Dataset: Human Activity Recognition Using Smartphones

Source: UCI Machine Learning Repository

URL: https://archive.ics.uci.edu/dataset/240/human+activity+recognition+using+smartphones

## 3. Identifiers

- `subject`: Identifies the volunteer who performed the activity. Values range from 1 to 30.
- `activity`: Describes the activity performed by the volunteer.

## 4. Activities

The dataset contains six activities:

1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

## 5. Measurement Variables

The dataset contains 66 measurement variables selected from the original 561 features.

These variables represent the mean and standard deviation measurements of body acceleration, gravity acceleration, body acceleration jerk, gyroscope signals, and frequency-domain measurements.

Measurements are expressed in normalized units as described in the original UCI HAR dataset.

The variable names were standardized by replacing hyphens with underscores and removing empty parentheses.

Examples:
- `tBodyAcc_mean_X`
- `tBodyAcc_std_X`
- `tGravityAcc_mean_Y`
- `tBodyGyro_std_Z`

## 6. Data Transformation

The following steps were performed:

1. Combined the training and test datasets.
2. Selected only measurements containing mean and standard deviation features.
3. Merged subject identifiers and activity labels with measurement data.
4. Replaced activity codes with descriptive activity names.
5. Standardized variable names.
6. Grouped observations by subject and activity.
7. Calculated the average of each measurement variable for each subject and activity.

## 7. Final Tidy Dataset

File: `tidy_data.txt`

Dimensions: 180 rows and 68 columns.

- 30 subjects.
- 6 activities.
- 66 averaged measurement variables.
- 2 identification variables: subject and activity.

Each row represents the average of the selected measurements for one subject performing one activity.

## 8. Units and Additional Information

The original dataset contains normalized sensor measurements. The measurement values are dimensionless normalized values, rather than raw acceleration or angular velocity readings in physical units.

The final dataset is suitable for further analysis of human activity recognition.
