USE [Group3]
GO
/****** Object:  Table [dbo].[memberdb]    Script Date: 2021/7/19 下午 03:25:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[memberdb](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[acctno] [varchar](255) NULL,
	[celno] [varchar](255) NULL,
	[dob] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[gender] [varchar](255) NULL,
	[name] [varchar](255) NULL,
	[nickname] [varchar](255) NULL,
	[pw] [varchar](255) NULL,
	[role] [varchar](255) NULL,
	[picture] [varbinary](max) NULL,
	[mime_type] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_gj6piak4bjmgarlol982k4ekw] UNIQUE NONCLUSTERED 
(
	[acctno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
