USE DW_FitnessClub
GO

-- Najpierw tabele faktów (mają FK do wymiarów)
DROP TABLE IF EXISTS Fact_Uczestnictwo;
DROP TABLE IF EXISTS Fact_PrzeprowadzenieZajec;

-- Potem wymiary
DROP TABLE IF EXISTS Dim_Uczestnictwo_Junk;
DROP TABLE IF EXISTS Dim_Ocena;
DROP TABLE IF EXISTS Dim_Czas;
DROP TABLE IF EXISTS Dim_Data;
DROP TABLE IF EXISTS Dim_Instruktor;
DROP TABLE IF EXISTS Dim_Czlonek;
DROP TABLE IF EXISTS Dim_TypZajec;
DROP TABLE IF EXISTS Dim_Sala;