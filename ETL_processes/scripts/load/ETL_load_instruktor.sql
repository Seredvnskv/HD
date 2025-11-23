USE DW_FitnessClub;
GO

IF OBJECT_ID('vETLDim_Instruktor') IS NOT NULL DROP VIEW vETLDim_Instruktor;
GO

CREATE VIEW vETLDim_Instruktor AS

WITH StazInstruktora AS (
	SELECT
		NumerPracownika,
		MIN(DataZajec) AS PierwszeZajecia
	FROM
		FitnessClub.dbo.Zajecia
	GROUP BY NumerPracownika
),

InstruktorT AS (
    SELECT
        I.NumerPracownika,
        CAST(I.Imie + ' ' + I.Nazwisko AS NVARCHAR(60)) AS ImieINazwisko,
        I.Specjalizacja,
        CAST(
            ISNULL(DATEDIFF(DAY, si.PierwszeZajecia, '2025-10-31') / 365.25, 0)
        AS DECIMAL(5, 2)) AS StazLat,
        1 AS IsCurrent
    FROM
        FitnessClub.dbo.Instruktor AS I
    LEFT JOIN
        StazInstruktora AS si ON I.NumerPracownika = si.NumerPracownika
)

SELECT
    NumerPracownika,
    ImieINazwisko,
    Specjalizacja,
    CASE
        WHEN StazLat < 1.0 THEN N'Początkujący'
        WHEN StazLat < 3.0 THEN N'Średnio doświadczony'
        ELSE N'Doświadczony'
    END AS KategoriaStazu,
    IsCurrent
FROM
    InstruktorT;
GO

INSERT INTO Dim_Instruktor
    (NumerPracownika, ImieINazwisko, Specjalizacja, KategoriaStazu, IsCurrent)
SELECT 
    NumerPracownika,
    ImieINazwisko,
    Specjalizacja,
    KategoriaStazu,
    IsCurrent
FROM vETLDim_Instruktor;
GO

DROP VIEW vETLDim_Instruktor;
GO