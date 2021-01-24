CREATE DATABASE [Geografia]

USE Geografia


CREATE TABLE [Role] (

		[IDRole]			NCHAR(1)						,
		[Title]				NVARCHAR(50)					NOT NULL,
		CONSTRAINT PK_Role_ID PRIMARY KEY ([IDRole])

)
GO

INSERT [Role] ([IDRole], [Title]) VALUES ('A', 'Admin')
INSERT [Role] ([IDRole], [Title]) VALUES ('U', 'User')

CREATE TABLE [SignIn] (

		[ID]				INT IDENTITY (1, 1)			,
		[Username]			NVARCHAR (50)				NOT NULL,
		[Password]			NVARCHAR (50)				NOT NULL,
		[RoleID]			NCHAR(1) CONSTRAINT FK_SignIin_RoleID_Role_IDRole FOREIGN KEY REFERENCES [Role] ([IDRole])		NOT NULL,
		CONSTRAINT PK_SignIn_ID PRIMARY KEY ([ID])

)
GO

INSERT [SignIn] ([Username], [Password], [RoleID]) VALUES ('Dias', '787898', 'A')
INSERT [SignIn] ([Username], [Password], [RoleID]) VALUES ('Sabir', '8020720', 'U')
---------------------------------------------------------------------------------------------------------------------------

CREATE TABLE [Population] (
	
		[ID]				INT		IDENTITY (1, 1)		,
		[NumberOfPeople]	INT							NOT NULL,
		CONSTRAINT PK_Population_ID PRIMARY KEY ([ID])

)
GO

CREATE TABLE [Nationality] (

		[ID]					INT		IDENTITY (1, 1)		,
		[IDNameOfNationality]	INT	CONSTRAINT FK_Nationality_IDNameOfNationality_NationalityName_ID	FOREIGN KEY REFERENCES [NationalityName] ([ID])		ON DELETE CASCADE ON UPDATE CASCADE		NOT NULL,
		[IDLanguage]			INT	CONSTRAINT FK_Nationality_IDLanguage_Language_ID					FOREIGN KEY REFERENCES [Language] ([ID])			ON DELETE CASCADE ON UPDATE CASCADE		NOT NULL
		CONSTRAINT PK_Nationality_ID PRIMARY KEY ([ID])	

)
GO

CREATE TABLE [NationalityName] (

		[ID]					INT IDENTITY(1, 1)			,
		[Title]					NVARCHAR(50)				NOT NULL,
		CONSTRAINT PK_NationalityName_ID PRIMARY KEY ([ID])

)
GO

CREATE TABLE [Language] (

		[ID]					INT IDENTITY (1, 1)			,
		[Title]					NVARCHAR(50)				NOT NULL,
		CONSTRAINT PK_Language_ID PRIMARY KEY ([ID])

)
GO

CREATE TABLE [Country] (

		[ID]					INT IDENTITY (1, 1)			,
		[NameCountry]			NVARCHAR (50)				NOT NULL,
		[Region]				NVARCHAR (50)				NOT NULL,
		[Capital]				NVARCHAR (50)				NOT NULL,
		[Square]				NVARCHAR (50)				NOT NULL,
		[AdvancedOr]			NVARCHAR (50)				NOT NULL,
		[IDNationality]			INT CONSTRAINT FK_Country_IDNationality_Nationality_ID	 FOREIGN KEY REFERENCES [Nationality] ([ID]) ON DELETE CASCADE ON UPDATE CASCADE	NOT NULL,
		[IDPopulation]			INT CONSTRAINT FK_Country_IDPopulation_Population_ID	 FOREIGN KEY REFERENCES [Population]	  ([ID]) ON DELETE CASCADE ON UPDATE CASCADE	NOT NULL,	
		CONSTRAINT PK_Country_ID PRIMARY KEY ([ID])
)
GO