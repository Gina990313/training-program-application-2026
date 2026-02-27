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
"rename columns for consistency"
data_normalized <- data_normalized %>% dplyr::rename(gene_id = X)
data_filtered <- data_filtered %>%
  rename (
    sample_id = X, 
    cell_type = immunophenotype, 
    stage = developmental.stage
  )
"combine into one data frame, join by sample_id in two data, 
one row per (gene, sample)"
data_normalized_long <- data_normalized %>%
  pivot_longer(
    cols = -c(gene_id, gene_symbol),   # all sample columns become rows
    names_to  = "sample_id",
    values_to = "expression"
  )

combined_df <- data_normalized_long %>% 
  left_join(data_filtered, by = "sample_id")
head(combined_df)
dim (combined_df)
 "combined_df has gene_id, gene_symbol, sample_id, expression,
characteristics, cell_tyep, stage"

# Plot the data --------------------------
## Plot the expression by cell type
## Can use boxplot() or geom_boxplot() in ggplot2
"choose genes to plot"
gene_of_interest <- c("Scml2","H19")
df_plot <- combined_df %>%
  filter (gene_symbol %in% gene_of_interest) %>%
  drop_na(cell_type)

plot_gene_expression <- ggplot (df_plot, aes (x = cell_type, y= expression, fill = gene_symbol)) +
  geom_boxplot(position = position_dodge(width = 0.8), outlier.shape = NA) +
  facet_wrap(~ stage) +
  labs(
    title = "Expression by cell type",
    x = "Cell type",
    y = "Expression (CPM/TMM)",
    fill = "Gene"
  ) +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 30, hjust = 1))


print(plot_gene_expression)

## Save the plot
### Show code for saving the plot with ggsave() or a similar function
ggsave(
  filename = file.path("results", "two_genes_expression.png"),
  plot = plot_gene_expression,
  width = 9, height = 5, dpi = 300
)
