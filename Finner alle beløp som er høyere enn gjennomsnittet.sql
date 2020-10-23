-- Finner alle beløp som er høyere enn average i tabellen sortert i synkende rekkefølge. 

SELECT * FROM payments WHERE amount > (Select AVG(amount)
from payments) ORDER BY amount DESC;

