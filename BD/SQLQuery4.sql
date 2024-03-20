USE [Jocuri Video]

SET IDENTITY_INSERT Firme ON;

ALTER TABLE Firme
ALTER COLUMN adresa NVARCHAR(100);

INSERT INTO Firme(id_firma, nume, adresa) VALUES
(1, 'Ubisoft', '28 Rue Armand Carrel, Montreuil, Franța');

INSERT INTO Firme(id_firma, nume, adresa) VALUES
(2, 'Electronic Arts', '209 Redwood Shores Pkwy, Redwood City, CA, SUA');

INSERT INTO Firme(id_firma, nume, adresa) VALUES
(3, 'Activision Blizzard', '3100 Ocean Park Blvd., Santa Monica, CA, SUA');

INSERT INTO Firme(id_firma, nume, adresa) VALUES
(4, 'Nintendo', '11-1 Kamitoba-hokotate-cho, Minami-ku, Kyoto, Japonia');

INSERT INTO Firme(id_firma, nume, adresa) VALUES
(5, 'Sony Interactive Entertainment', '1-7-1 Konan, Minato-ku, Tokyo, Japonia');

INSERT INTO Firme(id_firma, nume, adresa) VALUES
(6, 'Epic Games', '620 Crossroads Blvd., Cary, NC, SUA');

INSERT INTO Firme(id_firma, nume, adresa) VALUES
(7, 'Valve Corporation', '10400 NE 4th St., Bellevue, WA, SUA');

INSERT INTO Firme(id_firma, nume, adresa) VALUES
(8, 'Square Enix', 'Shinjuku Eastside Square, 6-27-30 Shinjuku, Shinjuku-ku, Tokyo, Japonia');

INSERT INTO Firme(id_firma, nume, adresa) VALUES
(9, 'CD Projekt', 'Jagiellonska 74, 03-301 Warsaw, Polonia');

INSERT INTO Firme(id_firma, nume, adresa) VALUES
(10, 'Bandai Namco Entertainment', 'Sumitomo Fudosan Roppongi Grand Tower 33F, 3-2-1 Roppongi, Minato-ku, Tokyo, Japonia');

SET IDENTITY_INSERT Firme OFF;
SET IDENTITY_INSERT Angajati ON;

