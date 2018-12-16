# Getting and Cleaning Data Course Project

The project fulfills part of the course requirements of Getting and Cleaning Data. 

The original data were collected by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, and Luca Oneto from an experiment carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities wearing Samsung Galaxy S II on the waist. 

The cleansed data is generated by programmatically combining training and test sets, extracting relevant variables (mean and standard deviation measurements), adding descriptive variable labels, and computing the average of each variable for each activity and each subject. 

Following files are included in the project:
* `README.md`: markdown file that provides the high-level overview of the project.
* `CodeBook.md`: markdown file that describes variables, data, and all the transformation works performed to clean up the original data.
* `run_analysis.R`: R script file that performs a sequence of operations, transforming original data to a tidy set.
* `tidy.txt`: flat file that is generated from running the script file. 

Original data set can be obtained here: [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones][1]

[1]:	http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones