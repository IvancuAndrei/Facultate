USE [Jocuri Video]
GO

ALTER TABLE Jocuri_Video
ADD CONSTRAINT ck_NameValidation CHECK (LEN(LTRIM(nume)) >=2);
GO

ALTER TABLE Jocuri_Video
ADD CONSTRAINT ck_PlatformValidation CHECK (LEN(LTRIM(platforma)) >=2);
GO



ALTER TABLE Jocuri_Video
ADD CONSTRAINT ck_PriceValidation CHECK (pret >= 0);
GO

ALTER TABLE Reviews
ADD CONSTRAINT ck_NumberOfStarsValidation CHECK (numar_stele > 0);
GO

CREATE OR ALTER FUNCTION validateJocId
(
    @id INT
)
RETURNS BIT
AS
    BEGIN
        if not exists (SELECT * FROM Jocuri_Video WHERE id_joc = @id)
        begin
            return 0
        end
        return 1
    END
GO

CREATE OR ALTER FUNCTION validateName
(
    @name VARCHAR(40)
)
RETURNS BIT
AS
    BEGIN
        if @name is null
            return 1
        if LTRIM(@name) = ''
            return 0
        if LEN(@name) < 2
            return 0

        DECLARE @len INT
        SET @len = LEN(@name)

        DECLARE @index INT
        SET @index = 1

        WHILE @index < @len
        BEGIN
            IF NOT SUBSTRING(@name, @index, 1) LIKE '%[\-a-zA-z]'
                return 0

            SET @index = @index + 1
        END

        return 1
    END
GO

CREATE OR ALTER FUNCTION validateNumber
(
    @number varchar(40)
)
RETURNS BIT
AS
BEGIN
    IF @number IS NULL
        RETURN 0 
    IF LTRIM(@number) = ''
        RETURN 0

    DECLARE @len INT
    SET @len = LEN(@number)

    DECLARE @index INT
    SET @index = 1

    DECLARE @car CHAR

    WHILE @index <= @len
    BEGIN
        SELECT @car = SUBSTRING(@number, @index, 1)

        
        IF @index = 1 AND @car = '0'
            RETURN 0

        IF ISNUMERIC(@car) != 1
            RETURN 0

        SET @index = @index + 1
    END

    RETURN 1
END
GO

CREATE OR ALTER PROCEDURE add_Jocuri
(
    @nume varchar(40),
    @id_firma varchar(40),
    @platforma varchar(40),
    @pret varchar(40)
)
AS
    BEGIN
        DECLARE @valid BIT
        SET @valid = 1

        if dbo.validateNumber(@id_firma) = 0
        begin
            SET @valid = 0
            print 'Id_firma is not a number'
        end
		if dbo.validateNumber(@pret) = 0
        begin
            SET @valid = 0
            print 'Pret is not a number'
        end
        if dbo.validateName(@nume) = 0
        begin
            SET @valid = 0
            print 'Nume is not a string'
        end
		if dbo.validateName(@platforma) = 0
        begin
            SET @valid = 0
            print 'Platforma is not a string'
        end
        if not exists(SELECT * FROM Firme WHERE id_firma = @id_firma)
        begin
            SET @valid = 0
            print 'The firm id does not exist'
        end

        if @valid = 0
        BEGIN
            print 'Invalid data'
            return
        END
 
	   INSERT INTO Jocuri_Video VALUES
	   (@nume, cast(@id_firma as int), @platforma, @pret)
	   print 'Insert done'
    END
GO

create or alter procedure get_Jocuri
(
	@id varchar(50)
)
as
begin

	if dbo.validateNumber(@id) = 0
	begin
		print 'Invalid Data'
		return
	end
	
	if not exists(select * from Jocuri_Video where Jocuri_Video.id_joc = cast(@id as bigint))
	begin
		print 'id is not found in table Jocuri_Video'
		return
	end

	select * from Jocuri_Video where Jocuri_Video.id_joc = cast(@id as bigint)
	print 'Game found succesfully'
		
end
go