INSERT INTO Angajati(id_angajat, nume, prenume, salariu, id_firma, CEO) VALUES
(1, 'Yves', 'Guillemot', 20000, 1, 1),
(2, 'Johnson', 'Jane', 1500, 1, 0),
(3, 'Williams', 'Michael', 1750, 1, 0),
(4, 'Davis', 'Sarah', 1350, 1, 0),
(5, 'Brown', 'David', 1600, 1, 0),
(6, 'Jones', 'Jennifer', 1500, 1, 0),
(7, 'Lee', 'Robert', 1400, 1, 0),
(8, 'Baker', 'Laura', 1450, 1, 0),
(9, 'Clark', 'Daniel', 1700, 1, 0),
(10, 'Rodriguez', 'Jennifer', 1550, 1, 0),
(11, 'Wilson', 'Andrew', 22000, 2, 1),
(12, 'Garcia', 'James', 1250, 2, 0),
(13, 'Hernandez', 'Susan', 1125, 2, 0),
(14, 'Martinez', 'Brian', 1375, 2, 0),
(15, 'Wilson', 'Linda', 1500, 2, 0),
(16, 'Davis', 'John', 1450, 2, 0),
(17, 'Perez', 'Jessica', 1600, 2, 0),
(18, 'Smith', 'Michael', 1650, 2, 0),
(19, 'Taylor', 'Patricia', 1350, 2, 0),
(20, 'Johnson', 'David', 1400, 2, 0),
(21, 'Bobby', 'Kotick', 24000, 3, 1),
(22, 'Thomas', 'Kevin', 1500, 3, 0),
(23, 'Hernandez', 'Barbara', 1250, 3, 0),
(24, 'Lopez', 'Jason', 1125, 3, 0),
(25, 'Clark', 'Susan', 1450, 3, 0),
(26, 'Baker', 'Robert', 1400, 3, 0),
(27, 'Taylor', 'Jennifer', 1550, 3, 0),
(28, 'Anderson', 'Brian', 1600, 3, 0),
(29, 'Wilson', 'Patricia', 1350, 3, 0),
(30, 'Lee', 'Daniel', 1700, 3, 0),
(31, 'Shuntaro', 'Furukawa', 26000, 4, 1),
(32, 'Garcia', 'James', 1250, 4, 0),
(33, 'Hernandez', 'Susan', 1125, 4, 0),
(34, 'Martinez', 'Brian', 1375, 4, 0),
(35, 'Wilson', 'Linda', 1500, 4, 0),
(36, 'Davis', 'John', 1450, 4, 0),
(37, 'Perez', 'Jessica', 1600, 4, 0),
(38, 'Smith', 'Michael', 1650, 4, 0),
(39, 'Taylor', 'Patricia', 1350, 4, 0),
(40, 'Johnson', 'David', 1400, 4, 0),
(41, 'Jim', 'Ryan', 28000, 5, 1),
(42, 'Thomas', 'Kevin', 1500, 5, 0),
(43, 'Hernandez', 'Barbara', 1250, 5, 0),
(44, 'Lopez', 'Jason', 1125, 5, 0),
(45, 'Clark', 'Susan', 1450, 5, 0),
(46, 'Baker', 'Robert', 1400, 5, 0),
(47, 'Taylor', 'Jennifer', 1550, 5, 0),
(48, 'Anderson', 'Brian', 1600, 5, 0),
(49, 'Wilson', 'Patricia', 1350, 5, 0),
(50, 'Lee', 'Daniel', 1700, 5, 0),
(51, 'Sweeney', 'Tim', 30000, 6, 1),
(52, 'Garcia', 'James', 1250, 6, 0),
(53, 'Hernandez', 'Susan', 1125, 6, 0),
(54, 'Martinez', 'Brian', 1375, 6, 0),
(55, 'Wilson', 'Linda', 1500, 6, 0),
(56, 'Davis', 'John', 1450, 6, 0),
(57, 'Perez', 'Jessica', 1600, 6, 0),
(58, 'Smith', 'Michael', 1650, 6, 0),
(59, 'Taylor', 'Patricia', 1350, 6, 0),
(60, 'Johnson', 'David', 1400, 6, 0),
(62, 'Thomas', 'Kevin', 1500, 7, 0),
(63, 'Hernandez', 'Barbara', 1250, 7, 0),
(64, 'Lopez', 'Jason', 1125, 7, 0),
(65, 'Clark', 'Susan', 1450, 7, 0),
(66, 'Baker', 'Robert', 1400, 7, 0),
(67, 'Taylor', 'Jennifer', 1550, 7, 0),
(68, 'Anderson', 'Brian', 1600, 7, 0),
(69, 'Wilson', 'Patricia', 1350, 7, 0),
(70, 'Lee', 'Daniel', 1700, 7, 0),
(71, 'Matsuda', 'Yosuke', 34000, 8, 1),
(72, 'Garcia', 'James', 1250, 8, 0),
(73, 'Hernandez', 'Susan', 1125, 8, 0),
(74, 'Martinez', 'Brian', 1375, 8, 0),
(75, 'Wilson', 'Linda', 1500, 8, 0),
(76, 'Davis', 'John', 1450, 8, 0),
(77, 'Perez', 'Jessica', 1600, 8, 0),
(78, 'Smith', 'Michael', 1650, 8, 0),
(79, 'Taylor', 'Patricia', 1350, 8, 0),
(80, 'Johnson', 'David', 1400, 8, 0),
(91, 'Miyakawa', 'Yasuo', 36000, 10, 1),
(82, 'Thomas', 'Kevin', 1500, 9, 0),
(83, 'Hernandez', 'Barbara', 1250, 9, 0),
(84, 'Lopez', 'Jason', 1125, 9, 0),
(85, 'Clark', 'Susan', 1450, 9, 0),
(86, 'Baker', 'Robert', 1400, 9, 0),
(87, 'Taylor', 'Jennifer', 1550, 9, 0),
(88, 'Anderson', 'Brian', 1600, 9, 0),
(89, 'Wilson', 'Patricia', 1350, 9, 0),
(90, 'Lee', 'Daniel', 1700, 9, 0),
(92, 'Garcia', 'James', 1250, 10, 0),
(93, 'Hernandez', 'Susan', 1125, 10, 0),
(94, 'Martinez', 'Brian', 1375, 10, 0),
(95, 'Wilson', 'Linda', 1500, 10, 0),
(96, 'Davis', 'John', 1450, 10, 0),
(97, 'Perez', 'Jessica', 1600, 10, 0),
(98, 'Smith', 'Michael', 1650, 10, 0),
(99, 'Taylor', 'Patricia', 1350, 10, 0),
(100, 'Johnson', 'David', 1400, 10, 0);


