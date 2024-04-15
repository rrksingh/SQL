create database tgc;
use tgc;

create table department(
department_id int primary key,
department_name varchar(20)
);

INSERT INTO department VALUES 
(1, 'Executive'),
(2, 'HR'),
(3, 'Sales'),
(4, 'Development'),
(5, 'Support'),
(6,'Research');

create table manager(
manager_id int auto_increment primary key,
manager_name varchar(20) not null
) auto_increment =101;

INSERT INTO manager(Manager_name) VALUES 
('Pooja'),
('Sanjana'),
('Twinkle'),
('Mohit'),
('Rohit'),
('Sujeet');

CREATE TABLE employee (
employee_id int AUTO_INCREMENT PRIMARY KEY,
full_name VARCHAR(100),
department_id int,
job_role VARCHAR(100),
manager_id int,
foreign key(department_id) references department(department_id),
foreign key(manager_id) references manager(manager_id)
)AUTO_INCREMENT=1001;

INSERT INTO employee (full_name, department_id, job_role, manager_id)
VALUES ('John Smith', 1, 'CEO', 101),
('Sarah Goodes', 1, 'CFO', 101),
('Wayne Ablett', 1, 'CIO', 101),
('Michelle Carey', 2, 'HR Manager', 102),
('Chris Matthews', 3, 'Sales Manager ', 103),
('Andrew Judd', 4, 'Development Manager', 106),
('Danielle McLeod', 5, 'Support Manager', 104),
('Matthew Swan', 2, 'HR Representative', 105),
('Stephanie Richardson', 2, 'Salesperson', 105),
('Tony Grant', 3, 'Salesperson', 103),
('Jenna Lockett', 4, 'Front-End Developer', 106),
('Michael Dunstall', 4, 'Back-End Developer', 106),
('Jane Voss', 4, 'Back-End Developer', 106),
('Anthony Hird', 5, 'Support', 104),
('Natalie Rocca',5,'Support',104);

select * from employee;
select * from manager;
select * from department;

select full_name,department_name,job_role from employee e
join department d on
e.department_id =d.department_id;

-- or 

select full_name,department_name,job_role from employee e, department d
where e.department_id =d.department_id;

select full_name,department_name,job_role from employee e
left join department d on
e.department_id =d.department_id;

select full_name,department_name,job_role from employee e
right join department d on
e.department_id =d.department_id;
-- department name wise no of employee count
select department_name, count(*) no_of_employee from employee e 
join department d 
on e.department_id = d.department_id
group by department_name;
 
 select department_name, count(*) no_of_employee from employee e 
right join department d 
on e.department_id = d.department_id
group by department_name;

-- details of department  having maxium employee 
select department_name, count(*) no_of_employee from employee e 
right join department d 
on e.department_id = d.department_id
group by department_name
order by count(*) desc 
limit 1;

select full_name,manager_name,job_role from employee e 
join manager m
on e.manager_id=m.manager_id;
select manager_name, count(*) no_of_employee from employee e 
join manager m
on e.manager_id = m.manager_id
group by manager_name;
-- 
select manager_name, count(*) no_of_employee from employee e 
join manager m
on e.manager_id = m.manager_id
group by manager_name
order by count(*) 
limit 1;
-- name of manager having more tha  2 empolyees 
select manager_name, count(*) no_of_employee from employee e 
join manager m
on e.manager_id = m.manager_id
group by manager_name having no_of_employee>2;

select full_name,department_name,manager_name,job_role 
from employee e
join department d
on e.department_id = d.department_id
join manager m
on e.manager_id=m.manager_id;





 


 