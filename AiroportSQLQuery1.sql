USE dbAiroport

CREATE TABLE [Role] (

		[IDRole]					NCHAR (1)							NOT NULL,
		[Title]						NVARCHAR (50)						NOT NULL,
		CONSTRAINT PK_Role_IDRole PRIMARY KEY ([IDRole])

)
GO

INSERT [Role] ([IDRole], [Title]) VALUES ('A', 'Admin')
INSERT [Role] ([IDRole], [Title]) VALUES ('U', 'User')

CREATE TABLE [SignIn] (

		[ID]						INT IDENTITY (1, 1)					,
		[Username]					NVARCHAR (50)						NOT NULL,
		[Password]					NVARCHAR (50)						NOT NULL,
		[RoleID]					NCHAR (1)	CONSTRAINT FK_SignIn_RoleID_Role_IDRole FOREIGN KEY REFERENCES	[Role] ([IDRole])	ON DELETE CASCADE ON UPDATE CASCADE		NOT NULL,
		CONSTRAINT PK_SignIn_ID PRIMARY KEY ([ID])

)
GO

INSERT [SignIn] ([Username], [Password], [RoleID]) VALUES ('Dias', '787898', 'A')
INSERT [SignIn] ([Username], [Password], [RoleID]) VALUES ('Abdulla', '8020720', 'U')

------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE [RouteInfo] (

		[ID]						INT IDENTITY (1, 1)					,
		[DateTimeDeparture]			DATETIME							NOT NULL,
		[DateTimeArrival]			DATETIME							NOT NULL,
		[CountSaleTicket]			INT									NOT NULL,
		CONSTRAINT PK_RouteInfo_ID	PRIMARY KEY ([ID])	

)
GO

INSERT [RouteInfo] ([DateTimeDeparture], [DateTimeArrival], [CountSaleTicket]) VALUES ('2020-01-01', '2020-01-02', '250')




CREATE TABLE [Route] (

		[ID]						INT IDENTITY (1, 1)					,
		[NumberRoute]				NVARCHAR (MAX)						NOT NULL,
		[Distance]					NVARCHAR(MAX)						NOT NULL,
		[PointOfDeparture]			NVARCHAR(MAX)						NOT NULL,
		[PointOfDestination]		NVARCHAR(MAX)						NOT NULL,
		[IDRouteInfo]				INT CONSTRAINT FK_Route_IDRouteInfo_RouteInfo_ID FOREIGN KEY REFERENCES [RouteInfo] ([ID])	ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
		CONSTRAINT	PK_Route_ID		PRIMARY KEY ([ID])

)
GO

INSERT [Route] ([NumberRoute], [Distance], [PointOfDeparture], [PointOfDestination], [IDRouteInfo]) VALUES ('FK 720', '2520 км.', 'Махачкала', 'Санкт-Петербург', '1')


CREATE TABLE [TypeAirplane] (

		[ID]						INT	IDENTITY (1, 1)					,
		[Title]						NVARCHAR (MAX)						NOT NULL,
		CONSTRAINT PK_TypeAirplane_ID PRIMARY KEY ([ID])
)
GO

INSERT [TypeAirplane] ([Title]) VALUES ('Поршневые')
INSERT [TypeAirplane] ([Title]) VALUES ('Турбовинтовые')
INSERT [TypeAirplane] ([Title]) VALUES ('Турбореактивные')


CREATE TABLE [Airplane] (

		[ID]						INT IDENTITY (1, 1)					,
		[NumberAirplane]			NVARCHAR (MAX)						NOT NULL,
		[IDTypeAirplane]			INT		CONSTRAINT FK_Airplane_IDTypeAirplane_TypeAirplane_ID	FOREIGN KEY REFERENCES 	[TypeAirplane]	([ID])	 ON DELETE CASCADE ON UPDATE CASCADE		NOT NULL,
		[NumberOfSeats]				INT									NOT NULL,
		[SpeedOfFlight]				NVARCHAR (MAX)						NOT NULL,
		[IDRoute]					INT		CONSTRAINT PK_Airplane_IDRoute_Route_ID FOREIGN KEY REFERENCES [Route] ([ID]) ON DELETE CASCADE ON UPDATE CASCADE		NOT NULL,
		[Picture]					IMAGE								NULL,
		CONSTRAINT PK_Airplane_ID PRIMARY KEY ([ID])

)
GO	

ALTER TABLE [Airplane]
ALTER COLUMN [Picture] NVARCHAR (MAX)	NULL

INSERT [Airplane] ([NumberAirplane], [IDTypeAirplane], [NumberOfSeats], [SpeedOfFlight], [IDRoute]) VALUES ('ТУ-154', '1', '255', '220 км/ч', '1')