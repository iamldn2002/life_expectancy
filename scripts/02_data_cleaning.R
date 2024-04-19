#### Preamble ####
# Purpose: select required data and delete unnecessary information from data set.
# Author: Dingning Li
# Date: 12 April 2024
# Contact: dingning.li@mail.utoronto.ca
# License: MIT
# Pre-requisites: Download tidyverse package
# Any other information needed? No.

# Load necessary library
library(dplyr)
library(stringr)


# Rename the columns to snake_case format
original_data <- life_expectancy_data %>%
  rename_with(~str_to_lower(.) %>% 
                str_replace_all(" ", "_") %>%
                str_trim(), .cols = everything())
original_data <- original_data %>%
  rename(hiv_aids = "hiv/aids")

# Print the new column names to check
print(names(original_data))

write.csv(original_data, "/cloud/project/original_data.csv", row.names = FALSE)

# Clean the data

cleaned_data <- original_data %>%
  select(country, year, status, life_expectancy, adult_mortality, alcohol,hiv_aids, status, schooling)

write_csv(cleaned_data, "/cloud/project/cleaned_data.csv")




# Check for missing values in each column
missing_values <- sapply(cleaned_data, function(x) sum(is.na(x)))
print(missing_values)

# Impute missing values with the mean of the column
cleaned_data <- cleaned_data %>%
  mutate(across(where(is.numeric), ~ifelse(is.na(.), mean(., na.rm = TRUE), .)))

# Verify that missing values have been replaced
missing_values_after <- sapply(cleaned_data, function(x) sum(is.na(x)))
print(missing_values_after)



write.csv(cleaned_data, "/cloud/project/cleaned_data.csv", row.names = FALSE)
