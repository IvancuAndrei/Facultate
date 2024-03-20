USE [Jocuri Video]
CREATE TABLE version_control
(
 v INT
);
GO

INSERT INTO version_control VALUES (0);
GO

CREATE PROCEDURE do_v1 AS 
BEGIN 
ALTER TABLE Angajati
ALTER COLUMN salariu MONEY NOT NULL
UPDATE version_control SET v = 1
PRINT 'coloana salariu din tabelul Angajati are acum tipul de date MONEY'
END
GO

CREATE PROCEDURE undo_v1 AS
BEGIN
ALTER TABLE Angajati
ALTER COLUMN salariu INT NOT NULL
UPDATE version_control SET v = 0
PRINT 'coloana salariu din tabelul Angajati are acum tipul de date INT'
END
GO

CREATE PROCEDURE do_v2 AS 
BEGIN 
ALTER TABLE Angajati
ADD CONSTRAINT df_salariu DEFAULT 2000 FOR salariu
UPDATE version_control SET v = 2
PRINT 'coloana salariu din tabelul Angajati are acum ca valoare implicita 2000'
END
GO

CREATE PROCEDURE undo_v2 AS
BEGIN
ALTER TABLE Angajati
DROP CONSTRAINT df_salariu 
UPDATE version_control SET v = 1
PRINT 'coloana salariu din tabelul Angajati nu mai are acum ca valoare implicita 2000'
END
GO

CREATE PROCEDURE do_v3 AS 
BEGIN 
CREATE TABLE Voluntari (
id_voluntar INT PRIMARY KEY IDENTITY, 
nume VARCHAR(20), 
prenume VARCHAR(20),
id_firma INT
)
UPDATE version_control SET v = 3
PRINT 'tabelul Voluntari a fost creat'
END
GO

CREATE PROCEDURE undo_v3 AS
BEGIN
DROP TABLE Voluntari
UPDATE version_control SET v = 2
PRINT 'tabelul Voluntari a fost sters'
END
GO

CREATE PROCEDURE do_v4 AS 
BEGIN 
ALTER TABLE Voluntari
ADD ore_pe_zi INT NOT NULL
UPDATE version_control SET v = 4
PRINT 'coloana ore_pe_zi din tabelul Voluntari a fost creata'
END 
GO

CREATE PROCEDURE undo_v4 AS
BEGIN 
ALTER TABLE Voluntari
DROP COLUMN ore_pe_zi
UPDATE version_control SET v = 3
PRINT 'coloana ore_pe_zi din tabelul Voluntari a fost stearsa'
END
GO

CREATE PROCEDURE do_v5 AS
BEGIN
ALTER TABLE Voluntari
ADD CONSTRAINT fk_firma_id FOREIGN KEY(id_firma) references Firme(id_firma)
UPDATE version_control SET v = 5
PRINT 'constraint-ul pentru id_firma din tabela Voluntari a fost adaugat'
END
GO

CREATE PROCEDURE undo_v5 AS
BEGIN
ALTER TABLE Voluntari
DROP CONSTRAINT fk_firma_id
UPDATE version_control SET v = 4
PRINT 'constraint-ul pentru id_firma din tabela Voluntari a fost stearsa'
END
GO

CREATE PROCEDURE main @vers INT 
AS 
BEGIN
	DECLARE @myVers INT;
	DECLARE @sql NVARCHAR(100);

	SELECT @myVers = v FROM version_control;
	IF @vers > 5
		BEGIN 
			PRINT 'Eroare: versiune inexistenta';
		END
	ELSE IF @vers < 0
		BEGIN 
			PRINT 'Eroare: versiune inexistenta';
		END
	ELSE IF @vers > @myVers
		BEGIN
			WHILE @vers > @myVers
				BEGIN
				SET @myVers  = @myVers + 1;
				SET @sql =  N'EXEC do_v' + CAST(@myVers as NVARCHAR(10));
				EXEC sp_executesql @sql;
		        END
		END
	ELSE IF @vers  < @myVers
		BEGIN
			WHILE @vers < @myVers
		    BEGIN
			SET @sql = N'EXEC undo_v' + CAST(@myVers as NVARCHAR(10));
			EXEC sp_executesql @sql;
			SET @myVers = @myVers -1;
			END
		END
END	
GO

BEGIN TRY
	exec main 8
END TRY
BEGIN CATCH
	PRINT ERROR_MESSAGE()
END CATCH

SELECT * FROM version_control;