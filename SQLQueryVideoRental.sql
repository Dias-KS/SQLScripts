CREATE DATABASE [dbVideoRental]

USE dbVideoRental

CREATE TABLE [Genre] (

	[ID]					INT IDENTITY (0, 1)		,
	[Title]					NVARCHAR (50)			NOT NULL,
	CONSTRAINT PK_Genre_ID PRIMARY KEY ([ID])

)
GO

CREATE TABLE [RecordVideotapeInfo] (

	[ID]					INT IDENTITY (0, 1)		,
	[Theme]					NVARCHAR (50)			NOT NULL,
	[YearRelease]			NVARCHAR (50)			NOT NULL,
	[CountryRelease]		NVARCHAR (50)			NOT NULL,
	[CinemaCompany]			NVARCHAR (50)			NOT NULL,
	[Description]			NVARCHAR (MAX)			NULL,
	[Actors]				NVARCHAR (MAX)			NOT NULL,
	[Director]				NVARCHAR (50)			NOT NULL,
	CONSTRAINT PK_RecordVidetapeInfo_ID PRIMARY KEY ([ID])
	
)
GO

CREATE TABLE [RecordVideotape] (

	[ID]					INT IDENTITY (0, 1)		,
	[Name]					NVARCHAR (50)			NOT NULL,
	[Duration]				NVARCHAR (50)			NOT NULL,
	[IDGenre]				INT	CONSTRAINT FK_RecordVideotape_IDGenre_Genre_ID FOREIGN KEY REFERENCES [Genre] ([ID])	NOT NULL,
	[IDRecordVideoTapeInfo] INT CONSTRAINT FK_RecordVideotape_IDRecordVideoTapeInfo_RecordVideotapeInfo_ID FOREIGN KEY REFERENCES [RecordVideotapeInfo] ([ID])	NOT NULL,
	CONSTRAINT PK_RecordVideotape_ID PRIMARY KEY ([ID])

)
GO

CREATE TABLE [MarkVideotape] (

	[ID]					INT IDENTITY (0, 1)		,
	[Title]					NVARCHAR (50)			NOT NULL,
	CONSTRAINT PK_MarkVideotape_ID PRIMARY KEY ([ID])

)
GO

CREATE TABLE [Videotape] (

	[ID]					INT IDENTITY (0, 1)		,
	[BriefDescription]		NVARCHAR (MAX)			NOT NULL,
	[ViewImage]				IMAGE					NULL,
	[IDMark]				INT	 CONSTRAINT FK_Videotape_IDMark_MarkVideotape_ID FOREIGN KEY REFERENCES [MarkVideotape] ([ID])  NOT NULL,
	[PriceUnit]				NVARCHAR (50)			NOT NULL,
	[Availability]			NVARCHAR (50)			NOT NULL,
	[RecordingTime]			NVARCHAR (50)			NOT NULL,
	[IDRecordVideotape]		INT CONSTRAINT FK_Videotape_IDRecordVideotape_RecordVideotape_ID FOREIGN KEY REFERENCES [RecordVideotape]	([ID])	NOT NULL,
	[IDOrders]				INT CONSTRAINT FK_Videotape_IDOrders_Orders_ID FOREIGN KEY REFERENCES [Orders]	([ID])		NOT NULL,
	CONSTRAINT PK_Videotape_ID PRIMARY KEY ([ID])
		

)
GO

CREATE TABLE [Orders] (

	[ID]					INT IDENTITY (0, 1)		,
	[NameVideotape]			NVARCHAR (50)			NOT NULL,
	[DateOfIssue]			DATE					NOT NULL,
	[ReturnDate]			DATE					NOT NULL,
	[TotalOrderPrice]		NVARCHAR (50)			NOT NULL,
	[ReturnOr]				NVARCHAR (50)			NOT NULL,
	CONSTRAINT PK_Orders_ID PRIMARY KEY ([ID])

)
GO


/* Скрипт добавления */


INSERT [Orders] ([NameVideotape], [DateOfIssue], [ReturnDate], [TotalOrderPrice], [ReturnOr]) VALUES ('T-90', '2021-04-01', '2021-04-07', '600', 'Да')


/* Скрипт редактирования */


UPDATE [Orders] set [ReturnOr] = 'Нет' WHERE ID = 0


/* Скрипт удаления */


DELETE FROM [Orders] WHERE ID = 0


/* Скрипт фильтрации */


SELECT * FROM [Orders] WHERE TotalOrderPrice > '200'

