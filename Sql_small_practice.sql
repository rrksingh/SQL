use xyz;
create table product(
product_cat varchar(255),
brand varchar(255),
product_name varchar(255),
price int
);
INSERT INTO product VALUES
('Phone', 'Apple', 'iPhone 12 Pro Max', 1300),
('Phone', 'Apple', 'iPhone 12 Pro', 1100),
('Phone', 'Apple', 'iPhone 12', 1000),
('Phone', 'Samsung', 'Galaxy Z Fold 3', 1800),
('Phone', 'Samsung', 'Galaxy Z Flip 3', 1000),
('Phone', 'Samsung', 'Galaxy Note 20', 1200),
('Phone', 'Samsung', 'Galaxy S21', 1000),
('Phone', 'OnePlus', 'OnePlus Nord', 300),
('Phone', 'OnePlus', 'OnePlus 9', 800),
('Phone', 'Google', 'Pixel 5', 600),
('Laptop', 'Apple', 'MacBook Pro 13', 2000),
('Laptop', 'Apple', 'MacBook Air', 1200),
('Laptop', 'Microsoft', 'Surface Laptop 4', 2100),
('Laptop', 'Dell', 'XPS 13', 2000),
('Laptop', 'Dell', 'XPS 15', 2300),
('Laptop', 'Dell', 'XPS 17', 2500),
('Earphone', 'Apple', 'AirPods Pro', 280),
('Earphone', 'Samsung', 'Galaxy Buds Pro', 220),
('Earphone', 'Samsung', 'Galaxy Buds Live', 170),
('Earphone', 'Sony', 'WF-1000XM4', 250),
('Headphone', 'Sony', 'WH-1000XM4', 400),
('Headphone', 'Apple', 'AirPods Max', 550),
('Headphone', 'Microsoft', 'Surface Headphones 2', 250),
('Smartwatch', 'Apple', 'Apple Watch Series 6', 1000),
('Smartwatch', 'Apple', 'Apple Watch SE', 400),
('Smartwatch', 'Samsung', 'Galaxy Watch 4', 600),
('Smartwatch','OnePlus','OnePlus Watch',220);
-- write a query on product table to find all the product having max price.
select product_cat,max(price)as max_price
from product
group by product_cat;

-- write a query on product table to find all the product having max price category wise.
select product_cat,max(price),
row_number() over(partition by product_cat order by price desc) max_price
from product =
(select max(price) from product);
-- price productname wise first expensive product
select *,
first_value(product_name) over(partition by product_cat order by price desc) as expensive_product
from product;
-- retr cheapest product name of first value productwise
select x.product_cat,brand,price,chepest_product from
(select *,
first_value (product_name) over(partition by product_cat order by price asc) as chepest_product
from product)x
where product_name=chepest_product;
-- last_value 
select *,
last_value (product_name) over(partition by product_cat order by price desc
range between unbounded preceding and unbounded following) as expensive_product
from product;

select * from product;
select product_cat,product_name,price,
case
when price>1000 then 'expensive_product'
when price<1000 then 'cheapest_product'
else 'moderate_product'
end as status
from product;