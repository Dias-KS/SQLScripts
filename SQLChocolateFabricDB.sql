CREATE DATABASE [dbChocolateFabric]

USE dbChocolateFabric

CREATE TABLE [Role] (

	[IDRole]	NCHAR (1)		NOT NULL,
	[Title]		NVARCHAR (50)	NOT NULL,
	CONSTRAINT PK_Role_IDRole PRIMARY KEY ([IDRole])

)
GO

INSERT [Role] ([IDRole], [Title]) VALUES ('A', 'Администратор')
INSERT [Role] ([IDRole], [Title]) VALUES ('U', 'Пользователь')

CREATE TABLE [SignIn] (

	[ID]			INT IDENTITY (1, 1)		,
	[FirstName]		NVARCHAR (50)			NOT NULL,
	[LastName]		NVARCHAR (50)			NOT NULL,
	[Password]		NVARCHAR (50)			NOT NULL,
	[RoleID]		NCHAR(1)	CONSTRAINT FK_SignIn_RoleID_Role_IDRole FOREIGN KEY REFERENCES [Role] ([IDRole])	NOT NULL,
	CONSTRAINT PK_SignIn_ID PRIMARY KEY ([ID])

)
GO

INSERT [SignIn] ([FirstName], [LastName], [Password], [RoleID]) VALUES ('София', 'Багирова', '1111', 'A')

INSERT [SignIn] ([FirstName], [LastName], [Password], [RoleID]) VALUES ('Магомед', 'Самиров', '2222', 'U')

---------------------------------------------------------------
---------------------------------------------------------------

CREATE TABLE [Client] (

	[ID]					INT IDENTITY (1, 1)			   ,
	[NameClient]			NVARCHAR (MAX)				   NOT NULL,
	[Adress]				NVARCHAR (MAX)				   NOT NULL,
	[City]					NVARCHAR (MAX)				   NOT NULL,
	CONSTRAINT PK_Client_ID	PRIMARY KEY ([ID])

)
GO

INSERT [Client] ([NameClient], [Adress], [City]) VALUES ('Кондитерская "Золотой улий"', 'Сибкина 41', 'Новосибирск')

CREATE TABLE [Order] (
	
	[ID]			INT IDENTITY (1, 1)				,
	[NameOrder]		NVARCHAR (MAX)					NOT NULL,
	[Count]			NVARCHAR (50)					NOT NULL,
	[Price]			NVARCHAR (50)					NOT NULL,
	[DateOrdered]	DATE							NOT NULL,
	CONSTRAINT PK_Order_ID	PRIMARY KEY ([ID])


)
GO

INSERT [Order] ([NameOrder], [Count], [Price], [DateOrdered]) VALUES ('Шоколад "Родной край"', '175 шт.', '25 000 руб.', '2021-05-23')



CREATE TABLE [ClientAndOrder] (

	[ID]			INT IDENTITY (1, 1)				,
	[IDClient]		INT	CONSTRAINT FK_ClientAndOrder_IDClient	FOREIGN KEY REFERENCES [Client]	([ID])		ON DELETE CASCADE ON UPDATE CASCADE		NULL,
	[IDOrder]		INT CONSTRAINT FK_ClientAndOrder_IDOrder	FOREIGN KEY REFERENCES [Order]	([ID])		ON DELETE CASCADE ON UPDATE CASCADE		NULL,
	CONSTRAINT PK_ClientAndOrder_ID PRIMARY KEY ([ID])


)
GO

INSERT [ClientAndOrder] ([IDClient], [IDOrder]) VALUES ('1', '1')


CREATE TABLE [Gender] (

	[ID]			INT IDENTITY (1, 1)			,
	[Title]			NVARCHAR (50)				NOT NULL,
	CONSTRAINT PK_Gender_ID	PRIMARY KEY ([ID])

)
GO

INSERT [Gender] ([Title]) VALUES ('Мужчина')
INSERT [Gender] ([Title]) VALUES ('Женщина')



