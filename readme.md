Read Me

There is 1 script which will combine and clean the Samsung data. The script is called run_analysis.r

This script will search your active directory for the data. Be sure the data is saved in your current directory in the file UCI HAR Dataset. The script takes the various data tables and combines them together, names the columns, selects the mean and std columns, then creates a seperate table of mean values. These are saved as cleanData.csv and cleanDataMean.sv respectively.
