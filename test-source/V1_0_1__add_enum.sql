CREATE TABLE [dbo].[Enum](
	[EnumTypeId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_Enum] PRIMARY KEY CLUSTERED 
(
	[EnumTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[EnumDetail](
	[EnumId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[EnumTypeId] [int] NULL,
	[Value] [int] NOT NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_EnumDetail] PRIMARY KEY CLUSTERED 
(
	[EnumId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

SET IDENTITY_INSERT [dbo].[Enum] ON 
INSERT [dbo].[Enum] ([EnumTypeId], [Description]) VALUES (1, N'IntegrationState')
INSERT [dbo].[Enum] ([EnumTypeId], [Description]) VALUES (2, N'EnvironmentType')
SET IDENTITY_INSERT [dbo].[Enum] OFF

SET IDENTITY_INSERT [dbo].[EnumDetail] ON 
INSERT [dbo].[EnumDetail] ([EnumId], [EnumTypeId], [Value], [Description]) VALUES (1, 1, 1, N'Connected')
INSERT [dbo].[EnumDetail] ([EnumId], [EnumTypeId], [Value], [Description]) VALUES (2, 1, 2, N'Disconnected')
INSERT [dbo].[EnumDetail] ([EnumId], [EnumTypeId], [Value], [Description]) VALUES (3, 1, 3, N'Disabled')
INSERT [dbo].[EnumDetail] ([EnumId], [EnumTypeId], [Value], [Description]) VALUES (4, 2, 1, N'Azure')
INSERT [dbo].[EnumDetail] ([EnumId], [EnumTypeId], [Value], [Description]) VALUES (5, 2, 2, N'AWS')
INSERT [dbo].[EnumDetail] ([EnumId], [EnumTypeId], [Value], [Description]) VALUES (6, 2, 3, N'Databricks')
SET IDENTITY_INSERT [dbo].[EnumDetail] OFF

ALTER TABLE [dbo].[EnumDetail]  WITH CHECK ADD  CONSTRAINT [FK_EnumDetail_Enum] FOREIGN KEY([EnumTypeId])
REFERENCES [dbo].[Enum] ([EnumTypeId])

ALTER TABLE [dbo].[EnumDetail] CHECK CONSTRAINT [FK_EnumDetail_Enum]

