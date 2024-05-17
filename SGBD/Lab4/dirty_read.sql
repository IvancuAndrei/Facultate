USE [Jocuri_Video]
GO

CREATE PROCEDURE dirty_read_t1 AS
BEGIN 
	BEGIN TRY
		BEGIN TRAN
		UPDATE Jocuri_Video SET pret = 15 WHERE id_joc = 1
		INSERT INTO log_table VALUES ('UPDATE', 'Jocuri Video', CURRENT_TIMESTAMP)
		WAITFOR DELAY '00:00:05'
		ROLLBACK TRAN
		PRINT 'Transaction rollbacked - good'
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN
		PRINT 'Transaction failed'
	END CATCH
END
GO

CREATE PROCEDURE dirty_reads_t2 AS
BEGIN
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED --solve with read commited
	BEGIN TRY
		BEGIN TRAN
		SELECT * FROM Jocuri_Video
		INSERT INTO log_table VALUES('SELECT', 'Jocuri Video', CURRENT_TIMESTAMP)
		WAITFOR DELAY '00:00:10'
		SELECT * FROM Jocuri_Video
		INSERT INTO log_table VALUES('SELECT', 'Jocuri Video', CURRENT_TIMESTAMP)

		COMMIT TRAN
		PRINT 'Transaction commited'
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN
		PRINT 'Error'
	END CATCH
END
GO


EXEC dirty_read_t1
EXEC dirty_reads_t2

select * from log_table

drop procedure dirty_read_t1
drop procedure dirty_reads_t2

 
delete from log_table


