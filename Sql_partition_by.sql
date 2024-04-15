create database google;
use google;
create table employee (
emp_ID int,
 emp_NAME varchar(50),
 DEPT_NAME varchar(50),
 SALARY int);
 
desc employee;
insert into employee values
(101, 'Mohan', 'Admin', 4000),
(102, 'Rajkumar', 'HR', 3000),
(103, 'Akbar', 'IT', 4000),
(104, 'Dorvin', 'Finance', 6500),
(105, 'Rohit', 'HR', 3000),
(106, 'Rajesh',  'Finance', 5000),
(107, 'Preet', 'HR', 7000),
(108, 'Maryam', 'Admin', 4000),
(109, 'Sanjay', 'IT', 6500),
(110, 'Vasudha', 'IT', 7000),
(111, 'Melinda', 'IT', 8000),
(112, 'Komal', 'IT', 10000),
(113, 'Gautham', 'Admin', 2000),
(114, 'Manisha', 'HR', 3000),
(115, 'Chandni', 'IT', 4500),
(116, 'Satya', 'Finance', 6500),
(117, 'Adarsh', 'HR', 3500),
(118, 'Tejaswi', 'Finance', 5500),
(119, 'Cory', 'HR', 8000),
(120, 'Monica', 'Admin', 5000),
(121, 'Rosalin', 'IT', 6000),
(122, 'Ibrahim', 'IT', 8000),
(123, 'Vikram', 'IT', 8000),
(124,'Dheeraj','IT',11000);
select * from employee;

CREATE TABLE sales(
    sales_employee VARCHAR(50) NOT NULL,
    fiscal_year INT NOT NULL,
    sale DECIMAL(14,2) NOT NULL,
    PRIMARY KEY(sales_employee,fiscal_year)
);

INSERT INTO sales(sales_employee,fiscal_year,sale)
VALUES('Bob',2016,100),
      ('Bob',2017,150),
      ('Bob',2018,200),
      ('Alice',2016,150),
      ('Alice',2017,100),
      ('Alice',2018,200),
       ('John',2016,200),
      ('John',2017,150),
      ('John',2018,250);
select * from sales;
select sum(sale) as total_sale
from sales;

select fiscal_year,sum(sale) as total
from sales
group by fiscal_year;

select fiscal_year,sales_employee,sum(sale) 
over(partition by fiscal_year) total
from sales;

select * from employee;

select x.*,(x.SALARY/x.total_salary)*100 'salary(%)'
from
(select DEPT_NAME,emp_NAME,SALARY,
sum(salary) over(partition by DEPT_NAME) total_salary
from employee) x;

select DEPT_NAME,emp_Name,SALARY,
min(salary) over(partition by DEPT_NAME) min_salary
from employee;

select DEPT_NAME,emp_Name,SALARY,
max(salary) over(partition by DEPT_NAME) max_salary
from employee;

select DEPT_NAME,emp_Name,SALARY,
count(emp_name) over(partition by DEPT_NAME) no_of_employee
from employee;

select DEPT_NAME,emp_Name,SALARY,
round(avg(salary) over(partition by DEPT_NAME),0) avg_salary
from employee;