SET IDENTITY_INSERT Angajati OFF;
SET IDENTITY_INSERT Jocuri_Video ON;

INSERT INTO Jocuri_Video(id_joc, nume, id_firma, platforma, pret) VALUES
(1, 'Assassin''s Creed', 1, 'PC, PS4', 49.99),
(2, 'Far Cry 6', 1, 'PC, PS5', 59.99),
(3, 'Just Dance', 1, 'Wii, PS5', 39.99),
(4, 'FIFA 22', 2, 'PC, PS4', 59.99),
(5, 'Madden NFL 22', 2, 'PC, PS5', 59.99),
(6, 'The Sims 4', 2, 'PC', 39.99),
(7, 'Call of Duty: CW', 3, 'PC, PS4', 69.99),
(8, 'Overwatch 2', 3, 'PC, PS5', 59.99),
(9, 'World of Warcraft', 3, 'PC', 49.99),
(10, 'The Legend of Zelda', 4, 'Switch', 59.99),
(11, 'Mario Kart 8', 4, 'Switch', 49.99),
(12, 'Animal Crossing', 4, 'Switch', 49.99),
(13, 'Demon''s Souls', 5, 'PS5', 69.99),
(14, 'Ratchet & Clank', 5, 'PS5', 69.99),
(15, 'Spider-Man: MM', 5, 'PS5', 49.99),
(16, 'Fortnite', 6, 'PC', 0.00),
(17, 'Genshin Impact', 6, 'PC', 0.00),
(18, 'Rocket League', 6, 'PC', 0.00),
(19, 'Half-Life: Alyx', 7, 'PC', 59.99),
(20, 'Portal 2', 7, 'PC', 19.99),
(21, 'Left 4 Dead 2', 7, 'PC', 9.99),
(22, 'Final Fantasy XV', 8, 'PS4', 49.99),
(23, 'Kingdom Hearts III', 8, 'PS4', 59.99),
(24, 'Dragon Quest XI', 8, 'PS4', 49.99),
(25, 'Cyberpunk 2077', 9, 'PC, PS4', 59.99);

INSERT INTO Jocuri_Video(id_joc, nume, id_firma, platforma, pret) VALUES
(26, 'Tekken 7', 10, 'PC, PS4', 49.99),
(27, 'Dark Souls III', 10, 'PC, PS4', 59.99);

SET IDENTITY_INSERT Jocuri_Video OFF;
SET IDENTITY_INSERT Cumparatori ON;


