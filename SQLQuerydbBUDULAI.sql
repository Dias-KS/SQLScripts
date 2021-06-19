CREATE DATABASE [dbBUDULAI]

USE dbBUDULAI

CREATE TABLE [Role] (

	[IDRole]		NCHAR (1)				NOT NULL,
	[Title]			NVARCHAR (50)			NOT NULL,
	CONSTRAINT PK_Role_ID PRIMARY KEY ([IDRole])

)
GO

INSERT [Role] ([IDRole], [Title]) VALUES ('A', 'Администратор')
INSERT [Role] ([IDRole], [Title]) VALUES ('U', 'Пользователь')


CREATE TABLE [SignIn] (

	[ID]			INT IDENTITY (1, 1)			,
	[FirstName]		NVARCHAR (50)				NOT NULL,
	[LastName]		NVARCHAR (50)				NOT NULL,
	[Password]		NVARCHAR (50)				NOT NULL,
	[RoleID]		NCHAR (1) CONSTRAINT FK_SignIn_RoleID_Role_IDRole FOREIGN KEY REFERENCES [Role] ([IDRole])		NOT NULL,
	CONSTRAINT PK_SignIn_ID PRIMARY KEY ([ID])

)
GO

INSERT [SignIn] ([FirstName], [LastName], [Password], [RoleID]) VALUES ('Андрей', 'Громов', '1111', 'A')
INSERT [SignIn] ([FirstName], [LastName], [Password], [RoleID]) VALUES ('Олег', 'Самойлов', '2222', 'U')



-------------------------------------------------------------------------------------------------------------------


CREATE TABLE [License] (

	[IDLicense]			INT IDENTITY (1, 1)				,
	[LicenseType]		INT								NOT NULL,
	[LicenseBriefInfo]	NVARCHAR (50)					NOT NULL,
	CONSTRAINT PK_License_ID PRIMARY KEY ([IDLicense])

)
GO


CREATE TABLE [Object] (

	[IDObject]			INT IDENTITY (1, 1)				,
	[ObjectName]		NVARCHAR (50)					NOT NULL,
	[Date]				DATETIME						NOT NULL,
	[EndDate]			DATETIME						NULL,
	[Adress]			NVARCHAR (150)					NOT NULL,
	CONSTRAINT PK_Object_ID PRIMARY KEY ([IDObject])

)
GO


CREATE TABLE [Podrazdelenie] (

	[IDDivision]		INT IDENTITY (1, 1)				,
	[NameDivision]		NVARCHAR (50)					NOT NULL
	CONSTRAINT PK_Podrazdelenie_ID PRIMARY KEY ([IDDivision])

)
GO


CREATE TABLE [GuardInfoGun] (

	[GuardGunID]		INT IDENTITY (1, 1)				,
	[Model]				NVARCHAR (50)					NOT NULL,
	[TypeGun]			NVARCHAR (50)					NOT NULL,
	CONSTRAINT PK_GuardInfoGun_ID PRIMARY KEY ([GuardGunID])

)
GO


CREATE TABLE [Schedule] (

	[ID]				INT IDENTITY (1, 1)				,
	[Date]				DATE							NULL,
	[ShiftNumber]		INT								NULL,
	CONSTRAINT PK_Schedule_ID PRIMARY KEY ([ID])

)
GO


CREATE TABLE [GuardInfoPersonal] (

	[IDGuard]			INT IDENTITY (1, 1)					,
	[RegAdress]			NVARCHAR (150)						NOT NULL,
	[PhoneNumber]		INT									NOT NULL,
	[FirstName]			NVARCHAR (50)						NOT NULL,
	[SurName]			NVARCHAR (50)						NOT NULL,
	[IDLicense]			INT CONSTRAINT FK_GuardInfoPersonal_IDLicense_License_ID FOREIGN KEY REFERENCES [License] ([IDLicense])		ON DELETE CASCADE ON UPDATE CASCADE  NULL,
	[IDGuardGun]		INT CONSTRAINT FK_GuardInfoPersonal_IDGuardGun_GuardInfoGun_GuardGunID FOREIGN KEY REFERENCES [GuardInfoGun] ([GuardGunID])	ON DELETE CASCADE ON UPDATE CASCADE NULL,
	[IDDivision]		INT CONSTRAINT FK_GuardInfoPersonal_IDDivision_Podrazdelenie_IDDivision FOREIGN KEY REFERENCES [Podrazdelenie] ([IDDivision])	NULL,
	[IDSchedule]		INT CONSTRAINT FK_GuardInfoPersonal_IDSchedule_Schedule_ID FOREIGN KEY REFERENCES [Schedule] ([ID])								NULL,
	[IDObjectT]			INT	CONSTRAINT FK_GuardInfoPersonal_IDObjectT_Object_IDObject FOREIGN KEY REFERENCES [Object] ([IDObject])						NULL,
	CONSTRAINT PK_GuardInfoPersonal_IDGuard PRIMARY KEY ([IDGuard])

)
GO