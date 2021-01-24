CREATE DATABASE Academy_fitness


CREATE TABLE Trainer (

	[Id] INT PRIMARY KEY IDENTITY (0,1) not null,
	[Name] NVARCHAR (50) not null

)
GO

CREATE TABLE Course (

	[Id] INT PRIMARY KEY IDENTITY (0,1) not null,
	[Title] NVARCHAR (50) not null

)
GO

CREATE TABLE CourseRegistration (

	[Id]				INT PRIMARY KEY IDENTITY (0, 1), 
	[TrainerId]			INT CONSTRAINT FK_CourseRegistration_TrainerId_Trainer_Id	FOREIGN KEY REFERENCES	[Trainer]	([Id]) not null,
	[CourseId]			INT CONSTRAINT FK_CourseRegistration_CourseId_Course_Id		FOREIGN KEY REFERENCES	[Course]	([Id]) not null,
	[CreatedDate]		DATE not null,
	[IsDone]			BIT	 not null,
	[TotalPoint]		INT  not null,
	[CertificateImage]	IMAGE null

)
GO	