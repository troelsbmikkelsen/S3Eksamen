IF OBJECT_ID('dbo.report_log', 'U') IS NOT NULL
	DROP TABLE report_log;
IF OBJECT_ID('dbo.report', 'U') IS NOT NULL
	DROP TABLE report;
IF OBJECT_ID('dbo.observed_gang', 'U') IS NOT NULL
	DROP TABLE observed_gang;	
IF OBJECT_ID('dbo.gang', 'U') IS NOT NULL
	DROP TABLE gang;
IF OBJECT_ID('dbo.observed', 'U') IS NOT NULL
	DROP TABLE observed;
IF OBJECT_ID('dbo.informer', 'U') IS NOT NULL
	DROP TABLE informer;
IF OBJECT_ID('dbo.agent', 'U') IS NOT NULL
	DROP TABLE agent;
IF OBJECT_ID('dbo.image', 'U') IS NOT NULL
	DROP TABLE image;
IF OBJECT_ID('dbo.appearence', 'U') IS NOT NULL
	DROP TABLE appearence;
IF OBJECT_ID('dbo.address', 'U') IS NOT NULL
	DROP TABLE address;
IF OBJECT_ID('dbo.person', 'U') IS NOT NULL
	DROP TABLE person;


-- person
CREATE TABLE person(
	id INT PRIMARY KEY IDENTITY,
	name VARCHAR(255) NOT NULL,
	nationality CHAR(3) NOT NULL,
	cpr VARCHAR(11),
	person_type VARCHAR(16) NOT NULL,
	CHECK(person_type in ('agent', 'informer', 'observed'))
)

-- address
CREATE TABLE address(
	id INT PRIMARY KEY FOREIGN KEY REFERENCES person(id),
	areacode int NOT NULL,
	street VARCHAR(255) NOT NULL
)

-- appearance
CREATE TABLE appearence(
	id INT PRIMARY KEY FOREIGN KEY REFERENCES person(id),
	height INT NOT NULL,
	eyecolor VARCHAR(32) NOT NULL,
	haircolor VARCHAR(32) NOT NULL
)

-- image
CREATE TABLE image(
	id INT PRIMARY KEY FOREIGN KEY REFERENCES person(id),
	data VARBINARY(MAX) NOT NULL
)

-- agent
CREATE TABLE agent(
	id INT PRIMARY KEY FOREIGN KEY REFERENCES person(id),
	username VARCHAR(64) NOT NULL,
	password CHAR(128) NOT NULL
)

-- informer
CREATE TABLE informer(
	id INT PRIMARY KEY FOREIGN KEY REFERENCES person(id),
	username VARCHAR(64) NOT NULL,
	password CHAR(128) NOT NULL,
	currency VARCHAR(16) NOT NULL,
	paymenttype VARCHAR(64) NOT NULL,
	tags VARCHAR(MAX)
)

-- observed
CREATE TABLE observed(
	id INT PRIMARY KEY FOREIGN KEY REFERENCES person(id),
	tags VARCHAR(MAX)
)

-- gang
CREATE TABLE gang(
	id INT PRIMARY KEY IDENTITY,
	name VARCHAR(64) NOT NULL
)

-- observed_gang
CREATE TABLE observed_gang(
	observed_id INT FOREIGN KEY REFERENCES observed(id),
	gang_id INT FOREIGN KEY REFERENCES gang(id),
	PRIMARY KEY(observed_id, gang_id)
)

-- report
CREATE TABLE report(
	id INT PRIMARY KEY IDENTITY,
	content VARCHAR(MAX) NOT NULL,
	create_date DATETIME NOT NULL,
	change_date DATETIME NOT NULL,
	place VARCHAR(255) NOT NULL,
	author_id INT NOT NULL FOREIGN KEY REFERENCES person(id),
	observed_id INT NOT NULL FOREIGN KEY REFERENCES observed(id),
	comment VARCHAR(MAX) NOT NULL
)

-- report_log
CREATE TABLE report_log(
	id INT PRIMARY KEY IDENTITY,
	report_id INT FOREIGN KEY REFERENCES report(id),
	content VARCHAR(MAX) NOT NULL,
	create_date DATETIME NOT NULL,
	change_date DATETIME NOT NULL,
	place VARCHAR(255) NOT NULL,
	author_id INT NOT NULL FOREIGN KEY REFERENCES person(id),
	observed_id INT NOT NULL FOREIGN KEY REFERENCES observed(id),
	comment VARCHAR(MAX) NOT NULL
)