USE [Jocuri Video]

DROP TABLE Cumparatori_Magazin;
DROP TABLE Jocuri_Magazin;
DROP TABLE Magazine;

ALTER TABLE Firme
DROP COLUMN CEO;

ALTER TABLE Angajati
ADD CEO BIT;

