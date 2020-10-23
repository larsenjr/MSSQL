CREATE TABLE resultater (	LopID int NOT NULL AUTO_INCREMENT,
								loypelengde int NOT NULL,
								dato date NOT NULL,
								tid timestamp NOT NULL, 
								plassering VARCHAR(255) NOT NULL,  
								medlemID int NOT NULL,
								PRIMARY KEY(LopID),
                                FOREIGN KEY(medlemID) REFERENCES medlemsregister(medlemsID)
							);