# m01_data_import_overview.R
#
# Purpose:
# - Import all raw datasets
# - Perform initial structural inspection
#
# CRISP-DM Phase:
# - Data Understanding (Cycle 1)
# -----------------------------
# Load required libraries
# -----------------------------
library(readr)
library(dplyr)

# -----------------------------
# Define data path (relative)
# -----------------------------
data_path <- "data"

# -----------------------------
# Load datasets
# -----------------------------

enrolments_run2 <- read_csv(
  file.path(data_path, "cyber-security-2_enrolments.csv"),
  show_col_types = FALSE
)

enrolments_run4 <- read_csv(
  file.path(data_path, "cyber-security-4_enrolments.csv"),
  show_col_types = FALSE
)

enrolments_run5 <- read_csv(
  file.path(data_path, "cyber-security-5_enrolments.csv"),
  show_col_types = FALSE
)

leaving_survey <- read_csv(
  file.path(data_path, "cyber-security-6_leaving-survey-responses.csv"),
  show_col_types = FALSE
)

step_activity <- read_csv(
  file.path(data_path, "cyber-security-7_step-activity.csv"),
  show_col_types = FALSE
)

# -----------------------------
# Initial data overview
# -----------------------------

# Dataset dimensions
dataset_summary <- tibble(
  dataset = c(
    "enrolments_run2",
    "enrolments_run4",
    "enrolments_run5",
    "leaving_survey",
    "step_activity"
  ),
  rows = c(
    nrow(enrolments_run2),
    nrow(enrolments_run4),
    nrow(enrolments_run5),
    nrow(leaving_survey),
    nrow(step_activity)
  ),
  columns = c(
    ncol(enrolments_run2),
    ncol(enrolments_run4),
    ncol(enrolments_run5),
    ncol(leaving_survey),
    ncol(step_activity)
  )
)

print(dataset_summary)

# -----------------------------
# Missing value overview
# -----------------------------

missing_summary <- list(
  enrolments_run2 = colSums(is.na(enrolments_run2)),
  enrolments_run4 = colSums(is.na(enrolments_run4)),
  enrolments_run5 = colSums(is.na(enrolments_run5)),
  leaving_survey  = colSums(is.na(leaving_survey)),
  step_activity   = colSums(is.na(step_activity))
)

# Print missing value summaries
lapply(missing_summary, head)

# -----------------------------
# Structure inspection
# -----------------------------

str(enrolments_run2)
str(leaving_survey)
str(step_activity)

# -----------------------------
# Save raw objects for reference
# (optional but professional)
# -----------------------------

save(
  enrolments_run2,
  enrolments_run4,
  enrolments_run5,
  leaving_survey,
  step_activity,
  file = "cache/raw_data_overview.RData"
)
