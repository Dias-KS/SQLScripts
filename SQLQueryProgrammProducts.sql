CREATE DATABASE [dbProgrammProducts]

USE dbProgrammProducts


CREATE TABLE [ApplicationArea] (

		[ID]					INT IDENTITY (1, 1)			,
		[Title]					NVARCHAR (50)				NOT NULL,
		CONSTRAINT PK_ApplicationArea_ID PRIMARY KEY ([ID])

)
GO


CREATE TABLE [TypeProduct] (

		[ID]					INT IDENTITY (1, 1)			,
		[Title]					NVARCHAR (50)				NOT NULL,
		CONSTRAINT PK_TypeProduct_ID PRIMARY KEY ([ID])

)
GO

CREATE TABLE [User] (
	
		[ID]					INT IDENTITY (1, 1)			,
		[NameUser]				NVARCHAR (50)				NOT NULL,
		[Region]				NVARCHAR (50)				NOT NULL,
		[ScopeOfApplication]	NVARCHAR (50)				NOT NULL,
		CONSTRAINT PK_User_ID PRIMARY KEY ([ID])

)
GO

CREATE TABLE [Service]	(

		[ID]					INT IDENTITY (1, 1)			,
		[CostOfInstallation]	INT							NOT NULL,
		[DateOfInstallation]	DATE						NOT NULL,
		[DateOfDeinstallation]	DATE						NOT NULL,
		[QuantityLicense]		INT							NOT NULL,
		CONSTRAINT PK_Service_ID PRIMARY KEY ([ID])

)
GO

CREATE TABLE [Product] (

		[ID]					INT IDENTITY (1, 1)			,
		[NameProduct]			NVARCHAR (50)				NOT NULL,
		[Version]				NVARCHAR (50)				NOT NULL,
		[IDType]				INT 						CONSTRAINT FK_Product_IDType_TypeProduct_ID FOREIGN KEY REFERENCES [TypeProduct] ([ID])		ON DELETE CASCADE ON UPDATE CASCADE			NOT NULL,
		[Firm]					NVARCHAR (50)				NOT NULL,
		[ReleaseDate]			DATE						NOT NULL,
		[IDApplicationArea]		INT							CONSTRAINT FK_Product_IDApplicationArea_ApplicationArea_ID FOREIGN KEY REFERENCES [ApplicationArea]	([ID])	ON DELETE CASCADE ON UPDATE CASCADE		NOT NULL,
		[CostOfLicense]			INT							NOT NULL,
		[QuantityDownoload]		INT							NOT NULL,
		[IDUser]				INT							CONSTRAINT FK_Product_IDUser_User_ID FOREIGN KEY REFERENCES [User] ([ID])	ON DELETE CASCADE ON UPDATE CASCADE		NOT NULL,
		[IDService]				INT							CONSTRAINT FK_Product_IDService_Service_ID FOREIGN KEY REFERENCES [Service]	([ID]) ON DELETE CASCADE ON UPDATE CASCADE	NOT NULL,
		CONSTRAINT FK_Product_ID PRIMARY KEY ([ID])

)
GO