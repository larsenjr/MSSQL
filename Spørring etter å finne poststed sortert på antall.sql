SELECT Poststed.Poststed, poststed.idPostnummer, COUNT(*) AS 'Antall_Studenter'
FROM student
INNER JOIN poststed ON Poststed.idPostnummer = student.Poststed_idPostnummer
GROUP BY 
Poststed.idPostnummer
ORDER BY Antall_Studenter DESC;