# Alzheimer’s and Healthy Aging (BRFSS)
**Contributors:** Lily Gates, Nainika Kadabha, Theodore Rose, Andre Soriano, Anna Wendt


## Project Overview

This project explores the **Alzheimer’s Disease and Healthy Aging** dataset derived from the CDC’s **Behavioral Risk Factor Surveillance System (BRFSS)**. The goal of the project is to design and implement a database that supports analysis of demographic and lifestyle factors associated with cognitive decline and Alzheimer’s-related outcomes, with an emphasis on public health relevance and data usability.

Using aggregated BRFSS survey results, our database enables users to identify patterns, disparities, and correlations across regions, demographic groups, and health-related behaviors that may inform prevention strategies, policy decisions, and future research.


## Organization Background: BRFSS

The **Behavioral Risk Factor Surveillance System (BRFSS)** is the largest continuously conducted health survey system in the world. Established in 1984 with 15 states, it now collects data from all 50 U.S. states, the District of Columbia, and three U.S. territories. BRFSS conducts over 400,000 adult interviews annually, collecting information on health-related risk behaviors, chronic health conditions, and use of preventive services.

More information: https://www.cdc.gov/brfss/


## Dataset Description

This project uses the **CDC Alzheimer’s Disease and Healthy Aging** dataset, which contains **aggregated percentages** corresponding to BRFSS survey questions.

Each row represents the response to a specific survey question for:
- A given **year**
- A specific **location** (region or overall U.S.)
- Up to three **stratification levels** (e.g., age group, gender, race/ethnicity)

### Example

- **General Question:** What percentage of adults have a body mass index (BMI) of 30 or more?
- **Stratified Question:** What percentage of Hispanic females aged 50–64 are obese (BMI ≥ 30)?

To answer stratified questions, users filter rows by topic, stratification category, and stratification value.

**Dataset Size:**
- 250,000+ rows  
- 38 columns  

**Key Fields Include:**
- Year  
- Location / Region  
- Topic and Question Category  
- Question Text  
- Data Value (percentage)  
- Demographic Groupings  


## Data Scope and Focus

Survey questions are grouped into seven major categories:

1. Cognitive decline  
2. Mental health  
3. Physical health  
4. Overall health  
5. Smoking and alcohol usage  
6. Screening and vaccines  
7. Caregiving information  

The database emphasizes **demographic and lifestyle factors** (e.g., age, race, sleep, physical activity, chronic conditions, healthcare access) that may be associated with cognitive decline and Alzheimer’s risk.


## Stakeholders

Potential users of this database include:

- Alzheimer’s advocacy and support organizations  
- Federal, state, and local public health agencies  
- Public health analysts and policymakers  
- Healthcare professionals  
- Health researchers and medical scientists  
- Health-conscious individuals  


## Research Questions

Example questions this database can help answer include:

- Which regions show higher prevalence of Alzheimer’s-related risk indicators?
- Which demographic groups exhibit higher rates of cognitive decline or related conditions?
- How do lifestyle factors (e.g., sleep, smoking, physical activity) vary across populations?
- Which health indicators are most prevalent across regions and demographics?


## Data Processing & Design Decisions

Several transformations and reductions were applied to improve clarity and usability:

- **Locations:** Reduced from states and territories to U.S. regions and overall U.S.  
- **Years:** Focused on 2021 due to consistency across regions  
- **Demographics:** Retained full demographic diversity while simplifying age groups to overall adults  
- **Removed Attributes:** Row IDs, redundant identifiers, unclear or unused metadata fields  
- **Excluded Questions:** Removed questions not consistently surveyed across selected locations  

> **Note:** Demographic data is reported independently (e.g., race *or* gender), not intersectionally.


## Database Features

### Views

1. **Question–Demographic View**  
   Displays survey questions, regions, categories, and associated demographics to help users explore available data.

2. **National Summary Statistics View**  
   Shows minimum, maximum, and average values for each question across the U.S. in 2021.

3. **High-Risk Demographic View**  
   Identifies demographic groups where negative health indicators exceed 50% prevalence.

### Stored Procedures

- **Race by Topic:** Compares average values, confidence intervals, and counts by race for a selected topic.
- **Topic by Region:** Returns topics and average values for a selected region in descending order.

### Functions

- **Smokers Over 50:** Returns the percentage of respondents reporting current smoking behavior above a threshold.
- **Second Highest Risk Topic:** Identifies the second highest reported topic for a given region and race.



## Future Improvements

With additional time and resources, future iterations could include:

- Expanded mental health conditions (e.g., anxiety, PTSD, bipolar disorder)
- More detailed substance use patterns
- Medication adherence and prescription data
- Additional chronic conditions
- Longer time spans and finer geographic resolution
- Additional views and advanced analytical functions


## Team Contributions

- **Lily Gates (Project Lead):** Excel preprocessing, views, task coordination  
- **Theodore Rose:** ERD design, procedures, and functions  
- **Nainika Kadabha:** Database export, views, and functions support  
- **Anna Wendt:** Written project documentation  
- **Andre Soriano:** Database support and collaboration  

Tasks were assigned based on individual strengths, and the team worked collaboratively throughout all project phases.


## Related Resources

- CDC BRFSS Overview  
- CDC Alzheimer’s & Healthy Aging Portal  
- CDC Data Dictionary  
- Original dataset (via Canvas for course use)



## Citation
If you use this repository or its data, please cite as:

Lily X. Gates. (2025). _Alzheimer’s and healthy aging (BRFSS)_ [Data and code]. GitHub. https://github.com/lilyxgates/alzheimers_and_healthy_aging_brfss

## Acknowledgements
_College of Information, University of Maryland, College Park_

INST 327: Database Design and Modeling, Mr. Iskander Lou (Fall 2024)