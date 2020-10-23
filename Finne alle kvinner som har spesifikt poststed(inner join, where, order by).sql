Select * FROM student
INNER JOIN poststed ON poststed.idPostnummer = student.poststed_idPostnummer
WHERE Kjonn = 'female' AND poststed.poststed ='brumunddal'
Order by etternavn;