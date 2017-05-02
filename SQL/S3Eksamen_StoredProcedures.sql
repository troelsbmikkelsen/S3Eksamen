-- EXEC RowInTable
--CREATE PROCEDURE RowInTable
--(
--	@id INT,
--	@table VARCHAR(MAX)
--)
--AS
--BEGIN
--	EXEC('SELECT COUNT(1) FROM ' + @table + ' WHERE id=' + @id)
--END


-- EXEC CreateAgent name, nationality, cpr, username, password
--CREATE PROCEDURE CreateAgent
--(
--	@name VARCHAR(255),
--	@nationality CHAR(3),
--	@cpr VARCHAR(11) = '',
--	@username VARCHAR(64),
--	@password CHAR(128)
--)
--AS
--BEGIN
--	DECLARE @row table (row_id INT)

--	INSERT INTO person 
--	OUTPUT INSERTED.id INTO @row(row_id)
--	VALUES(@name, @nationality, @cpr, 'agent')


--	--INSERT INTO agent VALUES(@id, @username, @password)
--	INSERT INTO agent 
--	SELECT row_id, @username, @password FROM @row
--END


-- EXEC UpdateAgent id, name, nationality, cpr, username, password
--CREATE PROCEDURE UpdateAgent
--(
--	@id INT,
--	@name VARCHAR(255),
--	@nationality CHAR(3),
--	@cpr VARCHAR(11) = '',
--	@username VARCHAR(64),
--	@password CHAR(128)
--)
--AS
--BEGIN
--	UPDATE person 
--	SET name = @name,
--		nationality = @nationality,
--		cpr = @cpr
--	WHERE id = @id

--	UPDATE agent
--	SET username = @username,
--		password = @password
--	WHERE id = @id

--END


-- EXEC CreateInformer name, nationality, cpr, username, password, currency, paymenttype, tags
--CREATE PROCEDURE CreateInformer
--(
--	@name VARCHAR(255),
--	@nationality CHAR(3),
--	@cpr VARCHAR(11) = '',
--	@username VARCHAR(64),
--	@password CHAR(128),
--	@currency VARCHAR(16),
--	@paymenttype VARCHAR(64),
--	@tags VARCHAR(MAX) = ''
--)
--AS
--BEGIN
--	DECLARE @row table (row_id INT)

--	INSERT INTO person 
--	OUTPUT INSERTED.id INTO @row(row_id)
--	VALUES(@name, @nationality, @cpr, 'informer')


--	--INSERT INTO informer VALUES(@id, @username, @password, @currency, @paymenttype, @tags)
--	INSERT INTO informer 
--	SELECT row_id, @username, @password, @currency, @paymenttype, @tags FROM @row
--END


-- EXEC UpdateInformer id, name, nationality, cpr, username, password, currency, paymenttype, tags
--CREATE PROCEDURE UpdateInformer
--(
--	@id INT,
--	@name VARCHAR(255),
--	@nationality CHAR(3),
--	@cpr VARCHAR(11) = '',
--	@username VARCHAR(64),
--	@password CHAR(128),
--	@currency VARCHAR(16),
--	@paymenttype VARCHAR(64),
--	@tags VARCHAR(MAX) = ''
--)
--AS
--BEGIN
--	UPDATE person 
--	SET name = @name,
--		nationality = @nationality,
--		cpr = @cpr
--	WHERE id = @id

--	UPDATE informer
--	SET username = @username,
--		password = @password,
--		currency = @currency,
--		paymenttype = @paymenttype,
--		tags = @tags
--	WHERE id = @id
--END



-- EXEC CreateObserved name, nationality, cpr, tags
--CREATE PROCEDURE CreateObserved
--(
--	@name VARCHAR(255),
--	@nationality CHAR(3),
--	@cpr VARCHAR(11) = '',
--	@tags VARCHAR(MAX) = ''
--)
--AS
--BEGIN
--	DECLARE @row table (row_id INT)
--	INSERT INTO person 
--	OUTPUT INSERTED.id INTO @row(row_id)
--	VALUES(@name, @nationality, @cpr, 'observed')

--	--INSERT INTO observed VALUES(@row.row_id, @tags)
--	INSERT INTO observed 
--	SELECT row_id, @tags FROM @row
--END


-- EXEC UpdateObserved id, name, nationality, cpr, tags
--CREATE PROCEDURE UpdateObserved
--(
--	@id INT,
--	@name VARCHAR(255),
--	@nationality CHAR(3),
--	@cpr VARCHAR(11) = '',
--	@tags VARCHAR(MAX) = ''
--)
--AS
--BEGIN
--	UPDATE person 
--	SET name = @name,
--		nationality = @nationality,
--		cpr = @cpr
--	WHERE id = @id

--	UPDATE observed
--		SET tags = @tags
--	WHERE id = @id
--END


--CREATE PROCEDURE DeletePerson
--(
--	@id INT
--)
--AS
--BEGIN
--	DELETE FROM person WHERE person.id = @id
--END



