USE dbSelhoz

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

		GO

		-------------------------------------------------------------------------------------------------------------
		-------------------------------------------------------------------------------------------------------------

		CREATE TABLE [Company] (
		
				[ID]					INT IDENTITY				,
				[NameCompany]			NVARCHAR (MAX)				NOT NULL,
				[DateOfRegistration]	DATE						NOT NULL,
				[TypeOfPproperty]		NVARCHAR (MAX)				NOT NULL,
				[QuantityOfEmployees]	NVARCHAR (MAX)				NOT NULL,
				[MainTypeProduct]		NVARCHAR (MAX)				NOT NULL,
				[AdvancedOr]			NVARCHAR (MAX)				NOT NULL,
				[Price]					NVARCHAR (MAX)				NOT NULL,
				[Comment]				NVARCHAR (MAX)				NULL,
				CONSTRAINT PK_Company_ID PRIMARY KEY ([ID])
		)
		GO

		INSERT [Company] ([NameCompany], [DateOfRegistration], [TypeOfPproperty], [QuantityOfEmployees], [MainTypeProduct], [AdvancedOr], [Price]) VALUES 
		('����������', '1990-06-12', '���' ,'28', '������� ����', '��', '70 000')

		SELECT * FROM Company


		CREATE TABLE [Supply] (
		
					[ID]					INT IDENTITY				NOT NULL,
					[DateOfSupply]			DATE						NOT NULL,
					[Volume]				NVARCHAR (MAX)				NOT NULL,
					[CostPriseSuppliers]	NVARCHAR (MAX)				NOT NULL,
					CONSTRAINT PK_Supply_ID PRIMARY KEY ([ID])

		)
		GO

		INSERT [Supply] ([DateOfSupply], [Volume], [CostPriseSuppliers])	VALUES	('2020-05-17', '20��', '100')
		INSERT [Supply] ([DateOfSupply], [Volume], [CostPriseSuppliers])	VALUES	('2020-04-11', '10��', '5 000')

		SELECT * FROM Supply


		CREATE TABLE [Product] (
		
				[ID]					INT IDENTITY			NOT NULL,
				[NameProduct]			NVARCHAR (MAX)			NOT NULL,
				[Unit]					NVARCHAR (MAX)			NOT NULL,
				[PurchasePrice]			NVARCHAR (MAX)			NOT NULL,
				CONSTRAINT PK_Product_ID PRIMARY KEY ([ID])

		)
		GO

		INSERT [Product] ([NameProduct], [Unit], [PurchasePrice])	VALUES	('������� ����', '��', '10 000')

		SELECT * FROM Product


		CREATE TABLE [ConnectCompany] (
		
				[ID]			INT IDENTITY		NOT NULL,
				[CompanyID]		INT CONSTRAINT FK_ConnectCompany_CompanyID_Company_ID FOREIGN KEY REFERENCES [Company] ([ID]) 	,
				[SupplyID]		INT CONSTRAINT FK_ConnectCompany_SupplyID_Supply_ID   FOREIGN KEY REFERENCES [Supply]  ([ID]) 	,
				[ProductID]		INT CONSTRAINT FK_ConnectCompany_ProductID_Product_ID FOREIGN KEY REFERENCES [Product] ([ID]) 	,
				CONSTRAINT PK_ConnectCompany_ID	PRIMARY KEY ([ID])
		)
		GO

		INSERT [ConnectCompany] ([CompanyID], [SupplyID], [ProductID])	VALUES	('1', '1', '1')
		INSERT [ConnectCompany] ([SupplyID]) VALUES ('2')

		ALTER TABLE [ConnectCompany] ALTER COLUMN [CompanyID] INT NULL

		SELECT * FROM ConnectCompany

		

		

		

		 
