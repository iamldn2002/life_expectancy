#### Preamble ####
# Purpose: Simulate data for life expectancy
# Author: Dingning Li
# Date: 12 April 2024
# Contact: dingning.li@mail.utoronto.ca
# License: MIT
# Pre-requisites: Download tidyverse package
# Any other information needed? No.

set.seed(123) # For reproducibility
n <- 100 # Define the number of observations you want

# Simulating some key variables. Adjust the parameters as necessary to reflect the actual data's distribution.
country <- factor(sample(c("Country A", "Country B", "Country C"), n, replace = TRUE))
year <- sample(2000:2015, n, replace = TRUE)
status <- factor(sample(c("Developed", "Developing"), n, replace = TRUE, prob = c(0.2, 0.8)))
life_expectancy <- rnorm(n, mean = 70, sd = 10) # Assuming a normal distribution
adult_mortality <- rnorm(n, mean = 150, sd = 50)
infant_deaths <- rpois(n, lambda = 5)
alcohol <- runif(n, min = 0, max = 15)
expenditure <- runif(n, min = 0, max = 20)
hepatitis_b <- rbinom(n, size = 100, prob = 0.8)
measles <- rpois(n, lambda = 1000)
bmi <- runif(n, min = 15, max = 40)
under_five_deaths <- rpois(n, lambda = 10)
polio <- rbinom(n, size = 100, prob = 0.9)
total_expenditure <- runif(n, min = 0, max = 20)
diphtheria <- rbinom(n, size = 100, prob = 0.85)
hiv_aids <- runif(n, min = 0, max = 5)
gdp <- rnorm(n, mean = 5000, sd = 1500)
population <- rnorm(n, mean = 1e6, sd = 5e5)
thinness_1_19_years <- runif(n, min = 0, max = 10)
thinness_5_9_years <- runif(n, min = 0, max = 10)
income_composition <- runif(n, min = 0, max = 1)
schooling <- runif(n, min = 0, max = 20)

# Combine into a dataframe
simulated_data <- data.frame(country, year, status, life_expectancy, adult_mortality,
                             infant_deaths, alcohol, expenditure, hepatitis_b, measles,
                             bmi, under_five_deaths, polio, total_expenditure, diphtheria,
                             hiv_aids, gdp, population, thinness_1_19_years, thinness_5_9_years,
                             income_composition, schooling)

# View the first few rows of the dataframe
head(simulated_data)

