CREATE DATABASE [dbCourse]
USE dbCourse
GO


CREATE TABLE [Role] (

		[RoleID]	NCHAR(1)		NOT NULL,
		[Title]		NVARCHAR(20)	NOT NULL
		CONSTRAINT PK_Role_RoleID PRIMARY KEY ([RoleID])

		)
		GO

		INSERT [Role]([RoleID], [Title]) VALUES ('A', 'Admin')
		INSERT [Role]([RoleID], [Title]) VALUES ('U', 'User')

CREATE TABLE [SignIn] (
	
		[ID]		INT IDENTITY (0, 1)		NOT NULL,
		[Username]  NVARCHAR (60)			NOT NULL,
		[Password]	NVARCHAR (60)			NOT NULL,
		[IDRole]	NCHAR (1) CONSTRAINT FK_SignIn_IDRole_Role_RoleID FOREIGN KEY REFERENCES [Role] ([RoleID])
		CONSTRAINT PK_SignIn_ID PRIMARY KEY ([ID])

		)
		GO

		INSERT [SignIn] ([Username], [Password], [IDRole]) VALUES ('Dias', '787898', 'A')
		INSERT [SignIn] ([Username], [Password], [IDRole]) VALUES ('Arsen', '1234', 'U')
		INSERT [SignIn] ([Username], [Password], [IDRole]) VALUES ('Lila', '4654', 'U')
		INSERT [SignIn] ([Username], [Password], [IDRole]) VALUES ('Naida', '4321', 'U')


		SELECT [Username], [Password], [IDRole] FROM [SignIn]


		CREATE TABLE [Computer] (
		
		[ID]			INT IDENTITY,
		[CPU]			NVARCHAR (MAX)	NOT NULL,
		[GPU]			NVARCHAR (MAX)	NOT NULL,
		[RAM]			NVARCHAR (MAX)	NOT NULL,
		[MotherBoard]	NVARCHAR (MAX)	NOT NULL,
		[HDD]			NVARCHAR (MAX)	NOT NULL,
		[Keyboard]		NVARCHAR (MAX)	NOT NULL,
		[Mouse]			NVARCHAR (MAX)	NOT NULL,
		[Headphones]	NVARCHAR (MAX)	NOT NULL,
		CONSTRAINT PK_Computer_ID PRIMARY KEY ([ID])
		
		)
		GO

		INSERT [Computer] ([CPU], [GPU], [RAM], [MotherBoard], [HDD], [Keyboard], [Mouse], [Headphones]) VALUES 
		('Intel i7', 'RTX 2070 Super', '32Gb', 'Gigabyte B450M Gaming', 'WD Blue[WD10EZEX]', 'Bloody 620G', 'Bloody 420G', 'Bloody G456')

		SELECT * FROM [Computer]

		