CREATE TABLE [Post] (

	[ID]			INT IDENTITY (1, 1)			,
	[Title]			NVARCHAR (50)				NOT NULL,
	CONSTRAINT PK_Post_ID	PRIMARY KEY ([ID])

)
GO

INSERT [Post] ([Title]) VALUES ('Бухгалтер')
INSERT [Post] ([Title]) VALUES ('Начальник цеха')
INSERT [Post] ([Title]) VALUES ('Склад. рабоник')
INSERT [Post] ([Title]) VALUES ('Разнорабочий')
INSERT [Post] ([Title]) VALUES ('Инженер')



CREATE TABLE [DepartmentEmpl] (

	[ID]					INT IDENTITY (1, 1)						,
	[Title]					NVARCHAR (50)							NOT NULL,
	CONSTRAINT PK_DepartmentEmpl_ID PRIMARY KEY ([ID])

)
GO

INSERT [DepartmentEmpl] ([Title]) VALUES ('Цех №1')
INSERT [DepartmentEmpl] ([Title]) VALUES ('Цех №2')
INSERT [DepartmentEmpl] ([Title]) VALUES ('Цех №3')
INSERT [DepartmentEmpl] ([Title]) VALUES ('Цех №4')




CREATE TABLE [Employees] (

	[ID]					INT IDENTITY (1, 1)						,
	[FirstName]				NVARCHAR (MAX)							NOT NULL,
	[LastName]				NVARCHAR (MAX)							NOT NULL,
	[Age]					NVARCHAR (50)							NOT NULL,
	[IDGender]				INT CONSTRAINT FK_Employees_IDGender_Gender_ID FOREIGN KEY REFERENCES [Gender]	([ID])		NULL,
	[IDPost]				INT CONSTRAINT FK_Employees_IDPost_Post_ID FOREIGN KEY REFERENCES [Post]	([ID])		NULL,
	[MonthlySalary]			NVARCHAR (MAX)							NULL,
	[IDDepartmentEmpl]		INT CONSTRAINT FK_Employees_IDDepartmentEmpl_DepartmentEmpl_ID FOREIGN KEY REFERENCES [DepartmentEmpl] ([ID])	NULL,
	CONSTRAINT PK_Employees_ID PRIMARY KEY ([ID])
)
GO

INSERT [Employees] ([FirstName], [LastName], [Age], [IDGender], [IDPost], [MonthlySalary], [IDDepartmentEmpl]) VALUES ('Арсен', 'Магомедов', '34', '1', '4', '30 000 руб.', '1')


CREATE TABLE [Period] (

	[ID]					INT IDENTITY (1, 1)						,
	[Title]					NVARCHAR (50)							NOT NULL,
	CONSTRAINT PK_Period_ID	PRIMARY KEY ([ID])

)
GO

INSERT [Period] ([Title]) VALUES ('День')
INSERT [Period] ([Title]) VALUES ('Неделя')
INSERT [Period] ([Title]) VALUES ('Месяц')
INSERT [Period] ([Title]) VALUES ('Год')


CREATE TABLE [DepartmentProd] (

	[ID]					INT IDENTITY (1, 1)						,
	[Title]					NVARCHAR (50)							NOT NULL,
	CONSTRAINT PK_DepartmentProd_ID PRIMARY KEY ([ID])

)
GO

INSERT [DepartmentProd] ([Title]) VALUES ('Цех №1')
INSERT [DepartmentProd] ([Title]) VALUES ('Цех №2')
INSERT [DepartmentProd] ([Title]) VALUES ('Цех №3')
INSERT [DepartmentProd] ([Title]) VALUES ('Цех №4')


CREATE TABLE [FinishedProducts] (

	[ID]					INT IDENTITY (1, 1)						,
	[Name]					NVARCHAR (50)							NOT NULL,
	[Count]					NVARCHAR (50)							NOT NULL,
	[IDPeriod]				INT CONSTRAINT FK_FinishedProducts_IDPeriod_Period_ID FOREIGN KEY REFERENCES [Period] ([ID])	NULL,
	[DateProduction]		DATE									NOT NULL,
	[IDDepartmentProd]		INT CONSTRAINT FK_Employees_IDDepartmentProd_DepartmentProd_ID FOREIGN KEY REFERENCES [DepartmentProd] ([ID])	NULL,
	CONSTRAINT PK_FinishedProducts_ID PRIMARY KEY ([ID])

)
GO

