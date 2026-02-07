
## 📌 Overall Project Description

This project is a **statistics and data analysis project** developed for the module **MAS8600**, using the **ProjectTemplate** framework in R.
The aim of the project is to analyse **learner engagement and course completion behaviour** in an online learning environment using a **systematic, reproducible workflow**.

The analysis follows the **CRISP-DM framework**, applied iteratively across two cycles:

* **Cycle 1** focuses on exploratory analysis to understand enrolment, engagement, and completion patterns.
* **Cycle 2** refines features and learner group definitions to enable deeper comparative analysis.

The project emphasises:

* Reproducible research practices
* Structured data preprocessing
* Exploratory and comparative statistical analysis
* Clear separation of data, preprocessing, analysis, and outputs

---

## ✅ README.md (Complete, Ready to Use)

```markdown
# Vivan_MAS8600  
**Learner Engagement Analysis Using ProjectTemplate**

## 📌 Project Overview
This repository contains a statistics project developed for **MAS8600**, analysing learner engagement and course completion behaviour in an online course. The project is implemented in **R** using the **ProjectTemplate** framework to ensure a clean, modular, and reproducible workflow.

The analysis follows the **CRISP-DM methodology**, applied across two iterative cycles to progressively refine insights into learner behaviour.

---

## 📊 Analytical Focus
The project investigates:
- Learner enrolment characteristics and demographics
- Levels of engagement with course content
- Relationships between engagement and course completion
- Differences between active and inactive learners
- The role of engagement intensity in course progression

---

## 🔁 Methodological Framework
- **CRISP-DM Cycle 1:**  
  Exploratory data analysis of enrolment, engagement, and completion patterns.
- **CRISP-DM Cycle 2:**  
  Feature refinement, learner grouping, and comparative analysis between engagement groups.

---

## 🗂 Project Structure (ProjectTemplate)

This project follows the standard **ProjectTemplate** directory structure:

```

.
├── data/        # Raw input datasets
├── munge/       # Data cleaning and preprocessing scripts
├── cache/       # Cached intermediate datasets
├── src/         # Analysis scripts
├── graphs/      # Generated plots and figures
├── reports/     # Written reports / outputs
├── config/      # Project configuration files
└── README.md

````

---

## ▶️ How to Run the Project

1. Set the working directory to the project root:
```r
setwd("path/to/Vivan_MAS8600")
````

2. Load and initialise the project:

```r
library(ProjectTemplate)
load.project()
```

This will automatically:

* Load required R packages
* Read datasets from `data/` or `cache/`
* Run preprocessing scripts in `munge/`

3. Run analysis scripts from the `src/` directory as needed.

---

## 🎓 Academic Context

* **Module:** MAS8600
* **Focus:** Statistical data analysis & reproducible research
* **Assessment Type:** Individual Coursework

---

## 👤 Author

**Vivan Kushal Heneger**

````

---

## 🧱 What `ProjectTemplate` Usually Creates

When you run:

```r
install.packages("ProjectTemplate")
library(ProjectTemplate)
create.project("Vivan_MAS8600")
````

ProjectTemplate automatically creates a **standardised project structure**, including:

### 📁 Key Directories

* **`data/`** – raw datasets (never modified directly)
* **`munge/`** – data cleaning and preprocessing scripts
* **`cache/`** – saved intermediate datasets for faster loading
* **`src/`** – analysis and modelling scripts
* **`graphs/`** – plots and visual outputs
* **`reports/`** – reports, summaries, or exports
* **`config/`** – configuration files (e.g. package loading)

### ⚙️ What `load.project()` Does

When called, it automatically:

* Loads required packages
* Reads datasets
* Runs preprocessing scripts in order
* Makes cleaned data available for analysis

This enforces **reproducibility, clarity, and separation of concerns**, which is ideal for statistical coursework and research projects.

---