INSERT INTO Cumparatori(id_cumparator, nume, prenume) VALUES
(1, 'Smith', 'John'),
(2, 'Johnson', 'Jane'),
(3, 'Brown', 'David'),
(4, 'Davis', 'Sarah'),
(5, 'Wilson', 'Michael'),
(6, 'Garcia', 'Jessica'),
(7, 'Hernandez', 'Robert'),
(8, 'Taylor', 'Jennifer'),
(9, 'Baker', 'Daniel'),
(10, 'Clark', 'Susan'),
(11, 'Martinez', 'Brian'),
(12, 'Thomas', 'Kevin'),
(13, 'Rodriguez', 'Linda'),
(14, 'Lee', 'James'),
(15, 'Harris', 'Emily'),
(16, 'Young', 'Patricia'),
(17, 'Evans', 'Richard'),
(18, 'Lopez', 'Karen'),
(19, 'Turner', 'Michael'),
(20, 'King', 'Deborah'),
(21, 'Wright', 'Sarah'),
(22, 'Hill', 'Christopher'),
(23, 'Ford', 'Nancy'),
(24, 'Reyes', 'Laura'),
(25, 'Harris', 'Christopher');

SET IDENTITY_INSERT Cumparatori OFF;
SET IDENTITY_INSERT Genuri ON;


INSERT INTO Genuri(id_gen,nume,PG) VALUES
(1, 'Acțiune', 16),
(2, 'Aventură', 10),
(3, 'RPG (Role-playing game)', 12),
(4, 'FPS (First-person shooter)', 18),
(5, 'MOBA (Multiplayer online battle arena)', 13),
(6, 'Strategie', 12),
(7, 'Simulare', 8),
(8, 'Sport', 3),
(9, 'Curse', 6),
(10, 'Puzzle', 3),
(11, 'Horror', 16),
(12, 'Survival', 16),
(13, 'Open-world', 14),
(14, 'Platformer', 6),
(15, 'Fighting', 10);

SET IDENTITY_INSERT Genuri OFF;
SET IDENTITY_INSERT Reviews ON;


INSERT INTO Reviews(id_review,id_joc, id_cumparator, numar_stele) VALUES
(1, 1, 1, 4),
(2, 2, 2, 5),
(3, 3, 3, 4),
(4, 4, 4, 4),
(5, 5, 5, 5),
(6, 6, 6, 3),
(7, 7, 7, 5),
(8, 8, 8, 4),
(9, 9, 9, 5),
(10, 10, 10, 4),
(11, 11, 11, 3),
(12, 12, 12, 4),
(13, 13, 13, 5),
(14, 14, 14, 4),
(15, 15, 15, 5),
(16, 16, 16, 3),
(17, 17, 17, 5),
(18, 18, 18, 4),
(19, 19, 19, 4),
(20, 20, 20, 5),
(21, 21, 21, 3),
(22, 22, 22, 5),
(23, 23, 23, 4),
(24, 24, 24, 5),
(25, 25, 25, 4),
(26, 1, 2, 3),
(27, 1, 3, 5),
(28, 3, 2, 4),
(29, 4, 5, 4),
(30, 5, 6, 5),
(31, 6, 2, 3),
(32, 7, 8, 5),
(33, 8, 9, 4),
(34, 8, 10, 4),
(35, 10, 11, 5),
(36, 11, 12, 3),
(37, 12, 13, 5),
(38, 12, 10, 4),
(39, 12, 15, 5),
(40, 15, 10, 4),
(41, 16, 17, 3),
(42, 17, 18, 4),
(43, 18, 20, 5),
(44, 19, 20, 4),
(45, 20, 21, 5),
(46, 22, 20, 3),
(47, 22, 23, 5),
(48, 25, 24, 4),
(49, 24, 25, 5),
(50, 25, 1, 4);


ALTER TABLE Echipe
ADD specializare_echipa NVARCHAR(50);

ALTER TABLE Echipe
DROP COLUMN nr_persoane;

SET IDENTITY_INSERT Reviews OFF;
SET IDENTITY_INSERT Echipe ON;

INSERT INTO Echipe (id_echipa, nume, specializare_echipa)
VALUES 
(1, 'Echipa Grafică 1', 'Grafică'),
(2, 'Echipa QA 1', 'Quality Assurance'),
(3, 'Echipa Dezvoltare Jocuri 1', 'Game Development'),
(4, 'Echipa Sound Design 1', 'Sound Design'),
(5, 'Echipa Game Design 1', 'Game Design'),
(6, 'Echipa Grafică 2', 'Grafică'),
(7, 'Echipa QA 2', 'Quality Assurance'),
(8, 'Echipa Dezvoltare Jocuri 2', 'Game Development'),
(9, 'Echipa Sound Design 2', 'Sound Design'),
(10, 'Echipa Game Design 2', 'Game Design');

