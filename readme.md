Repo contains 4 files:

codebook.md 
which explains how data was transformed

run_analysis.r 
which transforms data

cleanData
which is the transformed data

cleanDataMean
which is the mean values of cleanData by subject and by activity

To use run_analysis please download Human Activity Recognition Using Smartphones Data Set, and set your working directory to the folder containing UCI HAR DATASET

This script will search your active directory for the data. The script takes the various data tables and combines them together, names the columns, selects the mean and std columns, then creates a seperate table of mean values. These are saved as cleanData.csv and cleanDataMean.sv respectively.
