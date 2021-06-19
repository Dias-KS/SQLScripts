CREATE DATABASE [PastryShopdDB]

USE PastryShopdDB


-----------------For Authorization---------------------

CREATE TABLE [Role] (

	[IDRole]			NCHAR (1)					NOT NULL,
	[Title]				NVARCHAR (50)				NOT NULL,
	CONSTRAINT PK_Role_ID PRIMARY KEY ([IDRole])

)
GO

INSERT [Role] ([IDRole], [Title]) VALUES ('A', 'Admin')
INSERT [Role] ([IDRole], [Title]) VALUES ('U', 'User')


CREATE TABLE [SignIn]	(

	[ID]				INT IDENTITY (1, 1)					,
	[FirstName]			NVARCHAR (50)						NOT NULL,
	[LastName]			NVARCHAR (50)						NOT NULL,
	[Password]			NVARCHAR (50)						NOT NULL,
	[PictureUA]			IMAGE								NULL,	
	[RoleID]			NCHAR (1)		CONSTRAINT FK_SignIn_RoleID_Role_IDRole FOREIGN KEY REFERENCES [Role] ([IDRole])	ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
	CONSTRAINT PK_SignIn_ID PRIMARY KEY ([ID])

)
GO

INSERT [SignIn] ([FirstName], [LastName], [Password], [RoleID]) VALUES ('Арслан', 'Магомедович', '1111', 'A')
INSERT [SignIn] ([FirstName], [LastName], [Password], [RoleID]) VALUES ('Заира', 'Асхабова', '2222', 'U')

----------------End Authorization----------------------


CREATE TABLE [TypeProduct] (
	
	[ID]					INT IDENTITY (1, 1)					,
	[Title]					NVARCHAR (50)						NOT NULL,
	CONSTRAINT PK_TypeProduct_ID	PRIMARY KEY ([ID])

)
GO

INSERT [TypeProduct] ([Title]) VALUES ('Конфетные изделия')
INSERT [TypeProduct] ([Title]) VALUES ('Торты')
INSERT [TypeProduct] ([Title]) VALUES ('Пирожные')
INSERT [TypeProduct] ([Title]) VALUES ('Полуфабрикаты')

 
CREATE TABLE [StatusOrder]	(

	[ID]					INT IDENTITY (1, 1)					,
	[Title]					NVARCHAR (50)						NOT NULL,
	CONSTRAINT PK_StatusOrder_ID	PRIMARY KEY ([ID])

)
GO

INSERT [StatusOrder] ([Title]) VALUES ('В процессе')
INSERT [StatusOrder] ([Title]) VALUES ('Приостановлен')
INSERT [StatusOrder] ([Title]) VALUES ('Готов к выдаче')


CREATE TABLE [OrderRegister]	(

	[ID]					INT IDENTITY (1, 1)					,
	[NameProduct]			NVARCHAR (50)						NOT NULL,
	[Count]					NVARCHAR (50)						NOT NULL,
	[Price]					NVARCHAR (50)						NOT NULL,
	[Picture]				IMAGE								NULL,
	[IDTypeProduct]			INT CONSTRAINT FK_OrderRegister_IDTypeProduct_TypeProduct_ID	FOREIGN KEY REFERENCES [TypeProduct] ([ID])		NOT NULL,
	[IDStatus]				INT CONSTRAINT FK_OrderRegister_IDStatus_StatusOrder_ID		FOREIGN KEY REFERENCES [StatusOrder] ([ID])			NOT NULL,
	CONSTRAINT PK_OrderRegister_ID	PRIMARY KEY ([ID])

)
GO

 
INSERT [OrderRegister] ([NameProduct], [Count], [Price], [IDTypeProduct], [IDStatus]) VALUES ('"Рафаэлло"', '3 шт.', '700', '1', '3')



CREATE TABLE [ClientRegister]	(

	[ID]					INT IDENTITY (1, 1)					,
	[FirstName]				NVARCHAR (50)						NOT NULL,
	[LastName]				NVARCHAR (50)						NOT NULL,
	[DateRegistration]		DATETIME2							NOT NULL,
	[DateAccept]			DATETIME2							NOT NULL,
	[DateReadness]			DATETIME2						    NULL,
	[IDClientMoreInfo]		INT CONSTRAINT FK_ClientMoreInfo_ID FOREIGN KEY REFERENCES [ClientMoreInfo]	([ID])	ON DELETE CASCADE ON UPDATE CASCADE		NOT NULL,
	CONSTRAINT PK_ClientRegister_ID PRIMARY KEY ([ID])

)
GO

INSERT [ClientRegister] ([FirstName], [LastName], [DateRegistration], [DateAccept], [DateReadness], [IDClientMoreInfo]) VALUES ('Мадина', 'Маликова', '2021-05-08', '2021-05-09 15:00', '2021-05-09 17:00', '1')
INSERT [ClientRegister] ([FirstName], [LastName], [DateRegistration], [DateAccept], [DateReadness], [IDClientMoreInfo]) VALUES ('Мадина', 'Маликова', '2021-05-08', '2021-05-09', '2021-05-09', '6')

CREATE TABLE [ClientMoreInfo]   (

	[ID]					INT IDENTITY (1, 1)					,
	[Adress]				NVARCHAR (50)						NOT NULL,
	[Telephone]				NVARCHAR (50)						NOT NULL,
	CONSTRAINT PK_ClientMoreInfo_ID PRIMARY KEY ([ID])

)
GO

INSERT [ClientMoreInfo] ([Adress], [Telephone]) VALUES ('Гагарина 74', '8988-76-78-79')

CREATE TABLE [ClientAndOrder]	(

	[ID]					INT IDENTITY (1, 1)					,
	[ClientRegisterID]		INT CONSTRAINT FK_CLientAndOrder_IDClientRegister_ClientRegister_ID FOREIGN KEY REFERENCES [ClientRegister]	([ID])	ON DELETE CASCADE ON UPDATE CASCADE		NULL,
	[OrderRegisterID]		INT CONSTRAINT FK_ClientAndOrder_IDOorderRegister_OrderRegister_ID	FOREIGN KEY REFERENCES [OrderRegister]	([ID])	ON DELETE CASCADE ON UPDATE CASCADE		NULL,
	CONSTRAINT PK_ClientAndOrder_ID PRIMARY KEY ([ID])

)
GO

INSERT [ClientAndOrder] ([ClientRegisterID], [OrderRegisterID]) VALUES ('1', '1')



