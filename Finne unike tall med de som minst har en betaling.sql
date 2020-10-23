SELECT distinct customers.customernumber AS Kunder from payments 
INNER JOIN customers ON customers.customernumber = payments.customerNumber;
