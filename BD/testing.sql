USE [Jocuri Video]
GO

INSERT INTO Tables(Name) VALUES
('Echipe'),
('Angajati'),
('Angajat_Echipa');
GO



CREATE OR ALTER VIEW VEchipe
AS
SELECT E.id_echipa, E.nume
FROM Echipe E
GO

CREATE OR ALTER VIEW VAngajati
AS
SELECT A.nume, A.prenume, F.nume as nume_firma
FROM Angajati A
INNER JOIN Firme F on F.id_firma = A.id_firma
GO

CREATE OR ALTER VIEW VAngajat_Echipa
AS
SELECT E.nume, COUNT(*) AS 'Angajati'
FROM Angajat_Echipa AE
INNER JOIN Angajati A ON AE.id_angajat = A.id_angajat
INNER JOIN Echipe E on E.id_echipa = AE.id_echipa
GROUP BY E.nume
GO

INSERT INTO Views VALUES 
('VEchipe'),
('VAngajati'),
('VAngajat_Echipa');



INSERT INTO Tests(Name) VALUES
('main');
GO

Select * from Tests


INSERT INTO TestTables VALUES
(1, 1, 1000, 3),
(1, 2, 1000, 2),
(1, 3, 1000, 1);
GO


INSERT INTO TestViews VALUES
(1,1),
(1,2),
(1,3)
GO

CREATE or ALTER PROCEDURE InsertEchipe (@rows int)
AS
BEGIN
	DECLARE @id int
	DECLARE @nume VARCHAR(50)
	DECLARE @specializare VARCHAR(50)
	DECLARE @i int
	DECLARE @lastId int
	SET @nume='NumeEchipaRandom'
	SET @specializare='SpecializareRandom'
	
	SET @id=2000
	
	SET @i=1

	WHILE @i<=@rows
	BEGIN
		SET @id = 2000 + @i
		SELECT TOP 1 @lastId = E.id_echipa FROM dbo.Echipe E ORDER BY E.id_echipa DESC
		IF @lastId >2000
		SET @id=@lastId+1
        SET IDENTITY_INSERT Echipe ON
		INSERT INTO Echipe(id_echipa, nume, specializare_echipa) VALUES (@id, @nume, @specializare)
		SET IDENTITY_INSERT Echipe OFF
        SET @i=@i+1
		SET @id = @id + 1
	END

END
GO

CREATE or ALTER PROCEDURE InsertAngajati (@rows int)
AS
BEGIN
	DECLARE @id INT
	DECLARE @nume VARCHAR(50)
	DECLARE @prenume VARCHAR(50)
	DECLARE @salariu INT
	DECLARE @id_firma INT 
	DECLARE @CEO BIT
	DECLARE @i int
	DECLARE @lastId int

	SET @nume='numeRandom'
	SET @prenume = 'prenumeRandom'
	SET @salariu = 2000
	SET @id_firma = 1
	SET @CEO = 0  
	SET @id=2000
	SET @i=1

	WHILE @i<=@rows
	BEGIN
		SET @id=2000+@i
		SELECT TOP 1 @lastId = A.id_angajat FROM dbo.Angajati A ORDER BY A.id_angajat DESC
		IF @lastId >2000
			SET @id=@lastId+1
        SET IDENTITY_INSERT Angajati ON
        INSERT INTO Angajati(id_angajat, nume, prenume, salariu, id_firma, CEO) VALUES (@id, @nume, @prenume, @salariu, @id_firma, @CEO)
		SET IDENTITY_INSERT Angajati OFF
        SET @i=@i+1
	END

END
GO

CREATE or ALTER PROCEDURE InsertAngajatEchipa (@rows int)
AS
BEGIN
	DECLARE @i int
	SET @i=@rows

	DECLARE @idA int, @nume VARCHAR(50), @prenume VARCHAR(50), @salariu INT, @id_firma INT, @CEO BIT;
	
	DECLARE cursorAng CURSOR SCROLL FOR
	SELECT id_angajat, nume , prenume, salariu, id_firma, CEO FROM Angajati;
	OPEN cursorAng;
	FETCH LAST FROM cursorAng INTO @idA, @nume , @prenume, @salariu, @id_firma, @CEO;

	WHILE @i>0 AND @@FETCH_STATUS=0
		BEGIN
		INSERT INTO Angajat_Echipa VALUES (@idA, 2001)
		FETCH PRIOR FROM cursorAng INTO @idA, @nume , @prenume, @salariu, @id_firma, @CEO;
		SET @i=@i-1
	END

	CLOSE cursorAng;
	DEALLOCATE cursorAng;
END
GO

