/*
Question : What are the top paying data analyst jobs?
-> Identify the top 10 highest paying data analyst roles that are avaliable remotely.
-> Focuses on job postings with specififed salaries (remove nulls).
-> Why? 
    Highlight the top-paying oppurtunties for data analysts, 
    offering insights into employment options and location flexibility.
*/

SELECT
    job_id,
    job_title,
    name AS company_name,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM 
    job_postings_fact    
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title = 'Data Analyst' AND
    job_work_from_home IS TRUE AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;    