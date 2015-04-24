Getting and Cleaning Data - Course Project
----------------------------------------------
This repository hosts the R code and documentation files for the Data Science's track course "Getting and Cleaning data", available in coursera.

The dataset being used is download from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


Files
----------------------------------------------
The code takes for granted all the data is present in the same folder, un-compressed and without names altered. But the code includes a first part that let download and unzip the data if the users want it.

CodeBook.md describes the variables, the data type, and the transformations that was performed to make a tidy dataframe.

run_analysis.R contains all the code to perform the analyses described in the 5 steps. They can be launched in RStudio or Rconsole.

The output of the 5th step is called averages.txt, and uploaded in the course project's form.