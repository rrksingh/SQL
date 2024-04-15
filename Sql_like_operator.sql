use school;
select * from student;

-- update the name mahesh to meghana 
update student set name="meghana" where name ="mahesh";

-- delete the entery of student having id =4
delete from student where id =4; 

-- no of enteries id more than 5
select count(*) from student where id >5;

-- like 
-- name starting with p
select * from student where name like "p%";
insert into student values
(1,"poonam",18,10),
(3,"puravi",19,11);

-- name of student ending with a
select * from student where name like "%a";

-- name of the student having "a" in their names
select * from student where name like "%a%";
select * from student where name like "%ee%";

-- name starting with p and end with k
select * from student where name like "p%k";

-- name start with p and end with anything at least 2 place after p 
select * from student where name like "p__%";

insert into student values
(11,"pree",18,10),
(12,"priyanka",19,11);

-- start from pr and and take at least 2 charcter
select * from student where name like "pr__%";

-- start from pr and take only 2 character 
select * from student where name like "pr__";
-- start with pr and end with a
select * from student where name like "pr__%a";

-- group by 
-- classwise no of student 
select class,count(*) from student group by class order by class;

-- agewise no of student
select age,count(*) as "no of student" from student group by age order by age;

-- find the  minimum age of student in each class
select class,min(age) from student group by class order by class;

--  find the  maximum age of student in each class
select class,max(age) from student group by class order by class;

--  find the  average age of student in each class
select class,round(avg(age),2) as avg_age from student group by class order by class;

-- same for same name short
select class,round(avg(age),2) avg_age from student group by class order by class;

show databases;
use company;
show tables;
select * from oders;
insert into oders values
(1,"Paper",500,5),
(2,"Pen",10,2),
(3,"Marker",120,3),
(4,"Books",1000,1),
(5,"Eraser",20,4);

select product,sum(total_oder) 
from oders
group by product 
order by sum(total_oder) desc;

select * from oders;

-- customer wise total purchase
select customer_id,sum(total_oder) from oders 
group by customer_id
order by sum(total_oder) desc;

-- retr all the names of customer having  "o" in their names
use company;
select * from customer;
select concat(f_name," ",l_name) as full_name from customer where concat(f_name," ",l_name) like "%o%";

-- retr all the names of customer end with "n"
select * from customer where l_name like "%n";

-- retr all country name start with 'u' and end with 'a' or 'e'
select * from customer where country like "U%A" or country like "U%E";

-- countries wise no of customer 
select country,count(*) from customer group by country order by country;

-- age wise no of customer
select age,count(*) from customer group by age order by age;


 





