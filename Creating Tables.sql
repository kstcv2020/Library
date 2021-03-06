USE [Library]
GO

IF OBJECT_ID('BOOKS', 'U') IS NOT NULL
DROP TABLE [BOOKS]

IF OBJECT_ID('USERS', 'U') IS NOT NULL
DROP TABLE [USERS]

IF OBJECT_ID('USER_RIGHTS', 'U') IS NOT NULL
DROP TABLE [USER_RIGHTS]

IF OBJECT_ID('GENRES', 'U') IS NOT NULL
DROP TABLE [GENRES]

IF OBJECT_ID('ARCHIVED_BOOKS', 'U') IS NOT NULL
DROP TABLE [ARCHIVED_BOOKS]
GO

IF OBJECT_ID('FORMS', 'U') IS NOT NULL
DROP TABLE [FORMS]
GO

CREATE TABLE [USER_RIGHTS](
	ID int IDENTITY(1,1) NOT NULL,
	RIGHTS smallint NOT NULL,
	DESCRIPTION varchar(64) NOT NULL,

	CONSTRAINT PK_USER_RIGHTS_ID PRIMARY KEY (ID));
GO

CREATE TABLE [USERS](
	ID int IDENTITY(1,1) NOT NULL,
	NAME varchar(256) NOT NULL,
	USERNAME varchar(32) NOT NULL,
	PASSWORD varchar(32) NOT NULL,
	USER_RIGHTS int NOT NULL,
	LOYALTY_STATUS smallint NOT NULL,

	CONSTRAINT PK_USERS_ID PRIMARY KEY (ID),
	CONSTRAINT FK_USER_RIGHTS FOREIGN KEY (USER_RIGHTS)
		REFERENCES USER_RIGHTS(ID));
GO

CREATE TABLE [GENRES](
	ID int IDENTITY(1,1) NOT NULL,
	GENRE_NAME varchar(128) NOT NULL

	CONSTRAINT PK_GENRES_ID PRIMARY KEY (ID));

GO

CREATE TABLE [BOOKS](
	ID int IDENTITY(1,1) NOT NULL,
	NAME varchar(128) NOT NULL,
	GENRE int NOT NULL,
	CURRENT_READER int NOT NULL,
	AUTHOR varchar(256) NOT NULL,
	STATUS smallint NOT NULL,
	BORROW_TYPE varchar(32) NOT NULL,

	CONSTRAINT PK_BOOKS_ID PRIMARY KEY (ID),
	CONSTRAINT FK_CURRENT_READER FOREIGN KEY (CURRENT_READER)
		REFERENCES USERS(ID));
GO

CREATE TABLE [ARCHIVED_BOOKS](
	ID int IDENTITY(1,1) NOT NULL,
	NAME varchar(128) NOT NULL,
	GENRE int NOT NULL,
	AUTHOR varchar(256) NOT NULL,

	CONSTRAINT PK_ARCHIVED_BOOKS_ID PRIMARY KEY (ID));
GO

CREATE TABLE [FORMS](
	ID int IDENTITY(1,1) NOT NULL,
	DATE date NOT NULL, 
	NAME varchar(256) NOT NULL,
	USERNAME varchar(32) NOT NULL,
	PASSWORD varchar(32) NOT NULL,

	CONSTRAINT PK_FORMS_ID PRIMARY KEY (ID)
	);
GO
