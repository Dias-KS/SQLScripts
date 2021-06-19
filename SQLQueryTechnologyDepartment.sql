CREATE DATABASE [dbTechnologyDepartment]

USE dbTechnologyDepartment

CREATE TABLE [HumanResources] (

	[ID]			INT IDENTITY (1, 1)			,
	[Total]			NVARCHAR (50)				NULL,
	[ForUnit]		NVARCHAR (50)				NULL,
	[Necessary]		NVARCHAR (50)				NULL,
	[Real]			NVARCHAR (50)				NULL,
	CONSTRAINT PK_HumanResources_ID PRIMARY KEY ([ID])

)
GO

INSERT [HumanResources] ([Total], [ForUnit], [Necessary], [Real]) VALUES ('50', '10', '10', '10')
INSERT [HumanResources] ([Total], [ForUnit], [Necessary], [Real]) VALUES ('30', '6', '6', '5')


CREATE TABLE [TypeEquipment] (

	[ID]			INT IDENTITY (1, 1)			,
	[Title]			NVARCHAR (50)				NULL,
	CONSTRAINT PK_TypeEquipment_ID PRIMARY KEY ([ID])

)
GO

INSERT [TypeEquipment] ([Title]) VALUES ('Станок')
INSERT [TypeEquipment] ([Title]) VALUES ('Гидравлический пресс')
INSERT [TypeEquipment] ([Title]) VALUES ('Кузница')
INSERT [TypeEquipment] ([Title]) VALUES ('Сварочный аппарат')


CREATE TABLE [Equipment] (

	[ID]					INT IDENTITY (1, 1)			,
	[EquipmentName]			NVARCHAR (50)				NULL,
	[IDType]				INT CONSTRAINT FK_Equipment_IDType_TypeEquipment_ID FOREIGN KEY REFERENCES [TypeEquipment] ([ID])		NULL,
	[StartDate]				DATE						NULL,
	[DepreciationPeriods]	NVARCHAR (50)				NULL,
	[Performance]			NVARCHAR (50)				NULL,
	CONSTRAINT PK_Equipment_ID PRIMARY KEY ([ID])
	

)
GO

INSERT [Equipment] ([EquipmentName], [IDType], [StartDate], [DepreciationPeriods], [Performance]) VALUES ('SSRC - 2500M', '1', '2021-05-01', '20 лет', '20 кВт-Ч')
INSERT [Equipment] ([EquipmentName], [IDType], [StartDate], [DepreciationPeriods], [Performance]) VALUES ('M-600', '3', '2021-05-21', '14 лет', '10 кВт-Ч')



CREATE TABLE [Affiliation] (

	[ID]		INT IDENTITY (1, 1)				,
	[Title]		NVARCHAR (50)					NOT NULL,
	CONSTRAINT PK_Affiliation_ID PRIMARY KEY ([ID])

)
GO

INSERT [Affiliation] ([Title]) VALUES ('Явл. сырьем')
INSERT [Affiliation] ([Title]) VALUES ('Производится на предприятии')


CREATE TABLE [TypeMaterial] (

	[ID]		INT IDENTITY (1, 1)				,
	[Title]		NVARCHAR (50)					NOT NULL,
	CONSTRAINT PK_TypeMaterial_ID PRIMARY KEY ([ID])

)
GO

INSERT [TypeMaterial] ([Title]) VALUES ('Металлы')
INSERT [TypeMaterial] ([Title]) VALUES ('Керамика')
INSERT [TypeMaterial] ([Title]) VALUES ('Полимеры')


CREATE TABLE [Materials] (

	[ID]					INT IDENTITY (1, 1)				,
	[IDTypeMaterial]		INT CONSTRAINT FK_Materials_IDTypeMaterial_TypeMaterial_ID FOREIGN KEY REFERENCES [TypeMaterial] ([ID])		NULL,
	[Marks]					NVARCHAR (50)	NULL,
	[IDAffiliation]			INT CONSTRAINT FK_Materials_IDAffiliation_Affiliation_ID   FOREIGN KEY REFERENCES [Affiliation]	 ([ID])		NULL,
	[VolumesUsed]			NVARCHAR (50)	NULL,
	[TechnicalProcess]		NVARCHAR (MAX)	NULL,
	[Price]					NVARCHAR (50)	NULL,
	CONSTRAINT PK_Materials_ID PRIMARY KEY ([ID])

)
GO

INSERT [Materials] ([IDTypeMaterial], [Marks], [IDAffiliation], [VolumesUsed], [TechnicalProcess], [Price]) VALUES ('1', '"Металлург"', '1', '200 кг.', 'Переработка', '100 000 руб.')
INSERT [Materials] ([IDTypeMaterial], [Marks], [IDAffiliation], [VolumesUsed], [TechnicalProcess], [Price]) VALUES ('1', '"Металлург"', '1', '12 кг.', 'Переработка', '22 000 руб.')


CREATE TABLE [ProductionProcess] (

	[ID]						INT IDENTITY (1, 1)				,
	[ProductName]				NVARCHAR (50)					NULL,
	[VolumeProduction]			NVARCHAR (50)					NULL,
	[IDMaterials]				INT CONSTRAINT FK_ProductionProcess_IDMaterials_Materials_ID FOREIGN KEY REFERENCES [Materials] ([ID])	ON DELETE CASCADE ON UPDATE CASCADE  NULL,
	[QuantityMaterialsForUnit]	NVARCHAR (50)					NULL,
	[ProductionWaste]			NVARCHAR (50)					NULL,
	[IDEquipment]				INT CONSTRAINT FK_ProductionProcess_IDEquipment_Equipment_ID FOREIGN KEY REFERENCES [Equipment]	([ID])	ON DELETE CASCADE ON UPDATE CASCADE  NULL,
	[IDHumanResources]			INT CONSTRAINT FK_ProductionProcess_IDHumanResources_ID FOREIGN KEY REFERENCES [HumanResources] ([ID])	ON DELETE CASCADE ON UPDATE CASCADE  NULL,
	CONSTRAINT PK_ProductionProcess_ID PRIMARY KEY ([ID])

)
GO

INSERT [ProductionProcess] ([ProductName], [VolumeProduction], [IDMaterials], [QuantityMaterialsForUnit], [ProductionWaste], [IDEquipment], [IDHumanResources]) VALUES ('Трубы', '200 шт.', '1', '1 кг./ед.', '100 г.', '1', '1')




/********************************* МАНИПУЛЯЦИИ С ДАННЫМИ *********************************/



/** Добавление **/

INSERT [ProductionProcess] ([ProductName], [VolumeProduction], [IDMaterials], [QuantityMaterialsForUnit], [ProductionWaste], [IDEquipment], [IDHumanResources]) VALUES ('Гвозди', '800 шт.', '2', '600 г./ед.', '80 г.', '2', '2')



/** Удаление **/

DELETE FROM [ProductionProcess] WHERE ID = 1



/** Редактирование **/

UPDATE [ProductionProcess] set [VolumeProduction] = '250' WHERE ID = 1



/** Фильтрация **/

SELECT * FROM [ProductionProcess] WHERE [VolumeProduction] = '800 шт.'







