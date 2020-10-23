/* Heneter ut studenter der etternavn starter på Lar */
SELECT *
from student
WHERE left(Etternavn, 3)= 'Lar';