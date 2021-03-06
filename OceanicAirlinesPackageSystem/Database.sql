USE [OA_DB]
GO
/****** Object:  Table [dbo].[by]    Script Date: 07-10-2015 10:30:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[by](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CityId] [bigint] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[forsendelse]    Script Date: 07-10-2015 10:30:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[forsendelse](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PakkeId] [bigint] NULL,
	[StartBy] [bigint] NULL,
	[SlutBy] [bigint] NULL,
	[AfsendelsesDato] [date] NOT NULL DEFAULT (getdate()),
	[Saved] [bit] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[forsendelsesRute]    Script Date: 07-10-2015 10:30:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[forsendelsesRute](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ForsendelsesId] [bigint] NULL,
	[StartBy] [bigint] NULL,
	[SlutBy] [bigint] NULL,
	[Price] [bigint] NOT NULL,
	[TransportTime] [int] NOT NULL,
	[TransportType] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[forsendelsesType]    Script Date: 07-10-2015 10:30:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[forsendelsesType](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ForsendelsesId] [bigint] NULL,
	[packetTypeId] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[packetType]    Script Date: 07-10-2015 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[packetType](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PacketType] [nvarchar](50) NOT NULL,
	[multiplier] [real] NOT NULL DEFAULT ((1.0)),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[pakke]    Script Date: 07-10-2015 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pakke](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Weight] [int] NOT NULL,
	[Sender] [bigint] NULL,
	[SizeHight] [int] NOT NULL,
	[SizeWidth] [int] NOT NULL,
	[SizeDepth] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[pakkeDimintioner]    Script Date: 07-10-2015 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pakkeDimintioner](
	[Name] [nvarchar](50) NOT NULL,
	[Height] [int] NOT NULL,
	[Width] [int] NOT NULL,
	[Depth] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[pakkePris]    Script Date: 07-10-2015 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pakkePris](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[DimentionsNavn] [nvarchar](50) NULL,
	[FromWeight] [int] NOT NULL,
	[ToWeight] [int] NOT NULL,
	[Price] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[rute]    Script Date: 07-10-2015 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rute](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Time] [int] NOT NULL,
	[StartCity] [bigint] NOT NULL,
	[EndCity] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StartCity] ASC,
	[EndCity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[transportType]    Script Date: 07-10-2015 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transportType](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TransportType] [nvarchar](50) NOT NULL,
	[Company] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[users]    Script Date: 07-10-2015 10:30:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[BrugerNavn] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[IsAdmin] [bit] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET IDENTITY_INSERT [dbo].[by] ON 

INSERT [dbo].[by] ([Id], [CityId], [Name], [Active]) VALUES (1, 1, N'Cairo', 1)
INSERT [dbo].[by] ([Id], [CityId], [Name], [Active]) VALUES (2, 2, N'Tanger', 1)
INSERT [dbo].[by] ([Id], [CityId], [Name], [Active]) VALUES (3, 3, N'Tunis', 0)
INSERT [dbo].[by] ([Id], [CityId], [Name], [Active]) VALUES (4, 4, N'Tripoli', 0)
INSERT [dbo].[by] ([Id], [CityId], [Name], [Active]) VALUES (5, 5, N'De Kanariske Øer', 0)
INSERT [dbo].[by] ([Id], [CityId], [Name], [Active]) VALUES (6, 6, N'Marrakesh', 1)
INSERT [dbo].[by] ([Id], [CityId], [Name], [Active]) VALUES (7, 7, N'Sahara', 0)
INSERT [dbo].[by] ([Id], [CityId], [Name], [Active]) VALUES (8, 8, N'Dakar', 0)
INSERT [dbo].[by] ([Id], [CityId], [Name], [Active]) VALUES (9, 9, N'Sierra Leone', 1)
INSERT [dbo].[by] ([Id], [CityId], [Name], [Active]) VALUES (10, 10, N'Guldkysten', 1)
INSERT [dbo].[by] ([Id], [CityId], [Name], [Active]) VALUES (11, 11, N'Timbuktu', 0)
INSERT [dbo].[by] ([Id], [CityId], [Name], [Active]) VALUES (12, 12, N'Slavekysten', 1)
INSERT [dbo].[by] ([Id], [CityId], [Name], [Active]) VALUES (13, 13, N'Wadai', 0)
INSERT [dbo].[by] ([Id], [CityId], [Name], [Active]) VALUES (14, 14, N'Darfur', 1)
INSERT [dbo].[by] ([Id], [CityId], [Name], [Active]) VALUES (15, 15, N'Omdurman', 0)
INSERT [dbo].[by] ([Id], [CityId], [Name], [Active]) VALUES (16, 16, N'Suakin', 1)
INSERT [dbo].[by] ([Id], [CityId], [Name], [Active]) VALUES (17, 17, N'Addis Abeba', 0)
INSERT [dbo].[by] ([Id], [CityId], [Name], [Active]) VALUES (18, 18, N'Kap Guardafui', 1)
INSERT [dbo].[by] ([Id], [CityId], [Name], [Active]) VALUES (19, 19, N'Zanzibar', 1)
INSERT [dbo].[by] ([Id], [CityId], [Name], [Active]) VALUES (20, 20, N'Victoriasøen', 1)
INSERT [dbo].[by] ([Id], [CityId], [Name], [Active]) VALUES (21, 21, N'Bahrel Gghazal', 0)
INSERT [dbo].[by] ([Id], [CityId], [Name], [Active]) VALUES (22, 22, N'Congo', 0)
INSERT [dbo].[by] ([Id], [CityId], [Name], [Active]) VALUES (23, 23, N'Luanda', 1)
INSERT [dbo].[by] ([Id], [CityId], [Name], [Active]) VALUES (24, 24, N'Kabolo', 1)
INSERT [dbo].[by] ([Id], [CityId], [Name], [Active]) VALUES (25, 25, N'Mocambique', 1)
INSERT [dbo].[by] ([Id], [CityId], [Name], [Active]) VALUES (26, 26, N'Victoriafaldene', 0)
INSERT [dbo].[by] ([Id], [CityId], [Name], [Active]) VALUES (27, 27, N'Hvalbugten', 1)
INSERT [dbo].[by] ([Id], [CityId], [Name], [Active]) VALUES (28, 28, N'Dragebjerget', 1)
INSERT [dbo].[by] ([Id], [CityId], [Name], [Active]) VALUES (29, 29, N'Kapstaden', 1)
INSERT [dbo].[by] ([Id], [CityId], [Name], [Active]) VALUES (30, 30, N'Amatave', 1)
INSERT [dbo].[by] ([Id], [CityId], [Name], [Active]) VALUES (31, 31, N'Kap St. Marie', 1)
INSERT [dbo].[by] ([Id], [CityId], [Name], [Active]) VALUES (32, 32, N'St. Helena', 1)
SET IDENTITY_INSERT [dbo].[by] OFF
SET IDENTITY_INSERT [dbo].[forsendelse] ON 

INSERT [dbo].[forsendelse] ([Id], [PakkeId], [StartBy], [SlutBy], [AfsendelsesDato], [Saved]) VALUES (203, 203, 8, 18, CAST(N'0001-01-01' AS Date), 1)
INSERT [dbo].[forsendelse] ([Id], [PakkeId], [StartBy], [SlutBy], [AfsendelsesDato], [Saved]) VALUES (204, 204, 8, 18, CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[forsendelse] ([Id], [PakkeId], [StartBy], [SlutBy], [AfsendelsesDato], [Saved]) VALUES (205, 205, 4, 25, CAST(N'0001-01-01' AS Date), 1)
INSERT [dbo].[forsendelse] ([Id], [PakkeId], [StartBy], [SlutBy], [AfsendelsesDato], [Saved]) VALUES (206, 206, 4, 25, CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[forsendelse] ([Id], [PakkeId], [StartBy], [SlutBy], [AfsendelsesDato], [Saved]) VALUES (207, 207, 8, 18, CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[forsendelse] ([Id], [PakkeId], [StartBy], [SlutBy], [AfsendelsesDato], [Saved]) VALUES (208, 208, 8, 18, CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[forsendelse] ([Id], [PakkeId], [StartBy], [SlutBy], [AfsendelsesDato], [Saved]) VALUES (209, 209, 8, 18, CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[forsendelse] ([Id], [PakkeId], [StartBy], [SlutBy], [AfsendelsesDato], [Saved]) VALUES (210, 210, 8, 18, CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[forsendelse] ([Id], [PakkeId], [StartBy], [SlutBy], [AfsendelsesDato], [Saved]) VALUES (211, 211, 8, 18, CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[forsendelse] ([Id], [PakkeId], [StartBy], [SlutBy], [AfsendelsesDato], [Saved]) VALUES (212, 212, 8, 18, CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[forsendelse] ([Id], [PakkeId], [StartBy], [SlutBy], [AfsendelsesDato], [Saved]) VALUES (213, 213, 1, 2, CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[forsendelse] ([Id], [PakkeId], [StartBy], [SlutBy], [AfsendelsesDato], [Saved]) VALUES (214, 214, 1, 2, CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[forsendelse] ([Id], [PakkeId], [StartBy], [SlutBy], [AfsendelsesDato], [Saved]) VALUES (215, 215, 6, NULL, CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[forsendelse] ([Id], [PakkeId], [StartBy], [SlutBy], [AfsendelsesDato], [Saved]) VALUES (216, 216, 6, NULL, CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[forsendelse] ([Id], [PakkeId], [StartBy], [SlutBy], [AfsendelsesDato], [Saved]) VALUES (217, 217, 1, 2, CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[forsendelse] ([Id], [PakkeId], [StartBy], [SlutBy], [AfsendelsesDato], [Saved]) VALUES (218, 218, 1, 2, CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[forsendelse] ([Id], [PakkeId], [StartBy], [SlutBy], [AfsendelsesDato], [Saved]) VALUES (219, 219, 6, 5, CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[forsendelse] ([Id], [PakkeId], [StartBy], [SlutBy], [AfsendelsesDato], [Saved]) VALUES (220, 220, 6, 5, CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[forsendelse] ([Id], [PakkeId], [StartBy], [SlutBy], [AfsendelsesDato], [Saved]) VALUES (221, 221, 8, 18, CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[forsendelse] ([Id], [PakkeId], [StartBy], [SlutBy], [AfsendelsesDato], [Saved]) VALUES (222, 222, 8, 18, CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[forsendelse] ([Id], [PakkeId], [StartBy], [SlutBy], [AfsendelsesDato], [Saved]) VALUES (223, 223, 5, 29, CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[forsendelse] ([Id], [PakkeId], [StartBy], [SlutBy], [AfsendelsesDato], [Saved]) VALUES (224, 224, 5, 29, CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[forsendelse] ([Id], [PakkeId], [StartBy], [SlutBy], [AfsendelsesDato], [Saved]) VALUES (225, 225, 15, 5, CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[forsendelse] ([Id], [PakkeId], [StartBy], [SlutBy], [AfsendelsesDato], [Saved]) VALUES (226, 226, 15, 5, CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[forsendelse] ([Id], [PakkeId], [StartBy], [SlutBy], [AfsendelsesDato], [Saved]) VALUES (227, 227, 5, 21, CAST(N'0001-01-01' AS Date), 1)
INSERT [dbo].[forsendelse] ([Id], [PakkeId], [StartBy], [SlutBy], [AfsendelsesDato], [Saved]) VALUES (228, 228, 5, 21, CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[forsendelse] ([Id], [PakkeId], [StartBy], [SlutBy], [AfsendelsesDato], [Saved]) VALUES (229, 229, 1, 20, CAST(N'0001-01-01' AS Date), 1)
INSERT [dbo].[forsendelse] ([Id], [PakkeId], [StartBy], [SlutBy], [AfsendelsesDato], [Saved]) VALUES (230, 230, 1, 20, CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[forsendelse] ([Id], [PakkeId], [StartBy], [SlutBy], [AfsendelsesDato], [Saved]) VALUES (231, 231, 18, 1, CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[forsendelse] ([Id], [PakkeId], [StartBy], [SlutBy], [AfsendelsesDato], [Saved]) VALUES (232, 232, 18, 1, CAST(N'0001-01-01' AS Date), 1)
INSERT [dbo].[forsendelse] ([Id], [PakkeId], [StartBy], [SlutBy], [AfsendelsesDato], [Saved]) VALUES (233, 233, 29, 27, CAST(N'0001-01-01' AS Date), 1)
INSERT [dbo].[forsendelse] ([Id], [PakkeId], [StartBy], [SlutBy], [AfsendelsesDato], [Saved]) VALUES (234, 234, 29, 27, CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[forsendelse] ([Id], [PakkeId], [StartBy], [SlutBy], [AfsendelsesDato], [Saved]) VALUES (235, 235, 1, 11, CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[forsendelse] ([Id], [PakkeId], [StartBy], [SlutBy], [AfsendelsesDato], [Saved]) VALUES (236, 236, 1, 11, CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[forsendelse] ([Id], [PakkeId], [StartBy], [SlutBy], [AfsendelsesDato], [Saved]) VALUES (237, 237, 6, 2, CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[forsendelse] ([Id], [PakkeId], [StartBy], [SlutBy], [AfsendelsesDato], [Saved]) VALUES (238, 238, 6, 2, CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[forsendelse] ([Id], [PakkeId], [StartBy], [SlutBy], [AfsendelsesDato], [Saved]) VALUES (239, 239, 1, 2, CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[forsendelse] ([Id], [PakkeId], [StartBy], [SlutBy], [AfsendelsesDato], [Saved]) VALUES (240, 240, 1, 2, CAST(N'0001-01-01' AS Date), 1)
INSERT [dbo].[forsendelse] ([Id], [PakkeId], [StartBy], [SlutBy], [AfsendelsesDato], [Saved]) VALUES (241, 241, 1, 20, CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[forsendelse] ([Id], [PakkeId], [StartBy], [SlutBy], [AfsendelsesDato], [Saved]) VALUES (242, 242, 1, 20, CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[forsendelse] ([Id], [PakkeId], [StartBy], [SlutBy], [AfsendelsesDato], [Saved]) VALUES (243, 243, 1, 3, CAST(N'0001-01-01' AS Date), 1)
INSERT [dbo].[forsendelse] ([Id], [PakkeId], [StartBy], [SlutBy], [AfsendelsesDato], [Saved]) VALUES (244, 244, 1, 3, CAST(N'0001-01-01' AS Date), 1)
INSERT [dbo].[forsendelse] ([Id], [PakkeId], [StartBy], [SlutBy], [AfsendelsesDato], [Saved]) VALUES (245, 245, 18, 17, CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[forsendelse] ([Id], [PakkeId], [StartBy], [SlutBy], [AfsendelsesDato], [Saved]) VALUES (246, 246, 18, 17, CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[forsendelse] ([Id], [PakkeId], [StartBy], [SlutBy], [AfsendelsesDato], [Saved]) VALUES (247, 247, 22, 25, CAST(N'0001-01-01' AS Date), 1)
INSERT [dbo].[forsendelse] ([Id], [PakkeId], [StartBy], [SlutBy], [AfsendelsesDato], [Saved]) VALUES (248, 248, 22, 25, CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[forsendelse] ([Id], [PakkeId], [StartBy], [SlutBy], [AfsendelsesDato], [Saved]) VALUES (249, 249, 20, NULL, CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[forsendelse] ([Id], [PakkeId], [StartBy], [SlutBy], [AfsendelsesDato], [Saved]) VALUES (250, 250, 20, NULL, CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[forsendelse] ([Id], [PakkeId], [StartBy], [SlutBy], [AfsendelsesDato], [Saved]) VALUES (251, 251, 1, 5, CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[forsendelse] ([Id], [PakkeId], [StartBy], [SlutBy], [AfsendelsesDato], [Saved]) VALUES (252, 252, 1, 5, CAST(N'0001-01-01' AS Date), 1)
INSERT [dbo].[forsendelse] ([Id], [PakkeId], [StartBy], [SlutBy], [AfsendelsesDato], [Saved]) VALUES (253, 253, 5, 2, CAST(N'0001-01-01' AS Date), 1)
INSERT [dbo].[forsendelse] ([Id], [PakkeId], [StartBy], [SlutBy], [AfsendelsesDato], [Saved]) VALUES (254, 254, 5, 2, CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[forsendelse] ([Id], [PakkeId], [StartBy], [SlutBy], [AfsendelsesDato], [Saved]) VALUES (255, 255, 1, 20, CAST(N'0001-01-01' AS Date), 1)
INSERT [dbo].[forsendelse] ([Id], [PakkeId], [StartBy], [SlutBy], [AfsendelsesDato], [Saved]) VALUES (256, 256, 1, 20, CAST(N'0001-01-01' AS Date), 0)
SET IDENTITY_INSERT [dbo].[forsendelse] OFF
SET IDENTITY_INSERT [dbo].[forsendelsesRute] ON 

INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (737, 203, 30, 18, 96, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (738, 203, 29, 30, 96, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (739, 203, 32, 29, 96, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (740, 203, 9, 32, 96, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (741, 203, 8, 9, 12, 960, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (742, 204, 17, 18, 9, 720, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (743, 204, 16, 17, 9, 720, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (744, 204, 14, 16, 12, 960, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (745, 204, 7, 14, 24, 1920, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (746, 204, 6, 7, 15, 1200, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (747, 204, 8, 6, 24, 1920, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (748, 205, 20, 25, 18, 1440, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (749, 205, 16, 20, 128, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (750, 205, 14, 16, 128, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (751, 205, 4, 14, 128, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (752, 206, 20, 25, 18, 1440, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (753, 206, 21, 20, 6, 480, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (754, 206, 14, 21, 6, 480, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (755, 206, 15, 14, 9, 720, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (756, 206, 4, 15, 18, 1440, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (757, 207, 30, 18, 56, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (758, 207, 29, 30, 56, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (759, 207, 32, 29, 56, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (760, 207, 9, 32, 56, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (761, 207, 8, 9, 28, 960, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (762, 208, 16, 18, 20, 2880, 3)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (763, 208, 1, 16, 20, 2880, 3)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (764, 208, 3, 1, 25, 3600, 3)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (765, 208, 2, 3, 0, 0, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (766, 208, 5, 2, 15, 2160, 3)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (767, 208, 8, 5, 25, 3600, 3)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (768, 209, 30, 18, 56, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (769, 209, 29, 30, 56, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (770, 209, 32, 29, 56, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (771, 209, 9, 32, 56, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (772, 209, 8, 9, 28, 960, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (773, 210, 16, 18, 20, 2880, 3)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (774, 210, 1, 16, 20, 2880, 3)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (775, 210, 3, 1, 25, 3600, 3)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (776, 210, 2, 3, 0, 0, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (777, 210, 5, 2, 15, 2160, 3)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (778, 210, 8, 5, 25, 3600, 3)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (779, 211, 30, 18, 64, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (780, 211, 29, 30, 64, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (781, 211, 32, 29, 64, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (782, 211, 9, 32, 64, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (783, 211, 8, 9, 28, 960, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (784, 212, 16, 18, 20, 2880, 3)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (785, 212, 1, 16, 20, 2880, 3)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (786, 212, 3, 1, 25, 3600, 3)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (787, 212, 2, 3, 0, 0, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (788, 212, 5, 2, 15, 2160, 3)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (789, 212, 8, 5, 25, 3600, 3)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (790, 213, 4, 2, 48, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (791, 213, 14, 4, 48, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (792, 213, 16, 14, 48, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (793, 213, 1, 16, 48, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (794, 214, 3, 2, 0, 0, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (795, 214, 1, 3, 25, 3600, 3)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (796, 217, 4, 2, 128, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (797, 217, 14, 4, 128, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (798, 217, 16, 14, 128, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (799, 217, 1, 16, 128, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (800, 218, 3, 2, 0, 0, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (801, 218, 1, 3, 25, 3600, 3)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (802, 219, 2, 5, 15, 2160, 3)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (803, 219, 6, 2, 60, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (804, 220, 2, 5, 15, 2160, 3)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (805, 220, 6, 2, 60, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (806, 221, 30, 18, 64, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (807, 221, 29, 30, 64, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (808, 221, 32, 29, 64, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (809, 221, 9, 32, 64, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (810, 221, 8, 9, 28, 960, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (811, 222, 16, 18, 20, 2880, 3)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (812, 222, 1, 16, 20, 2880, 3)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (813, 222, 3, 1, 25, 3600, 3)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (814, 222, 2, 3, 0, 0, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (815, 222, 5, 2, 15, 2160, 3)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (816, 222, 8, 5, 25, 3600, 3)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (817, 223, 24, 29, 100, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (818, 223, 14, 24, 100, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (819, 223, 4, 14, 100, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (820, 223, 2, 4, 100, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (821, 223, 5, 2, 15, 2160, 3)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (822, 224, 32, 29, 45, 6480, 3)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (823, 224, 8, 32, 50, 7200, 3)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (824, 224, 5, 8, 25, 3600, 3)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (825, 225, 2, 5, 15, 2160, 3)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (826, 225, 4, 2, 152, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (827, 225, 14, 4, 152, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (828, 225, 15, 14, 9, 720, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (829, 226, 2, 5, 15, 2160, 3)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (830, 226, 3, 2, 9, 720, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (831, 226, 4, 3, 9, 720, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (832, 226, 15, 4, 18, 1440, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (833, 227, 14, 21, 6, 480, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (834, 227, 4, 14, 22, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (835, 227, 2, 4, 22, 480, 1)
GO
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (836, 227, 5, 2, 15, 2160, 3)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (837, 228, 14, 21, 6, 480, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (838, 228, 7, 14, 24, 1920, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (839, 228, 2, 7, 15, 1200, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (840, 228, 5, 2, 15, 2160, 3)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (841, 229, 16, 20, 20, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (842, 229, 1, 16, 20, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (843, 230, 21, 20, 6, 480, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (844, 230, 14, 21, 6, 480, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (845, 230, 15, 14, 9, 720, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (846, 230, 1, 15, 12, 960, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (847, 231, 16, 1, 40, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (848, 231, 20, 16, 40, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (849, 231, 18, 20, 40, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (850, 232, 15, 1, 12, 960, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (851, 232, 14, 15, 9, 720, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (852, 232, 16, 14, 12, 960, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (853, 232, 17, 16, 9, 720, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (854, 232, 18, 17, 9, 720, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (855, 233, 29, 27, 1200, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (856, 234, 29, 27, 12, 960, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (857, 235, 10, 11, 12, 960, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (858, 235, 4, 10, 56, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (859, 235, 14, 4, 56, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (860, 235, 16, 14, 56, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (861, 235, 1, 16, 56, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (862, 236, 6, 11, 15, 2160, 3)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (863, 236, 2, 6, 6, 480, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (864, 236, 3, 2, 9, 720, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (865, 236, 1, 3, 25, 3600, 3)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (866, 237, 6, 2, 6, 480, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (867, 238, 6, 2, 6, 480, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (868, 239, 4, 2, 40, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (869, 239, 14, 4, 40, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (870, 239, 16, 14, 40, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (871, 239, 1, 16, 40, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (872, 240, 3, 2, 9, 720, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (873, 240, 1, 3, 25, 3600, 3)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (874, 241, 16, 20, 64, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (875, 241, 1, 16, 64, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (876, 242, 21, 20, 6, 480, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (877, 242, 14, 21, 6, 480, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (878, 242, 15, 14, 9, 720, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (879, 242, 1, 15, 12, 960, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (880, 243, 4, 3, 9, 720, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (881, 243, 14, 4, 196, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (882, 243, 16, 14, 196, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (883, 243, 1, 16, 196, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (884, 244, 1, 3, 25, 3600, 3)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (885, 245, 18, 17, 9, 720, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (886, 246, 18, 17, 9, 720, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (887, 247, 23, 25, 30, 2400, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (888, 247, 22, 23, 9, 720, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (889, 248, 23, 25, 30, 2400, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (890, 248, 22, 23, 9, 720, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (891, 251, 2, 5, 15, 2160, 3)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (892, 251, 4, 2, 40, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (893, 251, 14, 4, 40, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (894, 251, 16, 14, 40, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (895, 251, 1, 16, 40, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (896, 252, 2, 5, 15, 2160, 3)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (897, 252, 3, 2, 9, 720, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (898, 252, 1, 3, 25, 3600, 3)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (899, 253, 5, 2, 15, 2160, 3)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (900, 254, 5, 2, 15, 2160, 3)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (901, 255, 16, 20, 56, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (902, 255, 1, 16, 56, 480, 1)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (903, 256, 21, 20, 6, 480, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (904, 256, 14, 21, 6, 480, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (905, 256, 15, 14, 9, 720, 2)
INSERT [dbo].[forsendelsesRute] ([Id], [ForsendelsesId], [StartBy], [SlutBy], [Price], [TransportTime], [TransportType]) VALUES (906, 256, 1, 15, 12, 960, 2)
SET IDENTITY_INSERT [dbo].[forsendelsesRute] OFF
SET IDENTITY_INSERT [dbo].[packetType] ON 

INSERT [dbo].[packetType] ([Id], [PacketType], [multiplier]) VALUES (1, N'Levende dyr', 60)
INSERT [dbo].[packetType] ([Id], [PacketType], [multiplier]) VALUES (2, N'Fødevare', 1.75)
INSERT [dbo].[packetType] ([Id], [PacketType], [multiplier]) VALUES (3, N'Anbefalet', 1)
INSERT [dbo].[packetType] ([Id], [PacketType], [multiplier]) VALUES (4, N'Våben', 2)
INSERT [dbo].[packetType] ([Id], [PacketType], [multiplier]) VALUES (5, N'Forsigtig forsendel', 1.1)
SET IDENTITY_INSERT [dbo].[packetType] OFF
SET IDENTITY_INSERT [dbo].[pakke] ON 

INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (1, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (2, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (3, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (4, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (5, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (6, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (7, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (8, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (9, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (10, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (11, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (12, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (13, 4500, NULL, 30, 50, 30)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (14, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (15, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (16, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (17, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (18, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (19, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (20, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (21, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (22, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (23, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (24, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (25, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (26, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (27, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (28, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (29, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (30, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (31, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (32, 2000, NULL, 20, 80, 20)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (33, 2333, NULL, 20, 80, 20)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (34, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (35, 34433, NULL, 15, 100, 15)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (36, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (37, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (38, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (39, 233, NULL, 20, 80, 20)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (40, 233, NULL, 20, 80, 20)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (41, 233, NULL, 20, 80, 20)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (42, 233, NULL, 20, 80, 20)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (43, 2333, NULL, 20, 80, 20)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (44, 2333, NULL, 20, 80, 20)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (45, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (46, 2333, NULL, 20, 80, 20)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (47, 2333, NULL, 20, 80, 20)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (48, 234, NULL, 15, 100, 15)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (49, 234, NULL, 15, 100, 15)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (50, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (51, 3244, NULL, 15, 100, 15)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (52, 3244, NULL, 15, 100, 15)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (53, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (54, 344, NULL, 20, 80, 20)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (55, 344, NULL, 20, 80, 20)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (56, 455, NULL, 20, 80, 20)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (57, 455, NULL, 20, 80, 20)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (58, 4500, NULL, 30, 50, 30)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (59, 4500, NULL, 30, 50, 30)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (60, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (61, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (63, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (66, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (67, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (68, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (69, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (70, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (71, 344, NULL, 20, 80, 20)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (72, 12345, NULL, 15, 100, 15)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (73, 12345, NULL, 15, 100, 15)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (74, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (75, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (76, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (77, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (78, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (79, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (80, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (81, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (82, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (83, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (84, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (85, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (86, 233, NULL, 20, 80, 20)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (87, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (88, 2133, NULL, 15, 100, 15)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (89, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (90, 1000, NULL, 25, 60, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (91, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (92, 0, NULL, 20, 80, 20)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (93, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (94, 2345, NULL, 20, 80, 20)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (95, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (96, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (97, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (98, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (99, 321, NULL, 25, 60, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (100, 3444, NULL, 20, 80, 20)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (101, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (102, 0, NULL, 15, 100, 15)
GO
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (103, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (104, 0, NULL, 20, 80, 20)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (105, 1333, NULL, 15, 100, 15)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (106, 1333, NULL, 15, 100, 15)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (107, 1000, NULL, 15, 100, 15)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (108, 1000, NULL, 15, 100, 15)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (109, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (110, 333, NULL, 20, 80, 20)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (111, 1233, NULL, 15, 100, 15)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (112, 1233, NULL, 15, 100, 15)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (113, 5444, NULL, 20, 80, 20)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (114, 5444, NULL, 20, 80, 20)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (115, 233, NULL, 15, 100, 15)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (116, 233, NULL, 15, 100, 15)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (117, 1233, NULL, 20, 80, 20)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (118, 6444, NULL, 25, 60, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (119, 6444, NULL, 25, 60, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (120, 1233, NULL, 20, 80, 20)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (121, 123, NULL, 15, 100, 15)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (122, 123, NULL, 20, 80, 20)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (123, 123, NULL, 15, 100, 15)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (124, 123, NULL, 20, 80, 20)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (125, 1000, NULL, 25, 25, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (126, 32, NULL, 15, 100, 15)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (127, 4545, NULL, 25, 60, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (128, 4545, NULL, 25, 60, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (129, 0, NULL, 40, 40, 40)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (130, 0, NULL, 40, 40, 40)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (131, 2333, NULL, 20, 80, 20)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (132, 2333, NULL, 20, 80, 20)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (133, 123, NULL, 25, 60, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (134, 123, NULL, 25, 60, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (135, 10, NULL, 15, 100, 15)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (136, 10, NULL, 15, 100, 15)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (137, 123, NULL, 15, 100, 15)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (138, 123, NULL, 15, 100, 15)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (139, 12, NULL, 25, 60, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (140, 12, NULL, 25, 60, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (141, 3242, NULL, 20, 80, 20)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (142, 3242, NULL, 20, 80, 20)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (143, 0, NULL, 25, 60, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (144, 0, NULL, 25, 60, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (145, 5433, NULL, 25, 60, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (146, 5433, NULL, 25, 60, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (147, 500, NULL, 25, 60, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (148, 500, NULL, 25, 60, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (149, 123, NULL, 25, 60, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (150, 123, NULL, 25, 60, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (151, 500, NULL, 40, 40, 40)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (152, 500, NULL, 40, 40, 40)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (153, 500, NULL, 40, 40, 40)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (154, 500, NULL, 40, 40, 40)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (155, 500, NULL, 40, 40, 40)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (156, 500, NULL, 40, 40, 40)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (157, 500, NULL, 40, 40, 40)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (158, 500, NULL, 40, 40, 40)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (159, 1500, NULL, 40, 40, 40)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (160, 1500, NULL, 40, 40, 40)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (161, 1500, NULL, 25, 60, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (162, 1500, NULL, 25, 60, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (163, 0, NULL, 40, 40, 40)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (164, 0, NULL, 40, 40, 40)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (165, 1500, NULL, 40, 40, 40)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (166, 1500, NULL, 40, 40, 40)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (167, 1500, NULL, 40, 40, 40)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (168, 1500, NULL, 40, 40, 40)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (169, 4321, NULL, 40, 40, 40)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (170, 4321, NULL, 40, 40, 40)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (171, 0, NULL, 25, 60, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (172, 0, NULL, 25, 60, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (173, 5432, NULL, 25, 60, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (174, 5432, NULL, 25, 60, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (175, 1500, NULL, 25, 60, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (176, 1500, NULL, 25, 60, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (177, 0, NULL, 25, 60, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (178, 0, NULL, 25, 60, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (179, 123, NULL, 15, 100, 15)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (180, 123, NULL, 15, 100, 15)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (181, 1000, NULL, 15, 100, 15)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (182, 1000, NULL, 15, 100, 15)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (183, 100, NULL, 15, 100, 15)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (184, 100, NULL, 15, 100, 15)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (185, 1230, NULL, 20, 80, 20)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (186, 1230, NULL, 20, 80, 20)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (187, 123, NULL, 20, 80, 20)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (188, 123, NULL, 20, 80, 20)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (189, 123, NULL, 15, 100, 15)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (190, 123, NULL, 15, 100, 15)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (191, 123, NULL, 20, 80, 20)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (192, 123, NULL, 20, 80, 20)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (193, 123, NULL, 20, 80, 20)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (194, 123, NULL, 20, 80, 20)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (195, 5432, NULL, 40, 40, 40)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (196, 5432, NULL, 40, 40, 40)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (197, 543, NULL, 40, 40, 40)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (198, 543, NULL, 40, 40, 40)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (199, 1231, NULL, 15, 100, 15)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (200, 1231, NULL, 15, 100, 15)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (201, 4322, NULL, 25, 60, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (202, 4322, NULL, 25, 60, 25)
GO
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (203, 123, NULL, 40, 40, 40)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (204, 123, NULL, 40, 40, 40)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (205, 1000, NULL, 20, 80, 20)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (206, 1000, NULL, 20, 80, 20)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (207, 100, NULL, 15, 100, 15)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (208, 100, NULL, 15, 100, 15)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (209, 123, NULL, 15, 100, 15)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (210, 123, NULL, 15, 100, 15)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (211, 333, NULL, 20, 80, 20)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (212, 333, NULL, 20, 80, 20)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (213, 23, NULL, 40, 40, 40)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (214, 23, NULL, 40, 40, 40)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (215, 0, NULL, 25, 60, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (216, 0, NULL, 25, 60, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (217, 123, NULL, 20, 80, 20)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (218, 123, NULL, 20, 80, 20)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (219, 3333, NULL, 25, 60, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (220, 3333, NULL, 25, 60, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (221, 1000, NULL, 20, 80, 20)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (222, 1000, NULL, 20, 80, 20)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (223, 3000, NULL, 30, 50, 30)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (224, 3000, NULL, 30, 50, 30)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (225, 1200, NULL, 15, 100, 15)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (226, 1200, NULL, 15, 100, 15)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (227, 1500, NULL, 40, 40, 40)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (228, 1500, NULL, 40, 40, 40)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (229, 1000, NULL, 40, 40, 40)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (230, 1000, NULL, 40, 40, 40)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (231, 1000, NULL, 25, 60, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (232, 1000, NULL, 25, 60, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (233, 1000, NULL, 40, 40, 40)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (234, 1000, NULL, 40, 40, 40)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (235, 1000, NULL, 15, 100, 15)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (236, 1000, NULL, 15, 100, 15)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (237, 1000, NULL, 40, 40, 40)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (238, 1000, NULL, 40, 40, 40)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (239, 1000, NULL, 25, 60, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (240, 1000, NULL, 25, 60, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (241, 212, NULL, 20, 80, 20)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (242, 212, NULL, 20, 80, 20)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (243, 1000, NULL, 15, 100, 15)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (244, 1000, NULL, 15, 100, 15)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (245, 0, NULL, 25, 60, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (246, 0, NULL, 25, 60, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (247, 1000, NULL, 20, 80, 20)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (248, 1000, NULL, 20, 80, 20)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (249, 1000, NULL, 20, 80, 20)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (250, 1000, NULL, 20, 80, 20)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (251, 2, NULL, 25, 60, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (252, 2, NULL, 25, 60, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (253, 1000, NULL, 25, 60, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (254, 1000, NULL, 25, 60, 25)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (255, 1000, NULL, 15, 100, 15)
INSERT [dbo].[pakke] ([Id], [Weight], [Sender], [SizeHight], [SizeWidth], [SizeDepth]) VALUES (256, 1000, NULL, 15, 100, 15)
SET IDENTITY_INSERT [dbo].[pakke] OFF
INSERT [dbo].[pakkeDimintioner] ([Name], [Height], [Width], [Depth]) VALUES (N'a', 25, 60, 25)
INSERT [dbo].[pakkeDimintioner] ([Name], [Height], [Width], [Depth]) VALUES (N'b', 40, 40, 40)
INSERT [dbo].[pakkeDimintioner] ([Name], [Height], [Width], [Depth]) VALUES (N'c', 15, 100, 15)
INSERT [dbo].[pakkeDimintioner] ([Name], [Height], [Width], [Depth]) VALUES (N'd', 20, 80, 20)
INSERT [dbo].[pakkeDimintioner] ([Name], [Height], [Width], [Depth]) VALUES (N'e', 30, 50, 30)
SET IDENTITY_INSERT [dbo].[pakkePris] ON 

INSERT [dbo].[pakkePris] ([Id], [DimentionsNavn], [FromWeight], [ToWeight], [Price]) VALUES (1, N'a', 0, 1000, 40)
INSERT [dbo].[pakkePris] ([Id], [DimentionsNavn], [FromWeight], [ToWeight], [Price]) VALUES (2, N'a', 1000, 5000, 60)
INSERT [dbo].[pakkePris] ([Id], [DimentionsNavn], [FromWeight], [ToWeight], [Price]) VALUES (3, N'a', 5000, 100000, 80)
INSERT [dbo].[pakkePris] ([Id], [DimentionsNavn], [FromWeight], [ToWeight], [Price]) VALUES (4, N'b', 0, 1000, 48)
INSERT [dbo].[pakkePris] ([Id], [DimentionsNavn], [FromWeight], [ToWeight], [Price]) VALUES (5, N'b', 1000, 5000, 20)
INSERT [dbo].[pakkePris] ([Id], [DimentionsNavn], [FromWeight], [ToWeight], [Price]) VALUES (6, N'b', 5000, 100000, 88)
INSERT [dbo].[pakkePris] ([Id], [DimentionsNavn], [FromWeight], [ToWeight], [Price]) VALUES (7, N'c', 0, 1000, 56)
INSERT [dbo].[pakkePris] ([Id], [DimentionsNavn], [FromWeight], [ToWeight], [Price]) VALUES (8, N'c', 1000, 5000, 76)
INSERT [dbo].[pakkePris] ([Id], [DimentionsNavn], [FromWeight], [ToWeight], [Price]) VALUES (9, N'c', 5000, 100000, 96)
INSERT [dbo].[pakkePris] ([Id], [DimentionsNavn], [FromWeight], [ToWeight], [Price]) VALUES (10, N'd', 0, 1000, 64)
INSERT [dbo].[pakkePris] ([Id], [DimentionsNavn], [FromWeight], [ToWeight], [Price]) VALUES (11, N'd', 1000, 5000, 84)
INSERT [dbo].[pakkePris] ([Id], [DimentionsNavn], [FromWeight], [ToWeight], [Price]) VALUES (12, N'd', 5000, 100000, 104)
INSERT [dbo].[pakkePris] ([Id], [DimentionsNavn], [FromWeight], [ToWeight], [Price]) VALUES (13, N'e', 0, 1000, 80)
INSERT [dbo].[pakkePris] ([Id], [DimentionsNavn], [FromWeight], [ToWeight], [Price]) VALUES (14, N'e', 1000, 5000, 100)
INSERT [dbo].[pakkePris] ([Id], [DimentionsNavn], [FromWeight], [ToWeight], [Price]) VALUES (15, N'e', 5000, 100000, 120)
SET IDENTITY_INSERT [dbo].[pakkePris] OFF
SET IDENTITY_INSERT [dbo].[rute] ON 

INSERT [dbo].[rute] ([Id], [Time], [StartCity], [EndCity]) VALUES (1, 8, 1, 16)
INSERT [dbo].[rute] ([Id], [Time], [StartCity], [EndCity]) VALUES (3, 8, 2, 4)
INSERT [dbo].[rute] ([Id], [Time], [StartCity], [EndCity]) VALUES (2, 8, 2, 6)
INSERT [dbo].[rute] ([Id], [Time], [StartCity], [EndCity]) VALUES (4, 8, 4, 2)
INSERT [dbo].[rute] ([Id], [Time], [StartCity], [EndCity]) VALUES (5, 8, 4, 10)
INSERT [dbo].[rute] ([Id], [Time], [StartCity], [EndCity]) VALUES (6, 8, 4, 14)
INSERT [dbo].[rute] ([Id], [Time], [StartCity], [EndCity]) VALUES (7, 8, 6, 2)
INSERT [dbo].[rute] ([Id], [Time], [StartCity], [EndCity]) VALUES (8, 8, 6, 9)
INSERT [dbo].[rute] ([Id], [Time], [StartCity], [EndCity]) VALUES (9, 8, 6, 10)
INSERT [dbo].[rute] ([Id], [Time], [StartCity], [EndCity]) VALUES (10, 8, 9, 6)
INSERT [dbo].[rute] ([Id], [Time], [StartCity], [EndCity]) VALUES (11, 8, 9, 32)
INSERT [dbo].[rute] ([Id], [Time], [StartCity], [EndCity]) VALUES (13, 8, 10, 4)
INSERT [dbo].[rute] ([Id], [Time], [StartCity], [EndCity]) VALUES (12, 8, 10, 6)
INSERT [dbo].[rute] ([Id], [Time], [StartCity], [EndCity]) VALUES (14, 8, 10, 23)
INSERT [dbo].[rute] ([Id], [Time], [StartCity], [EndCity]) VALUES (15, 8, 10, 27)
INSERT [dbo].[rute] ([Id], [Time], [StartCity], [EndCity]) VALUES (16, 8, 14, 4)
INSERT [dbo].[rute] ([Id], [Time], [StartCity], [EndCity]) VALUES (17, 8, 14, 16)
INSERT [dbo].[rute] ([Id], [Time], [StartCity], [EndCity]) VALUES (18, 8, 14, 24)
INSERT [dbo].[rute] ([Id], [Time], [StartCity], [EndCity]) VALUES (19, 8, 16, 1)
INSERT [dbo].[rute] ([Id], [Time], [StartCity], [EndCity]) VALUES (20, 8, 16, 14)
INSERT [dbo].[rute] ([Id], [Time], [StartCity], [EndCity]) VALUES (21, 8, 16, 20)
INSERT [dbo].[rute] ([Id], [Time], [StartCity], [EndCity]) VALUES (22, 8, 18, 20)
INSERT [dbo].[rute] ([Id], [Time], [StartCity], [EndCity]) VALUES (23, 8, 18, 30)
INSERT [dbo].[rute] ([Id], [Time], [StartCity], [EndCity]) VALUES (24, 8, 20, 16)
INSERT [dbo].[rute] ([Id], [Time], [StartCity], [EndCity]) VALUES (25, 8, 20, 18)
INSERT [dbo].[rute] ([Id], [Time], [StartCity], [EndCity]) VALUES (26, 8, 20, 28)
INSERT [dbo].[rute] ([Id], [Time], [StartCity], [EndCity]) VALUES (27, 8, 23, 10)
INSERT [dbo].[rute] ([Id], [Time], [StartCity], [EndCity]) VALUES (28, 8, 23, 27)
INSERT [dbo].[rute] ([Id], [Time], [StartCity], [EndCity]) VALUES (29, 8, 24, 14)
INSERT [dbo].[rute] ([Id], [Time], [StartCity], [EndCity]) VALUES (30, 8, 24, 29)
INSERT [dbo].[rute] ([Id], [Time], [StartCity], [EndCity]) VALUES (31, 8, 27, 10)
INSERT [dbo].[rute] ([Id], [Time], [StartCity], [EndCity]) VALUES (32, 8, 27, 23)
INSERT [dbo].[rute] ([Id], [Time], [StartCity], [EndCity]) VALUES (33, 8, 27, 29)
INSERT [dbo].[rute] ([Id], [Time], [StartCity], [EndCity]) VALUES (34, 8, 28, 20)
INSERT [dbo].[rute] ([Id], [Time], [StartCity], [EndCity]) VALUES (35, 8, 28, 29)
INSERT [dbo].[rute] ([Id], [Time], [StartCity], [EndCity]) VALUES (38, 8, 29, 24)
INSERT [dbo].[rute] ([Id], [Time], [StartCity], [EndCity]) VALUES (37, 8, 29, 27)
INSERT [dbo].[rute] ([Id], [Time], [StartCity], [EndCity]) VALUES (39, 8, 29, 28)
INSERT [dbo].[rute] ([Id], [Time], [StartCity], [EndCity]) VALUES (40, 8, 29, 30)
INSERT [dbo].[rute] ([Id], [Time], [StartCity], [EndCity]) VALUES (41, 8, 29, 31)
INSERT [dbo].[rute] ([Id], [Time], [StartCity], [EndCity]) VALUES (36, 8, 29, 32)
INSERT [dbo].[rute] ([Id], [Time], [StartCity], [EndCity]) VALUES (42, 8, 30, 18)
INSERT [dbo].[rute] ([Id], [Time], [StartCity], [EndCity]) VALUES (43, 8, 30, 29)
INSERT [dbo].[rute] ([Id], [Time], [StartCity], [EndCity]) VALUES (44, 8, 31, 29)
INSERT [dbo].[rute] ([Id], [Time], [StartCity], [EndCity]) VALUES (45, 8, 32, 9)
INSERT [dbo].[rute] ([Id], [Time], [StartCity], [EndCity]) VALUES (46, 8, 32, 29)
SET IDENTITY_INSERT [dbo].[rute] OFF
SET IDENTITY_INSERT [dbo].[transportType] ON 

INSERT [dbo].[transportType] ([Id], [TransportType], [Company]) VALUES (1, N'Fly', N'Oceanic Airlines')
INSERT [dbo].[transportType] ([Id], [TransportType], [Company]) VALUES (2, N'Lastbil', N'Telstar Logistics')
INSERT [dbo].[transportType] ([Id], [TransportType], [Company]) VALUES (3, N'Båd', N'East India Trade Company')
SET IDENTITY_INSERT [dbo].[transportType] OFF
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([Id], [BrugerNavn], [password], [IsAdmin]) VALUES (1, N'Egon', N'Olsen', 1)
INSERT [dbo].[users] ([Id], [BrugerNavn], [password], [IsAdmin]) VALUES (2, N'Peter', N'Plys', 0)
INSERT [dbo].[users] ([Id], [BrugerNavn], [password], [IsAdmin]) VALUES (3, N'admin', N'fly', 1)
INSERT [dbo].[users] ([Id], [BrugerNavn], [password], [IsAdmin]) VALUES (4, N'bruger', N'fly', 0)
SET IDENTITY_INSERT [dbo].[users] OFF
/****** Object:  Index [UQ__by__F2D21B779644DE59]    Script Date: 07-10-2015 10:30:44 ******/
ALTER TABLE [dbo].[by] ADD UNIQUE NONCLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
ALTER TABLE [dbo].[forsendelse]  WITH CHECK ADD FOREIGN KEY([PakkeId])
REFERENCES [dbo].[pakke] ([Id])
GO
ALTER TABLE [dbo].[forsendelse]  WITH CHECK ADD FOREIGN KEY([SlutBy])
REFERENCES [dbo].[by] ([CityId])
GO
ALTER TABLE [dbo].[forsendelse]  WITH CHECK ADD FOREIGN KEY([StartBy])
REFERENCES [dbo].[by] ([CityId])
GO
ALTER TABLE [dbo].[forsendelsesRute]  WITH CHECK ADD FOREIGN KEY([ForsendelsesId])
REFERENCES [dbo].[forsendelse] ([Id])
GO
ALTER TABLE [dbo].[forsendelsesRute]  WITH CHECK ADD FOREIGN KEY([SlutBy])
REFERENCES [dbo].[by] ([CityId])
GO
ALTER TABLE [dbo].[forsendelsesRute]  WITH CHECK ADD FOREIGN KEY([StartBy])
REFERENCES [dbo].[by] ([CityId])
GO
ALTER TABLE [dbo].[forsendelsesRute]  WITH CHECK ADD FOREIGN KEY([TransportType])
REFERENCES [dbo].[transportType] ([Id])
GO
ALTER TABLE [dbo].[forsendelsesType]  WITH CHECK ADD FOREIGN KEY([ForsendelsesId])
REFERENCES [dbo].[forsendelse] ([Id])
GO
ALTER TABLE [dbo].[forsendelsesType]  WITH CHECK ADD FOREIGN KEY([packetTypeId])
REFERENCES [dbo].[packetType] ([Id])
GO
ALTER TABLE [dbo].[pakke]  WITH CHECK ADD FOREIGN KEY([Sender])
REFERENCES [dbo].[users] ([Id])
GO
ALTER TABLE [dbo].[pakkePris]  WITH CHECK ADD FOREIGN KEY([DimentionsNavn])
REFERENCES [dbo].[pakkeDimintioner] ([Name])
GO
ALTER TABLE [dbo].[rute]  WITH CHECK ADD FOREIGN KEY([EndCity])
REFERENCES [dbo].[by] ([CityId])
GO
ALTER TABLE [dbo].[rute]  WITH CHECK ADD FOREIGN KEY([StartCity])
REFERENCES [dbo].[by] ([CityId])
GO
