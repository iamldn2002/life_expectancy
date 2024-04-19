#### Preamble ####
# Purpose: Test data
# Author: Dingning Li
# Date: 12 April 2024
# Contact: dingning.li@mail.utoronto.ca
# License: MIT
# Pre-requisites: none
# Any other information needed? No.

# Test that all entries are from the year 2013
test_year <- function(data) {
  all(cleaned_data$year == 2013)
}
print(test_year(data))

# Test that BMI is within a reasonable range
test_bmi_range <- function(data) {
  all(cleaned_data$bmi >= 0 & cleaned_data$bmi <= 100)
}
print(test_bmi_range(data))

# Check data types of columns
test_data_types <- function(data) {
  sapply(cleaned_data, class)
}
print(test_data_types(data))

## Test for missing values in specific columns
test_missing_values <- function(data) {
  sapply(cleaned_data[c("life_expectancy", "adult_mortality", "alcohol", "measles", "bmi", "hiv_aids", "schooling")], function(x) sum(is.na(x)))
}
print(test_missing_values(cleaned_data))

