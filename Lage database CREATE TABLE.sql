Use test


Create table student(
	studentId int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	fornavn VARCHAR (255) NOT NULL,
	etternavn VARCHAR (255) NOT NULL,
	klasse VARCHAR (20) NOT NULL,
	tlf int NOT NULL 
	CONSTRAINT Checktlf CHECK (tlf<99999999),
	adresse VARCHAR (50) NOT NULL,
	postnummer int NOT NULL
	CONSTRAINT Checkpostnummer CHECK(postnummer<9999),
	poststed VARCHAR(50) NOT NULL, 
	epost VARCHAR(100) NOT NULL,
	kjonn VARCHAR(1) NOT NULL, 
	);
