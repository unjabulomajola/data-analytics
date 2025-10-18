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