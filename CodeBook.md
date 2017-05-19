The run_analysis.R script has the following datasets:

**measures_train** - train dataset, containing information of all 561 measures
**activities_train** - activity labels vector which corresponds to collected measures in measures_train dataset. 
**subj_train** - subject vector with 30 subject ids  which corresponds to collected measures in measures_train dataset

**measures_test** - test dataset, containing information of all 561 measures
**activities_test** -  activity labels vector which corresponds to collected measures in measures_test dataset. 
**subj_test** - subject vector with 30 subject ids  which corresponds to collected measures in measures_test dataset

**measure_cnames** - vector with 561 measure names for data stored in measures_test and measures_train datasets
**activiti_labs** - activity lables dataset with id/name mapping

**measures_full** - merged dataset containing data from both measures_test and measures_train datasets
**activities_full** - merged dataset containing data from both activities_test and activities_train datasets
**subj_full** - merged dataset containing data from both subj_test and subj_train datasets

**ds_full** -  merged dataset containing columns and data from measures_full, activities_full and subj_full datasets

**ds_mean_std** - subset of ds_full dataset, containing only measures for mean and std values

**ds_avg** - grouped dataset based on ds_mean_std, containing average of each measure for each activity (act_name) and each subject (subj_id)
