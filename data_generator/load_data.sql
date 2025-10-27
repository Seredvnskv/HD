USE FitnessClub;
GO

DELETE FROM Zapis;
DELETE FROM Zajecia;
DELETE FROM Czlonek;
DELETE FROM Instruktor;
DELETE FROM TypZajec;
DELETE FROM Sala;
GO

BULK INSERT Sala
FROM 'C:\Users\Sambor\Python\hd\T1\Sala.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001',
    TABLOCK
);

BULK INSERT TypZajec
FROM 'C:\Users\Sambor\Python\hd\T1\TypZajec.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001',
    TABLOCK
);

BULK INSERT Instruktor
FROM 'C:\Users\Sambor\Python\hd\T1\Instruktor.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001',
    TABLOCK
);

BULK INSERT Czlonek
FROM 'C:\Users\Sambor\Python\hd\T1\Czlonek.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001',
    TABLOCK
);

BULK INSERT Zajecia
FROM 'C:\Users\Sambor\Python\hd\T1\Zajecia.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001',
    TABLOCK
);

BULK INSERT Zapis
FROM 'C:\Users\Sambor\Python\hd\T1\Zapis.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001',
    TABLOCK
);

DELETE FROM Zapis;
DELETE FROM Zajecia;
DELETE FROM Czlonek;
DELETE FROM Instruktor;
DELETE FROM TypZajec;
DELETE FROM Sala;
GO

BULK INSERT Sala
FROM 'C:\Users\Sambor\Python\hd\T2\Sala.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001',
    TABLOCK
);

BULK INSERT TypZajec
FROM 'C:\Users\Sambor\Python\hd\T2\TypZajec.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001',
    TABLOCK
);

BULK INSERT Instruktor
FROM 'C:\Users\Sambor\Python\hd\T2\Instruktor.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001',
    TABLOCK
);

BULK INSERT Czlonek
FROM 'C:\Users\Sambor\Python\hd\T2\Czlonek.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001',
    TABLOCK
);

BULK INSERT Zajecia
FROM 'C:\Users\Sambor\Python\hd\T2\Zajecia.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001',
    TABLOCK
);

BULK INSERT Zapis
FROM 'C:\Users\Sambor\Python\hd\T2\Zapis.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001',
    TABLOCK
);