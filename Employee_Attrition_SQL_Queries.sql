--1.What is the total number of employees?
select count(*) AS Total_Number
from employee_data
select * from employee_data

--2.What are the unique job roles in the company?
select distinct jobrole from employee_data

--3.How many employees work in each department?
select Department, count (*) AS DepartmentCount
from employee_data
group by department

--4.What is the average monthly income by job role?
select ROUND(avg(monthlyincome),2) as sikaaba, jobrole
from employee_data
group by jobrole

--5.Which employees travel frequently for business?
select * from employee_data
where businesstravel = 'Travel_Frequently'

select businesstravel, count (*)  as bebree
from employee_data
where businesstravel='Travel_Frequently'
group by businesstravel

--select which department travels most
select department, count (*) as department_travel
from employee_data
where businesstravel ='Travel_Frequently'
group by department

--How many employees are male vs female
select gender, count (*) as gender_count
from employee_data
group by gender

--What is the average age of employees?
select ROUND(avg(age),2) AS average_age
from employee_data

--what are the different education fields represented?
select distinct educationfield
from employee_data

--How many employees have stock options?
select stockoptionlevel, count (*) as stock_option
from employee_data
group by stockoptionlevel

select * from employee_data

--what is the average daily rate per department
select department, avg(dailyrate) as average_daily_rate
from employee_data
group by department

--what is the attrition rate by gender?
select 
gender,
count(*) filter (where attrition='yes') as attrition_count,
count (*) as employee_count,
ROUND(100 * COUNT(*)filter (where attrition='yes')/count(*),2) as attrition_rate_percent
from employee_data
group by gender;

--what is the average number of years at the company by educational level?
select
education,
ROUND(avg(yearsatcompany),2) as company_years
from employee_data
group by education
order by education;

--what are the top 5 highest monthly incomes?
select
monthlyincome
from employee_data
order by monthlyincome desc
limit 5;

--what is the distribution of marital status across employees?
select
maritalstatus
from employee_data as age_limit
group by maritalstatus

--How many employees work overtime vs not?
select overtime, count (*) as overtime_count
from employee_data
group by overtime

--what is the average job satisfaction by department?
select department, ROUND(avg(jobsatisfaction),2) as avg_happiness
from employee_data
group by department;

--What is the average distance from home by job role?
select jobrole, avg(distancefromhome) AS averagedistance
from employee_data
group by jobrole;

select * from employee_data

--what is the average performance rating by job level
select joblevel, avg(performancerating) AS performance_rating
from employee_data
group by joblevel

--How many companies has each employee worked at previously?
select 
employeenumber,
numcompaniesworked
from employee_data;

--what is the average training times per year?
select avg(trainingtimeslastyear) as avg_training_time
from employee_data

select min(age) from employee_data

--what is the attrition rate across different age groups?
SELECT
  CASE
    WHEN age BETWEEN 20 AND 29 THEN '20-29'
    WHEN age BETWEEN 30 AND 39 THEN '30-39'
    WHEN age BETWEEN 40 AND 49 THEN '40-49'
    WHEN age BETWEEN 50 AND 59 THEN '50-59'
    ELSE '60+'
  END AS age_group,
  COUNT(*) AS total_employees,
  SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
  ROUND(
    (SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)::decimal / COUNT(*)) * 100, 2
  ) AS attrition_rate_percent
FROM employee_data
GROUP BY age_group
ORDER BY age_group;

--Is there a pattern between distance from home and attrition rate
SELECT 
  distancefromhome,
  COUNT(*) AS total_employees,
  SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
  ROUND(
    (SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)::decimal / COUNT(*)) * 100, 
    2
  ) AS attrition_rate_percent
FROM employee_data
GROUP BY distancefromhome
ORDER BY distancefromhome;

--How does monthly income compare for employees who work overtime vs those who don't?
select overtime, 
ROUND(avg(monthlyincome),2) AS monthly_money
from employee_data
group by overtime;

--Which job roles have the highest attrition and lowest job satisfaction?
SELECT 
  JobRole,
  COUNT(*) AS total_employees,
  SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
  ROUND(
    (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)::decimal / COUNT(*)) * 100, 2
  ) AS attrition_rate_percent,
  ROUND(AVG(JobSatisfaction), 2) AS avg_job_satisfaction
FROM employee_data
GROUP BY JobRole
ORDER BY attrition_rate_percent DESC, avg_job_satisfaction ASC;

--which education field have the highest average performance ratings?
select educationfield, ROUND(avg(performancerating),2) AS Performance_Rating
from employee_data
group by educationfield
order by Performance_Rating desc;

--what is the average number of years in the current role vs years with current manager?
select avg(yearsincurrentrole) AS yearsinrole, AVG(yearswithcurrmanager) AS yearswithmanager
from employee_data

--what is the average percent salary hike by job level?
select joblevel, avg(percentsalaryhike) AS Average_Money
from employee_data
group by joblevel;

--Is there a correlation between environment satisfaction and attrition?
SELECT 
  EnvironmentSatisfaction,
  COUNT(*) AS total_employees,
  SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
  ROUND(
    (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)::DECIMAL / COUNT(*)) * 100, 
    2
  ) AS attrition_rate_percent
FROM employee_data
GROUP BY EnvironmentSatisfaction
ORDER BY EnvironmentSatisfaction;

--what is the average number of years since last promotion for each job role?
select jobrole, avg(yearssincelastpromotion) AS lastyearofpromotion
from employee_data
group by jobrole;
