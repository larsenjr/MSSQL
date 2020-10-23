SQL Prøve

# SQL Prøve
- [SQL Prøve](#sql-pr%c3%b8ve)
  - [Oppgave 1 - Forklar HADR og hvordan man implementerer det på server/clusternivå](#oppgave-1---forklar-hadr-og-hvordan-man-implementerer-det-p%c3%a5-serverclusterniv%c3%a5)
    - [Log shipping](#log-shipping)
    - [Replication](#replication)
  - [Oppgave 2 - Hva vet du om transaksjonsloggen? Hvorfor og hvordan bør denne beskyttes?](#oppgave-2---hva-vet-du-om-transaksjonsloggen-hvorfor-og-hvordan-b%c3%b8r-denne-beskyttes)
  - [Oppgave 3 - Hvilke recovery-modeller har vi, og hva er egenskapene til hver enkelt?](#oppgave-3---hvilke-recovery-modeller-har-vi-og-hva-er-egenskapene-til-hver-enkelt)
    - [Simple](#simple)
    - [Bulk logged recovery](#bulk-logged-recovery)
    - [Full](#full)
  - [Oppgave 4 - Forklar Clustered vs Non-clustered indexes](#oppgave-4---forklar-clustered-vs-non-clustered-indexes)
    - [Clustered index](#clustered-index)
    - [Non-clustered index](#non-clustered-index)
  - [Oppgave 5 - Forklar forskjellen på å bruke en domeneautentisering vs å bruke SQL-autentisering](#oppgave-5---forklar-forskjellen-p%c3%a5-%c3%a5-bruke-en-domeneautentisering-vs-%c3%a5-bruke-sql-autentisering)
  - [Oppgave 6 - Forklar Always-on availability groups, hva poenget er og hvordan det virker](#oppgave-6---forklar-always-on-availability-groups-hva-poenget-er-og-hvordan-det-virker)
  - [Oppgave 7 - Forklar hva disse transact-statements gjør](#oppgave-7---forklar-hva-disse-transact-statements-gj%c3%b8r)
    - [a)](#a)
    - [b)](#b)
    - [c)](#c)
  - [Case](#case)

## Oppgave 1 - Forklar HADR og hvordan man implementerer det på server/clusternivå

High availability disaster recovery (HADR) er en backup platform for å sikre “High Availability” og være forberedt på katastrofe hvis SQL serveren går ned. HADR sikrer datatap gjennom å «speile» data fra en «primærdatabase» til «target database» eller en «standby database». Hvis den ene databasen går ned, tar den andre over som står i standby. HADR støtter opp til tre «standby databaser». Hvis en feil inntreffer, kan HADR hjelpe med å ta over for databasen på sekunder. Standby-databasene kan enten være «inhouse» eller «remote». Man kan konfigurere slik at brukerne blir automatisk sendt til «standbydatabasen»

### Log shipping

Log shipping lar deg legge en kopi av databasen til en «standbyserver». Det må settes opp på hver database. Den bruker SQL Server Agent til å kjøre planlagte jobber. For å konfigurere log shipping må man lage et network share som transaction log kan lagres. Det er visse krav til sikkerheten til denne mappen. Transaction log trenger "READ" og "WRITE" access. Hvis man mioster data og skal restore den blir backupen lastet opp til den andre serveren ved hjelp av server sharet. 

### Replication

Man trenger å «kopiere schema» fra en database til en annen. Det finnes tre forskjellige replication: «transactional, merge og snapshot». Hver type har forskjellige egenskaper som kan gjøre de bedre eller dårligere med enten HA eller DR.

Man implementerer HADR gjennom å beskytte mot serverfailure til hardware eller software. Ved at man implementerer Windows Server Failover Cluster (WSFC)

## Oppgave 2 - Hva vet du om transaksjonsloggen? Hvorfor og hvordan bør denne beskyttes?

Transaksjonsloggen er en logg med alle endringer som er gjort på en SQL server. Transaksjonsloggen er en liste av endringer i databasen og hvis det er noe feil sendes den i «Rollback» og gjenoppretter de endringene som er gjort når databasen ikke har vært aktiv. Hele meningen med transaksjonsloggen er for å få SQL serveren tilbake til "logical state". SQL logger hver endringt il transaksjonsloggen før den skrives inn i databasen. hvor mye som skrives er avhengig av "recovery modellen" som brukes for databasen. Transaksjonsloggen er kritisk for at SQL-serveren skal fungere. Hvis man får en "system-failure" trengs loggen til å gjenopprette databasen. Den bør beskyttes med at man tar regelmessige "full" backups av den og den lagres på to forskjellige steder. En innelåst på lokasjonen, og ha en på en annen lokasjon. 

## Oppgave 3 - Hvilke recovery-modeller har vi, og hva er egenskapene til hver enkelt?

Det er 3 forskjellige recovery models. Vi har `Simple`, `Bulk Logged` og `Full`

### Simple

Simple Recovery model tar for bare som forrige backup. Modellen tar av seg "inserts, updates" og andre databaseaktiviteter. Den er den simpleste måten å ta recovery av modellene. Simple recovery støtter full, differential og file level backups. Simple recovery tar ikke med `transaction log`. Man bruker simple recovery hvis man ikke har noe data som er kritisk til å miste, kan brukes som testmiljø.

### Bulk logged recovery

Bulk logged recovery fungerer på samme måte som "Full recovery" utenom at visse operasjoner minimeres. Fordelen med bulk logged recovery er at den bruker minimalt med ressurser for å hindre store loggfiler. Den kan brukes hvis SQL serveren er utsatt for periodiske operasjoner.

### Full

Full recovery modell tar backup av alt, inkludert transaction-log fila. Alle restore operasjoner er supportert som vil si at man kan ta backup og recovery på databasen til hvilket som helst tidspunkt. Full backup recovery fordeler er at man tar backup av alt og det minimerer risikoen for datatap. - Tar backup av alt - Adds PiT

## Oppgave 4 - Forklar Clustered vs Non-clustered indexes

### Clustered index
Clustered index er en måte å å sortere data og presentere det som er "viktig" i sin helhet. Clustered Index sorterer data og lagrer data i rader i tabeller og viser det som er basert på hva man har lyst til å se. Clustered index inneholder grunnleggende data og det kan kun lages en "clustered index" per tabell.

### Non-clustered index
Non-clustered index er en separat struktur som bare bruker strukturen til å referere til clustered index. Det vil si at det er data som kan ha en annen sorteringsrekkefølge.

## Oppgave 5 - Forklar forskjellen på å bruke en domeneautentisering vs å bruke SQL-autentisering

Domeneautentisering er at brukeren eller kontoen som bruker er i Active directory fra domene. SQL sjekker om brukeren er aktiv, og hvilke tilganger brukeren har. Hvis brukeren har tilgang vil ikke SQL-serveren spørre om passord. 

SQL-autentisering er en separat tilgang som implementeres i SQL-serveren. Det har ingen relasjon til Windows. Tilgangen er styrt gjennom Masterdatabasen på hver SQL-server. Det vil si at hvis man har flere SQL-servere trenger man å legge inn tilgangen på alle serverne. Ved å bruke SQL authentication får man muligheten til å "overskrive" domene policyer, men det kan være et problem for sikkerheten til databasen h

## Oppgave 6 - Forklar Always-on availability groups, hva poenget er og hvordan det virker

Always-on availability groups er en gruppe som består av failovermiljø mot en gruppe brukere til databasen. Den beskytter databasen basert på hva man har satt i backupinstillinger og prioriterer de konfiguert for den aktuelle gruppen og gir tilgang til for å starte sikkerhetskopieringer og gjenoppretting. En Availability gruop er en logisk gruppering av en eller flere grupper. Det brukes for å få tilganger for klienter. Når en database dør lages det en enkel tilgang for brukerne til å utføre sikkerhetskopiering eller gjenoppretting.

## Oppgave 7 - Forklar hva disse transact-statements gjør

### a)

```sql
USE Bokhandel
GO
Select * FROM Forfattere WHERE Etternavn ='Hansen'
```
**Forklaring:**
Bruker databasen `Bokhandel`.
Velger alle `(*)` fra tabellen `Forfattere` som har etternavn `'Hansen'`

### b)

```sql
USE Bokhandel
GO
Alter TABLE Forfatter ADD Internnr INT IDENTITY (10,1) PRIMARY KEY
```

**Forklaring:**
Bruker fortsatt databasen Bokhandel

Legger til en kolonne i tabellen som heter `Internnr`. Det skal være en `INT`, samtidig som den er `AUTOINCREMENT` med `Identity(10,1)`. for hver kolonne skal det legges til 1 så det blir `10, 11, 12` osv. Tilslutt skal det være en primary key.

### c)

```sql
USE LagerDB
GO
CREATE TABLE Deler (Delenr INT IDENTITY (10,1)PRIMARY KEY , Delnavn char(200), Hyllenr numeric(8,0), Beskrivelse char(200))
GO
insert into deler
VALUES ('Torxskrue',1234, '4 tommers linkskrudd torxskrue med vrengte gjenger')
GO
Select * FROM Deler WHERE Delenr < 30
GO
Delete FROM Deler WHERE Delenr < 30
GO
DROP TABLE Deler
```

**Forklaring:**

Bruker database `LagerDB`. Med `CREATE TABLE` legges det til en tabell som heter `Deler`. I tabellen legges det til `Delenr` som skal være en `INT`, `IDENTITY(10,1)` er `AUTOINCREMENT` (Som starter fra 10) og `PRIMARY KEY` som er primærnøkkelen til tabellen.
`Delnavn char(200)` legger til navn, skal ha `Characters` som er limited til 200 chars.  `Hyllenr numeric(8,0), Beskrivelse char(200)`  legger til en kolonne `Hyllenr` som sier at det skal være 8 sifre, men det ikke skal være sifre etter punktum. `Beskrivelse` skal ha bokstaver som max antall er `200`

## Case
```sql
create table klovner (
    -- AutoIncrement sørger for at klovnenummer fylles inn automatisk. Starter på 1 og øker med 1 gang
    Klovnenummer INT IDENTITY(1,1) PRIMARY KEY,
    Fornavn VARCHAR(50) NOT NULL,
    Etternavn VARCHAR(50) NOT NULL,
    -- Setter "UNIQUE" slik at klovner ikke kan ha likt artistnavn
    Artistnavn VARCHAR(50) NOT NULL UNIQUE,
    Postnr SMALLINT NOT NULL,
    Poststed VARCHAR(50) NOT NULL
)
create table Klovneutstyr (
    -- AutoIncrement sørger for at lanenummer fylles inn automatisk. starter på 1000 og legger på 1 hver gang
    Lanenummer INT IDENTITY(1000,1) PRIMARY KEY,
    Beskrivelse VARCHAR(255),
    -- Setter automatisk timestamp for utlevert dato
    Utlant_Dato DATE DEFAULT CURRENT_TIMESTAMP,
    Innlevert_Dato DATE NULL,
    -- Setter klovnenummer så den sjekker klovnetabellen. hvis det ikke finnes får man ikke lånt utstyr
    Klovnenummer INT,
    CONSTRAINT FK_Klovneutstyr_Klovner_Klovnenummer FOREIGN KEY (Klovnenummer)
        REFERENCES Klovner(Klovnenummer)
)
create table utbytte (
    -- AutoIncrement sørger for at arkivnummer fylles inn automatisk. starter på 500 og øker med 10
    Arkivnummer INT IDENTITY (500,10) PRIMARY KEY,
    Klovnenummer INT,
    CONSTRAINT FK_Utbytte_Klovner_Klovnenummer FOREIGN KEY (Klovnenummer) REFERENCES Klovner(Klovnenummer),
    -- Skatt og nettutbytte regnes ut automatisk. Setter 9-tall for at man har en limit på decimalen.
    -- 2 for å ha to desimaler etter punktum
    Bruttoutbytte DECIMAL(9,2),
    -- Skatt skulle være 35% derfor ganger man bruttoutbytte med 0,35 som er 35%
    Skatt AS(Bruttoutbytte * 0.35),
    -- Legger til bruttutbytte - skatt.
    Nettoutbytte AS (Bruttoutbytte -(Bruttoutbytte * 0.35))
)
-- Legger inn verdier i tabellene.
insert into klovner (fornavn, etternavn, artistnavn, postnr, poststed)
VALUES ('Stian', 'Larsen', 'El Chapo', 2320 , 'FURNES'),
       ('Alex', 'Finsrud', 'Flikkaren', 2380 , 'Brumunddal'),
       ('Oyvind', 'Thomassen', 'The Oldmighty', 1220 , 'Bærum'),
       ('Svein', 'Kristiansen', 'Kjekken', 2830 , 'Trysil');

insert into Klovneutstyr (beskrivelse, Utlant_Dato, innlevert_dato, klovnenummer)
 VALUES ('Blå nese','2019-03-18', '2019-06-15', 2), ('Parykk','2019-11-07', '2019-01-12', 3)

 insert into utbytte (Klovnenummer, Bruttoutbytte)
 VALUES (1,5000), (2,7500), (3, 10000)

-- Sjekk tabellene
 select * from klovner;
select * from Klovneutstyr;
select * from utbytte;
```