create or alter procedure delete_Jocuri_Video
(
	@id varchar(50)
)
as
begin
	if dbo.validateNumber(@id) = 0
	begin
		print 'Invalid Data'
		return
	end
	
	if not exists(select * from Jocuri_Video where Jocuri_Video.id_joc = cast(@id as bigint))
	begin
		print 'id is not found in table Jocuri_Video'
		return
	end

	delete Jocuri_Video where Jocuri_Video.id_joc = cast(@id as bigint)

	print 'product deleted succesfully'

end
go

create or alter procedure update_Jocuri_Video
(
	@id varchar(50),
	@nume varchar(40),
    @id_firma varchar(40),
    @platforma varchar(40),
    @pret varchar(40)
)
as
begin
	declare @valid bit
    set @valid = 1

	if dbo.validateNumber(@id) = 0
        set @valid = 0
    if dbo.validateName(@nume) = 0
        set @valid = 0
	if dbo.validateNumber(@id_firma) = 0
        set @valid = 0
	if dbo.validateName(@platforma) = 0
        set @valid = 0
	if dbo.validateNumber(@pret) = 0
        set @valid = 0

	if @valid = 0
	begin
		print 'invalid data'
		return
	end
	
	if not exists(select * from Jocuri_Video where Jocuri_Video.id_joc = cast(@id as bigint))
	begin
		print 'id is not found in table Jocuri_Video'
		return
	end

	if not exists(select * from Firme where Firme.id_firma = cast(@id_firma as bigint))
	begin
		print 'id_firma is not found in table Firme'
		return
	end

	update Jocuri_Video set Jocuri_Video.nume = @nume, id_firma = cast(@id_firma as bigint), platforma = @platforma, pret = cast(@pret as bigint)
	where Jocuri_Video.id_joc = cast(@id as bigint)

	print 'Game updated succesfully'

end
go


CREATE OR ALTER PROCEDURE add_Review
(
    @id_joc varchar(40),
    @id_cumparator varchar(40),
    @numar_stele varchar(40)
)
AS
    BEGIN
        DECLARE @valid bit
        SET @valid = 1

        if dbo.validateNumber(@id_joc) = 0
        begin
            print 'Invalid game id'
            SET @valid = 0
        end

        if dbo.validateNumber(@id_cumparator) = 0
        begin
            print 'Invalid buyer id'
            SET @valid = 0
        end

        if dbo.validateNumber(@numar_stele) = 0
        begin
            print 'Invalid number of stars'
            SET @valid = 0
        end

        if @valid = 0
            return

        if not exists(SELECT * FROM Jocuri_Video WHERE id_joc = @id_joc)
            begin
                print 'Invalid game id'
                return
            end
		if not exists(SELECT * FROM Cumparatori WHERE id_cumparator = @id_cumparator)
            begin
                print 'Invalid buyer id'
                return
            end
	    
		INSERT INTO Reviews
            VALUES (cast(@id_joc as int), cast(@id_cumparator as int), cast(@numar_stele as int))
            print 'Insert done'

    END
GO

create or alter procedure get_Review
(
	@id varchar(50)
)
as
begin

	if dbo.validateNumber(@id) = 0
	begin
		print 'Invalid Data'
		return
	end
	
	if not exists(select * from Reviews where Reviews.id_review = cast(@id as bigint))
	begin
		print 'id is not found in table Reveiws'
		return
	end

	select * from Reviews where Reviews.id_review = cast(@id as bigint)

	print 'Review found succesfully'
		
end
go

create or alter procedure delete_Review
(
	@id varchar(50)
)
as
begin
	if dbo.validateNumber(@id) = 0
	begin
		print 'Invalid Data'
		return
	end
	
	if not exists(select * from Reviews where Reviews.id_review = cast(@id as bigint))
	begin
		print 'id is not found in table Reviews'
		return
	end

	delete Reviews where Reviews.id_review = cast(@id as bigint)

	print 'Review deleted succesfully'

end
go

