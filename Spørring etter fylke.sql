Select fornavn, etternavn, adresse, poststed, Poststed_idPostnummer, kjonn, fylke.Fylkenavn FROM student
INNER JOIN poststed ON student.Poststed_idPostnummer = poststed.idPostnummer
INNER JOIN fylke ON fylke.idFylke = poststed.Fylke_idFylke
ORDER BY etternavn DESC;