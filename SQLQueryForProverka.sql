CREATE DATABASE [ForProverka]

USE [ForProverka]

CREATE TABLE [Role] (

	[RoleID]	NCHAR (1)		NOT NULL,
	[Title]		NVARCHAR (50)	NOT NULL,
	CONSTRAINT PK_Role_RoleID PRIMARY KEY ([RoleID])

)

INSERT [Role] ([RoleID], [Title]) VALUES ('A','Admin')
INSERT [Role] ([RoleID], [Title]) VALUES ('U','User')




CREATE TABLE [SignIn] (

	[ID]			INT IDENTITY		NOT NULL,
	[Username]		NVARCHAR (MAX)		NOT NULL,
	[Password]		NVARCHAR (MAX)		NOT NULL,
	[IDRole]		NCHAR (1)	CONSTRAINT FK_SignIn_Role_RoleID FOREIGN KEY REFERENCES [Role] ([RoleID])
	CONSTRAINT PK_SignIn_ID PRIMARY KEY ([ID])

)

INSERT [SignIn] ([Username], [Password], [IDRole]) VALUES ('Said', '787898', 'A')
INSERT [SignIn] ([Username], [Password], [IDRole]) VALUES ('Ahmed', '1234', 'U')


--------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------

	CREATE TABLE [TypeMagazine] (
	
		[ID]			INT IDENTITY		NOT NULL,
		[TitleType]		NVARCHAR (50)		NOT NULL
		CONSTRAINT PK_TypeMagazine_ID PRIMARY KEY ([ID])

	
)

SELECT * FROM TypeMagazine

INSERT [TypeMagazine] ([TitleType]) VALUES ('Продуктовый')


CREATE TABLE [CurrentCity] (

		[ID]			INT IDENTITY		NOT NULL,
		[TitleCity]		NVARCHAR (50)			NOT NULL
		CONSTRAINT PK_CurrentCity_ID PRIMARY KEY ([ID])

)

INSERT [CurrentCity] ([TitleCity]) VALUES ('Махачкала')




	CREATE TABLE [Magazine] (
	
		[ID]					INT IDENTITY			NOT NULL,
		[Name]					NVARCHAR (50)			NOT NULL,
		[Adress]				NVARCHAR (MAX)			NOT NULL,
		[NumberOfEmployees]		INT						NOT NULL,
		[Type]					INT CONSTRAINT FK_Magazine_Type_TypeMagazine_ID FOREIGN KEY REFERENCES [TypeMagazine]   ([ID])		ON DELETE CASCADE ON UPDATE CASCADE,
		[City]					INT CONSTRAINT FK_Magazine_City_CurrentCity_ID	FOREIGN KEY REFERENCES [CurrentCity]	([ID])		ON DELETE CASCADE ON UPDATE CASCADE,
		CONSTRAINT PK_Magazine_ID PRIMARY KEY ([ID])
	
	)


	INSERT [Magazine] ([Name], [Adress], [NumberOfEmployees], [Type], [City]) VALUES ('Пятерочка', 'Гамидова 54', '32', '1', '1')

	SELECT * FROM Magazine