INSERT INTO Angajat_Echipa(id_angajat, id_echipa)
VALUES 
(2,1),(2,2),(2,3),(2,4),(2,5),(3,2),(3,3),(3,5),(5,1),(5,2),(5,5),(6,2),(7,6),(7,7),(8,6),(8,7),(8,8),(8,9),(8,10),(9,7),(9,8),(9,10),(10,10),
(12,11),(12,14),(12,15),(13,15),(14,11),(14,12),(15,11),(15,12),(15,13),(16,11),(17,15),(18,14),(19,11),(19,12),(19,13),(19,14),(20,12),
(22,16),(22,17),(22,18),(22,19),(22,20),(23,21),(23,22),(23,23),(23,24),(23,25),(24,21),(25,17),(25,18),(26,24),(26,25),(27,16),(27,18),(28,20),(29,20),(30,19),(30,20),
(32,26),(33,27),(33,28),(33,29),(34,30),(35,27),(35,28),(36,30),(37,29),(37,30),(38,27),(38,28),(39,30),(40,27),(40,28),
(42,31),(43,32),(44,33),(45,34),(46,35),(47,32),(47,33),(48,31),(48,34),(49,32),(50,32),(42,40),(44,36),(44,37),(44,38),(45,39),(45,40),
(52,41),(52,42),(53,43),(53,44),(53,45),(55,42),(56,40),(57,44),(58,36),(59,43),(60,45),
(62,46),(63,47),(63,48),(64,49),(65,50),(65,51),(66,52),(66,53),(67,54),(68,55),(68,53),(69,52),(70,55),(70,51),(70,52),
(72,56),(72,57),(73,57),(73,58),(73,59),(73,60),(74,56),(74,57),(75,57),(76,60),(77,58),(77,60),(78,60),(79,59),(80,56),
(82,61),(83,62),(84,63),(85,64),(86,65),(87,66),(88,67),(89,68),(90,69),(90,70),(84,67),(83,70),(87,67),
(92,71),(92,73),(92,74),(93,75),(93,76),(93,77),(94,78),(94,79),(95,80),(96,73),(96,75),(97,79),
(98,78),(98,80),(99,71),(99,72),(100,75),(100,79);

INSERT INTO Echipa_Joc(id_joc,id_echipa) VALUES
(1, 1), (1, 2), (1, 3), (1, 4), (1, 5),
(2, 1), (2, 2), (2, 3), (2, 4), (2, 5),
(3, 6), (3, 7), (3, 8), (3, 9), (3, 10),
(4, 11), (4, 12), (4, 13), (4, 14), (4, 15), 
(5, 11), (5, 12), (5, 13), (5, 14), (5, 15),
(6, 11), (6, 12), (6, 13), (6, 14), (6, 15),
(7, 21), (7, 22), (7, 23), (7, 24), (7, 25),
(8, 16), (8, 17), (8, 18), (8, 19), (8, 20),
(9, 16), (9, 17), (9, 18), (9, 19), (9, 20),
(10, 26), (10, 27), (10, 28), (10, 29), (10, 30);

INSERT INTO Echipa_Joc(id_joc,id_echipa) VALUES
(11, 26), (11, 27), (11, 28), (11, 29), (11, 30),
(12, 26), (12, 27), (12, 28), (12, 29), (12, 30),
(13, 31), (13, 32), (13, 33), (13, 35), (13, 36);

