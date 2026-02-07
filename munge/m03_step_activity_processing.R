# m03_step_activity_processing.R
# This script processes learner step activity data

library(dplyr)
library(lubridate)

# load raw data
load("cache/raw_data_overview.RData")

# convert time columns
step_activity$first_visited_at <- ymd_hms(step_activity$first_visited_at)
step_activity$last_completed_at <- ymd_hms(step_activity$last_completed_at)

# remove rows with no visit time (just in case)
step_activity <- step_activity %>%
  filter(!is.na(first_visited_at))

# create a flag for completed steps
step_activity <- step_activity %>%
  mutate(
    step_completed = ifelse(!is.na(last_completed_at), 1, 0)
  )

# simple engagement summary per learner
step_summary <- step_activity %>%
  group_by(learner_id) %>%
  summarise(
    total_steps_visited = n(),
    total_steps_completed = sum(step_completed),
    first_activity = min(first_visited_at),
    last_activity = max(first_visited_at),
    .groups = "drop"
  )

# quick check
summary(step_summary$total_steps_visited)
summary(step_summary$total_steps_completed)

# save cleaned step data
save(
  step_activity,
  step_summary,
  file = "cache/step_activity_cleaned.RData"
)