create or alter procedure update_Review
(	
	@id varchar(50),
	@id_joc varchar(50),
	@id_cumparator varchar(50),
    @numar_stele varchar(50)
)
as
begin
	declare @valid bit
    set @valid = 1

	if dbo.validateNumber(@id) = 0
		set @valid = 0
    if dbo.validateNumber(@id_joc) = 0
        set @valid = 0
	if dbo.validateNumber(@id_cumparator) = 0
        set @valid = 0
	if dbo.validateNumber(@numar_stele) = 0
        set @valid = 0

	if @valid = 0
	begin
		print 'invalid data'
		return
	end
	
	if not exists(select * from Reviews where Reviews.id_review = cast(@id as bigint))
	begin
		print 'id is not found in table Reviews'
		return
	end

	if not exists(select * from Jocuri_Video where Jocuri_Video.id_joc = cast(@id_joc as bigint))
	begin
		print 'id_joc is not found in table Jocuri_Video'
		return
	end

	update Reviews set Reviews.id_joc = cast(@id_joc as bigint), id_cumparator = cast(@id_cumparator as bigint), numar_stele = cast(@numar_stele as bigint)
	where Reviews.id_review = cast(@id as bigint)

	print 'Review updated succesfully'

end
go

CREATE OR ALTER PROCEDURE add_GenuriJocuri
(
    @id_joc varchar(40),
    @id_gen varchar(40)
)
AS
    BEGIN
        DECLARE @valid BIT
        SET @valid = 1

        if dbo.validateNumber(@id_joc) = 0
        begin
            print 'The game id should be a number'
            SET @valid = 0
        end

		if dbo.validateNumber(@id_gen) = 0
        begin
            print 'The genre id should be a number'
            SET @valid = 0
        end
		


        if @valid = 0
            return

        if not exists(SELECT * FROM Jocuri_Video WHERE id_joc = @id_joc)
        begin
            print 'Invalid game id'
            return
        end

        if not exists(SELECT * FROM Genuri where id_gen = @id_gen)
        begin
            print 'Invalid genre id'
            return
        end
    
		if exists(SELECT * FROM Genuri_Jocuri WHERE id_joc = @id_joc AND id_gen = @id_gen)
		        print 'Record already in the table'
	    else
	        begin
                INSERT INTO Genuri_Jocuri VALUES (@id_joc, @id_gen)
                print 'Insert done'
            end
        
    END
GO

create or alter procedure get_GenuriJocuri
(
	@id_joc varchar(50),
    @id_gen varchar(50)
)
as
begin

	declare @valid bit
    set @valid = 1

	if dbo.validateNumber(@id_joc) = 0
        set @valid = 0
	if dbo.validateNumber(@id_gen) = 0
        set @valid = 0

	if @valid = 0
	begin
		print 'invalid data'
		return
	end

	if not exists(select * from Jocuri_Video where Jocuri_Video.id_joc = cast(@id_joc as bigint))
	begin
		print 'id_joc is not found in table Jocuri_Video'
		return
	end

	if not exists(select * from Genuri where Genuri.id_gen = cast(@id_gen as bigint))
	begin
		print 'id_gen is not found in table Genuri'
		return
	end

	select * from Genuri_Jocuri
	where Genuri_Jocuri.id_joc = cast(id_joc as bigint) and Genuri_Jocuri.id_gen = cast(@id_gen as bigint)

	print 'Game genre found succesfully'
		
end
go

create or alter procedure delete_GenuriJocuri
(
	@id_joc varchar(50),
    @id_gen varchar(50)
)
as
begin
	declare @valid bit
    set @valid = 1

	if dbo.validateNumber(@id_joc) = 0
        set @valid = 0
	if dbo.validateNumber(@id_gen) = 0
        set @valid = 0

	if @valid = 0
	begin
		print 'invalid data'
		return
	end

	if not exists(select * from Jocuri_Video where Jocuri_Video.id_joc = cast(@id_joc as bigint))
	begin
		print 'id_joc is not found in table Jocuri_Video'
		return
	end

	if not exists(select * from Genuri where Genuri.id_gen = cast(@id_gen as bigint))
	begin
		print 'id_gen is not found in table Genuri'
		return
	end

	delete Genuri_Jocuri
	where Genuri_Jocuri.id_joc = cast(id_joc as bigint) and Genuri_Jocuri.id_gen = cast(@id_gen as bigint)

	print 'Game genre deleted succesfully'

