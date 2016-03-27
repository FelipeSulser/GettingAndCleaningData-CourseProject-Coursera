# Code Book

This repository focuses on the script `run_analysis.R` that performs some actions regarding the dataset (explained in the Coursera course)

* In the beginning we merge train and data set into a single table, all the data is merged using the `rbind()` function. 
* Then, we choose only the columns with the mean and standard deviation measures. After extracting these columns, we change their names (of the column) based on the info of the file `features.txt`.
* In the activity data, we take the activity names and IDs from `activity_labels.txt` and they are substituted in the dataset.
* Regarding the whole dataset, we correct labels with bad names.
* Finally, we generate a new dataset with all the average measures for each subject and activity type. The result is a file called `average_values.txt`, and uploaded to this repository.

# Data and Variables

* `x_train`, `y_train`, `x_test`, `y_test`, `subject_train` and `subject_test` contain the data from the downloaded files.
* `x_data`, `y_data` and `subject_data` merge the previous datasets to further analysis.
* `features` contains the correct labels for the `x_data` dataset, applied to: `stdMeanFeats`, a numeric vector used to extract the desired data.
* We do the same with `activities` variable.
* `all_data` is the result of a union of the following datasets: `x_data`, `y_data` and `subject_data`
* Finally, `average_values` contains the table that is asked for in this project (I also include average_values.txt in the repository).  
