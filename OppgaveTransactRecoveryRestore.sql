-- Lage database DBrecovery
create database DBrecovery;

-- Setter databasen i full recovery mode
use [master]
alter database DBrecovery Set recovery full
GO;

-- Legger til tabeller i databasen
use [DBrecovery]
create table kunder (
    kundeID INT IDENTITY(1,1) NOT NULL primary key ,
    fornavn varchar(50) NOT NULL,
    etternavn varchar(50) NOT NULL,
    alder tinyint NOT NULL
);
create table gjester (
    gjesteID INT IDENTITY(1,1) NOT NULL primary key,
    fornavn varchar(50) NOT NULL,
    etternavn varchar(50) NOT NULL,
    alder tinyint NOT NULL
);

-- Setter inn info i tabellene kunder
insert into kunder(fornavn, etternavn, alder)
VALUES('Stian','Larsen',22),('Øyvind', 'Finsrud',22),('Espen', 'Rognstad',21), ('Pete', 'Pettersen', 20 );

-- Setter inn info i tabellen gjester
insert into gjester(fornavn, etternavn, alder)
VALUES('Per','Persson', 53), ('Linus','Linussson', 46),('Alf','Alfsson', 12),('Wilhelm','Drillo Olsen', 74)

-- **Full backup**

-- WITH FORMAT overwriter den siste backupen. Denne backupen blir tom hvis du ikke kjører den uten "backup log" statement!
backup database DBrecovery
-- Spesifiserer "path" til hvor backupen skal lagres.
to disk ='D:\backupDB\DBrecoveryFullBackup.bak'
WITH FORMAT;
GO
-- Backup log for databasen dbrecovery. Brukes for å lagre filene som er i databasen og skrive det inn i samme fil
backup log [DBrecovery]
-- Spesifiserer path til backup log
to disk ='D:\backupDB\DBrecoveryFullBackup.bak';

-- Dropper databasen for å sjekke om restore fungerer!
use [master]
drop database DBrecovery;

-- Recovery av database dbrecovery.
-- https://docs.microsoft.com/en-us/sql/relational-databases/backup-restore/complete-database-restores-full-recovery-model?view=sql-server-2017
use [master]
restore database DBrecovery
-- Spesifiserer path til der fila er lagret.
from disk = 'D:\backupDB\DBrecoveryFullBackup.bak'
-- WITH RECOVERY brukes for at databasen skal være operativ. NORECOVERY gjør databasen NON-OPERATIONAL
with RECOVERY ;

-- Recovery av transaction log
-- https://docs.microsoft.com/en-us/sql/relational-databases/backup-restore/restore-a-transaction-log-backup-sql-server?view=sql-server-2017
restore log DBrecovery
-- Path til backupfila
from disk = 'D:\backupDB\DBrecoveryFullBackup.bak'
-- Viktig at RECOVERY brukes eller så blir databasen ubrukelig.
with recovery;
GO
drop database DBrecovery

-- Eksempel hvis du skal bruke NORECOVERY mode
Restore database DBrecovery
from disk = 'D:\backupDB\DBrecoveryFullBackup.bak'
with norecovery ;
GO
Restore log DBrecovery
from disk = 'D:\backupDB\DBrecoveryFullBackup.bak'
with norecovery;
go
restore database DBrecovery
with recovery ;
go