end
go

create or alter procedure update_GenuriJocuri
(
	@id_joc varchar(50),
    @id_gen varchar(50),
	@id_joc_nou varchar(50),
	@id_gen_nou varchar(50)
)
as
begin
	declare @valid bit
    set @valid = 1

	if dbo.validateNumber(@id_joc) = 0
        set @valid = 0
	if dbo.validateNumber(@id_gen) = 0
        set @valid = 0

	if dbo.validateNumber(@id_joc_nou) = 0
        set @valid = 0
	if dbo.validateNumber(@id_gen_nou) = 0
        set @valid = 0

	if @valid = 0
	begin
		print 'invalid data'
		return
	end

	if not exists(select * from Jocuri_Video where Jocuri_Video.id_joc = cast(@id_joc as bigint))
	begin
		print 'id_joc is not found in table Jocuri_Video'
		return
	end

	if not exists(select * from Genuri where Genuri.id_gen = cast(@id_gen as bigint))
	begin
		print 'id_gen is not found in table Genuri'
		return
	end

	if exists(SELECT * FROM Genuri_Jocuri WHERE id_joc = @id_joc_nou AND id_gen = @id_gen_nou)
		        print 'Record already in the table'
	    else
	        begin
              UPDATE Genuri_Jocuri
				SET id_joc = @id_joc_nou, id_gen = @id_gen_nou
				WHERE id_joc = CAST(@id_joc AS BIGINT) AND id_gen = CAST(@id_gen AS BIGINT)
                print 'Insert done'
            end

end
go

CREATE OR ALTER VIEW VJocuri AS
SELECT J.nume, J.pret, J.platforma, Firme.nume AS nume_firma
FROM Jocuri_Video J
INNER JOIN Firme ON J.id_firma = Firme.id_firma
WHERE pret > 50
go

if exists(select name from sys.indexes where name = 'index_Jocuri_Video_pret')
    drop index index_Jocuri_Video_pret on Jocuri_Video
go
create nonclustered index index_Jocuri_Video_pret on Jocuri_Video(pret)
go


create or alter view VReviews as
	select Cumparatori.nume as nume_cumparator, Cumparatori.prenume, Jocuri_Video.nume as nume_joc, Reviews.numar_stele from Reviews
	inner join Jocuri_Video on Jocuri_Video.id_joc = Reviews.id_joc
	inner join Cumparatori on Cumparatori.id_cumparator = Reviews.id_cumparator
	where numar_stele < 4
go

if exists(select name from sys.indexes where name = 'index_Reviews_numar_stele')
    drop index index_Reviews_numar_stele on Reviews
go
create nonclustered index index_Reviews_numar_stele on  Reviews(numar_stele)
go

SELECT * FROM VReviews ORDER BY numar_stele
GO
SELECT * FROM VJocuri ORDER BY pret
GO

delete from Jocuri_Video where id_joc = 2004 

select * from Jocuri_Video

delete from Jocuri_Video where id_joc = 2006

exec add_Jocuri 'HearthStone','1','PC','100'

exec update_Jocuri_Video '2007', 'Minecraft', '1', 'PC', '25'

exec get_Jocuri  '2007'

exec delete_Jocuri_Video '2007'


select * from Reviews

exec add_Review '1','2','3'

exec update_Review '1002', '2', '2', '4'

exec get_Review '1002'

exec delete_Review '1002'

select * from Genuri_Jocuri

exec add_GenuriJocuri '1' ,'4'

exec update_GenuriJocuri '1', '4', '1', '3'

exec get_GenuriJocuri  '1', '3'

exec delete_GenuriJocuri '1', '3'







