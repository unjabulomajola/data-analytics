# Introduction
This project analyses the real-world Data job market using SQL. The objective is to find which skills pay the most, which are most in demand, and which are optimal to learn for a Fully Remote role for a Data Analyst targeting >$100k annual salary. The analysis runs on actual job postings curated by **Luke Barousse** from platforms such as LinkedIn, Glassdoor, Indeed and can be found [here](https://www.kaggle.com/datasets/lukebarousse/data-analyst-job-postings-google-search/data). My aim is providing an evidence-based view of pay and demand. In this analysis, we focus primarily on uncovering insights for individuals interested in becoming a Data Analyst who works remotely and potentially wants to earn a salary above $100k per year.

### The questions I wanted to answer through my SQL queries were:

1. What are the top-paying Data Analyst jobs?
2. What skills are required for these top-paying Data Analyst jobs?
3. What skills are most in demand for Data Analysts?
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learn?

# Tools I Used
For my deep dive into the data analyst job market, I harnessed the power of several key tools:

- **SQL:** The backbone of my analysis, allowing me to query the database and unearth critical insights.
- **PostgreSQL:** The chosen database management system, ideal for handling the job posting data.
- **Visual Studio Code:** My go-to for database management and executing SQL queries.
- **Git & GitHub:** Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.
- **Chatgpt**: For plotting basic visuals & fine tuning 

# The Analysis
Each query for this project aimed at investigating specific aspects of the data analyst job market. Here’s how I approached each question:

---

### 1. Top Paying Data Analyst Jobs
To identify the highest-paying roles, I filtered data analyst positions by average yearly salary and location, focusing on remote jobs. This query highlights the high paying opportunities in the field.

```sql
SELECT
	job_title_short,
	job_location,
	salary_year_avg,
	company_dim.name AS company_name
FROM
	job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
	job_title_short = 'Data Analyst'
	AND salary_year_avg IS NOT NULL
	AND job_location = 'Anywhere'
ORDER BY 
	salary_year_avg DESC 
LIMIT 10
```

Here's the breakdown of the top data analyst jobs 💼:
| Company     | Job Title    | Location | Salary ($/year) |
| ----------- | ------------ | -------- | --------------: |
| Mantys      | Data Analyst | Anywhere |           $650k |
| Netflix     | Data Analyst | Anywhere |           $445k |
| Netflix     | Data Analyst | Anywhere |           $445k |
| Netflix     | Data Analyst | Anywhere |           $445k |
| Siemens     | Data Analyst | Anywhere |           $385k |
| Meta        | Data Analyst | Anywhere |           $336k |
| Confluent   | Data Analyst | Anywhere |           $297k |
| Edge & Node | Data Analyst | Anywhere |           $264k |
| Edge & Node | Data Analyst | Anywhere |           $264k |
| AT&T        | Data Analyst | Anywhere |           $256k |


![Top Paying Roles](assets/1_top_paying_jobs.png)  
*Bar graph visualizing the salary for the top 10 salaries for data analysts; ChatGPT generated this graph from my SQL query results*

**Business Insights:**  
- **Wide Salary Range:** he top 10 remote data analyst roles span from $256k to $650k, showing extreme salary variance, likely driven by specialized senior or hybrid roles (e.g., data science–analytics crossover).
- **Tech and Media Lead:** Companies like Netflix, Meta, and Mantys dominate top salary listings, confirming that media streaming and big-tech sectors offer premium compensation..
- **Fully Remote Viability:** Every listing is “Anywhere”, reaffirming that six-figure remote data roles are widely available and globally competitive.
---
### 2. Skills for Top Paying Jobs    
To understand what skills are required for the top-paying jobs, I joined the job postings with the skills data, providing insights into what employers value for high-compensation roles.

```sql
WITH top_paying_jobs AS (
    SELECT	
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND 
        job_location = 'Anywhere' AND 
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)
SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;
```
Here's the breakdown of the most demanded skills for the top 10 highest paying data analyst jobs 🧩:
| Company     | Job Title    | Key Skills                     |
| ----------- | ------------ | ------------------------------ |
| Mantys      | Data Analyst | SQL, Python, Snowflake, Looker |
| Netflix     | Data Analyst | SQL, Python, R, Tableau, Excel |
| Siemens     | Data Analyst | SQL, Power BI, Python          |
| Meta        | Data Analyst | Python, R, SQL, Excel, Tableau |
| Confluent   | Data Analyst | SQL, Snowflake, Power BI       |
| Edge & Node | Data Analyst | Python, SQL, Tableau           |
| AT&T        | Data Analyst | SQL, Power BI, Excel           |
| HubSpot     | Data Analyst | SQL, Python, Excel             |
| Salesforce  | Data Analyst | SQL, Python, Tableau           |
| Airbnb      | Data Analyst | SQL, Python, BigQuery          |

![Top Paying Roles](assets/2_top_paying_job_skills.png)  
*Bar graph visualizing the scommon skills of the top 10 salaries for data analysts; ChatGPT generated this graph from my SQL query results*

**Business Insights:**     
- **SQL** dominates (appears in 10/10 listings), confirming it as the most critical skill for high-paying roles.  
- **Python** follows closely, reinforcing its dual use in data manipulation and machine learning.  
- **Visualization tools** like **Tableau** and **Power BI** are consistently required, highlighting the importance of communication through visuals.

---

### 3. In-Demand Skills for Data Analysts

This query helped identify the skills most frequently requested in job postings, directing focus to areas with high demand.
```sql
SELECT
  skills_dim.skills,
  COUNT(skills_job_dim.job_id) AS demand_count
FROM
  job_postings_fact
  INNER JOIN
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
  INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
  job_postings_fact.job_title_short = 'Data Analyst'
	 --AND job_work_from_home = True -- optional to filter for remote jobs
GROUP BY
  skills_dim.skills
ORDER BY
  demand_count DESC
LIMIT 5;
```

Here's the breakdown of the most demanded skills for data analysts ⚙️:
| Skill    | Demand Count |
| -------- | -----------: |
| SQL      |      180,369 |
| Excel    |      131,822 |
| Python   |      116,082 |
| Tableau  |       90,588 |
| Power BI |       84,353 |


**Business Insights:**  
- **SQL** & **Excel** remain the backbone of analytical work.  
- **Python** is now core for automation and advanced analytics.  
- **Tableau** and **Power BI** continue to dominate visualization demand, reflecting an increasing focus on data storytelling.

---

### 4. Skills Based on Salary
Exploring the average salaries associated with different skills revealed which skills are the highest paying.
```sql
SELECT
  skills_dim.skills AS skill, 
  ROUND(AVG(job_postings_fact.salary_year_avg),2) AS avg_salary
FROM
  job_postings_fact
	INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
	INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
  job_postings_fact.job_title_short = 'Data Analyst' 
  AND job_postings_fact.salary_year_avg IS NOT NULL 
GROUP BY
  skills_dim.skills 
ORDER BY
  avg_salary DESC; 
```

Here's a breakdown of the results for top paying skills for Data Analysts 💵:
| Skill        | Average Salary ($/year) |
| :----------- | ----------------------: |
| FastAPI      |                 212,500 |
| SVN          |                 185,000 |
| Blazor       |                 161,000 |
| APL          |                 155,000 |
| MXNet        |                 149,000 |
| GraphQL      |                 137,699 |
| TypeScript   |                 135,520 |
| ASP.NET Core |                 130,500 |
| DynamoDB     |                 129,970 |
| Solidity     |                 128,313 |


**Business Insights:**  
- **API & Development Frameworks Dominate:** FastAPI, Blazor, and ASP.NET Core top the list, suggesting that full-stack data professionals who can deploy analytical applications command higher salaries.  
- **High-Pay Niche Tools:** APL and MXNet (a deep-learning library) suggest premium pay for rare, specialized technical expertise.
- **Hybrid Skill Advantage:** Analysts with coding backgrounds, especially in backend and cloud systems are rewarded beyond traditional analytics pay bands
---

### 5. Most Optimal Skills to Learn
Combining insights from demand and salary data, this query aimed to pinpoint skills that are both in high demand and have high salaries, offering a strategic focus for skill development.
```sql
WITH skills_demand AS (
  SELECT
    skills_dim.skill_id,
		skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count
  FROM
    job_postings_fact
	  INNER JOIN
	    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
	  INNER JOIN
	    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
  WHERE
    job_postings_fact.job_title_short = 'Data Analyst'
		AND job_postings_fact.salary_year_avg IS NOT NULL
    AND job_postings_fact.job_work_from_home = True
  GROUP BY
    skills_dim.skill_id
),
average_salary AS (
  SELECT
    skills_job_dim.skill_id,
    AVG(job_postings_fact.salary_year_avg) AS avg_salary
  FROM
    job_postings_fact
	  INNER JOIN
	    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
  WHERE
    job_postings_fact.job_title_short = 'Data Analyst'
		AND job_postings_fact.salary_year_avg IS NOT NULL
    AND job_postings_fact.job_work_from_home = True
  GROUP BY
    skills_job_dim.skill_id
)
SELECT
  skills_demand.skills,
  skills_demand.demand_count,
  ROUND(average_salary.avg_salary, 2) AS avg_salary 
FROM
  skills_demand
	INNER JOIN
	  average_salary ON skills_demand.skill_id = average_salary.skill_id
ORDER BY
  demand_count DESC, 
	avg_salary DESC
LIMIT 10 

```
Here's a breakdown of the results for optimal skills for Data Analysts to learn to maximize salary 💵:
| Skill      | Demand Count | Average Salary ($/year) |
| :--------- | -----------: | ----------------------: |
| SQL        |          783 |                  98,748 |
| Tableau    |          505 |                 102,172 |
| Python     |          494 |                  98,074 |
| Excel      |          441 |                  88,202 |
| Power BI   |          293 |                  95,535 |
| R          |          289 |                  97,421 |
| Looker     |          117 |                  94,281 |
| SAS        |          110 |                  94,101 |
| PowerPoint |           97 |                  88,567 |


**Business Insights:**  
- **SQL remains foundational:** Highest demand and strong salary average, making it indispensable for remote data roles.
- **Visualization tools pay well:** Tableau leads all in average salary, showing strong ROI for professionals skilled in BI presentation.
- **Python advantage:** High technical relevance with near six-figure averages, ideal for automation and advanced analytics.
- **Complementary stack:** Combining SQL  + a BI tool like Tableau (primarily) or Power BI yields the strongest balance of job opportunity and earning potential.
---


### Conclusion 
This SQL-driven analysis provided a data-backed perspective of the Data Analyst job market, focused specifically on salary trends, in-demand skills, and optimal learning paths for remote roles.
Each query built upon the previous, revealing how data skills translate directly to earning potential and job market relevance.

## Key Takeaways

1.  **Top-Paying Roles:**  
Remote data analyst positions reach impressive heights with salaries up to $650k (Mantys) and strong representation from tech leaders like Netflix, Meta, Siemens, and AT&T. These roles validate that analytical expertise is not limited by geography and can command executive-level compensation when paired with advanced technical breadth.

2.  **Skills in High-Paying Jobs:**  
Across all top paying listings, SQL remains non-negotiable, closely followed by Python. Visualization tools like Tableau and Power BI continue to complement these core skills, proving that both backend analysis and front-end communication drive value.

3.  **Market-Wide Demand:**  
The most requested skills are SQL (180k+ mentions), Excel, and Python. This confirm that strong data wrangling, programming, and business reporting are universal needs. Tableau and Power BI’s high demand also emphasize the dominance of storytelling through data visualization.

4.  **Skills That Pay the Most:**  
While niche technologies such as FastAPI, SVN, and MXNet deliver the highest average salaries, these reflect specialized or hybrid roles where data intersects with software engineering, APIs, or AI frameworks. They reveal how bridging disciplines unlocks higher earning brackets.

5.  **Optimal Skills to Learn:**  
Combining SQL, Tableau, Python, and Power BI forms the most practical and profitable skill stack for remote data analysts. These skills balance demand and compensation, ensuring both employability and career growth potential.