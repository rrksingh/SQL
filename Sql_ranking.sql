use google;
show tables;
-- show row wise number
select row_number() over() row_no,e.*
from employee e;

select row_number() over(partition by DEPT_NAME order by SALARY desc) row_no,e.*
from employee e;
-- department wise employee details having higest salary
select x.* from 
(select row_number() over(partition by DEPT_NAME order by SALARY desc) row_no,e.*
from employee e
)x
where row_no =1;
-- department wise employee details having lowest salary
select x.* from 
(select row_number() over(partition by DEPT_NAME order by SALARY ) row_no,e.*
from employee e
)x
where row_no=1;

-- depart wise employee details having highest salary

select
rank() over(partition by DEPT_NAME order by SALARY desc) ranking,
e.*from employee e;

select x.* from
(select
rank() over(partition by DEPT_NAME order by SALARY desc) ranking,
e.* from employee e
) x
where ranking=1;

select dense_rank() over(partition by DEPT_NAME order by SALARY desc) ranking,
e.* from employee e;

select 
row_number() over(partition by DEPT_NAME order by SALARY) row_no,
rank() over(partition by DEPT_NAME order by SALARY desc) ranking,
dense_rank() over(partition by DEPT_NAME order by SALARY desc) d_ranking,
e.* from employee e;

select * from employee;

select *,
lag(SALARY) over(partition by DEPT_NAME order by SALARY) prev_emp_sal
from employee;

select *,
lag(emp_NAME) over(partition by DEPT_NAME order by SALARY) prev_emp_sal
from employee;

select *,
salary - lag(salary) over(partition by DEPT_NAME order by SALARY) diff_in_sal
from employee;

-- to show from upper 2 salary
select *,
lag(salary,3) over(partition by DEPT_NAME order by salary) pre_emp_sal_3
from employee;
-- show department wise salary next  
select *,
lead(salary) over(partition by dept_name order by salary) next_emp_sal
from employee;

select *,
lead(emp_name) over(partition by dept_name order by salary) next_emp_name
from employee;

select *,
salary -lead(salary) over(partition by dept_name order by salary desc) diff_in_next_sal
from employee;

select *,
lead(salary,2) over(partition by dept_name order by salary) 2nd_next_sal
from employee;

select * from employee;
-- show salary range 
select *,
case
when salary<=4000 then "low salary range" 
when salary>=8000 then "high salary range" 
else "mid salary range"
end salary_status
from employee;
-- show bonus status
select *,
case
when salary<=4000 then (salary*.05)
when salary>=8000 then (salary*.10) 
else (salary*.07)
end bonus_staus
from employee;

select e.*,
lead(salary) over(partition by dept_name order by emp_id)as next_emp_sal,
case
when e.salary < lead(salary) over(partition by dept_name order by emp_id) then "higher than next employee"
when e.salary > lead(salary) over(partition by dept_name order by emp_id) then "lowerr than next employee"
when e.salary = lead(salary) over(partition by dept_name order by emp_id) then "same next employee"
end salary_staus
from employee e;








