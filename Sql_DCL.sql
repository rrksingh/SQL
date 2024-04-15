show databases;
use mysql;
show tables;
select * from user;
select user from user;
-- grant and revoke
create user 'rrk' identified by 'rrk123';
select user from user;
-- use bookstore;
grant select on book_store.Books to 'rrk';
flush privileges;
show grants for 'rrk';
select * from global_grants;
revoke select on book_store.Books from 'rrk';
drop user 'rrk';
select user from user;

use company;
select * from customer;
insert into customer values
(6,'rrk','singh',20,'india'),
(7,'rohit','raj',21,'india'),
(8,'munna','kumar',22,'india');

select * from oders;
select * from customer c
join oders o
on c.c_id = o.customer_id;

select * from customer c
left join oders o
on c.c_id = o.customer_id;

select * from customer c
right join oders o
on c.c_id = o.customer_id;

select * from oders o
left join customer c
on c.c_id = o.customer_id;

select * from oders o
right join customer c
on c.c_id = o.customer_id;








