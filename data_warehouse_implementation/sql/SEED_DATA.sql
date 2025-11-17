USE DW_FitnessClub
GO

INSERT INTO Dim_Sala (NumerSali, KategoriaWielkosci) VALUES 
(1, N'mała'),
(2, N'średnia'),
(3, N'duża');
GO

INSERT INTO Dim_TypZajec (Nazwa, KategoriaCzasuTrwania, Opis) VALUES
('Yoga', N'krótkie', 'Zajęcia relaksacyjne i rozciągające'),
('Crossfit', N'średnie', 'Trening siłowo-wytrzymałościowy'),
('Spinning', N'długie', 'Intensywny trening na rowerach stacjonarnych');
GO

INSERT INTO Dim_Czlonek (NumerKartyCzlonkowskiej, ImieINazwisko, Email, KategoriaStazu, IsCurrent) VALUES
('1001', N'Jan Kowalski', 'jan.k@example.com', 'Nowicjusz', 1),
('1002', N'Anna Nowak', 'anna.n@example.com', 'Zaawansowany', 1),
('1003', N'Marek Zielinski', 'marek.z@example.com', 'Weteran', 1);
GO

INSERT INTO Dim_Instruktor (NumerPracownika, ImieINazwisko, Specjalizacja, KategoriaStazu, IsCurrent) VALUES
('I001', N'Karol Maj', 'Yoga', N'początkujący', 1),
('I002', N'Paulina Karp', 'Crossfit', N'średnio doświadczony', 1),
('I003', N'Tomasz Lewandowski', 'Spinning', N'doświadczony', 1);
GO

INSERT INTO Dim_Data (Data, Rok, Miesiac, NumerMiesiaca, Dzien, DzienTygodnia, NumerDniaTygodnia, Weekend, Swieta, Wakacje) VALUES
('2024-05-10', 2024, 'May', 5, 10, 'Friday', 5, 'dzień pracujący', 'Brak', 'brak wakacji'),
('2024-05-11', 2024, 'May', 5, 11, 'Saturday', 6, 'weekend', 'Brak', 'brak wakacji'),
('2024-05-12', 2024, 'May', 5, 12, 'Sunday', 7, 'weekend', 'Brak', 'brak wakacji');
GO

INSERT INTO Dim_Czas (Godzina, PoraDnia) VALUES
('08:00', 'rano'),
('12:00', 'popołudnie'),
('18:00', 'wieczór');
GO

INSERT INTO Dim_Ocena (Ocena, Komentarz) VALUES
('5', N'Zajęcia świetne'),
('4', N'Dobre zajęcia'),
('3', N'Przeciętnie'),
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
(1, 1, 1, 1, 5.0, 0.4),
(1, 2, 2, 3, 4.0, 1.5),
(2, 3, 3, 1, 3.0, 2.2);
GO
