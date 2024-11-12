# Flu-Shot-Vaccination-Analysis-Using-SQL-and-Tableau

**Project Overview:**

This project aims to analyze flu shot compliance among a general population, focusing on key demographic segments to provide insights into vaccination trends. Using data on patient demographics and immunization records, the project visualizes flu shot uptake across different age groups, races, and geographic locations, and tracks the cumulative count of vaccinations over the course of a year.

The interactive dashboard enables public health analysts, policymakers, and healthcare providers to identify vaccination rates and trends within the population. These insights can help in planning outreach programs, improving vaccine accessibility, and targeting specific demographics with lower compliance rates.

**Dashboard Link:** 
https://public.tableau.com/app/profile/harsh.mehta5638/viz/FluShot_Analysis/Dashboard1

**Objectives:**

1) Total Flu Shot Compliance: Calculate the overall percentage of patients who received flu shots in 2022.
2) Flu Shot Compliance by Demographics:
- Age Group
- Race
- Geographical Location (County)

3) Running Total of Flu Shots Administered: Track the cumulative count of flu shots administered over the course of the year.
4) Patient List: Generate a list of patients showing whether they received a flu shot.

**Data Requirements:**

To qualify as an active patient for flu shot compliance analysis, individuals must:
- Be alive at the time of the data extraction.
- Have had at least one encounter with the hospital or outpatient clinic within the last three years (2020-2022).
- Be at least six months old as of December 31, 2022.

**SQL Code Structure:**

The SQL code used to prepare the data utilizes Common Table Expressions (CTEs) and JOINs to filter and organize patient data efficiently:

1) CTEs are used to structure queries by creating temporary result sets that simplify complex filtering and enhance readability.
2) JOINs are used to link tables such as patients, encounters, and immunizations, ensuring that only active patients and their flu shot records are included.


**SQL Code Highlights:**

1) Active Patients CTE: Identifies eligible patients based on the conditions of recent encounters, age, and survival status.
2) Flu Shot Records CTE: Extracts data on flu shots administered in 2022 using the vaccine code 5302.
3) Main Query with JOINs: Combines demographic data with flu shot records, marking each patient as vaccinated or unvaccinated.

The SQL Tables file is available in this reporsitory as SQL_Tables.sql/SQL_Tables.txt
The SQL code file is available in this repository as SQL_DataExtraction.sql/SQL_DataExtraction.txt.

**Tableau Dashboard Features:**

1) Overall Compliance Metrics: Displays the total compliance rate and the absolute number of flu shots given in 2022.
2) Demographic Analysis:
- Age: Visualizes flu shot compliance by different age groups.
- Race: Shows compliance rates across various racial groups.
- County Map: A geographical representation of flu shot compliance percentages by county.

3) Running Sum of Flu Shots: Tracks the cumulative flu shots administered monthly in 2022, helping visualize seasonal vaccination trends.
4) Patient List: A scrollable list of patients, indicating the count of flu shots received.

**Insights:**

- High Compliance in Older Age Groups: Compliance rates increase significantly among older age demographics.
- Racial Variability in Compliance: Some racial groups show higher compliance rates, which could inform targeted outreach efforts.
- Geographic Differences: Certain counties exhibit lower compliance, signaling potential areas for improved flu shot campaigns.

**Impact:**

- The Flu Shot Analysis 2022 dashboard serves as a powerful tool for healthcare administrators to monitor vaccination trends, optimize outreach strategies, and ultimately increase flu shot coverage in the patient population.
