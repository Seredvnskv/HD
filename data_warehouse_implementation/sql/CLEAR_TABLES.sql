USE DW_FitnessClub;
GO

/* 1. Najpierw czyścimy tabele faktów (bo mają FK do wymiarów) */

DELETE FROM Fact_Uczestnictwo;
DELETE FROM Fact_PrzeprowadzenieZajec;
GO

/* 2. Czyścimy wymiary i junk */

DELETE FROM Dim_Uczestnictwo_Junk;
DELETE FROM Dim_Ocena;
DELETE FROM Dim_Czas;
DELETE FROM Dim_Data;
DELETE FROM Dim_Instruktor;
DELETE FROM Dim_Czlonek;
DELETE FROM Dim_TypZajec;
DELETE FROM Dim_Sala;
GO

/* 3. Opcjonalnie – reset IDENTITY, żeby ID znowu zaczynały się od 1 */

DBCC CHECKIDENT ('Fact_Uczestnictwo', RESEED, 0);
DBCC CHECKIDENT ('Fact_PrzeprowadzenieZajec', RESEED, 0);

DBCC CHECKIDENT ('Dim_Uczestnictwo_Junk', RESEED, 0);
DBCC CHECKIDENT ('Dim_Ocena', RESEED, 0);
DBCC CHECKIDENT ('Dim_Czas', RESEED, 0);
DBCC CHECKIDENT ('Dim_Data', RESEED, 0);
DBCC CHECKIDENT ('Dim_Instruktor', RESEED, 0);
DBCC CHECKIDENT ('Dim_Czlonek', RESEED, 0);
DBCC CHECKIDENT ('Dim_TypZajec', RESEED, 0);
DBCC CHECKIDENT ('Dim_Sala', RESEED, 0);
GO