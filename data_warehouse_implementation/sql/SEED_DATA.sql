USE DW_FitnessClub
GO

INSERT INTO Dim_Sala (NumerSali, LimitMiejsc, KategoriaWielkosci) VALUES 
(1, 9, N'mała'),
(2, 18, N'średnia'),
(3, 27, N'duża');
GO

INSERT INTO Dim_TypZajec (Nazwa, KategoriaCzasuTrwania, Opis) VALUES
('Yoga', N'krótkie', 'Zajęcia relaksacyjne i rozciągające'),
('Crossfit', N'średnie', 'Trening siłowo-wytrzymałościowy'),
('Spinning', N'długie', 'Intensywny trening na rowerach stacjonarnych');
GO

INSERT INTO Dim_Czlonek (NumerKartyCzlonkowskiej, ImieINazwisko, Email, KategoriaStazu, IsCurrent) VALUES
('MCFAOW3520', N'Fabian Owsianka', 'fabian.owsianka@wp.pl', 'Nowicjusz', 1),
('MCJUDZ2883', N'Julita Działa', 'julita.dziala@test.com', 'Zaawansowany', 1),
('MCMAMA7973', N'Marcelina Małocha', 'marcelina.malocha@outlook.com', 'Weteran', 1);
GO

INSERT INTO Dim_Instruktor (NumerPracownika, ImieINazwisko, Specjalizacja, KategoriaStazu, IsCurrent) VALUES
('WNMASI7472', N'Karol Maj', 'Yoga', N'początkujący', 1),
('WNSAZA3777', N'Paulina Karp', 'Crossfit', N'średnio doświadczony', 1),
('WNROKU2025', N'Tomasz Lewandowski', 'Spinning', N'doświadczony', 1);
GO

INSERT INTO Dim_Data (Data, Rok, Miesiac, NumerMiesiaca, Dzien, DzienTygodnia, NumerDniaTygodnia, Weekend, Swieta, Wakacje) VALUES
('2024-05-10', 2024, 'May', 5, 10, 'Friday', 5, 'dzień pracujący', 'Brak', 'brak wakacji'),
('2024-01-13', 2024, 'January', 1, 13,'Saturday', 6, 'weekend', 'Brak', 'brak wakacji'),
('2024-02-05', 2024, 'February', 2, 5, 'Monday', 1, 'dzień pracujący', 'Brak', 'brak wakacji');
GO

INSERT INTO Dim_Czas (Godzina, PoraDnia) VALUES
('08:00', 'rano'),
('12:00', 'popołudnie'),
('18:00', 'wieczór');
GO

INSERT INTO Dim_Ocena (Ocena, Komentarz) VALUES
('1', N'bardzo źle'),
('3', N'średnie zajęcia'),
('4', N'dobre zajęcia'),
('5', N'rewelacyjne zajęcia'),
('brak oceny', N'Brak komentarza');
GO

INSERT INTO Dim_Uczestnictwo_Junk (Obecny) VALUES 
(1),
(0),
(1);
GO

INSERT INTO Fact_PrzeprowadzenieZajec
(ID_Instruktor, ID_TypZajec, ID_Sala, ID_Data, ID_Czas,
 LimitMiejsc, LiczbaZapisanych, LiczbaObecnych, Frekwencja,
 CzasTrwania, SredniaOcena, ProcentZapelnienia,
 StazWKlubieInstruktor, SredniStazUczestnikow)
VALUES
(1, 1, 1, 1, 1, 10, 8, 7, 87.5, 45, 4.50, 80.0, 0.5, 1.2),
(2, 2, 2, 2, 2, 20, 15, 13, 86.7, 60, 4.20, 75.0, 2.0, 2.3),
(3, 3, 3, 3, 3, 30, 25, 20, 80.0, 90, 4.70, 83.0, 3.5, 3.1);
GO

INSERT INTO Fact_Uczestnictwo
(ID_PrzeprowadzenieZajec, ID_Czlonek, ID_Ocena, ID_Junk, Ocena, StazWKlubie)
VALUES
    -- Fabian na jodze, obecny, dobra ocena
    (1, 1, 3, 1, 4, 0.3),

    -- Julita na jodze, obecna, najwyższa ocena
    (1 ,2, 4, 1, 5, 1.0),

    -- Marcelina zapisała się na jogę, ale nie przyszła, brak oceny
    (1, 3, 5, 2, NULL, 2.5),

    -- Fabian na CrossFit, obecny, średnia ocena
    (2, 1, 2, 1, 3, 0.5),

    -- Julita na CrossFit, obecna, wysoka ocena
    (2, 2, 4, 1, 5, 1.2),

    -- Marcelina na Spinningu, obecna, bardzo dobra ocena
    (3, 3, 4, 1, 5, 3.0);
GO
