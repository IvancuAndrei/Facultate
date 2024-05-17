USE [Jocuri_Video]
GO

CREATE TABLE log_table 
(
	id INT PRIMARY KEY IDENTITY,
	operation_type VARCHAR(20),
	table_name VARCHAR(20),
	execution_time DATETIME,
)
GO

CREATE FUNCTION validate_parameters_angajat(@nume VARCHAR(50), @prenume VARCHAR(50), @salariu INT, @id_firma INT, @CEO BIT)
RETURNS VARCHAR(200)
AS
BEGIN
	DECLARE @error VARCHAR(200)
	SET @error = ''

	IF (@nume = '')
		SET @error = @error + 'Nume cannot be empty'

	IF (@prenume = '')
		SET @error = @error + 'Prenume cannot be empty'

	IF (@salariu < 0) 
		SET @error = @error + 'The salary cannot be negative'

	IF (@id_firma < 0) 
		SET @error = @error + 'The firm id cannot be negative'

	IF (@CEO <> 0 AND @CEO <> 1)
		SET @error = @error + 'CEO must be 1 or 0'

	RETURN @error
END
GO


CREATE FUNCTION validate_parameters_echipa(@nume VARCHAR(50), @specializare VARCHAR(50))
RETURNS VARCHAR(200)
AS
BEGIN
	DECLARE @error VARCHAR(200)
	SET @error = ''

	IF (@nume = '')
		SET @error = @error + 'Nume cannot be empty'

	IF (@specializare = '')
		SET @error = @error + 'Specializare cannot be empty'

	RETURN @error
END
GO

CREATE PROCEDURE insert_into_tables(@nume VARCHAR(50), @prenume VARCHAR(50), @salariu INT, @id_firma INT, @CEO BIT, @nume_echipa VARCHAR(50), @specializare VARCHAR(50))
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		DECLARE @error_msg VARCHAR(200)
		SET @error_msg = dbo.validate_parameters_angajat(@nume, @prenume, @salariu, @id_firma, @CEO)
		IF (@error_msg <> '')
		BEGIN
			PRINT @error_msg
			RAISERROR(@error_msg, 14, 1)
		END
		
		
		INSERT INTO Angajati VALUES (@nume, @prenume,  @salariu, @id_firma, @CEO)
		INSERT INTO log_table VALUES ('INSERT', 'angajat', CURRENT_TIMESTAMP)

		SET @error_msg = dbo.validate_parameters_echipa(@nume_echipa, @specializare)
		IF (@error_msg <> '')
		BEGIN
			PRINT @error_msg
			RAISERROR(@error_msg, 14, 1)
		END

		INSERT INTO Echipe VALUES (@nume_echipa, @specializare)
		INSERT INTO log_table VALUES ('INSERT', 'echipa', CURRENT_TIMESTAMP)
		
		DECLARE @id_angajat INT, @id_echipa INT
		SET @id_angajat = (SELECT MAX(id_angajat) FROM Angajati)
		SET @id_echipa = (SELECT MAX(id_echipa) FROM Echipe)


		INSERT INTO Angajat_Echipa VALUES (@id_angajat, @id_echipa)
		INSERT INTO log_table VALUES ('INSERT', 'Angajat_Echipa', CURRENT_TIMESTAMP)

		COMMIT TRAN
		PRINT 'Transaction commited'
	END TRY
	BEGIN CATCH
		PRINT ERROR_MESSAGE()
		ROLLBACK TRAN
		PRINT 'Transaction rollbacked'
	END CATCH
END



EXEC dbo.insert_into_tables 'numetest', 'prenumetest', 5000, 1, 0, 'echipatest', 'specializaretest';


EXEC dbo.insert_into_tables '', '', -1, -1, -1, 'echipatest', 'specializaretest';
EXEC dbo.insert_into_tables 'numetest', 'prenumetest', 5000, 1, 0, '', '';

select * from log_table
select * from Angajati
select * from Echipe
select * from Angajat_Echipa
go

delete from Angajati where nume = 'numetest'
delete from Echipe where nume = 'echipatest'
delete from log_table
GO



CREATE PROCEDURE insert_into_tables2(@nume VARCHAR(50), @prenume VARCHAR(50), @salariu INT, @id_firma INT, @CEO BIT, @nume_echipa VARCHAR(50), @specializare VARCHAR(50))
AS
BEGIN
	DECLARE @err BIT
	SET @err = 0

	BEGIN TRAN
	BEGIN TRY
		DECLARE @error_msg VARCHAR(200)
		SET @error_msg = dbo.validate_parameters_angajat(@nume, @prenume, @salariu, @id_firma, @CEO)
		IF (@error_msg <> '')
		BEGIN
			PRINT @error_msg
			RAISERROR(@error_msg, 14, 1)
		END
		
		INSERT INTO Angajati VALUES (@nume, @prenume,  @salariu, @id_firma, @CEO)
		INSERT INTO log_table VALUES ('INSERT', 'angajat', CURRENT_TIMESTAMP)

		COMMIT TRAN
		PRINT 'Transaction commited'
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN
		INSERT log_table VALUES ('INSERT ERROR', 'angajat', CURRENT_TIMESTAMP)
		PRINT 'Transaction rollbacked'
		SET @err = 1
	END CATCH

	BEGIN TRAN
	BEGIN TRY
		SET @error_msg = dbo.validate_parameters_echipa(@nume_echipa, @specializare)
		IF (@error_msg <> '')
		BEGIN
			PRINT @error_msg
			RAISERROR(@error_msg, 14, 1)
		END

		INSERT INTO Echipe VALUES (@nume_echipa, @specializare)
		INSERT INTO log_table VALUES ('INSERT', 'echipa', CURRENT_TIMESTAMP)

		COMMIT TRAN
		PRINT 'Transaction commited'
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN
		INSERT log_table VALUES ('INSERT ERROR', 'echipa', CURRENT_TIMESTAMP)
		PRINT 'Transaction rollbacked'
		SET @err = 1
	END CATCH

	IF (@err = 1)
		return

	BEGIN TRAN
	BEGIN TRY
		
		DECLARE @id_angajat INT, @id_echipa INT
		SET @id_angajat = (SELECT MAX(id_angajat) FROM Angajati)
		SET @id_echipa = (SELECT MAX(id_echipa) FROM Echipe)


		INSERT INTO Angajat_Echipa VALUES (@id_angajat, @id_echipa)
		INSERT INTO log_table VALUES ('INSERT', 'Angajat_Echipa', CURRENT_TIMESTAMP)

		COMMIT TRAN
		PRINT 'Transaction commited'
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN
		INSERT log_table VALUES ('INSERT ERROR', 'Angajat_Echipa', CURRENT_TIMESTAMP)
		PRINT 'Transaction rollbacked'
	END CATCH
END


EXEC dbo.insert_into_tables2 'numetest', 'prenumetest', 5000, 1, 0, 'echipatest', 'specializaretest';


EXEC dbo.insert_into_tables2 '', '', -1, -1, -1, 'echipatest', 'specializaretest';
EXEC dbo.insert_into_tables2 'numetest', 'prenumetest', 5000, 1, 0, '', '';


select * from log_table
select * from Angajati order by id_angajat desc
select * from Echipe order by id_echipa desc
select * from Angajat_Echipa order by id_echipa desc

delete from Angajati where nume = 'numetest'
delete from Echipe where nume = 'echipatest'
delete from log_table
GO
select * from log_table