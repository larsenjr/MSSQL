SELECT F.Fylkenavn, COUNT(*) AS `Antall`
FROM student
    INNER JOIN poststed P ON P.idPostnummer = student.Poststed_idPostnummer
    INNER JOIN fylke F ON F.idFylke = P.Fylke_idFylke
GROUP BY
    F.Fylkenavn
HAVING Antall >= 2
ORDER BY Antall ASC;