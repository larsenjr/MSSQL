Select fylke.fylkenavn, COUNT(*) AS Antall
FROM poststed
INNER JOIN fylke ON fylke.idFylke = poststed.Fylke_idFylke
INNER JOIN student ON poststed.idPostnummer = student.Poststed_idPostnummer
GROUP BY fylke.fylkenavn
Having Antall >2 -- Kan også bruke COUNT(*) isteden for alias Antall
ORDER BY Antall DESC;