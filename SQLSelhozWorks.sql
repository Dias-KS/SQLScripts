CREATE DATABASE [SelhozWorks]

USE SelhozWorks


CREATE TABLE [Role]	(

	[IDRole]	NCHAR(1)		NOT NULL,
	[Title]		NVARCHAR(MAX)	NOT NULL,
	CONSTRAINT PK_Role_IDRole PRIMARY KEY ([IDRole])

)
GO

INSERT [Role] ([IDRole], [Title])	VALUES ('A','Admin')
INSERT [Role] ([IDRole], [Title])	VALUES ('U','User')




CREATE TABLE [SignIn] (

	[ID]		INT IDENTITY	NOT NULL,
	[Username]	NVARCHAR(MAX)	NOT NULL,
	[Password]  NVARCHAR(MAX)	NOT NULL,
	[RoleID]	NCHAR(1)	CONSTRAINT FK_SignIn_RoleID_Role_IDRole FOREIGN KEY REFERENCES [Role] ([IDRole])	ON DELETE CASCADE ON UPDATE CASCADE		NOT NULL,
	CONSTRAINT PK_SignIn_ID PRIMARY KEY ([ID])

)
GO

INSERT [SignIn] ([Username],[Password],[RoleID]) VALUES ('Dias', '787898', 'A')
INSERT [SignIn] ([Username],[Password],[RoleID]) VALUES ('Ahmed', '1234', 'U')


--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE [Supply] (

	[ID]					INT		IDENTITY		,
	[DateOfSupply]			DATE					NOT NULL,
	[Volume]				NVARCHAR(MAX)			NOT NULL,
	[SuppliersCostPrice]	INT						NOT NULL,
	CONSTRAINT PK_Supply_ID PRIMARY KEY ([ID])

)
GO


CREATE TABLE [Products] (
	
	[ID]					INT     IDENTITY		,
	[NameProduct]			NVARCHAR(MAX)			NOT NULL,
	[UnitOfMeasurement]		NVARCHAR(MAX)			NOT NULL,
	[PurchasePrice]			INT						NOT NULL,
	CONSTRAINT PK_Products_ID PRIMARY KEY ([ID])
	
)
GO



CREATE TABLE [Companies] (

	[ID]					INT		IDENTITY		,
	[NameCompany]			NVARCHAR(MAX)			NOT NULL,
	[DateOfRegistration]	DATE					NOT NULL,
	[TypeOfProperty]		NVARCHAR(MAX)			NOT NULL,
	[NumberOfEmployees]		NVARCHAR(MAX)			NOT NULL,
	[MainTypeProduct]		NVARCHAR(MAX)			NOT NULL,
	[AdvancedOr]			NVARCHAR(MAX)			NOT NULL,
	[Price]					INT						NOT NULL,
	[Comment]				NVARCHAR(MAX)			NULL,
	[IDSupply]				INT CONSTRAINT FK_Companies_IDSupply_Supply_ID FOREIGN KEY REFERENCES [Supply] ([ID])			ON DELETE CASCADE ON UPDATE CASCADE		NOT NULL,
	[IDProducts]			INT CONSTRAINT FK_Companies_IDProducts_Products_ID FOREIGN KEY REFERENCES [Products] ([ID])		ON DELETE CASCADE ON UPDATE CASCADE		NOT NULL,
	CONSTRAINT PK_Companies_ID PRIMARY KEY ([ID])

)
GO

ALTER TABLE [Companies]
ALTER COLUMN [Price] INT NOT NULL