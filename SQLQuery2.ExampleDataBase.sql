CREATE DATABASE [ExampleDB]

USE [ExampleDB]
GO

CREATE TABLE [Role] (

	[IDRole]	NCHAR  (1) NOT NULL,
	[Name]		NVARCHAR (50) NOT NULL,
	CONSTRAINT PK_Role_ID PRIMARY KEY ([IDRole])

)
GO

CREATE TABLE [Users] (

	ID			INT IDENTITY  (0, 1),
	[Username]	NVARCHAR (50) NOT NULL,
	[Password]	INT NOT NULL,
	-- Этот столбец является вторичным ключём, который ссылается на таблицу Role и на его столбец IDRole.
	[RoleID]	NCHAR (1)  CONSTRAINT FK_Users_RoleID_Role_IDRole FOREIGN KEY REFERENCES [Role] ([IDRole]) not null,
	CONSTRAINT PK_Users_ID PRIMARY KEY ([ID])

)
GO