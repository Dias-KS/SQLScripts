CREATE DATABASE SelhozCompany

USE SelhozCompany



CREATE TABLE [Role] (

		[RoleID]	NCHAR (1)		NOT NULL,
		[Title]		NVARCHAR (50)	NOT NULL,
		CONSTRAINT PK_Role_RoleID PRIMARY KEY ([RoleID])

)
GO

INSERT [Role] ([RoleID], [Title]) VALUES ('A', 'Admin')
INSERT [Role] ([RoleID], [Title]) VALUES ('U', 'User')


CREATE TABLE [SignIn] (

		[ID]			INT IDENTITY (0, 1)		NOT NULL,
		[Usernamae]		NVARCHAR (50)			NOT NULL,
		[Password]		NVARCHAR (50)			NOT NULL,
		[IDRole]		NCHAR (1) CONSTRAINT FK_SignIn_IDRole_Role_RoleID  FOREIGN KEY REFERENCES [Role] ([RoleID]) ON DELETE CASCADE ON UPDATE CASCADE,
		CONSTRAINT PK_SignIn_ID	PRIMARY KEY ([ID])				

)
GO

INSERT [SignIn] ([Usernamae], [Password], [IDRole]) VALUES ('Dias','787898','A')
INSERT [SignIn] ([Usernamae], [Password], [IDRole]) VALUES ('Ali','12345','U')


-----------------------------------------------------------------------------------------------------------------------


CREATE TABLE [Company] (
		
		[ID]					INT IDENTITY,		
		[NameCompany]			NVARCHAR (50)			NOT NULL,
		[DateOfRegistration]	DATE					NOT NULL,
		[TypeOfProperty]		NVARCHAR (50)			NOT NULL,
		[Units]					NVARCHAR (50)			NOT NULL,
		[MainTypeProduct]		NVARCHAR (50)			NOT NULL,
		[AdvancedOr]			NVARCHAR (50)			NOT NULL,
		[Profit]				NVARCHAR (50)			NOT NULL,
		[Comment]				NVARCHAR (50)			NULL,
		CONSTRAINT PK_Company_ID PRIMARY KEY ([ID])


)
GO

SELECT * FROM [Company]
INSERT [Company] ([NameCompany],[DateOfRegistration],[TypeOfProperty],[Units],[MainTypeProduct],[AdvancedOr],[Profit]) VALUES ('—‡·ÌÂÚ','2020-12-17','ŒŒŒ', '20', '–˚·‡', 'ƒ‡', '1000000')

CREATE TABLE [Supply] (
		
		[ID]					INT IDENTITY,		
		[DateOfSupply]			DATE				NOT NULL,
		[Volume]				NVARCHAR (50)		 NULL,
		[CostPriceSuppliers]	NVARCHAR (50)		 NULL,
		CONSTRAINT PK_Supply_ID PRIMARY KEY ([ID])

	
)
GO

SELECT * FROM [Supply]
INSERT [Supply] ([DateOfSupply],[Volume],[CostPriceSuppliers]) VALUES ('2020-12-18','50KG','1000–”¡.')

CREATE TABLE [Product] (

		[ID]					INT IDENTITY,		
		[NameProduct]			NVARCHAR (50)	    NULL,
		[UnitOfMeasurement]		NVARCHAR (50)		NOT NULL,
		[PrurchasePrice]		NVARCHAR (50)		NULL,
		CONSTRAINT PK_Product_ID PRIMARY KEY ([ID])

)
GO

SELECT * FROM [Product]
INSERT [Product] ([NameProduct],[UnitOfMeasurement],[PrurchasePrice]) VALUES ('–˚·‡','kg','100')


CREATE TABLE [ConnectCompany] (

		[ID]			INT IDENTITY,
		[CompanyID]		INT CONSTRAINT FK_ConnectCompany_CompanyID_Company_ID FOREIGN KEY REFERENCES [Company] ([ID])  ON DELETE CASCADE ON UPDATE CASCADE,
		[SupplyID]		INT CONSTRAINT FK_ConnectCompany_SupplyID_Supply_ID FOREIGN KEY REFERENCES [Supply] ([ID])  ON DELETE CASCADE ON UPDATE CASCADE,
		[ProductID]		INT CONSTRAINT FK_ConnectCompany_ProductID_Product_ID FOREIGN KEY REFERENCES [Product] ([ID])  ON DELETE CASCADE ON UPDATE CASCADE,
		CONSTRAINT PK_ConnectCompany_ID PRIMARY KEY ([ID])
 
)

SELECT * FROM [ConnectCompany]
INSERT [ConnectCompany] ([CompanyID],[SupplyID],[ProductID]) VALUES ('4','2','2')
INSERT [ConnectCompany] ([CompanyID]) VALUES ('3')