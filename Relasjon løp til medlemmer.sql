ALTER TABLE `resultater` ADD CONSTRAINT `fk_resultater_medlemsID` FOREIGN KEY(`MedlemsID`)
REFERENCES `medlemmer` (`medlemsID`);