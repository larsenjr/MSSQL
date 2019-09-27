create table products
(
    productID int primary key identity (1,1),
    ProductName varchar(50)
)
alter table products
add Price float;


insert into products (ProductName, Price) values ('Baseball', 5.95)
insert into products (ProductName, Price) values ('Bat', 195.99);

Create table orders (
    orderId int primary key identity (1,1),
    orderDate  DATETIME,
    customerId int,
    ProductId int,

)

select * from orders;
select * from products
select * from customer;

insert into orders(orderDate, customerId, ProductId) VALUES (GETDATE(),3,2);