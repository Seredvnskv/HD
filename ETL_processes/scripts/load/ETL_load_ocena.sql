USE DW_FitnessClub
GO

INSERT INTO Dim_Ocena (Ocena, Komentarz)
SELECT DISTINCT
    COALESCE(CAST(Ocena AS VARCHAR(20)), 'brak oceny') AS Ocena,
    Komentarz
FROM auxiliary.dbo.Ocena;