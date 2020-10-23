-- Finner customernumber, checknumber og amount fra tabellen payments hvor den sier at "amount" er høyeste prisen fra amounts i payments. Dette er en "subquery". 
SELECT customerNumber, checkNumber, amount 
FROM payments WHERE amount = (Select MAX(amount)
from payments);


/** Alternativ 2
Sorterer fra toppen og ned (synkende)
	SELECT * FROM classicmodels.payments ORDER BY amount DESC LIMIT 1;*/
