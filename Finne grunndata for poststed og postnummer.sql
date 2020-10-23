SELECT navn, etternavn, adresse, poststed, Poststed_idPostnummer FROM student 
INNER JOIN poststed ON student.Poststed_idPostnummer = poststed.idPostnummer
ORDER BY etternavn;