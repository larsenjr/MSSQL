alter table orders

add foreign key (customerId) references Customer(id);
alter table orders

add foreign key (ProductId) references products(productID);

Select c.city, c.lastname, p.ProductName, sum(p.Price) As total, avg(p.price) as Gjennomsnitt
from orders o
    INNER JOIN products p on o.ProductId = p.productID
    inner join customer c ON o.customerId = c.id
group by c.city, p.ProductName, c.lastname
;