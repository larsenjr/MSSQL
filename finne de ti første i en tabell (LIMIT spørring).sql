-- For å bruke databasen "classicmodels"
use classicmodels;
-- Finner customernumber, customername og creditlimit fra Classicmodels. LIMIT for å fikse hvor mange som skal vises etterfulgt av tallet. 
SELECT customerNumber, customerName, creditLimit from classicmodels.customers LIMIT 10;