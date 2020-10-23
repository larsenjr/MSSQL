SELECT distinct Etternavn, COUNT(*) AS 'Antall'
FROM student
GROUP BY Etternavn
ORDER BY Antall DESC, Etternavn ASC;