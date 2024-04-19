#### Preamble ####
# Purpose: Models for predicting life expectancy in the world
# Author: Dingning Li
# Date: 12 April 2024
# Contact: dingning.li@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None

#Build and summarize simple linear model: life expectancy and status
sl_model <- lm(life_expectancy ~ status, data = cleaned_data)
saveRDS(
  sl_model,
  file = "simple_linear_model.rds"
)

# Build multiple linear model: life expectancy with multiple variables

cleaned_data$status <- relevel(cleaned_data$status, ref = "Developed")

# Now convert the factor to numeric, where 'Developed' will be 0 and 'Developing' will be 1
cleaned_data$status_numeric <- as.numeric(cleaned_data$status) - 1

ml_model <-
  stan_glm(
    formula = life_expectancy ~ adult_mortality + alcohol+ hiv_aids + schooling + status,
    data = cleaned_data,
    family = gaussian(),
    prior = normal(location = 0, scale = 2.5),
    prior_intercept = normal(location = 0, scale = 2.5),
    prior_aux = exponential(rate = 1),
    seed = 853
  )

saveRDS(
  ml_model,
  file = "multiple_linear_model.rds"
)
