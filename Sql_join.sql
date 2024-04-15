use tgc;
show tables;
select * from employee;
select * from department;
select * from manager;
create table employee1(
id int primary key,
full_name varchar(30),
role varchar(30),
manager_id int);
insert into employee1 values
(1,'pooja','student',5),
(2,'rrk','developer',7),
(3,'munna','student',5),
(4,'rohit','student',5),
(5,'amit','trainer',7),
(6,'sumit','trainer',7),
(7,'twinkle','hr_manager',null);

select * from employee1;
select e1.id,e1.full_name,e1.role,e1.manager_id,e2.full_name
from employee1 e1
join employee1 e2
on e1.manager_id = e2.id;

select e1.id,e1.full_name,e1.role,e1.manager_id,e2.full_name
from employee1 e1,employee1 e2
where e1.manager_id =e2.id;

select * from employee;
select * from department;
select * from manager;

select full_name,department_name,job_role from employee e ,department d
where e.department_id =d.department_id;
-- or
-- or
select full_name,department_name,job_role
from employee e join department d  
on e.department_id =d.department_id;
-- or
select full_name,department_name,job_role
from employee e join department d  
using (department_id) ;

-- department name no of employee
select department_name, count(*) no_of_employee from employee e 
join department d 
on e.department_id = d.department_id -- using(department_id)
group by department_name;

-- details of department  having maxium employee 
select department_name, count(*) no_of_employee from employee e 
join department d 
on e.department_id = d.department_id
group by department_name
order by count(*) desc 
limit 1;

-- left join (return all rows of left join and )
select full_name,manager_name,job_role 
from manager left join employee 
using (manager_id);
select * from employee;

-- right join 
select full_name,manager_name,job_role 
from manager right join employee 
using (manager_id);
-- for checking if null is present in table 
select full_name,manager_name,job_role 
from manager left join employee 
using (manager_id)
where full_name is null;

-- for checking if 
select full_name,manager_name,job_role 
from manager left join employee 
using (manager_id)
where full_name is not null;

select manager_name,count(*) no_of_employee
from employee e right join manager m 
using (manager_id)
group by manager_name
order by no_of_employee
limit 1;