CREATE OR ALTER PROCEDURE Insert1000 (@Table VARCHAR(20))
AS
BEGIN
	IF @Table='Echipe'
	exec InsertEchipe 1000
	IF @Table='Angajati'
	exec InsertAngajati 1000
	IF @Table='Angajat_Echipa'
	exec InsertAngajatEchipa 1000
END
GO



CREATE OR ALTER PROCEDURE Eval (@View VARCHAR(20))
AS
BEGIN
	IF @View='Echipe'
	select * from VEchipe
	IF @View='Angajati'
	select * from VAngajati
	IF @View='Angajat_Echipa'
	select * from VAngajat_Echipa
END
GO

CREATE OR ALTER PROCEDURE DeleteTable (@tableName VARCHAR(30))
AS
BEGIN
	IF @tableName='Echipe'
	DELETE Echipe
	IF @tableName='Angajati'
	DELETE Angajati
	IF @tableName='Angajat_Echipa'
	DELETE Angajat_Echipa
END
GO

CREATE OR ALTER PROCEDURE main 
AS
BEGIN
	DECLARE @startMain datetime, @stopMain datetime, @startInsert datetime, @stopInsert datetime, @startView datetime, @stopView datetime
	DECLARE @currentIdTestRuns INT
	DECLARE @testDescription NVARCHAR(200)
	
	SET @testDescription = 'Test Stergeri Inserari si View-uri pe Echipe, Angajati, Angajat_Echipa'
	SET @startMain = GETDATE()

	INSERT INTO TestRuns(Description, StartAt) VALUES (@testDescription,@startMain)
	SELECT TOP 1 @currentIdTestRuns = T.TestRunID FROM TestRuns T ORDER BY T.TestRunID  DESC

	DECLARE @nameTable VARCHAR(50), @position INT, @nrRows INT
	DECLARE CursorDelete CURSOR FOR
	    SELECT T.Name, TT.Position
	    FROM Tables T
	    JOIN TestTables TT ON T.TableID = TT.TableID 
	    WHERE TT.TestID = 1
	    ORDER BY TT.Position ASC;

	OPEN CursorDelete
	FETCH NEXT FROM CursorDelete INTO @nameTable, @position

	WHILE @@FETCH_STATUS = 0
	BEGIN
		EXEC DeleteTable @nameTable
	    FETCH NEXT FROM CursorDelete INTO @nameTable, @position
	END
	
	CLOSE CursorDelete
	DEALLOCATE CursorDelete
	
	

	
	DECLARE @tableID INT
	DECLARE @insertMethod VARCHAR(50)

	DECLARE CursorInsert CURSOR FOR
	    SELECT T.Name, TT.Position, TT.NoOfRows, T.TableID 
	    FROM Tables T
	    JOIN TestTables TT ON T.TableID = TT.TableID 
	    WHERE TT.TestID = 1
	    ORDER BY TT.Position DESC;
	   
	SELECT * FROM TestTables 
	SELECT * FROM Tables  

	OPEN CursorInsert
	FETCH NEXT FROM CursorInsert INTO @nameTable, @position, @nrRows, @tableID
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @startInsert = GETDATE() 
		EXEC Insert1000 @nameTable
		SET @stopInsert = GETDATE() 
		INSERT INTO TestRunTables VALUES (@currentIdTestRuns, @tableID ,@startInsert ,@stopInsert)
	    FETCH NEXT FROM CursorInsert INTO @nameTable, @position, @nrRows, @tableID
	END
	
	CLOSE CursorInsert
	DEALLOCATE CursorInsert
	


	DECLARE @nameView NVARCHAR(50), @viewID INT, @executeSQL NVARCHAR(100)
	
	DECLARE CursorView CURSOR FOR
	    SELECT V.Name, V.ViewID 
	    FROM Views V
	    JOIN TestViews TV ON V.ViewID = TV.ViewID 
	    WHERE TV.TestID = 1;

	OPEN CursorView
	FETCH NEXT FROM CursorView INTO @nameView, @viewID
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @executeSQL = N'SELECT * FROM ' + @nameView
		SET @startView = GETDATE()
		EXEC sp_executesql @executeSQL
		SET @stopView = GETDATE() 
		PRINT 2
		INSERT INTO TestRunViews  VALUES (@currentIdTestRuns,@viewID ,@startView ,@stopView)
	    FETCH NEXT FROM CursorView INTO @nameView, @viewID
	END
	
	CLOSE CursorView
	DEALLOCATE CursorView
	
	SET @stopMain = GETDATE() 
	UPDATE TestRuns SET EndAt = @stopMain WHERE TestRunID = @currentIdTestRuns
END
GO

EXEC main

select * from TestRuns
select * from TestRunTables
select * from TestRunViews

DELETE TestRuns
DELETE TestRunTables
DELETE TestRunViews
