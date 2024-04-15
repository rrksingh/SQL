create database book_store;
use book_store;


create table category(
id int primary key,
c_name varchar(20));

INSERT INTO category 
VALUES (1, 'Cat-A'),
(2, 'Cat-B'),
(3, 'Cat-C'),
(7, 'Cat-D'),
(8, 'Cat-E'),
(4, 'Cat-F'),
(10,'Cat-G'),
(12,'Cat-H'),
(6, 'Cat-I');
select * from category;

 
alter table category modify c_name varchar(20) not null;
desc category;
create table Authors(
id int primary key,
a_name varchar(20));

INSERT INTO Authors
VALUES (1, 'Author-A'),
(2, 'Author-B'),
(3, 'Author-C'),
(10, 'Author-D'),
(12,'Author-E');

alter table Authors modify a_name varchar(20) not null;
truncate table Authors;
select * from Authors;
select * from category;


create table Books(
id int auto_increment primary key,
b_name varchar(20) not null,
price int,
cat_id int,
aut_id int,
foreign key(cat_id) references category(id),
foreign key(aut_id) references Authors(id)
)auto_increment=100;

INSERT INTO Books 
(b_name,price,cat_id,aut_id)
VALUES ( 'Book-A', 100, 1, 2),
( 'Book-B', 200, 2, 2),
( 'Book-C', 150, 3, 2),
( 'Book-D', 100, 3,1),
( 'Book-E', 200, 3,1),
( 'Book-F', 150, 4,1),
( 'Book-G', 100, 7,10),
( 'Book-H', 200, 8,12);

select * from Books;

select b.id, b_name, c_name,price from books b,category c
where b.cat_id =c.id;

select b.id, b_name, a_name,price from books b,Authors a
where b.aut_id =a.id;

select b.id, b_name, c_name, a_name, price from Books b, category c, Authors a
where b.cat_id = c.id and b.aut_id = a.id;

select * from Authors;
select a.id, a_name, b_name, price from Authors a, Books b
where a.id =b.aut_id;

select a.id, a_name, count(*) no_of_books from Authors a, Books b
where a.id =b.aut_id
group by a.id;

select a.id, a_name, count(*) no_of_books from Authors a, Books b
where a.id =b.aut_id
group by a.id having no_of_books>2;

select a.id, a_name, count(*) no_of_books,round(avg(price),0) avg_price
from Authors a, Books b
where a.id =b.aut_id
group by a.id;

select a.id, a_name, count(*) no_of_books,round(avg(price),0) avg_price
from Authors a, Books b
where a.id =b.aut_id
group by a.id having avg_price>150;

--  ret category id wise no of the books 
select c.id,c_name, count(*) no_of_books 
from  Books b,category c
where c.id=b.cat_id
group by c.id;

-- category id wise total earning from  books
select * from Books;
select c.id,c_name,sum(price) total_earning from  Books b,category c
where c.id=b.cat_id
group by c.id;

-- what is author id wise ,the min and max price of book
select a.id,a_name,max(price) max_price,min(price) min_price from Books b,Authors a
group by a.id;

-- display book name ,category name and price for book id =103;
select b.id,b_name,c_name,price 
from Books b,category c
where b.id=103 and c.id=b.cat_id;

select * from Books where id =103;

-- ret all the rows where book name ends with 'vowels'
select b_name from Books 
where b_name like '%a'or b_name like '%e' or b_name like '%i' or b_name like '%o' or b_name like '%u';

--  display author wise :author_name,no of books,min price of book whose min price is > 150
select a.id, a_name,count(*) no_of_books, min(price) as min_price
from Authors a,Books b
where a.id=b.aut_id
group by a.id having  min(price) >150;






