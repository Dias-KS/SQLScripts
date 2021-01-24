CREATE DATABASE [AcademyFitness2]

USE [AcademyFitness2]
GO


CREATE TABLE [Trainer] (
	
	[Id]	INT IDENTITY (0, 1)	NOT NULL,
	[NAME]	NVARCHAR (50)		NOT NULL,
	CONSTRAINT PK_Trainer_Id PRIMARY KEY ([Id])

)
GO

CREATE TABLE [Course] (

	[Id]	INT IDENTITY (0, 1) NOT NULL,
	[Title] NVARCHAR (50)		NOT NULL,
	CONSTRAINT PK_Course_Id PRIMARY KEY ([Id])

)

CREATE TABLE [CourseRegistration] (

	[Id]				INT IDENTITY (0, 1) NOT NULL,
	[TrainerId]			INT CONSTRAINT FK_CourseRegistration_TrainerId_Trainer_Id	FOREIGN KEY REFERENCES [Trainer] ([Id]) NOT NULL,
	[CourseId]			INT CONSTRAINT FK_CourseRegistration_CourseId_Course_Id		FOREIGN KEY REFERENCES [Course]	 ([Id]) NOT NULL,
	[CreatedDate]		DATE NOT NULL,
	[IsDone]			BIT NOT NULL,
	[TotalPoint]		INT NOT NULL,
	[CertificateImage]	IMAGE NULL,
	[Comment]			NVARCHAR (100) NULL,
	CONSTRAINT PK_CourseRegistration_Id PRIMARY KEY ([Id])

)