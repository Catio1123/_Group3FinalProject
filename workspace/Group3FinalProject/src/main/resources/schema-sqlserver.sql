-- use database
USE Group3;

-- drop table 
drop table if exists [roles_permissions]
drop table if exists [channel_category];
drop table if exists [sysusers_roles]
drop table if exists [episode];
drop table if exists [channel];
drop table if exists [permission];
drop table if exists [role];
drop table if exists [sysuser];
drop table if exists [userfile];


-- create table
--user
create table [sysuser](
	[id] [bigint] not null identity(1,1) primary key,
	[account] [nvarchar](100) not null unique,
	[password] [nvarchar](100) not null,
	[image] [nvarchar](255),
	[firstname] [nvarchar](100),
	[lastname] [nvarchar](100),
	[email] [nvarchar](100) not null,
	[registdate] [datetime] not null,
	[enabled] [bit] not null,
	
);

--role
create table [role](
	[id] [bigint] not null identity(1,1) primary key,
	[name] [nvarchar](100) not null,
	[description] [nvarchar](255),
	[enabled] bit not null,
	
);

--permission
create table permission(
	[id] [bigint] not null identity(1,1) primary key,
	[name] [nvarchar](100) not null,
	[resource_type] nvarchar(100),
	[resource_id] nvarchar(100),
	[privilege] nvarchar(100),
	[enabled] bit not null,
);

--channel
CREATE TABLE channel
  (
  
   [id] bigint IDENTITY(1,1) CONSTRAINT PK_CHANNEL_ID PRIMARY KEY CLUSTERED,
   [sysuser_id] bigint CONSTRAINT FK_CHANNEL_UID REFERENCES [sysuser]([id]),
   [channel_category_id] int CONSTRAINT NN_CHANNEL_CAT1 NOT NULL,
   [title] NVARCHAR(50) CONSTRAINT NN_CHANNEL_TITLE NOT NULL,
   [description] NVARCHAR(200),
   [pubdate] datetime,
   [image] NVARCHAR(200) ,
   [block] bit not null,
   [enabled] bit not null
  );

  --episode
CREATE TABLE episode
  (
  
   [id] bigint IDENTITY(1,1) CONSTRAINT PK_EP_ID PRIMARY KEY CLUSTERED,
   [channel_id] bigint CONSTRAINT FK_EP_CID REFERENCES channel([id]),
   [title] NVARCHAR(50) CONSTRAINT NN_EP_TITLE NOT NULL,
   [ep_file] NVARCHAR(200) CONSTRAINT NN_EP_FILE NOT NULL,
   [pubdate] datetime not null,
   [description] NVARCHAR(1000),
   [free] bit not null,
   [block] bit not null,
   [enabled] bit not null,

  );
  
  --channnel category
  create table channel_category
  (
  [id] int identity(1,1) primary key clustered,
  [en_name] nvarchar(255) not null,
  [zh_tw_name] nvarchar(255) not null,
  )
  
  --channel role join table
 create table sysusers_roles(
	[sysuser_id] bigint references [sysuser](id),
	[role_id] bigint references role(id),

	constraint PK_SYSUSERS_ROLES primary key([sysuser_id], [role_id])
)
--role permission join table
create table roles_permissions(
	[role_id] bigint references [role](id),
	[permission_id] bigint references permission(id),

	constraint PK_ROLES_PERMISSIONS primary key([role_id], [permission_id])
)

--file
create table userfile(
	id bigint identity(1,1) primary key,
	filename nvarchar(100),
	publisher nvarchar(100),
	purpose nvarchar(100),
	pubdate datetime,
	mime nvarchar(50),
	ext nvarchar(10),
	url nvarchar(255)

)

  