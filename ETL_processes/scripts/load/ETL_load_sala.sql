USE DW_FitnessClub
GO

If (object_id('vETLDIM_SALA') is not null) Drop View vETLDIM_SALA;
go

CREATE VIEW vETLDIM_SALA
AS
SELECT DISTINCT
	[NumerSali],
	CASE
		WHEN [LimitMiejsc] < 10 THEN N'mała'
		WHEN [LimitMiejsc] BETWEEN 10 AND 20 THEN N'średnia'
		ELSE N'duża'
	END AS [KategoriaWielkosci]
FROM [FitnessClub].dbo.[Sala]
;
GO

INSERT INTO Dim_Sala (NumerSali, KategoriaWielkosci)
SELECT 
	[NumerSali],
	[KategoriaWielkosci]
FROM vETLDIM_SALA;
GO

DROP VIEW vETLDIM_SALA;
GO