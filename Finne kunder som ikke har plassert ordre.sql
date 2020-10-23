-- Finner kunder som ikke har plassert ordre i tabellen.  

SELECT * from customers
WHERE customerNumber NOT IN (Select customerNumber from orders)