INSERT [FinishedProducts] ([Name], [Count], [IDPeriod], [DateProduction], [IDDepartmentProd]) VALUES ('Шоколад "Родной край"', '200 шт.', '1', '2021-05-22', '1')


CREATE TABLE [EmployeesAndProduct] (

	[ID]					INT IDENTITY (1, 1)						,
	[IDEmployees]			INT CONSTRAINT FK_Department_IDEmployees_Employees_ID FOREIGN KEY REFERENCES [Employees] ([ID])		ON DELETE CASCADE ON UPDATE CASCADE	 NULL,
	[IDFinishedProducts]	INT CONSTRAINT FK_Department_IDFinishedProducts_FinishedProducts_ID FOREIGN KEY REFERENCES [FinishedProducts] ([ID])	ON DELETE CASCADE ON UPDATE CASCADE NULL,
	CONSTRAINT PK_Department_ID PRIMARY KEY ([ID])

)
GO

INSERT [EmployeesAndProduct] ([IDEmployees], [IDFinishedProducts]) VALUES ( '1', '1')


CREATE TABLE [Warehouse] (

	[ID]					INT IDENTITY (1, 1)						,
	[Title]					NVARCHAR (50)							NOT NULL,
	CONSTRAINT PK_Warehouse_ID	PRIMARY KEY ([ID])	

)
GO

INSERT [Warehouse] ([Title]) VALUES ('Склад цеха №1')
INSERT [Warehouse] ([Title]) VALUES ('Склад цеха №2')
INSERT [Warehouse] ([Title]) VALUES ('Склад цеха №3')
INSERT [Warehouse] ([Title]) VALUES ('Склад цеха №4')
INSERT [Warehouse] ([Title]) VALUES ('')


CREATE TABLE [Supply] (

	[ID]					INT IDENTITY (1, 1)						,
	[NameProduct]			NVARCHAR (50)							NOT NULL,
	[Count]					NVARCHAR (50)							NOT NULL,
	[Price]					NVARCHAR (50)							NOT NULL,
	[DateSupply]			DATE									NOT NULL,
	[NameProvider]			NVARCHAR (MAX)							NOT NULL,
	[IDWarehouse]			INT CONSTRAINT FK_Supply_IDWarehouse_Warehouse_ID FOREIGN KEY REFERENCES [Warehouse] ([ID])		NULL,
	CONSTRAINT PK_Supply_ID PRIMARY KEY ([ID])

)
GO

INSERT [Supply] ([NameProduct], [Count], [Price], [DateSupply], [NameProvider], [IDWarehouse]) VALUES ('Молочный шоколад', '10 л.', '30 000 руб.', '2021-05-19', 'ООО "Лезарк"', '1')


CREATE TABLE [MainTable] (

	[ID]							INT IDENTITY (1, 1)				,
	[IDClientAndOrder]				INT CONSTRAINT FK_MainTable_IDClientAndOrder_ClientAndOrder_ID FOREIGN KEY REFERENCES [ClientAndOrder]	([ID]) ON DELETE CASCADE ON UPDATE CASCADE		NULL,
	[IDSupply]						INT CONSTRAINT FK_MainTable_IDSupply_Supply_ID FOREIGN KEY REFERENCES [Supply] ([ID])	ON DELETE CASCADE ON UPDATE CASCADE		NULL,
	[IDEmployeesAndProduct]		INT CONSTRAINT FK_MainTable_IDDepartment_Department_ID FOREIGN KEY REFERENCES [EmployeesAndProduct]	([ID])	ON DELETE CASCADE ON UPDATE CASCADE		NULL,
	CONSTRAINT PK_MainTable_ID PRIMARY KEY ([ID])

)
GO

INSERT [MainTable] ([IDClientAndOrder], [IDSupply], [IDEmployeesAndProduct]) VALUES ('1', '1', '1')