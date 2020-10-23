SELECT orderNumber, SUM(quantityOrdered * priceEach) AS Totalpris
	FROM orderdetails
	GROUP BY ordernumber
HAVING Totalpris < (Select avg(Total) 
	FROM (Select SUM(quantityOrdered * priceEach) AS Total 
    FROM orderdetails 
    GROUP by orderNumber) AS Totals)
	ORDER BY 
    Totalpris ASC;
    
    -- Du kan også bruke denne:
    /*
SELECT * FROM payments 
WHERE amount < (Select AVG(amount)
FROM payments) ORDER BY amount DESC;
*/