Select Fornavn, 
	Etternavn, 
	Adresse, 
	Telefonnummer,
	alder, 
	idPostnummer, 
    kjonn
	Poststed, 
	Fylke 
FROM ((
	student 
    INNER JOIN poststed 
		ON student.Poststed_idPostnummer = poststed.idPostnummer) 
    INNER JOIN fylke 
		ON poststed.Fylke = fylke.fylkenavn)
	ORDER BY fylke.fylkenavn ASC;