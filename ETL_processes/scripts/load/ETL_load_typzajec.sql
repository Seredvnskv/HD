USE DW_FitnessClub
GO

If (object_id('vETLDIM_TYPZAJEC') is not null) Drop View vETLDIM_TYPZAJEC;
go

CREATE VIEW vETLDIM_TYPZAJEC
AS
SELECT DISTINCT
	[Nazwa],
	CASE
		WHEN [CzasTrwania] <= 45 THEN 'krotkie'
		WHEN [CzasTrwania] BETWEEN 46 AND 89 THEN 'srednie'
		ELSE 'dlugie'
	END AS [KategoriaCzasuTrwania]
FROM [FitnessClub].dbo.[TypZajec]
JOIN [FitnessClub].dbo.[Zajecia] on [FitnessClub].dbo.[Zajecia].[TypZajecID] = [FitnessClub].dbo.[TypZajec].[TypZajecID]
;
GO

INSERT INTO Dim_TypZajec (Nazwa, KategoriaCzasuTrwania)
SELECT 
	[Nazwa],
	[KategoriaCzasuTrwania]
FROM vETLDIM_TYPZAJEC;
GO

DROP VIEW vETLDIM_TYPZAJEC;
GO