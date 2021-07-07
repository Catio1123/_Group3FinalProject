USE [Group3]

--insert data user
insert into [sysuser] values ('user01', 'user01pwd','use01img', 'use01first','last', 'use01@gmail.com','1996-11-23', 1);

--insert category
insert into [channel_category] values ('SPORT', N'運動');
insert into [channel_category] values ('FOOD', N'食物');
insert into [channel_category] values ('STOCK', N'股票');
insert into [channel_category] values ('OTHER', N'其他');

--insert default file
insert into[userfile] values ('default', 'sysadmin',  'channel image', '2021-07-01 10:30:00.0', 'image/png','.png', 'http://localhost:8080/ipodcast/files/channel/img/default.png')

--insert audio file
INSERT INTO [userfile]  VALUES (N'2', N'user01', N'ep sound file', CAST(N'2021-07-05T12:55:56.177' AS DateTime), N'audio/mpeg', N'.mp3', N'http://localhost:8080/ipodcast/files/episode/sound/2.mp3')
INSERT INTO [userfile]  VALUES (N'3', N'user01', N'ep sound file', CAST(N'2021-07-05T12:55:56.177' AS DateTime), N'audio/mpeg', N'.mp3', N'http://localhost:8080/ipodcast/files/episode/sound/3.mp3')
INSERT INTO [userfile]  VALUES (N'4', N'user01', N'ep sound file', CAST(N'2021-07-05T12:55:56.177' AS DateTime), N'audio/mpeg', N'.mp3', N'http://localhost:8080/ipodcast/files/episode/sound/4.mp3')
INSERT INTO [userfile]  VALUES (N'5', N'user01', N'ep sound file', CAST(N'2021-07-05T12:55:56.177' AS DateTime), N'audio/mpeg', N'.mp3', N'http://localhost:8080/ipodcast/files/episode/sound/5.mp3')
INSERT INTO [userfile]  VALUES (N'6', N'user01', N'ep sound file', CAST(N'2021-07-05T12:55:56.177' AS DateTime), N'audio/mpeg', N'.mp3', N'http://localhost:8080/ipodcast/files/episode/sound/6.mp3')
INSERT INTO [userfile]  VALUES (N'7', N'user01', N'ep sound file', CAST(N'2021-07-05T12:55:56.177' AS DateTime), N'audio/mpeg', N'.mp3', N'http://localhost:8080/ipodcast/files/episode/sound/7.mp3')
INSERT INTO [userfile]  VALUES (N'8', N'user01', N'ep sound file', CAST(N'2021-07-05T12:55:56.177' AS DateTime), N'audio/mpeg', N'.mp3', N'http://localhost:8080/ipodcast/files/episode/sound/8.mp3')
INSERT INTO [userfile]  VALUES (N'9', N'user01', N'ep sound file', CAST(N'2021-07-05T12:55:56.177' AS DateTime), N'audio/mpeg', N'.mp3', N'http://localhost:8080/ipodcast/files/episode/sound/9.mp3')
INSERT INTO [userfile]  VALUES (N'10', N'user01', N'ep sound file', CAST(N'2021-07-05T12:55:56.177' AS DateTime), N'audio/mpeg', N'.mp3', N'http://localhost:8080/ipodcast/files/episode/sound/10.mp3')


--insert channel
INSERT into [channel] VALUES (1, 4, N'chan01', N'xczxczxczxc', CAST(N'2021-07-01T15:19:08.320' AS DateTime), N'http://localhost:8080/ipodcast/files/channel/img/default.png', 0, 1)
INSERT into [channel] VALUES (1, 4, N'chan02', N'', CAST(N'2021-07-01T15:19:08.320' AS DateTime), N'http://localhost:8080/ipodcast/files/channel/img/default.png', 0, 1)
INSERT into [channel] VALUES (1, 4, N'chan03', N'', CAST(N'2021-07-01T15:19:09.320' AS DateTime), N'http://localhost:8080/ipodcast/files/channel/img/default.png', 0, 1)
INSERT into [channel] VALUES (1, 4, N'chan04', N'', CAST(N'2021-07-01T15:19:10.320' AS DateTime), N'http://localhost:8080/ipodcast/files/channel/img/default.png', 0, 1)
INSERT into [channel] VALUES (1, 4, N'chan05', N'', CAST(N'2021-07-01T15:19:11.320' AS DateTime), N'http://localhost:8080/ipodcast/files/channel/img/default.png', 0, 1)
INSERT into [channel] VALUES (1, 4, N'chan06', N'', CAST(N'2021-07-01T15:19:12.320' AS DateTime), N'http://localhost:8080/ipodcast/files/channel/img/default.png', 0, 1)
INSERT into [channel] VALUES (1, 4, N'chan07', N'', CAST(N'2021-07-01T15:19:13.320' AS DateTime), N'http://localhost:8080/ipodcast/files/channel/img/default.png', 0, 1)
INSERT into [channel] VALUES (1, 4, N'chan08', N'', CAST(N'2021-07-01T15:19:14.320' AS DateTime), N'http://localhost:8080/ipodcast/files/channel/img/default.png', 0, 1)
INSERT into [channel] VALUES (1, 4, N'chan09', N'', CAST(N'2021-07-01T15:19:15.320' AS DateTime), N'http://localhost:8080/ipodcast/files/channel/img/default.png', 0, 1)

--insert episode
INSERT INTO [episode] VALUES (1, N'ep1', N'http://localhost:8080/ipodcast/files/episode/sound/2.mp3', CAST(N'2021-07-05T12:55:56.577' AS DateTime), N'', 0, 0, 1)
INSERT INTO [episode] VALUES (1, N'ep2', N'http://localhost:8080/ipodcast/files/episode/sound/3.mp3', CAST(N'2021-07-05T12:59:19.663' AS DateTime), N'ep2desc', 1, 0, 1)
INSERT INTO [episode] VALUES (1, N'ep3', N'http://localhost:8080/ipodcast/files/episode/sound/4.mp3', CAST(N'2021-07-05T12:59:20.663' AS DateTime), N'ep2desc', 1, 0, 1)
INSERT INTO [episode] VALUES (1, N'ep4', N'http://localhost:8080/ipodcast/files/episode/sound/5.mp3', CAST(N'2021-07-05T12:59:21.663' AS DateTime), N'ep2desc', 0, 0, 1)
INSERT INTO [episode] VALUES (1, N'ep5', N'http://localhost:8080/ipodcast/files/episode/sound/6.mp3', CAST(N'2021-07-05T12:59:22.663' AS DateTime), N'ep2desc', 0, 0, 1)
INSERT INTO [episode] VALUES (1, N'ep6', N'http://localhost:8080/ipodcast/files/episode/sound/7.mp3', CAST(N'2021-07-05T12:59:23.663' AS DateTime), N'ep2desc', 0, 0, 1)
INSERT INTO [episode] VALUES (1, N'ep7', N'http://localhost:8080/ipodcast/files/episode/sound/8.mp3', CAST(N'2021-07-05T12:59:24.663' AS DateTime), N'ep2desc', 0, 0, 1)
INSERT INTO [episode] VALUES (1, N'ep8', N'http://localhost:8080/ipodcast/files/episode/sound/9.mp3', CAST(N'2021-07-05T12:59:25.663' AS DateTime), N'ep2desc', 0, 0, 1)
INSERT INTO [episode] VALUES (1, N'ep9', N'http://localhost:8080/ipodcast/files/episode/sound/10.mp3', CAST(N'2021-07-05T12:59:26.663' AS DateTime), N'ep2desc', 0, 0, 1)
