SELECT kjonn, COUNT(*) AS Antall
FROM student GROUP BY kjonn
ORDER BY Antall desc;