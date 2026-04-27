# SQL-Window-Functions-for-Analytics

## Overview

- Understand how SQL window functions work and how to use them  
- Manipulate data in tables using SQL SELECT statements together with window functions  
- Use different SQL windows to get database insights  


## Project Structure

The hands-on project on SQL Window Functions for Analytics is divided into the following tasks:

### Task 1: Getting Started

- Overview of the project  
- A brief introduction to the Rhyme platform  
- What are window functions in SQL?  
- Retrieve all the data in the projectdb database  

### Task 2: Window Functions - Refresher

- Retrieve a list of employee_id, first_name, hire_date, and department of all employees ordered by the hire date  
- Retrieve the employee_id, first_name, hire_date of employees for different departments  

### Task 3: Ranking

- Recall the use of ROW_NUMBER()  
- Use the RANK() function  
- Exercise 3.1: Retrieve the hire_date. Return details of employees hired on or before 31st Dec, 2005 and are in First Aid, Movies and Computers departments  
- Return the fifth-ranked salary for each department  
- Create a Common Table Expression (CTE) to retrieve the customer_id and the number of times the customer has purchased from the mall  
- Understand the difference between ROW_NUMBER(), RANK(), and DENSE_RANK()  

### Task 4: Paging: NTILE()

- Group the employees table into five groups based on the order of their salaries  
- Group the employees table into five groups for each department based on the order of their salaries  
- Create a CTE that returns details of employees and groups them into five salary-based groups  
- Find the average salary for each group of employees  

### Task 5: Aggregate Window Functions - Part One

- Retrieve how many employees are in each department  
- Retrieve the first names, departments, and number of employees working in each department  
- Calculate total salary for all employees  
- Calculate total salary for each department  
- Exercise 5.1: Calculate total salary for each department ordered by hire date (column name: running_total)  

### Task 6: Aggregate Window Functions - Part Two

- Retrieve the different region IDs  
- Retrieve the first names, departments, and number of employees working in each department and region  
- Exercise 6.1: Retrieve the first names, departments, and number of employees working in department and region 2  
- Create a CTE to retrieve the customer_id, ship_mode, and purchase count  
- Exercise 6.2: Calculate the cumulative sum of customer purchases for different ship modes  

### Task 7: Window Frames - Part One

- Calculate the running total of salary  
- Add the current row and previous row values  
- Find the running average  

### Task 8: Window Frames - Part Two

- Review the FIRST_VALUE() function  
- Retrieve the last department in the departments table  
- Create a CTE to retrieve the customer_id, ship_mode, and purchase count  

### Task 9: GROUPING SETS(), ROLLUP(), & CUBE()

- Find the sum of quantity for different ship modes  
- Find the sum of quantity for different categories  
- Find the sum of quantity for different subcategories  
- Use the GROUPING SETS() clause  
- Use the ROLLUP() clause  
- Use the CUBE() clause  
- Wrap up the project  