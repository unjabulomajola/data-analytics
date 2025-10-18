# Jobs Salary Analysis – Exploratory Data Analysis (EDA)

## Introduction

This analysis builds on the initial salary dashboard, diving deeper into the dataset to uncover role specific trends, skill demand, and salary benchmarks across industries and regions.  
The purpose was to move beyond descriptive reporting and begin uncovering meaningful correlations between job roles, skills, and compensation.

The dataset comes from [here](https://www.kaggle.com/datasets/lukebarousse/data-analyst-job-postings-google-search/data) and spans **January 2023 to June 2025**, containing real-world postings from platforms such as LinkedIn, Indeed, Glassdoor, etc. It contains detailed information on job titles, average salaries, company locations, and the essential skills most in demand across data roles.

---   
## Analytical Focus

The EDA aimed to uncover meaningful insights into the data job market and answer key analytical questions such as:

-  What percentage of demand exists for different data job titles?  
-  How do salaries compare across roles like Data Analyst, Data Scientist, and Data Engineer?  
-  What are the top skills most requested by employers in the data field?  
-  How have job postings and salary trends evolved over time?

By visualizing and interpreting these findings, this analysis provides both job seekers and organizations with **data-driven clarity** on compensation trends, skill demand, and career opportunities within the data industry. Pivot tables and chart groupings were used to identify cross-dimensional insights.

---

## Project Insights

### 1️. Dataset Snapshot
![Dataset Snapshot](assets/1_data.png)

- The dataset provides a broad overview of **data-related roles globally**, including job titles, salaries, and associated skills.  
- It serves as the foundation for identifying compensation trends and skill requirements across different job categories.


---

### 2️. Average Salary by Country and Role
![Average Salary by Country and Role](assets/2_avg_country_salary.png)

- By grouping average salaries by **country** and **job role**, clear distinctions emerged between markets. The **United States** and **United Kingdom** report higher average salaries, especially for **Data Scientists** and **Data Engineers**, while emerging markets like **South Africa** show growing but moderate compensation levels.

- Employers can use this information to benchmark salary competitiveness, while job seekers can identify high-paying regions or roles aligned with their skills.
- It also highlights how advanced economies tend to compensate more for technical and engineering-oriented data roles.

---

### 3️. Top Skills for Data Roles
![Top Skills for Data Roles](assets/3_top_data_skills.png)

- The most frequently requested skills include **SQL**, **Python**, and **AWS**, followed by **Excel**, **Power BI**, and **Tableau**.
- Cloud technologies and programming languages dominate modern data job requirements.

- These findings indicate that candidates proficient in **data querying (SQL)** and **data modeling (Python)** have the highest employability.
- For companies, it signals a continued shift toward **data infrastructure and cloud-first** skillsets when hiring.

---

### 4️. Job Demand by Role
![Job Demand](assets/4_roles_in_demand.gif)

- By counting how many times each job role appears in the dataset, **Data Analyst** emerged as the most in-demand role, followed by **Data Engineer** and **Data Scientist**.

 - High job posting frequency for Data Analysts suggests that businesses continue to rely heavily on roles that bridge **data insights with decision-making**.
 - This also signals a healthy entry point for professionals seeking to transition into data careers.

---

### 5️. Top Paying Roles
![Top Paying Roles](assets/5_top_paying_roles.png)

- After cleaning and reformatting the data for clarity, it was found that **Senior Data Scientist**, **Senior Data Engineer**, and **Machine Learning Engineer** consistently rank among the highest-paying positions.

- These findings reinforce that specialization and advanced technical skills command higher salaries.
- Recruiters can use this to define compensation bands, while candidates can align their learning paths with the roles offering the best ROI on skill development.

---

### 6️. Job Trends Over Time
![Job Trends Over Time](assets/6_job_trends.png)

- A timeline analysis of job postings revealed cyclical hiring trends, with notable increases in **Q1** and **Q3**.
- This aligns with typical business planning and project initiation cycles.

- Understanding hiring trends can help both job seekers and hiring managers **plan their recruitment strategies**.
- Candidates can time their job search for peak demand periods, while employers can allocate resources effectively.

---

### Key Takeaways:
- **SQL** and **Python** remain the most essential and universal skills.  
- **Data Analysts** dominate demand, but **Data Engineers** and **Scientists** lead in salary.  
- **Cloud computing skills (AWS, Azure)** are becoming crucial differentiators.  
- Job trends follow predictable cycles tied to quarterly business planning.

  **Recommendations:**
- **Job Seekers:** Focus on strengthening high-demand, high-value skills like Python, SQL, and cloud tools to improve job prospects and earning potential.  
- **Recruiters & HR Teams:** Use salary benchmarks and skill trends from this analysis to attract qualified candidates and align compensation with market expectations.

##  Conclusion

- This analysis revealed clear, data driven patterns within the data job market and served as a pivotal step in narrowing down the most strategic career paths in the field.
- Among all roles analyzed, Data Analyst role emerged as the most in-demand, accounting for the majority of postings between 2023 and mid-2025.
- It also presented the most balanced combination of salary growth potential, remote work flexibility, and broad skill applicability across industries.  

Based on these insights, I chose to focus the next phase of this project on the Data Analyst position specifically, targeting fully remote roles with salaries above $100K. This led to the SQL Advanced Market Analysis, where I explored in depth which skills, tools, and combinations are most associated with high-paying analyst opportunities and long-term career value.

