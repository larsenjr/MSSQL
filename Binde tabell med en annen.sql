CREATE TABLE modeller(
	id INT NOT NULL auto_increment,
    modellnavn VARCHAR (50),
    MerkeID int NOT NULL,
    PRIMARY KEY (id),
    foreign key (MerkeID) REFERENCES bilmerker(id));
    