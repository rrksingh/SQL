use school;
show tables;
select * from student;

update student 
set age =20 where name = "poorvi";
select * from student where name ="poorvi";
update student set name="Jatin" ,age =15, class=10 where id =9;
select * from student where id =9;
select * from student where class=12;
update student set age =19 where class =12;
select * from student where class=12;
delete  from student where name="mohit";

select * from student;

select * from student where name in ("poorvi","mahesh","jatin");

select * from student where name not in ("poorvi","mahesh","jatin");

-- find the minimum age from the table 
select min(age) as min_age from student;

-- find maxium age from table
select max(age) as max_age from student;

-- count the no of rows
select count(*) as total_row from student;
select count(distinct class) from student;
select count(*) as no_of_student,class from student where class=11;

-- average age of student from class 11
select * from student where class =11;
select avg(age) as avg_age from student where class=11;

-- round off
select round(avg(age),2) as avg_age from student where class=11;
select round(avg(age),0) as avg_age from student where class=11;

-- sum 
show databases;
use company;
show tables;
select * from oders;
select sum(total_oder) as total_sale from oders;
select sum(total_oder) as book_sale from oders where product="books";

select * from customer;

-- concat
select concat(f_name," ",l_name)as full_name,age,country from customer;

use school;
show tables;
select * from student;

-- question 

-- retrieve age and country of all customers
use company;
show tables;
select * from customer;
select age,country from customer;

-- select rows if age is less than 27
select * from customer where age<27;

-- select the age and country of customers whose age is less than or equal to 28
select age,country from customer where age <=28;

-- select the countries of customers whose age is greater than 27
select country from customer where age >27;

-- select customers whose age is equal to 22
select * from customer where age=22;

-- select customers whose age is not equal to 22
select * from customer where age <> 22;

-- select rows if country is USA
select * from customer where country="USA";

-- select rows if both the age > 23 and last_name = 'Doe' conditions are TRUE
select * from customer where age>23 and l_name="Doe"; 

-- select rows if either of the conditions age > 23 or country = 'USA' is TRUE
select * from customer where age>23 or country="USA"; 

-- select rows if country is not UK
select * from customer where country <> "UK";

-- select customers if age > 23 and country is both 'USA' or 'UK'
select * from customer where age>23 and country ="USA" or "UK";
select * from customer where age>23 and country in ("USA","UK");

-- find the minimum sale from order table
select * from oders;
select min(total_oder) as min_sale from oders;

--  find the maximum sale from order table
select max(total_oder) as max_sale from oders;

-- find the product name with minimum sale
select product,total_oder from oders where total_oder=(select min(total_oder)from oders);

-- find the product name with maximum sale
select product,total_oder from oders where total_oder=(select max(total_oder)from oders);

-- write a query to find the no of students of class 10
use school;
select * from  student;
select *from student where class =10;

-- find the no of customer from country UK
use company;
select * from customer;
select * from customer where country="UK";







