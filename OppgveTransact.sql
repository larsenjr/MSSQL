create table fag (
    FagId int identity(1,1) PRIMARY KEY,
    FagNavn varchar(50) NOT NULL,
    Laerer varchar(50) NOT NULL,
    ISBN varchar(17) CONSTRAINT ISBN_Len_CHECK Check (LEN(ISBN) = 13 or LEN(ISBN) = 17),
    KlasseRom int NULL,
    UNIQUE (ISBN)
)

create table Karakter(
    KarakterId int identity(1,1),
    FagId int CONSTRAINT FK_fag_FagId REFERENCES fag(fagId),
    Karakter tinyint CONSTRAINT Karakter_Check Check (Karakter BETWEEN 1 AND 6),
    studentId int CONSTRAINT FK_karakter_studentId REFERENCES student(studentId),
    PRIMARY KEY (KarakterId),
);

create table KarakterSnitt (
    karakterId int identity (1,1) PRIMARY KEY ,
    studentId int CONSTRAINT FK_Karaktersnitt_StudentId REFERENCES student(studentId),
    fagId int CONSTRAINT FK_Karaktersnitt_fagId REFERENCES fag(FagId),
    karakterSnitt float CONSTRAINT Karaktersnitt_Check Check (KarakterSnitt BETWEEN 1 AND 6)
)

insert into fag (fagNavn, Laerer, ISBN, KlasseRom)
VALUES ('Norsk', 'Kjell',9780735699826, 101),
('Engelsk', 'Per',9780723602879, 10), ('Matte', 'Cato',9780735693122, 105),
('Windows Server', 'Maths',9880131612851, 97):

CREATE FUNCTION dbo.AvgKarakter(@FagId INT, @StudentId INT)
RETURNS FLOAT
AS
    BEGIN
        RETURN (SELECT AVG(CAST(Karakter.Karakter as FLOAT)) FROM Karakter WHERE FagId = @FagId AND StudentId = @StudentId)
    END;

ALTER TABLE Karakter
ADD Karaktersnitt AS dbo.AvgKarakter(FagId, StudentId);

INSERT INTO Karakter(FagId, Karakter, StudentId) VALUES(4, 4, 1);
INSERT INTO Karakter(FagId, Karakter, StudentId) VALUES(5, 3, 2);
INSERT INTO Karakter(FagId, Karakter, StudentId) VALUES(6, 5, 1);
INSERT INTO Karakter(FagId, Karakter, StudentId) VALUES(7, 5, 2);
INSERT INTO Karakter(FagId, Karakter, StudentId) VALUES(5, 3, 2);
INSERT INTO Karakter(FagId, Karakter, StudentId) VALUES(4, 1, 3);