USE [Group3]
GO
/****** Object:  Table [dbo].[memberdb]    Script Date: 2021/7/18 上午 03:08:06 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[memberdb] ON 

INSERT [dbo].[memberdb] ([id], [acctno], [celno], [dob], [email], [gender], [name], [nickname], [pw], [role], [picture], [mime_type]) VALUES (2, N'admin', N'0900000001', N'2021-01-01', N'admin@gmail.com', N'Female', N'admin', N'admin', N'admin5151', N'admin', NULL, NULL)
INSERT [dbo].[memberdb] ([id], [acctno], [celno], [dob], [email], [gender], [name], [nickname], [pw], [role], [picture], [mime_type]) VALUES (5, N'companyTest', N'0900000002', N'2021-02-01', N'companyTest@gmail.com', N'Male', N'三組音樂', N'三組音樂', N'companyTest', N'company', NULL, NULL)
INSERT [dbo].[memberdb] ([id], [acctno], [celno], [dob], [email], [gender], [name], [nickname], [pw], [role], [picture], [mime_type]) VALUES (7, N'generalTest', N'0900000003', N'2021-03-01', N'generalTest@gmail.com', N'Male', N'布魯斯一般人', N'布魯斯', N'generalTest', N'general', 0x, NULL)
INSERT [dbo].[memberdb] ([id], [acctno], [celno], [dob], [email], [gender], [name], [nickname], [pw], [role], [picture], [mime_type]) VALUES (18, N'Backey515', N'0900000006', N'2000-05-01', N'Backey@yahoo.com.tw', N'Femle', N'Backy', N'Backy', N'Backey515', N'general', 0x, NULL)
INSERT [dbo].[memberdb] ([id], [acctno], [celno], [dob], [email], [gender], [name], [nickname], [pw], [role], [picture], [mime_type]) VALUES (19, N'Banana007', N'0900000156', N'2011-11-10', N'bann@gmail.com', N'Femle', N'張蕉蕉', N'張蕉蕉', N'Banana007', N'general', NULL, NULL)
INSERT [dbo].[memberdb] ([id], [acctno], [celno], [dob], [email], [gender], [name], [nickname], [pw], [role], [picture], [mime_type]) VALUES (25, N'tina7788', N'0932665445', N'2007-12-31', N'tina@hotmail.com', N'Femle', N'Tina', N'Tina', N'tina99999', N'general', 0x, NULL)
INSERT [dbo].[memberdb] ([id], [acctno], [celno], [dob], [email], [gender], [name], [nickname], [pw], [role], [picture], [mime_type]) VALUES (31, N'Curry19950613', N'0900000004', N'2021-06-13', N'Didi@gmail.com', N'Female', N'戴戴', N'戴戴', N'Curry19950613', N'general', 0x, NULL)
INSERT [dbo].[memberdb] ([id], [acctno], [celno], [dob], [email], [gender], [name], [nickname], [pw], [role], [picture], [mime_type]) VALUES (33, N'orea9898', N'0900000010', N'2008-06-10', N'dada@hotmail.com', N'Femle', N'黛安芬', N'黛安芬', N'orea9898', N'general', 0x, NULL)
INSERT [dbo].[memberdb] ([id], [acctno], [celno], [dob], [email], [gender], [name], [nickname], [pw], [role], [picture], [mime_type]) VALUES (34, N'pap065665', N'0900000008', N'1996-06-13', N'sally@yahoo.com', N'Femle', N'潘步步', N'潘步步', N'pap065665', N'suspension', 0x, NULL)
INSERT [dbo].[memberdb] ([id], [acctno], [celno], [dob], [email], [gender], [name], [nickname], [pw], [role], [picture], [mime_type]) VALUES (51, N'aaa0723', N'0921072303', N'2021-07-01', N'Jane@gmail.com', N'Femle', N'張君雅', N'Jane', N'aaa07231', N'suspension', 0x, NULL)
SET IDENTITY_INSERT [dbo].[memberdb] OFF
GO
