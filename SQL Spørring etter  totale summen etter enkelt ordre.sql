SELECT orderNumber, ( priceEach * quantityOrdered) 
AS Totalt FROM orderdetails GROUP BY orderNumber ORDER BY Totalt DESC;