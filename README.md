## Readme

To perform the analysis run the *run_analysis.R* script. As a result *tidy_data_set_grouped* data set will be created.


Flow of the operations performed in run.analysis.R (more details included in comments in the file):

1. download data

2. read both test and train data into R into separate variables using ReadLines function

3. use *my_processing()* function to split the strings representing records and get rid of all but the actual data - the output is in matrix format

4. convert the strings to numerical values where needed

5. merge test and train data with *bind.rows()* and store resulting data sets in data frames

6. for *data_labels* and *subject_data* merge by *c()* and convert to data.frames remembering about *stringsToFactors=FALSE*

7. to introduce descriptive names for activities match data_labels with activity labels

8. to ensure descriptive names for variables use labels from features set as names of variables in merged data set

9. use *setNames()* to ensure that V1...V128 variables in body/acc/gyro files are prefixed with name of the set

10. use *grep()* and *select()* to ensure that only *mean()* and *std()* measurements are included

11. create base tidy data set using *bind.cols()*

12. use *group_by()* to group tidy data by activity and subject

13. create final *tidy_data_set_grouped* data set by running *summarize_each()* on grouped data set



