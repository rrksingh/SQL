create database comapny;
select database();
use company;


create table customer(
c_id int primary key,
f_name varchar(30) not null,
l_name varchar(20) ,
age int check (age>=20),
country varchar(20)
);

desc customer;

insert into customer values
(1,"John","Doe",31,"USA"),
(2,"Robert","Luna",22,"USA"),
(3,"David","Robinson",22,"UK"),
(4,"John","Robinson",25,"UK"),
(5,"Betty","Doe",26,"UAE");
select * from customer;

create table oders(
oder_id int,
product varchar(30),
total_oder int,
customer_id int,
foreign key(customer_id) references customer(c_id)
);

insert into oders values
(1,"Paper",500,5),
(2,"Pen",10,2),
(3,"Marker",120,3),
(4,"Books",1000,1),
(5,"Eraser",20,4);
select * from oder;
show tables;
select * from customer;
select * from oders;

-- retrive the first and last name from customer table

select f_name,l_name from customer;

-- retrive the product name whoses total sale is grater than and eual 500 from oders table
select product,total_oder from oders where total_oder>=500;
-- retrive all entries except product is paper
select * from oders where product <>"Paper";
select * from oders where product ="Books";
select * from oders where not product ="Books";
-- retrive all distinct country name from customer table
select distinct country from customer;
-- shorting orders
select * from oders order by total_oder;
-- shorting descending oder
select * from oders order by total_oder desc;
insert into oders values
(6,"Books",500,5);
select * from oders order by product desc,total_oder desc;

-- retrive the distinct first name from customer table 
select distinct f_name from customer;
-- retrive all the customers name whose age is between 23 to 35

select f_name,age from customer where age between 23 and 35;
select f_name ,age from customer where age>23 and age<35;
select f_name ,age from customer where age>23 or age<35;
-- show limits in rows
-- retrivre top 3 high selling product
select  product as top_3, total_oder from oders order by total_oder desc limit 3;
select * from oders;
-- skip rows 
select * from oders limit 3 offset 2;
select * from oders limit 1 offset 1;
select product as sec_heighest,total_oder from oders order by total_oder desc limit 1 offset 1;
select * from oders limit 2,3; -- limit (offset_no, limit_no)