INSERT INTO Echipa_Joc(id_joc, id_echipa) VALUES
(13, 37), (13, 38), (13, 39), (13, 40),
(14, 36), (14, 37), (14, 38), (14, 39), (14, 40),
(15, 31), (15, 32), (15, 33), (15, 34), (15, 35),
(16, 41), (16, 42), (16, 43), (16, 44), (16, 45),
(17, 41), (17, 42), (17, 43), (17, 44), (17, 45),
(18, 41), (18, 42), (18, 43), (18, 44), (18, 45),
(19, 46), (19, 47), (19, 48), (19, 49), (19, 50),
(20, 46), (20, 47), (20, 48), (20, 49), (20, 50),(20, 51), (20, 52), (20, 53), (20, 54), (20, 55),
(21, 46), (21, 47), (21, 48), (21, 49), (21, 50),(21, 51), (21, 52), (21, 53), (21, 54), (21, 55),
(22, 56), (22, 57), (22, 58), (22, 59), (22, 60),
(23, 56), (23, 57), (23, 58), (23, 59), (23, 60),
(24, 56), (24, 57), (24, 58), (24, 59), (24, 60),
(25, 61), (25, 62), (25, 63), (25, 64), (25, 65), (25, 66), (25, 67), (25, 68), (25, 69), (25, 70),
(26, 71), (26, 72), (26, 73), (26, 74), (26, 75),
(27, 76), (27, 77), (27, 78), (27, 79), (27, 80);



INSERT INTO Genuri_Jocuri(id_joc,id_gen) VALUES
(1,1),(2,1),(7,1),(13,1),(14,1),(15,1),(16,1),(17,1),(19,1),(25,1),
(1,2),(2,2),(10,2),(11,2),(13,2),(14,2),(15,2),(22,2),(23,2),(24,2),
(9,3),(10,3),(11,3),(13,3),(19,3),(20,3),(22,3),(23,3),(24,3),(25,3),
(7,4),(8,4),(19,4),(20,4),(21,4),
(17,5),
(19,6),(20,6),(21,6),
(6,7),
(4,8),(5,8),
(11,9),(18,9),
(20,10),
(13,11),
(16,12),(17,12),
(25,13),
(14,14),
(22,15),(23,15);

INSERT INTO Joc__cumparator(id_joc, id_cumparator) VALUES
(1, 1),(2, 2),(3, 3),(4, 4),(5, 5),(6, 6),(7, 7),(8, 8),(9, 9),(10, 10),
(11, 11),(12, 12),(13, 13),(14, 14),(15, 15),(16, 16),(17, 17),(18, 18),
(19, 19),(20, 20),(21, 21),(22, 22),(23, 23),(24, 24),
(25, 25),(1, 2),(1, 3),(3, 2),(4, 5),(5, 6),(6, 2),(7, 8),
(8, 9),(8, 10),(10, 11),(11, 12),(12, 13),
(12, 10),(12, 15),(15, 10),(16, 17),(17, 18),(18, 20),(19, 20),
(20, 21),(22, 20),(22, 23),(25, 24),(24, 25),(25, 1);


DELETE FROM Angajat_Echipa;
DELETE FROM Echipa_Joc;

SET IDENTITY_INSERT Echipe ON;

