# Wk4-Project
# run_analysis.R (pseudo code)
  # read the several readme and experiment files to understand the data layout and collection mechanism
  # Read test/train data as read.table(), this gives a table with 561 variables (features) (~10k rows)
  # Also read the associated labels num data (y_test.txt) from test/train folders
  # None of these tables have column names
  # Eadch observation is tied to an activity label(1-6) and subject (1-30). However, these are separate files
  # read activity labels (1-6), subject (1-30) and features (561) through read.table
  # merge test/train data (rbind), cbind the columns with activity labels and subject
  # name colums in the merged dataset to match features
  # select data to extract mean() and std() columns only
  # create new data set - mean of variables grouped by Subject and Activity
  
# 
