CREATE DATABASE [dbProduction]

USE dbProduction

CREATE TABLE [Company] (

		[ID]						INT		IDENTITY(1, 1)		,
		[NameCompany]				NVARCHAR(MAX)				NOT NULL,
		[Adress]					NVARCHAR(MAX)				NOT NULL,
		[Telephone]					NVARCHAR(MAX)				NOT NULL,
		[YearRelease]				DATE						NOT NULL,
		[VolumeRelease]				NVARCHAR(50)				NOT NULL,
		CONSTRAINT PK_Company_ID PRIMARY KEY ([ID])

)
GO

CREATE TABLE [Material] (

		[ID]						INT		IDENTITY(1, 1)		,
		[NameMaterial]				NVARCHAR(MAX)				NOT NULL,
		[TypeMaterial]				NVARCHAR(MAX)				NOT NULL,
		[UnitOfMeasurement]			NVARCHAR(MAX)				NOT NULL,
		[PriceUnit]					INT							NOT NULL,
		[NoteUse]					NVARCHAR(50)				NOT NULL,
		CONSTRAINT PK_Material_ID PRIMARY KEY ([ID])

)
GO

CREATE TABLE [Specification] (

		[ID]						INT IDENTITY (1, 1)			,
		[QuantityMaterial]			INT							NOT NULL,
		[DateInstallSpecification]	DATE						NOT NULL,
		[DateCancel]				DATE						NOT NULL,
		CONSTRAINT PK_Specification_ID	PRIMARY KEY ([ID])

)
GO

CREATE TABLE [Product] (

		[ID]						INT		IDENTITY(1, 1)		,
		[NameProduct]				NVARCHAR(MAX)				NOT NULL,
		[TypeOr]					NVARCHAR(MAX)				NOT NULL,
		[YearVolumeRelease]			NVARCHAR(MAX)				NOT NULL,
		[IDMaterial]				INT CONSTRAINT FK_Product_IDMaterial_Material_ID FOREIGN KEY REFERENCES [Material] ([ID])  ON DELETE CASCADE ON UPDATE CASCADE		NOT NULL,
		[IDCompany]					INT CONSTRAINT FK_Product_IDCompany_Company_ID	 FOREIGN KEY REFERENCES [Company]  ([ID])  ON DELETE CASCADE ON UPDATE CASCADE		NOT	NULL,
		[IDSpecification]			INT CONSTRAINT FK_Product_IDSpecification_Specification_ID FOREIGN KEY REFERENCES [Specification] ([ID]) ON DELETE CASCADE ON UPDATE CASCADE		NOT NULL,
 		[Comment]					NVARCHAR(MAX)				NULL,
		CONSTRAINT PK_Product_ID PRIMARY KEY ([ID])

)
GO