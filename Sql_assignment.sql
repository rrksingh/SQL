create database company_A;
use company_A;

CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);
select * from worker;

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');
INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(009, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(010, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(011, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR');

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');
        
select * from bonus;		
		

CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003,'Lead','2016-06-11 00:00:00');
 select * from title;
 
 
-- Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.

select first_name as WORKER_NAME
 from worker;


-- Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.

SELECT UPPER(FIRST_NAME) 
FROM Worker;

-- Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.

select distinct department from worker;

-- Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.
-- Hint: SUBSTRING( string, start_position, length ); formula

select substring(first_name,1,3) from worker;

-- Q-5. Write an SQL query to find the position of the alphabet(‘a’) in the first name column ‘Amitabh’ from Worker table.
-- Hint: INSTR(string, substring)- The INSTR function returns an integer value representing the position of the first occurrence of the substring within the string. 
-- If the substring is not found, the function returns 0.

SELECT instr('a', first_name) AS position_of_a
FROM Worker
WHERE first_name = 'Amitabh';

 -- Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
-- Hint: rtrim(column_name)

select rtrim(first_name) from worker;

-- Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
-- Hint: ltrim(column_name)

select ltrim(department) from worker;

-- Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker  table and prints its length.
 -- Hint: length(column_name)
 
 select distinct department ,length(department) unique_values from worker;
 
-- Q-9. Write an SQL query to print the FIRST_NAME from Worker  table after replacing ‘a’ with ‘A’.
-- Hint: replace(column_name)

select replace(first_name,'a','A') from worker;

-- Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them.

select concat_ws(' ',first_name,last_name) as complete_name from worker;

 -- Q-11. Write an SQL query to print details of the Workers who are also Managers.
 
 select * from title where worker_title='Manager';
 
 -- select * from title;
 
-- Q-12. Write an SQL query to determine the nth (say n=5) highest salary from a table.

select * from worker
where salary =
(select distinct(salary) from worker order by salary desc limit 1 offset 4);
-- or another way
select x.first_name,x.salary from
( 
select *,
dense_rank() over(order by salary desc) as dr from worker) x
where x.dr=5;

-- Q-13. Write an SQL query to fetch the list of employees with the same salary.

SELECT *
FROM worker
WHERE salary IN (
    SELECT salary
    FROM worker
    GROUP BY salary
    HAVING COUNT(worker_id) > 1 );

-- Q-14. Write an SQL query to fetch the count of employees working in the department ‘Admin’.

 select department,count(*) from worker group by department order by 'admin';

 
-- Q15. Write an SQL query to fetch worker names with salaries >=  50000 and <= 100000.

select * from worker having salary>=50000 and salary<=100000;

-- Q-16. Write an SQL query to fetch the no. of workers for each department in the descending order.

select count(*) no_of_worker  from worker group by department ;

-- Q-17. Write an SQL query to print details of the Workers who are also Managers.

select * from title where worker_title='Manager';

-- Q-18. Write an SQL query to fetch duplicate records having matching data in some fields of a table.

select first_name,last_name,joining_date,count(*) as count from worker
group by first_name,last_name,joining_date
having count>1;

-- Q-19. Write an SQL query to show only odd rows from a table.

select * from worker where worker_id%2=1;


-- Q-20. Write an SQL query to show records from one table  that another table does not have.

select * from worker w
join title t on
w.worker_id =t.worker_ref_id;

-- Q21. Write an SQL query to show the top n (say 10) records of a table.

select * from worker order by salary limit 10;

-- Q-22. Write an SQL query to fetch the list of employees with the same salary.

SELECT *
FROM worker
WHERE salary IN (
    SELECT salary
    FROM worker
    GROUP BY salary
    HAVING COUNT(worker_id) > 1 );
    
-- Q-23. Write an SQL query to show all departments along with the number of people in there.

select department,count(*) no_of_people from worker group by department;

-- Q-24. Write an SQL query to show the last record from a table.

select * from worker limit 1 offset 10;

-- Q-25. Write an SQL query to fetch the last five records from a table.

select * from worker limit 5 offset 6;

-- Q-26. Write an SQL query to print the name of employees  having the highest salary in each department.

select department,max(salary) highest_salary from worker group by department having highest_salary;

-- Q-27. Write an SQL query to fetch three max salaries from a table.

SELECT distinct(salary)
FROM worker
ORDER BY salary DESC
LIMIT 3;

-- Q-28. Write an SQL query to fetch three min salaries from a table.

SELECT distinct(salary)
FROM worker
ORDER BY salary asc
LIMIT 3;

-- Q-29. Write an SQL query to fetch nth max salaries from a table.

 SELECT max(salary) FROM worker ORDER BY salary desc;

-- Q-30. Write an SQL query to fetch departments along with the total salaries  paid for each of them.

select department,salary from worker;

-- Q-31. Write an SQL query to fetch the names of workers who earn the highest salary.

select first_name,salary from worker where salary=(select max(salary) from worker);

-- or
SELECT distinct(salary),first_name,last_name
FROM worker
ORDER BY salary DESC
LIMIT 1;


-- Q-32. Write an SQL query to fetch the list of employees with the same salary.

SELECT *
FROM worker
WHERE salary IN (
    SELECT salary
    FROM worker
    GROUP BY salary
    HAVING COUNT(worker_id) > 1 );
    