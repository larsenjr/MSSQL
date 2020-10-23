ModellIDCreate table modeller(
ModellID int NOT NULL auto_increment,
modellnavn varchar (50) NOT NULL,
MerkeID int NOT NULL,
PRIMARY KEY (modellID),
constraint fk_merkeID foreign key (MerkeID) references bilmerker(id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
);