# m02_enrolment_data_preparation.R
# This script cleans and prepares enrolment data for Cycle 1 analysis

library(dplyr)
library(lubridate)

# load raw data saved from m01
load("cache/raw_data_overview.RData")

# combine enrolment datasets from different course runs
enrolments_all <- bind_rows(
  enrolments_run2,
  enrolments_run4,
  enrolments_run5
)

# convert date columns to datetime format
enrolments_all$enrolled_at <- ymd_hms(enrolments_all$enrolled_at)
enrolments_all$unenrolled_at <- ymd_hms(enrolments_all$unenrolled_at)
enrolments_all$fully_participated_at <- ymd_hms(enrolments_all$fully_participated_at)
enrolments_all$purchased_statement_at <- ymd_hms(enrolments_all$purchased_statement_at)

# keep only learners (remove mentors or staff if any)
enrolments_all <- enrolments_all %>%
  filter(role == "learner")

# replace "Unknown" values with NA for demographics
enrolments_all <- enrolments_all %>%
  mutate(
    gender = ifelse(gender == "Unknown", NA, gender),
    country = ifelse(country == "Unknown", NA, country),
    age_range = ifelse(age_range == "Unknown", NA, age_range),
    highest_education_level = ifelse(highest_education_level == "Unknown", NA, highest_education_level),
    employment_status = ifelse(employment_status == "Unknown", NA, employment_status),
    employment_area = ifelse(employment_area == "Unknown", NA, employment_area)
  )

# create a simple completion indicator
enrolments_all <- enrolments_all %>%
  mutate(
    completed_course = ifelse(!is.na(fully_participated_at), 1, 0)
  )

# quick check
table(enrolments_all$completed_course)

# save cleaned enrolment data
save(
  enrolments_all,
  file = "cache/enrolments_cleaned.RData"
)
