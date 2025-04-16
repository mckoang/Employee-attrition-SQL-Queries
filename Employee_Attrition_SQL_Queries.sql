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