INSERT INTO Echipe (id_echipa, nume, specializare_echipa)
VALUES 
(11, 'Echipa Grafică 1', 'Grafică'),
(12, 'Echipa QA 1', 'Quality Assurance'),
(13, 'Echipa Dezvoltare Jocuri 1', 'Game Development'),
(14, 'Echipa Sound Design 1', 'Sound Design'),
(15, 'Echipa Game Design 1', 'Game Design'),
(16, 'Echipa Grafică 1', 'Grafică'),
(17, 'Echipa QA 1', 'Quality Assurance'),
(18, 'Echipa Dezvoltare Jocuri 1', 'Game Development'),
(19, 'Echipa Sound Design 1', 'Sound Design'),
(20, 'Echipa Game Design 1', 'Game Design'),
(21, 'Echipa Grafică 2', 'Grafică'),
(22, 'Echipa QA 2', 'Quality Assurance'),
(23, 'Echipa Dezvoltare Jocuri 2', 'Game Development'),
(24, 'Echipa Sound Design 2', 'Sound Design'),
(25, 'Echipa Game Design 2', 'Game Design'),
(26, 'Echipa Grafică 1', 'Grafică'),
(27, 'Echipa QA 1', 'Quality Assurance'),
(28, 'Echipa Dezvoltare Jocuri 1', 'Game Development'),
(29, 'Echipa Sound Design 1', 'Sound Design'),
(30, 'Echipa Game Design 1', 'Game Design'),
(31, 'Echipa Grafică 1', 'Grafică'),
(32, 'Echipa QA 1', 'Quality Assurance'),
(33, 'Echipa Dezvoltare Jocuri 1', 'Game Development'),
(34, 'Echipa Sound Design 1', 'Sound Design'),
(35, 'Echipa Game Design 1', 'Game Design'),
(36, 'Echipa Grafică 2', 'Grafică'),
(37, 'Echipa QA 2', 'Quality Assurance'),
(38, 'Echipa Dezvoltare Jocuri 2', 'Game Development'),
(39, 'Echipa Sound Design 2', 'Sound Design'),
(40, 'Echipa Game Design 2', 'Game Design'),
(41, 'Echipa Grafică 1', 'Grafică'),
(42, 'Echipa QA 1', 'Quality Assurance'),
(43, 'Echipa Dezvoltare Jocuri 1', 'Game Development'),
(44, 'Echipa Sound Design 1', 'Sound Design'),
(45, 'Echipa Game Design 1', 'Game Design'),
(46, 'Echipa Grafică 1', 'Grafică'),
(47, 'Echipa QA 1', 'Quality Assurance'),
(48, 'Echipa Dezvoltare Jocuri 1', 'Game Development'),
(49, 'Echipa Sound Design 1', 'Sound Design'),
(50, 'Echipa Game Design 1', 'Game Design'),
(51, 'Echipa Grafică 2', 'Grafică'),
(52, 'Echipa QA 2', 'Quality Assurance'),
(53, 'Echipa Dezvoltare Jocuri 2', 'Game Development'),
(54, 'Echipa Sound Design 2', 'Sound Design'),
(55, 'Echipa Game Design 2', 'Game Design'),
(56, 'Echipa Grafică 1', 'Grafică'),
(57, 'Echipa QA 1', 'Quality Assurance'),
(58, 'Echipa Dezvoltare Jocuri 1', 'Game Development'),
(59, 'Echipa Sound Design 1', 'Sound Design'),
(60, 'Echipa Game Design 1', 'Game Design'),
(61, 'Echipa Grafică 1', 'Grafică'),
(62, 'Echipa QA 1', 'Quality Assurance'),
(63, 'Echipa Dezvoltare Jocuri 1', 'Game Development'),
(64, 'Echipa Sound Design 1', 'Sound Design'),
(65, 'Echipa Game Design 1', 'Game Design'),
(66, 'Echipa Grafică 2', 'Grafică'),
(67, 'Echipa QA 2', 'Quality Assurance'),
(68, 'Echipa Dezvoltare Jocuri 2', 'Game Development'),
(69, 'Echipa Sound Design 2', 'Sound Design'),
(70, 'Echipa Game Design 2', 'Game Design'),
(71, 'Echipa Grafică 1', 'Grafică'),
(72, 'Echipa QA 1', 'Quality Assurance'),
(73, 'Echipa Dezvoltare Jocuri 1', 'Game Development'),
(74, 'Echipa Sound Design 1', 'Sound Design'),
(75, 'Echipa Game Design 1', 'Game Design'),
(76, 'Echipa Grafică 2', 'Grafică'),
(77, 'Echipa QA 2', 'Quality Assurance'),
(78, 'Echipa Dezvoltare Jocuri 2', 'Game Development'),
(79, 'Echipa Sound Design 2', 'Sound Design'),
(80, 'Echipa Game Design 2', 'Game Design');

DELETE FROM Echipe;
SET IDENTITY_INSERT Echipe OFF; 

DELETE FROM Angajat_Echipa
WHERE id_angajat = 56 AND id_echipa = 40;

