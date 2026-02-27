# ---------------------------------------------------------

# Melbourne Bioinformatics Training Program

# This exercise to assess your familiarity with R and git. Please follow
# the instructions on the README page and link to your repo in your application.
# If you do not link to your repo, your application will be automatically denied.

# Leave all code you used in this R script with comments as appropriate.
# Let us know if you have any questions!


# You can use the resources available on our training website for help:
# Intro to R: https://mbite.org/intro-to-r
# Version Control with Git: https://mbite.org/intro-to-git/

# ----------------------------------------------------------

# Load libraries -------------------
# You may use base R or tidyverse for this exercise

# ex. library(tidyverse)
library(tidyverse)

# Load data here ----------------------
# Load each file with a meaningful variable name.
data_normalized = read.csv ("~/training-program-application-2026/data/GSE60450_GeneLevel_Normalized(CPM.and.TMM)_data.csv")
data_filtered =  read.csv ("~/training-program-application-2026/data/GSE60450_filtered_metadata.csv")




# Inspect the data -------------------------
dim(data_normalized)
dim (data_filtered)
head (data_normalized)
head (data_filtered)

# What are the dimensions of each data set? (How many rows/columns in each?)
# Keep the code here for each file.

row_number = nrow(data_normalized)
column_number = ncol(data_normalized)
print(paste("There are", row_number, "rows and", column_number, "columns in this data."))

## Expression data


## Metadata


# Prepare/combine the data for plotting ------------------------
# How can you combine this data into one data.frame?



# Plot the data --------------------------
## Plot the expression by cell type
## Can use boxplot() or geom_boxplot() in ggplot2



## Save the plot
### Show code for saving the plot with ggsave() or a similar function
