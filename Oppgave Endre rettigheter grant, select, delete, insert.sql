use [testdb];
-- Lag global SERVER login.
create login [LompeKnut] with password = N'Kaff3kopp123' MUST_CHANGE ,
    -- databasen som login skal ha tilgang til.
    default_database = [testdb],
    check_expiration = ON;

-- Lag en DATABASEBRUKER som er basert på SQL-innloggingen 'LompeKnut'
CREATE USER LompeKnutDB FOR LOGIN LompeKnut;

Create server role [LompeKnutTest]
Alter server role [LompeKnutTest]
-- Legger til bruker i Rollen LompeKnut.
ADD member [LompeKnut]
GO


-- Gir tilganger til brukeren i testdb.
grant create view to LompeKnut with grant option;
USE [master]
grant select, delete, insert on testdb to [LompeKnutTest]
grant execute, view definition to [LompeKnutTest]