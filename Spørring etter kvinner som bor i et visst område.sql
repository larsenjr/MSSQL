SELECT fornavn, etternavn, adresse, telefonnummer, kjonn, alder, Poststed_idPostnummer FROM student
INNER JOIN poststed
ON poststed.idPostnummer = student.Poststed_idPostnummer
WHERE Kjonn = 'Female'
AND student.Poststed_idPostnummer = 381
Order by etternavn;
