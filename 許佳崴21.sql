USE [Group3]
GO
/****** Object:  Table [dbo].[Ad]    Script Date: 2021/7/6 上午 08:28:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ad](
	[ad_id] [int] IDENTITY(1,1) NOT NULL,
	[company] [nvarchar](50) NULL,
	[company_id] [int] NULL,
	[text] [nvarchar](500) NULL,
	[url] [nvarchar](500) NULL,
	[ad_total_click] [float] NULL,
	[sponsorship_amount] [float] NULL,
 CONSTRAINT [PK__Ad__FD291E40164B23C1] PRIMARY KEY CLUSTERED 
(
	[ad_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ad_Clicktime]    Script Date: 2021/7/6 上午 08:28:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ad_Clicktime](
	[user_id] [int] NOT NULL,
	[ad_id] [int] NOT NULL,
	[click_time] [float] NULL,
 CONSTRAINT [PK_Ad_Ad_User] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC,
	[ad_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ad_Company]    Script Date: 2021/7/6 上午 08:28:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ad_Company](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[number] [nvarchar](50) NULL,
	[name] [nvarchar](50) NULL,
	[totalclick] [int] NULL,
 CONSTRAINT [PK_Ad_Company] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ad_Record]    Script Date: 2021/7/6 上午 08:28:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ad_Record](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[ad_id] [int] NULL,
	[url] [nvarchar](500) NULL,
	[ad_click] [float] NULL,
	[bonus] [float] NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ad_User]    Script Date: 2021/7/6 上午 08:28:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ad_User](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
 CONSTRAINT [PK_Ad_User] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Ad] ON 

INSERT [dbo].[Ad] ([ad_id], [company], [company_id], [text], [url], [ad_total_click], [sponsorship_amount]) VALUES (1, N'國泰世華銀行', 1, N'國泰世華銀行卡友尊享 限量優惠33折起預付訂位享【活動一: 3%現折+2%回饋】 或 【活動二: 100元優惠代碼】', N'https://www.cathaybk.com.tw/cathaybk/', 5, 20000)
INSERT [dbo].[Ad] ([ad_id], [company], [company_id], [text], [url], [ad_total_click], [sponsorship_amount]) VALUES (2, N'國泰世華卡友專屬優惠', 1, N'國泰優惠APP會員獨享
預付訂位即享16% EZCASH回饋', NULL, 0, 20000)
INSERT [dbo].[Ad] ([ad_id], [company], [company_id], [text], [url], [ad_total_click], [sponsorship_amount]) VALUES (3, N'國泰世華卡友專屬優惠', 1, N'國泰優惠APP會員獨享預付訂位即享5% EZCASH回饋', N'ertyuii', 0, 20000)
INSERT [dbo].[Ad] ([ad_id], [company], [company_id], [text], [url], [ad_total_click], [sponsorship_amount]) VALUES (4, N'花旗銀行卡友專屬優惠', NULL, N'花旗頂級饗宴 頂級卡 享極品美饌最優5折Prestige卡、寰旅尊尚世界卡，最優享5折，另再享EZCASH回饋', N'https://www.citibank.com.tw/sim/index.htm', 0, 20000)
INSERT [dbo].[Ad] ([ad_id], [company], [company_id], [text], [url], [ad_total_click], [sponsorship_amount]) VALUES (5, N'華南銀行美饌卡友優惠', NULL, N'華南銀行美饌卡
享預付金額現折10%+用餐後回饋5%EZCASH！', NULL, 0, 20000)
INSERT [dbo].[Ad] ([ad_id], [company], [company_id], [text], [url], [ad_total_click], [sponsorship_amount]) VALUES (6, N'華南銀行美饌卡友優惠', NULL, N'華南銀行美饌卡友優惠
華南銀行美饌卡友 獨享10%現折優惠', NULL, 0, 20000)
INSERT [dbo].[Ad] ([ad_id], [company], [company_id], [text], [url], [ad_total_click], [sponsorship_amount]) VALUES (7, N'新光銀行指定卡友優惠', NULL, N'新光銀行指定卡友優惠
預付享用餐後回饋20%EZCASH，單筆回饋上限200 EZCASH', NULL, 0, 20000)
INSERT [dbo].[Ad] ([ad_id], [company], [company_id], [text], [url], [ad_total_click], [sponsorship_amount]) VALUES (8, N'Visa卡友專屬優惠', NULL, N'Visa無限卡精選米其林餐廳
預付訂位享 20% EZCASH回饋', NULL, 0, 20000)
INSERT [dbo].[Ad] ([ad_id], [company], [company_id], [text], [url], [ad_total_click], [sponsorship_amount]) VALUES (9, N'Visa卡友專屬優惠', NULL, N'Visa 御璽卡精選五星下午茶
預付訂位享 15% EZCASH回饋
409 位粉絲，來自 EZTABLE', NULL, 0, 20000)
INSERT [dbo].[Ad] ([ad_id], [company], [company_id], [text], [url], [ad_total_click], [sponsorship_amount]) VALUES (10, N'星展銀行專屬優惠', NULL, N'星展銀行全卡友優惠
享預付金額用餐後回饋5%EZCASH，再享餐廳0.5~5% EZCASH 回饋！', NULL, 0, 20000)
INSERT [dbo].[Ad] ([ad_id], [company], [company_id], [text], [url], [ad_total_click], [sponsorship_amount]) VALUES (11, N'玉山銀行卡友專屬優惠', NULL, N'玉山Only卡 專屬優惠精采加倍
預付金額10%EZCASH回饋', NULL, 0, 20000)
INSERT [dbo].[Ad] ([ad_id], [company], [company_id], [text], [url], [ad_total_click], [sponsorship_amount]) VALUES (12, N'彰化銀行My樂卡卡友優惠', NULL, N'彰化銀行My樂卡卡友優惠
預付訂位享回饋12%EZCASH', NULL, 0, 20000)
INSERT [dbo].[Ad] ([ad_id], [company], [company_id], [text], [url], [ad_total_click], [sponsorship_amount]) VALUES (13, N'郵政Visa金融卡友專屬優惠', NULL, N'郵政Visa金融卡友專屬優惠
預付訂位享 10%現折', NULL, 0, 20000)
INSERT [dbo].[Ad] ([ad_id], [company], [company_id], [text], [url], [ad_total_click], [sponsorship_amount]) VALUES (14, N'第一銀行卡友專屬優惠', NULL, N'一銀世界卡好食讚
預付訂位享 10%現折 + 5% EZCASH 回饋', NULL, 0, 20000)
INSERT [dbo].[Ad] ([ad_id], [company], [company_id], [text], [url], [ad_total_click], [sponsorship_amount]) VALUES (15, N'高雄銀行卡友專屬優惠', NULL, N'高雄銀行卡友專屬優惠
預付訂位享 10%現折', NULL, 0, 20000)
INSERT [dbo].[Ad] ([ad_id], [company], [company_id], [text], [url], [ad_total_click], [sponsorship_amount]) VALUES (16, N'LEXUS車主獨享', NULL, N'LEXUS車主獨享
務必使用「LEXUS PLUS」App訂位 享預付10%現折優惠', NULL, 0, 20000)
INSERT [dbo].[Ad] ([ad_id], [company], [company_id], [text], [url], [ad_total_click], [sponsorship_amount]) VALUES (17, N'中華電信 Hami Pass加碼回饋', NULL, N'中華電信 Hami Pass加碼回饋
中華電信 Hami Pass 限量加碼10%美食金回饋，不限餐廳！', NULL, 0, 20000)
INSERT [dbo].[Ad] ([ad_id], [company], [company_id], [text], [url], [ad_total_click], [sponsorship_amount]) VALUES (23, N'ii', NULL, N'ii', N'https://news.google.com/topstories?tab=rn&hl=zh-TW&gl=TW&ceid=TW:zh-Hant', 0, 20000)
INSERT [dbo].[Ad] ([ad_id], [company], [company_id], [text], [url], [ad_total_click], [sponsorship_amount]) VALUES (24, N'aa', NULL, N'aa', N'aa', 0, 20000)
INSERT [dbo].[Ad] ([ad_id], [company], [company_id], [text], [url], [ad_total_click], [sponsorship_amount]) VALUES (25, N'qq', NULL, N'qq', N'qq', 0, 20000)
INSERT [dbo].[Ad] ([ad_id], [company], [company_id], [text], [url], [ad_total_click], [sponsorship_amount]) VALUES (28, N'ComapnyA', 1, N'qwerrr', N'rrrrrr', 0, 20000)
SET IDENTITY_INSERT [dbo].[Ad] OFF
GO
INSERT [dbo].[Ad_Clicktime] ([user_id], [ad_id], [click_time]) VALUES (1, 1, 4)
INSERT [dbo].[Ad_Clicktime] ([user_id], [ad_id], [click_time]) VALUES (1, 2, 0)
INSERT [dbo].[Ad_Clicktime] ([user_id], [ad_id], [click_time]) VALUES (1, 4, 0)
INSERT [dbo].[Ad_Clicktime] ([user_id], [ad_id], [click_time]) VALUES (1, 23, 0)
INSERT [dbo].[Ad_Clicktime] ([user_id], [ad_id], [click_time]) VALUES (1, 24, 0)
INSERT [dbo].[Ad_Clicktime] ([user_id], [ad_id], [click_time]) VALUES (1, 25, 0)
INSERT [dbo].[Ad_Clicktime] ([user_id], [ad_id], [click_time]) VALUES (1, 28, 0)
INSERT [dbo].[Ad_Clicktime] ([user_id], [ad_id], [click_time]) VALUES (2, 1, 4)
INSERT [dbo].[Ad_Clicktime] ([user_id], [ad_id], [click_time]) VALUES (2, 4, 0)
INSERT [dbo].[Ad_Clicktime] ([user_id], [ad_id], [click_time]) VALUES (2, 23, 0)
GO
SET IDENTITY_INSERT [dbo].[Ad_Company] ON 

INSERT [dbo].[Ad_Company] ([id], [number], [name], [totalclick]) VALUES (1, N'87654', N'ComapnyA', 0)
SET IDENTITY_INSERT [dbo].[Ad_Company] OFF
GO
SET IDENTITY_INSERT [dbo].[Ad_Record] ON 

INSERT [dbo].[Ad_Record] ([id], [user_id], [ad_id], [url], [ad_click], [bonus]) VALUES (6, 1, 1, N'https://www.cathaybk.com.tw/cathaybk/', 4, 16000)
INSERT [dbo].[Ad_Record] ([id], [user_id], [ad_id], [url], [ad_click], [bonus]) VALUES (7, 1, 2, NULL, 0, 0)
INSERT [dbo].[Ad_Record] ([id], [user_id], [ad_id], [url], [ad_click], [bonus]) VALUES (8, 1, 3, NULL, 0, 0)
INSERT [dbo].[Ad_Record] ([id], [user_id], [ad_id], [url], [ad_click], [bonus]) VALUES (9, 1, 4, NULL, 0, 0)
INSERT [dbo].[Ad_Record] ([id], [user_id], [ad_id], [url], [ad_click], [bonus]) VALUES (10, 1, 5, NULL, 0, 0)
INSERT [dbo].[Ad_Record] ([id], [user_id], [ad_id], [url], [ad_click], [bonus]) VALUES (16, 1, 6, NULL, 0, 0)
INSERT [dbo].[Ad_Record] ([id], [user_id], [ad_id], [url], [ad_click], [bonus]) VALUES (17, 1, 7, NULL, 0, 0)
INSERT [dbo].[Ad_Record] ([id], [user_id], [ad_id], [url], [ad_click], [bonus]) VALUES (18, 1, 8, NULL, 0, 0)
INSERT [dbo].[Ad_Record] ([id], [user_id], [ad_id], [url], [ad_click], [bonus]) VALUES (19, 1, 9, NULL, 0, 0)
INSERT [dbo].[Ad_Record] ([id], [user_id], [ad_id], [url], [ad_click], [bonus]) VALUES (20, 1, 10, NULL, 0, 0)
INSERT [dbo].[Ad_Record] ([id], [user_id], [ad_id], [url], [ad_click], [bonus]) VALUES (21, 2, 2, NULL, 0, 0)
INSERT [dbo].[Ad_Record] ([id], [user_id], [ad_id], [url], [ad_click], [bonus]) VALUES (22, 2, 9, NULL, 0, 0)
INSERT [dbo].[Ad_Record] ([id], [user_id], [ad_id], [url], [ad_click], [bonus]) VALUES (23, 2, 23, N'https://news.google.com/topstories?tab=rn&hl=zh-TW&gl=TW&ceid=TW:zh-Hant', 0, 0)
INSERT [dbo].[Ad_Record] ([id], [user_id], [ad_id], [url], [ad_click], [bonus]) VALUES (24, 2, 4, N'https://www.citibank.com.tw/sim/index.htm', 0, 0)
INSERT [dbo].[Ad_Record] ([id], [user_id], [ad_id], [url], [ad_click], [bonus]) VALUES (25, 1, 11, NULL, 0, 0)
INSERT [dbo].[Ad_Record] ([id], [user_id], [ad_id], [url], [ad_click], [bonus]) VALUES (26, 1, 23, N'https://news.google.com/topstories?tab=rn&hl=zh-TW&gl=TW&ceid=TW:zh-Hant', 0, 0)
INSERT [dbo].[Ad_Record] ([id], [user_id], [ad_id], [url], [ad_click], [bonus]) VALUES (27, 2, 1, N'https://www.cathaybk.com.tw/cathaybk/', 1, 4000)
INSERT [dbo].[Ad_Record] ([id], [user_id], [ad_id], [url], [ad_click], [bonus]) VALUES (28, 1, 24, N'aa', 0, 0)
INSERT [dbo].[Ad_Record] ([id], [user_id], [ad_id], [url], [ad_click], [bonus]) VALUES (29, 1, 25, N'qq', 0, 0)
INSERT [dbo].[Ad_Record] ([id], [user_id], [ad_id], [url], [ad_click], [bonus]) VALUES (30, 1, 28, N'rrrrrr', 0, 0)
SET IDENTITY_INSERT [dbo].[Ad_Record] OFF
GO
SET IDENTITY_INSERT [dbo].[Ad_User] ON 

INSERT [dbo].[Ad_User] ([user_id], [username], [password]) VALUES (1, N'abc', N'123')
INSERT [dbo].[Ad_User] ([user_id], [username], [password]) VALUES (2, N'def', N'def')
SET IDENTITY_INSERT [dbo].[Ad_User] OFF
GO
ALTER TABLE [dbo].[Ad]  WITH CHECK ADD  CONSTRAINT [FK_Ad_Ad_Company] FOREIGN KEY([company_id])
REFERENCES [dbo].[Ad_Company] ([id])
GO
ALTER TABLE [dbo].[Ad] CHECK CONSTRAINT [FK_Ad_Ad_Company]
GO
ALTER TABLE [dbo].[Ad_Clicktime]  WITH CHECK ADD  CONSTRAINT [FK__Ad_clickt__ad_id__2A164134] FOREIGN KEY([ad_id])
REFERENCES [dbo].[Ad] ([ad_id])
GO
ALTER TABLE [dbo].[Ad_Clicktime] CHECK CONSTRAINT [FK__Ad_clickt__ad_id__2A164134]
GO
ALTER TABLE [dbo].[Ad_Clicktime]  WITH CHECK ADD  CONSTRAINT [FK__Ad_clickt__user___29221CFB] FOREIGN KEY([user_id])
REFERENCES [dbo].[Ad_User] ([user_id])
GO
ALTER TABLE [dbo].[Ad_Clicktime] CHECK CONSTRAINT [FK__Ad_clickt__user___29221CFB]
GO
ALTER TABLE [dbo].[Ad_Record]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Ad] FOREIGN KEY([ad_id])
REFERENCES [dbo].[Ad] ([ad_id])
GO
ALTER TABLE [dbo].[Ad_Record] CHECK CONSTRAINT [FK_Cart_Ad]
GO
ALTER TABLE [dbo].[Ad_Record]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Ad_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[Ad_User] ([user_id])
GO
ALTER TABLE [dbo].[Ad_Record] CHECK CONSTRAINT [FK_Cart_Ad_User]
GO
