#############################
-- Task One: Window Functions - Refresher
-- In this task, we will refresh our understanding
-- of using window functions in SQL
#############################
-- 1.1: Retrieve a list of employee_id, first_name, hire_date, 
-- and department of all employees ordered by the hire date
select employee_id, first_name, hire_date, department,
row_number() over (order by hire_date) as Row_Num
from employees;

-- 1.2: Retrieve the employee_id, first_name, 
-- hire_date of employees for different departments

select employee_id, first_name, hire_date,department,
row_number() over ( partition by department 
                    order by hire_date) as emp_num
from employees;


#############################
-- Task Two: Ranking
-- In this task, we will learn how to rank the
-- rows of a result set
#############################

-- 2.1: Let's use the RANK() function


-- Exercise 2.1: Retrieve the hire_date. Return details of
-- employees hired on or before 31st Dec, 2005 and are in
-- First Aid, Movies and Computers departments 

select employee_id, first_name, email, hire_date, department, salary,
rank() over (partition by department 
             order by hire_date) as rank_n
from employees
where hire_date <= '2005-12-31' and department in ('First Aid','Movies','Computers');



-- This returns how many employees are in each department
select department, count(*) as dept_count
from employees 
group by department
order by dept_count desc;

-- 2.2: Return the fifth ranked salary for each department
select * 
from 
(select first_name, department, salary,
rank() over (partition by department order by salary) as ranked_salary
from employees) as e
where e.ranked_salary=5;


--2.3: Create a common table expression to retrieve the customer_id, 
-- and how many times the customer has purchased from the mall 
with purchase_count as(
select "Customer ID", count(Sales) as purchase from sales group by "Customer ID" order by purchase
)
--select * from purchase order by purchase_count desc;

-- 2.4: Understand the difference between ROW_NUMBER, RANK, DENSE_RANK
SELECT "Customer ID", purchase,
ROW_NUMBER() OVER (ORDER BY purchase DESC) AS Row_N,
RANK() OVER (ORDER BY purchase DESC) AS Rank_N,
DENSE_RANK() OVER (ORDER BY purchase DESC) AS Dense_Rank_N
FROM purchase_count
ORDER BY purchase DESC;

#############################
-- Task Three: Paging: NTILE()
-- In this task, we will learn how break/page
-- the result set into groups
#############################

-- 3.1: Group the employees table into five groups
-- based on the order of their salaries
select first_name, salary,
ntile(5) over (order by salary desc)
from employees;

--create 3 different groups
select first_name, salary,
ntile(4) over (order by salary desc) as group_1,
ntile(50) over (order by salary desc) as group_2,
ntile(100) over (order by salary desc) as group_3
from employees;

-- 3.2: Group the employees table into five groups for 
-- each department based on the order of their salaries
select first_name, email, department, salary,
ntile(5) over (partition by department order by salary)
from employees;

-- Create a CTE that returns details of an employee
-- and group the employees into five groups
-- based on the order of their salaries
with employee_details as( 
select first_name, email, department, salary,
ntile(5) over (order by salary desc) as rank_of_salary
from employees
)
--select * from employee_details;

-- 3.3: Find the average salary for each group of employees
select rank_of_salary, avg(salary) as avg_salary
from employee_details
group by rank_of_salary
order by rank_of_salary;

#############################
-- Task Four: Aggregate Window Functions - Part One
-- In this task, we will learn how to use
-- aggregate window functions in SQL
#############################
-- 4.1: This returns how many employees are in each department
select department, count(*) as employee_count
from employees
group by department
order by department;

-- 4.2: Retrieve the first names, department and 
-- number of employees working in that department
select first_name,department,(select count(*) from employees e1 where e1.department=e2.department group by department)
from employees e2
group by first_name, department
order by department;

-- The solution  (Use window window function to make the query easy anf efficient)
  
select 
           first_name,
           department,
           count(*) over (partition by department) as dept_count
from employees
order by department;
     

-- 4.3: Total Salary for all employees
select first_name, department,
sum(salary) over (order by hire_date) as total_salary
from employees;


-- 4.4: Total Salary for each department
select * 
from (select department,
       sum(salary) over (partition by department) as total_salary,
       row_number() over (partition by department order by department) as row_n
from employees) a
where row_n = 1;

-- Exercise 4.1: Total Salary for each department and
-- order by the hire date. Call the new column running_total
SELECT first_name, hire_date, department, salary,
sum(salary) OVER(partition by department
				 order by hire_date) AS running_total
FROM employees;


#############################
-- Task Five: Aggregate Window Functions - Part Two
-- In this task, we will learn how to use
-- aggregate window functions in SQL
#############################

-- Retrieve the different region ids
select distinct region_id from employees;

-- 5.1: Retrieve the first names, department and 
-- number of employees working in that department and region

select first_name, department,
count(*) over (partition by department) dept_count,
region_id,
count(*) over (partition by region_id) region_count
from employees;


-- Exercise 5.1: Retrieve the first names, department and 
-- number of employees working in that department and in region 2
select first_name, department,
count(*) over (partition by department) dept_count
from employees
where region_id=2;


-- Create a common table expression to retrieve the customer_id, 
-- ship_mode, and how many times the customer has purchased from the mall

with purchase_count as(
select "Customer ID","Ship Mode",
count(*) as purchase
from sales
group by "Customer ID","Ship Mode"
order by "purchase" desc
)

-- Exercise 5.2: Calculate the cumulative sum of customers purchase
-- for the different ship mode
select "Customer ID","Ship Mode",purchase,
sum(purchase) over (partition by "Ship Mode"
                    order by "Customer ID" asc) total_purchase
from purchase_count;









