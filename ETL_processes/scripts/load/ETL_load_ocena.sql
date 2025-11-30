USE DW_FitnessClub
GO

MERGE DW_FitnessClub.dbo.Dim_Ocena AS T
USING (
    SELECT DISTINCT
        COALESCE(CAST(Ocena AS varchar(20)), 'brak oceny') AS Ocena,
        Komentarz
    FROM auxiliary.dbo.Ocena
) AS S
ON  T.Ocena = S.Ocena
AND ISNULL(T.Komentarz,'') = ISNULL(S.Komentarz,'')
WHEN NOT MATCHED BY TARGET THEN
    INSERT (Ocena, Komentarz)
    VALUES (S.Ocena, S.Komentarz);