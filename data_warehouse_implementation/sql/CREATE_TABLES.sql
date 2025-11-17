USE DW_FitnessClub
GO

CREATE TABLE Dim_Sala
(
    ID_Sala INTEGER IDENTITY(1,1) PRIMARY KEY,
    NumerSali INTEGER NOT NULL,
    LimitMiejsc INTEGER NOT NULL,
    KategoriaWielkosci NVARCHAR(7) NOT NULL CHECK (
        KategoriaWielkosci IN (N'mała', N'średnia', N'duża')
    ),
)

CREATE TABLE Dim_TypZajec 
(
    ID_TypZajec INTEGER IDENTITY(1,1) PRIMARY KEY,
    Nazwa VARCHAR(50) NOT NULL,
    KategoriaCzasuTrwania NVARCHAR(7) NOT NULL CHECK (
        KategoriaCzasuTrwania IN (N'krótkie', N'średnie', N'długie')
    ),
    Opis NVARCHAR(100) NOT NULL,
)

CREATE TABLE Dim_Czlonek
(
    ID_Czlonek INTEGER IDENTITY(1,1) PRIMARY KEY,
    NumerKartyCzlonkowskiej VARCHAR(20) NOT NULL,
    ImieINazwisko NVARCHAR(60) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    KategoriaStazu VARCHAR(20) NOT NULL,
    IsCurrent BIT NOT NULL,
)

CREATE TABLE Dim_Instruktor
(
    ID_Instruktor INTEGER IDENTITY(1,1) PRIMARY KEY,
    NumerPracownika VARCHAR(20) NOT NULL,
    ImieINazwisko NVARCHAR(60) NOT NULL,
    Specjalizacja VARCHAR(50) NOT NULL,
    KategoriaStazu NVARCHAR(20) NOT NULL CHECK (
        KategoriaStazu IN (N'początkujący', N'średnio doświadczony', N'doświadczony')
    ),
    IsCurrent BIT NOT NULL,
)

CREATE TABLE Dim_Data
(
    ID_Data INTEGER IDENTITY(1,1) PRIMARY KEY,
    Data DATE NOT NULL UNIQUE, 
    Rok INTEGER NOT NULL,
    Miesiac VARCHAR(10) NOT NULL CHECK (
        Miesiac IN ('January', 'February', 'March', 'Aprli', 'May', 'June', 'July', 'August',
        'September', 'October', 'November', 'December')
    ),
    NumerMiesiaca INTEGER NOT NULL CHECK (NumerMiesiaca BETWEEN 1 AND 12),
    Dzien INTEGER NOT NULL CHECK (Dzien BETWEEN 1 AND 31),
    DzienTygodnia VARCHAR(9) NOT NULL CHECK (
        DzienTygodnia IN ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday')
    ),
    NumerDniaTygodnia INTEGER NOT NULL CHECK (NumerDniaTygodnia BETWEEN 1 AND 7),
    Weekend NVARCHAR(15) NOT NULL CHECK (Weekend IN ('weekend', N'dzień pracujący')),
    Swieta NVARCHAR(50) NOT NULL CHECK (Swieta IN (N'Boże Narodzenie', 'Wielkanoc', 'Brak')),
    Wakacje VARCHAR(14) NOT NULL CHECK (Wakacje IN ('ferie zimowe', 'wakacje letnie', 'brak wakacji')),
)

CREATE TABLE Dim_Czas
(
    ID_Czas INTEGER IDENTITY(1,1) PRIMARY KEY, 
    Godzina TIME NOT NULL,
    PoraDnia VARCHAR(13) NOT NULL,
)

CREATE TABLE Dim_Ocena
(
    ID_Ocena INTEGER IDENTITY(1,1) PRIMARY KEY,
    Ocena VARCHAR(10) NOT NULL CHECK (
        Ocena IN ('1', '2', '3', '4', '5', 'brak oceny')
    ),
    Komentarz NVARCHAR(50) NOT NULL,
)

CREATE TABLE Dim_Uczestnictwo_Junk
(
    ID_Junk INTEGER IDENTITY(1,1) PRIMARY KEY,
    Obecny BIT NOT NULL,
)

CREATE TABLE Fact_PrzeprowadzenieZajec
(
    ID_PrzeprowadzenieZajec INTEGER IDENTITY(1,1) PRIMARY KEY,

    ID_Instruktor INTEGER NOT NULL REFERENCES Dim_Instruktor(ID_Instruktor), 
    ID_TypZajec INTEGER NOT NULL REFERENCES Dim_TypZajec(ID_TypZajec),
    ID_Sala INTEGER NOT NULL REFERENCES Dim_Sala(ID_Sala),
    ID_Data INTEGER NOT NULL REFERENCES Dim_Data(ID_Data),
    ID_Czas INTEGER NOT NULL REFERENCES Dim_Czas(ID_Czas),
    
    LimitMiejsc INTEGER NOT NULL,
    LiczbaZapisanych INTEGER NOT NULL,
    LiczbaObecnych INTEGER NOT NULL,
    Frekwencja NUMERIC(5,2) NOT NULL,
    CzasTrwania INTEGER NOT NULL,
    SredniaOcena NUMERIC(3,2) NOT NULL,
    ProcentZapelnienia NUMERIC(5,2) NOT NULL,
    StazWKlubieInstruktor NUMERIC(5,2) NOT NULL,
    SredniStazUczestnikow NUMERIC(5,2) NOT NULL,
)

CREATE TABLE Fact_Uczestnictwo
(
    ID_Uczestnictwo INTEGER IDENTITY(1,1) PRIMARY KEY,
    ID_PrzeprowadzenieZajec INTEGER NOT NULL 
        REFERENCES Fact_PrzeprowadzenieZajec(ID_PrzeprowadzenieZajec),
    ID_Czlonek INTEGER NOT NULL REFERENCES Dim_Czlonek(ID_Czlonek),
    ID_Ocena INTEGER NULL REFERENCES Dim_Ocena(ID_Ocena),
    ID_Junk INTEGER NOT NULL REFERENCES Dim_Uczestnictwo_Junk(ID_Junk),
    Ocena NUMERIC(3,2) NOT NULL,
    StazWKlubie NUMERIC(5,2) NOT NULL,
)