-- EXEC CreateReport
--CREATE PROCEDURE CreateReport
--(
--	@content VARCHAR(MAX),
--	@create_date DATETIME,
--	@change_date DATETIME,
--	@place VARCHAR(255),
--	@author_id INT,
--	@observed_id INT,
--	@comment VARCHAR(MAX)
--)
--AS
--BEGIN
--	INSERT INTO report
--	VALUES(
--		@content,
--		@create_date,
--		@change_date,
--		@place,
--		@author_id,
--		@observed_id,
--		@comment
--	)
--END

-- EXEC UpdateReport
--CREATE PROCEDURE UpdateReport
--(
--	@id INT,
--	@content VARCHAR(MAX),
--	@create_date DATETIME,
--	@change_date DATETIME,
--	@place VARCHAR(255),
--	@author_id INT,
--	@observed_id INT,
--	@comment VARCHAR(MAX)
--)
--AS
--BEGIN
--	INSERT INTO report_log
--	SELECT * FROM report WHERE id = @id

--	UPDATE report
--	SET 
--		content = @content,
--		create_date = @create_date,
--		change_date = @change_date,
--		place = @place,
--		author_id = @author_id,
--		observed_id = @observed_id,
--		comment = @comment
--	WHERE id = @id

--END

-- EXEC SelectReportLogs
--CREATE PROCEDURE SelectReportLogs
--(
--	@id INT
--)
--AS
--BEGIN
--	SELECT * FROM report_log WHERE id = @id
--END

-- EXEC SelectAgent
--CREATE PROCEDURE SelectAgent
--(
--	@id INT
--)
--AS
--BEGIN
--	SELECT * FROM person
--	JOIN agent ON agent.id = person.id
--	WHERE person.id = @id
--END

-- EXEC SelectAllAgents
--CREATE PROCEDURE SelectAllAgents
--(
--	@id INT
--)
--AS
--BEGIN
--	SELECT * FROM person
--	JOIN agent ON agent.id = person.id
--END

-- EXEC SelectInformer
--CREATE PROCEDURE SelectInformer
--(
--	@id INT
--)
--AS
--BEGIN
--	SELECT * FROM person
--	JOIN informer ON informer.id = person.id
--	WHERE person.id = @id
--END

-- EXEC SelectAllInformers
--CREATE PROCEDURE SelectAllInformers
--(
--	@id INT
--)
--AS
--BEGIN
--	SELECT * FROM person
--	JOIN informer ON informer.id = person.id
--END

-- EXEC SelectObserved
--CREATE PROCEDURE SelectObserved
--(
--	@id INT
--)
--AS
--BEGIN
--	SELECT * FROM person
--	JOIN observed ON observed.id = person.id
--	WHERE person.id = @id
--END

-- EXEC SelectAllObserved
--CREATE PROCEDURE SelectAllObserved
--(
--	@id INT
--)
--AS
--BEGIN
--	SELECT * FROM person
--	JOIN observed ON observed.id = person.id
--END




-- EXEC CreateAddress
--CREATE PROCEDURE CreateAddress
--(
--	@areacode INT,
--	@street VARCHAR(255)
--)
--AS
--BEGIN
--	INSERT INTO address VALUES(@areacode, @street)
--END

-- EXEC SelectAddress
--CREATE PROCEDURE SelectAddress
--(
--	@id INT
--)
--AS
--BEGIN
--	SELECT * FROM address WHERE id = @id
--END

-- EXEC UpdateAddress
--CREATE PROCEDURE UpdateAddress
--(
--	@id INT,
--	@areacode INT,
--	@street VARCHAR(255)
--)
--AS
--BEGIN
--	UPDATE address
--	SET
--		areacode = @areacode,
--		street = @street
--	WHERE id = @id
--END

-- EXEC CreateAppearence
--CREATE PROCEDURE CreateAppearance
--(
--	@height INT,
--	@eyecolor VARCHAR(32),
--	@haircolor VARCHAR(32)
--)
--AS
--BEGIN
--	INSERT INTO appearence VALUES(@height, @eyecolor, @haircolor)
--END


-- EXEC SelectAppearance
--CREATE PROCEDURE SelectAppearence
--(
--	@id INT
--)
--AS
--BEGIN
--	SELECT * FROM appearence WHERE id = @id
--END

-- EXEC UpdateAppearance
--CREATE PROCEDURE UpdateAppearence
--(
--	@id INT,
--	@height INT,
--	@eyecolor VARCHAR(32),
--	@haircolor VARCHAR(32)
--)
--AS
--BEGIN
--	UPDATE appearence
--	SET
--		height = @height,
--		eyecolor = @eyecolor,
--		haircolor = @haircolor
--	WHERE id = @id
--END

-- EXEC CreateImage
--CREATE PROCEDURE CreateImage
--(
--	@data VARBINARY(MAX)
--)
--AS
--BEGIN
--	INSERT INTO image VALUES(@data)
--END


-- EXEC SelectImage
--CREATE PROCEDURE SelectImage
--(
--	@id INT
--)
--AS
--BEGIN
--	SELECT * FROM image WHERE id = @id
--END

-- EXEC UpdateImage
--CREATE PROCEDURE UpdateAppearence
--(
--	@id INT,
--	@data VARBINARY(MAX)
--)
--AS
--BEGIN
--	UPDATE image
--	SET
--		data = @data
--	WHERE id = @id
--END

