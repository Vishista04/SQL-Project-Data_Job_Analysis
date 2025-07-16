/* 
Question : What are the top skills based on salary?
- Look at the average salary assocaiated with each skill for data analyst positions
- Focuss on roles with specified salaries, regardless of location
- Why?
    It reveals how different skills impact salary levels for data analysts and
    helps identify the most financially rewarding skills to acquire or improve
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg),2)
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    AVG(salary_year_avg) DESC
LIMIT 15

/*
Here’s a shorter 3-point summary of the trends:
1. Emerging & Niche Tools Pay More – Skills like SVN, Solidity, Couchbase and Datarobot command premium 
   salaries due to their rarity and use in cutting-edge fields (blockchain, automation).
2. AI & ML Frameworks Are Highly Valued – Knowledge of PyTorch, Keras, MXNet reflects a shift toward 
   hybrid data analyst/data scientist roles with deep learning expertise.
3. Cloud & DevOps Skills Boost Pay – Tools like Terraform, Kafka, Puppet, VMware show that analysts with
   cloud infrastructure and DataOps skills earn significantly higher salaries.

[
  {
    "skills": "svn",
    "round": "400000.00"
  },
  {
    "skills": "solidity",
    "round": "179000.00"
  },
  {
    "skills": "couchbase",
    "round": "160515.00"
  },
  {
    "skills": "datarobot",
    "round": "155485.50"
  },
  {
    "skills": "golang",
    "round": "155000.00"
  },
  {
    "skills": "mxnet",
    "round": "149000.00"
  },
  {
    "skills": "dplyr",
    "round": "147633.33"
  },
  {
    "skills": "vmware",
    "round": "147500.00"
  },
  {
    "skills": "terraform",
    "round": "146733.83"
  },
  {
    "skills": "twilio",
    "round": "138500.00"
  },
  {
    "skills": "gitlab",
    "round": "134126.00"
  },
  {
    "skills": "kafka",
    "round": "129999.16"
  },
  {
    "skills": "puppet",
    "round": "129820.00"
  },
  {
    "skills": "keras",
    "round": "127013.33"
  },
  {
    "skills": "pytorch",
    "round": "125226.20"
  }
]

*/