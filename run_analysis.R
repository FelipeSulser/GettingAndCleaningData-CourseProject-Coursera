library(plyr)

# 1
# Load data

# I am working on my home directory, assuming data is placed there

subject_train <- read.table("train/subject_train.txt")
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")


subject_test <- read.table("test/subject_test.txt")
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")


# Unify the  datasets
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)



# 2
# Now extract only measurements 


features <- read.table("features.txt")

# Find the columns that contain statistical data (std and mean) followed by ()
stdMeanFeats <- grep("-(std|mean)\\(\\)", features[, 2])

# get the subset only
x_data <- x_data[, stdMeanFeats]

# Apply names
names(x_data) <- features[stdMeanFeats, 2]

# 3
# We apply descriptive names to activity data set

activity_labels <- read.table("activity_labels.txt")

# update values with correct activity names
y_data[, 1] <- activity_labels[y_data[, 1], 2]

# Change column name
names(y_data) <- "activity"

# 4
# We set labels with descriptive names

# Change column name
names(subject_data) <- "subject"

# bind all the data in a single data set
all_binded <- cbind(x_data, y_data, subject_data)

# 5

# Create new data using anonymous function that creates the mean of the values (colMeans)
average_values <- ddply(all_binded, .(subject, activity), function(x) colMeans(x[, 1:66]))

#write the data intoa file
write.table(average_values, "average_values.txt",row.name=FALSE)

