CREATE DATABASE Vizite
GO

USE [Vizite]
GO

CREATE TABLE Tari(
id_tara INT PRIMARY KEY IDENTITY,
nume VARCHAR(50),
continent VARCHAR(50)
)
GO

CREATE TABLE Tineri (
id_tanar INT PRIMARY KEY IDENTITY,
nume VARCHAR(50),
adresa_de_mail VARCHAR(50),
ocupatie VARCHAR(50),
data_nastere DATETIME NOT NULL,
id_tara INT FOREIGN KEY REFERENCES Tari(id_tara) ON UPDATE CASCADE ON DELETE CASCADE
)
GO

CREATE TABLE Categorie(
id_categorie INT PRIMARY KEY IDENTITY,
denumire VARCHAR(50)
)
GO

CREATE TABLE Cluburi (
id_club INT PRIMARY KEY IDENTITY,
nume VARCHAR(50),
descriere VARCHAR(50),
adresa VARCHAR(50),
website VARCHAR(50),
numar_de_telefon VARCHAR(50),
id_categorie INT FOREIGN KEY REFERENCES Categorie(id_categorie) ON UPDATE CASCADE ON DELETE CASCADE
)
GO

CREATE TABLE Vizite(
id_tanar INT FOREIGN KEY REFERENCES Tineri(id_tanar) ON UPDATE CASCADE ON DELETE CASCADE,
zi DATE,
id_club INT FOREIGN KEY REFERENCES Cluburi(id_club) ON UPDATE CASCADE ON DELETE CASCADE,
PRIMARY KEY(id_tanar, zi, id_club),
suma INT,
CONSTRAINT ch_suma CHECK (suma >=1)
)
GO

INSERT INTO Categorie(denumire) VALUES
('denumire_1'),
('denumire_2'),
('denumire_3'),
('denumire_4');
GO

INSERT INTO Tari(nume, continent) VALUES 
('nume_1', 'continent_1'),
('nume_2', 'continent_2'),
('nume_3', 'continent_3'),
('nume_4', 'continent_4'),
('nume_5', 'continent_5');
GO


INSERT INTO Tineri(nume, adresa_de_mail, ocupatie, data_nastere, id_tara) VALUES
('nume_1', 'adresa_de_mail_1','ocupatie_1', '2004-01-23', 1),
('nume_2', 'adresa_de_mail_2','ocupatie_2', '2004-01-23', 1),
('nume_3', 'adresa_de_mail_3','ocupatie_3', '2004-01-24', 2),
('nume_4', 'adresa_de_mail_4','ocupatie_4', '2004-01-24', 2),
('nume_5', 'adresa_de_mail_5','ocupatie_5', '2004-01-25', 3),
('nume_6', 'adresa_de_mail_6','ocupatie_6', '2004-01-25', 4),
('nume_7', 'adresa_de_mail_7','ocupatie_7', '2004-01-26', 5);
GO

INSERT INTO Cluburi(nume, descriere, adresa, website, numar_de_telefon, id_categorie) VALUES
('nume_1', 'descriere_1', 'adresa_1', 'website_1', '0789765767', 1),
('nume_2', 'descriere_2', 'adresa_2', 'website_2', '0789765768', 1),
('nume_3', 'descriere_3', 'adresa_3', 'website_3', '0789765769', 2),
('nume_4', 'descriere_4', 'adresa_4', 'website_4', '0789765760', 3),
('nume_5', 'descriere_5', 'adresa_5', 'website_5', '0789765761', 3),
('nume_6', 'descriere_6', 'adresa_6', 'website_6', '0789765762', 4),
('nume_7', 'descriere_7', 'adresa_7', 'website_7', '0789765763', 4);
GO

INSERT INTO Vizite(id_tanar, zi, id_club, suma) VALUES
(8,'2024-01-26', 1, 24),
(8,'2024-01-26', 2, 24),
(8,'2024-01-26', 3, 24),
(9,'2024-01-27', 1, 24),
(10,'2024-01-27', 2, 24),
(10,'2024-01-28', 3, 24),
(11,'2024-01-28', 4, 24),
(12,'2024-01-29', 5, 24),
(12,'2024-01-29', 6, 24),
(12,'2024-01-29', 7, 24);
GO

CREATE OR ALTER PROCEDURE add_Vizita
(
    @id_tanar varchar(40),
    @zi varchar(40),
    @id_club varchar(40),
    @suma varchar(40)
)
AS
    BEGIN
	DECLARE @valid BIT
        SET @valid = 1

        if not exists(SELECT * FROM Tineri WHERE id_tanar = @id_tanar)
        begin
            SET @valid = 0
            print 'id_tanar does not exist'
        end

		if not exists(SELECT * FROM Cluburi WHERE id_club = @id_club)
        begin
            SET @valid = 0
            print 'id_club does not exist'
        end

        if @valid = 0
        BEGIN
            print 'Invalid data'
            return
        END
		
		if exists(SELECT * FROM Vizite WHERE id_tanar = @id_tanar AND zi = @zi AND id_club = @id_club)
			BEGIN 
				update Vizite
				SET suma = @suma
				WHERE id_tanar = cast(@id_tanar as int) AND zi = cast(@zi as DATE) AND id_club = cast(@id_club as int)
				print 'Insert done'
			END
		if not exists(SELECT * FROM Vizite WHERE id_tanar = @id_tanar AND zi = @zi AND id_club = @id_club)
			BEGIN
				INSERT INTO Vizite VALUES
				(cast(@id_tanar as int), cast(@zi as date), cast(@id_club as int), cast(@suma as int))
				print 'Insert done'
			END
    END
GO


CREATE FUNCTION ReturneazaTineri()
RETURNS TABLE
AS
RETURN
(
    SELECT T.nume, T.adresa_de_mail, SUM(V.suma) as suma_totala, COUNT(*) as numar_vizite
    FROM Tineri T
    INNER JOIN Vizite V ON T.id_tanar = V.id_tanar
    WHERE SUM(V.suma) > 2000 and COUNT(*) > 3
    GROUP BY T.nume, T.adresa_de_mail
);
SELECT * From dbo.ReturneazaTineri

select * from Vizite

exec add_Vizita '8', '2024-01-29', '4', '2000'


