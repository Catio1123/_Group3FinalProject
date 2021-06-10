USE [Group3]
GO
/****** Object:  Table [dbo].[Ad]    Script Date: 2021/5/24 下午 11:39:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Studio](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[location] [nvarchar](500) NULL,
	[fee] [nvarchar](50) NULL,
 CONSTRAINT [PK__Studio__FD291E40164B23C1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Studio] ON 

INSERT [dbo].[Studio] ([id], [name], [location], [fee]) VALUES (1, N'獨角音樂', N'台北市中山區敬業一路158號', N'900/h')
INSERT [dbo].[Studio] ([id], [name], [location], [fee]) VALUES (2, N'OnMic Studio', N'台北市信義區基隆路一段432號13樓之二', N'2,000/3h')
INSERT [dbo].[Studio] ([id], [name], [location], [fee]) VALUES (3, N'樂在聲音工作室', N'新北市泰山區全興路228號3樓。', N'1,200/hr')

SET IDENTITY_INSERT [dbo].[Studio] OFF
GO
