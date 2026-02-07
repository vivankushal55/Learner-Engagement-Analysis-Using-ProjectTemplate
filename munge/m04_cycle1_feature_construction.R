# m04_cycle1_feature_construction.R
# This script combines enrolment and activity data for Cycle 1 analysis

library(dplyr)

# load cleaned datasets
load("cache/enrolments_cleaned.RData")
load("cache/step_activity_cleaned.RData")

# merge enrolment data with step activity summary
cycle1_data <- enrolments_all %>%
  left_join(step_summary, by = "learner_id")

# replace NA activity values with 0 (no activity recorded)
cycle1_data <- cycle1_data %>%
  mutate(
    total_steps_visited = ifelse(is.na(total_steps_visited), 0, total_steps_visited),
    total_steps_completed = ifelse(is.na(total_steps_completed), 0, total_steps_completed)
  )

# simple engagement level variable
cycle1_data <- cycle1_data %>%
  mutate(
    engagement_level = case_when(
      total_steps_visited == 0 ~ "No activity",
      total_steps_visited <= 5 ~ "Low",
      total_steps_visited <= 20 ~ "Medium",
      TRUE ~ "High"
    )
  )

# quick checks
table(cycle1_data$engagement_level)
table(cycle1_data$completed_course)

# save Cycle 1 dataset
save(
  cycle1_data,
  file = "cache/cycle1_analysis_data.RData"
)
