CREATE TABLE medlemsregister (	medlemsID int NOT NULL AUTO_INCREMENT,
								fornavn VARCHAR(255) NOT NULL,
								etternavn VARCHAR(255) NOT NULL,
								adresse VARCHAR(255) NOT NULL,
								Tlf int NOT NULL, 
								poststed VARCHAR(255) NOT NULL, 
								Fodt date NOT NULL,
								kjonn VARCHAR(40) NOT NULL, 
								
								PRIMARY KEY(medlemsID)

							);