USE [master]
GO
/****** Object:  Database [GameMall]    Script Date: 2023/11/7 15:13:15 ******/
CREATE DATABASE [GameMall]
 CONTAINMENT = NONE
 
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GameMall].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GameMall] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GameMall] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GameMall] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GameMall] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GameMall] SET ARITHABORT OFF 
GO
ALTER DATABASE [GameMall] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GameMall] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GameMall] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GameMall] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GameMall] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GameMall] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GameMall] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GameMall] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GameMall] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GameMall] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GameMall] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GameMall] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GameMall] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GameMall] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GameMall] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GameMall] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GameMall] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GameMall] SET RECOVERY FULL 
GO
ALTER DATABASE [GameMall] SET  MULTI_USER 
GO
ALTER DATABASE [GameMall] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GameMall] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GameMall] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GameMall] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'GameMall', N'ON'
GO
USE [GameMall]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 2023/11/7 15:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[pwd] [varchar](50) NOT NULL,
	[nickname] [varchar](50) NOT NULL,
	[power] [smallint] NOT NULL,
	[createtime] [date] NULL,
 CONSTRAINT [PK_admin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 2023/11/7 15:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[catename] [varchar](50) NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comment]    Script Date: 2023/11/7 15:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[detail] [varchar](50) NOT NULL,
	[uid] [int] NOT NULL,
	[shop_id] [int] NOT NULL,
	[createtime] [datetime] NULL,
 CONSTRAINT [PK_comment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[forums]    Script Date: 2023/11/7 15:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[forums](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](100) NOT NULL,
	[detail] [text] NOT NULL,
	[createtime] [datetime] NOT NULL,
	[uid] [int] NOT NULL,
 CONSTRAINT [PK_forums] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[message]    Script Date: 2023/11/7 15:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[message](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[email] [varchar](80) NOT NULL,
	[detail] [varchar](200) NOT NULL,
	[createtime] [datetime] NOT NULL,
 CONSTRAINT [PK_message] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 2023/11/7 15:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[uid] [int] NULL,
	[order_num] [varchar](150) NULL,
	[sum_price] [decimal](8, 2) NULL,
	[mark] [varchar](50) NULL,
	[createtime] [date] NULL,
	[is_pay] [smallint] NULL,
	[state] [smallint] NULL,
	[pay_way] [varchar](20) NULL,
	[address] [varchar](250) NULL,
	[name] [varchar](50) NULL,
	[phone] [varchar](12) NULL,
 CONSTRAINT [PK_order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_detail]    Script Date: 2023/11/7 15:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[count] [int] NULL,
	[price] [decimal](8, 2) NULL,
	[sum_price] [decimal](8, 2) NULL,
	[shop_id] [int] NULL,
	[title] [varchar](255) NULL,
 CONSTRAINT [PK_order_detail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shopping]    Script Date: 2023/11/7 15:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shopping](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](255) NOT NULL,
	[cid] [int] NULL,
	[price] [decimal](8, 2) NOT NULL,
	[sale_price] [decimal](8, 2) NULL,
	[number] [int] NOT NULL,
	[detail] [text] NOT NULL,
	[img] [varchar](255) NOT NULL,
	[shop_number] [varchar](255) NOT NULL,
	[state] [int] NULL,
	[game_download] [varchar](255) NULL,
 CONSTRAINT [PK_shopping] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[state]    Script Date: 2023/11/7 15:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[state](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[statename] [varchar](50) NULL,
 CONSTRAINT [PK_state] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 2023/11/7 15:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[pwd] [varchar](50) NOT NULL,
	[nickname] [varchar](50) NOT NULL,
	[sex] [smallint] NULL,
	[introduce] [varchar](50) NULL,
	[age] [int] NULL,
	[img] [varchar](200) NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[video]    Script Date: 2023/11/7 15:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[video](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](100) NOT NULL,
	[rate] [decimal](4, 2) NOT NULL,
	[img] [varchar](200) NOT NULL,
	[url] [varchar](200) NOT NULL,
	[createtime] [datetime] NOT NULL,
 CONSTRAINT [PK_video] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[admin] ON 

INSERT [dbo].[admin] ([id], [username], [pwd], [nickname], [power], [createtime]) VALUES (1, N'admin', N'admin', N'Miss RJ管理员', 1, CAST(N'2023-07-01' AS Date))
SET IDENTITY_INSERT [dbo].[admin] OFF
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([id], [catename]) VALUES (1, N'Strategy')
INSERT [dbo].[category] ([id], [catename]) VALUES (2, N'Defense')
INSERT [dbo].[category] ([id], [catename]) VALUES (3, N'Role Play')
INSERT [dbo].[category] ([id], [catename]) VALUES (7, N'other')
SET IDENTITY_INSERT [dbo].[category] OFF
GO
SET IDENTITY_INSERT [dbo].[comment] ON 

INSERT [dbo].[comment] ([id], [detail], [uid], [shop_id], [createtime]) VALUES (0, N'这个游戏真的太棒了，好喜欢。', 1, 8, CAST(N'2023-06-14T08:10:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[comment] OFF
GO
SET IDENTITY_INSERT [dbo].[forums] ON 

INSERT [dbo].[forums] ([id], [title], [detail], [createtime], [uid]) VALUES (1, N'侵蚀扣血无视神佑状态，空血倒地后自带1回合死亡禁锢', N'<p>防不胜防，卖好感度的摊位中有20级的装备，买来白花钱</p><p><img src=" /20230614/6382233287286104333293363.jpg" title="CuXAIPbrcznEpve.jpg!a-3-540x.jpg" alt="CuXAIPbrcznEpve.jpg!a-3-540x.jpg"/></p>大雁塔的扫塔队伍可不只是靠那些善恶点来牟利，大雁塔的那些扫塔队在大雁塔中获得的那些垃圾的召唤兽装备也是可以做到保本保点卡的。因为这些垃圾的召唤兽装备是可以用来提升坐骑好感度的，大雁塔给的召唤兽装备，每一件装备都能够增加一点坐骑好感度，平均下来每一点做一些好感度的出售，价格能够达到8000左右。但是小编却发现有些出售好感度的摊位里却有着一些低等级的角色的装备。50级以下的角色装备是没办法增加坐骑好感度的。所以这里面所出售的这些角色装备都是在坑盲僧的。<p><br/></p>', CAST(N'2023-06-14T09:46:31.000' AS DateTime), 1)
INSERT [dbo].[forums] ([id], [title], [detail], [createtime], [uid]) VALUES (2, N'仙侠世界2评测：全自由飞行，没有空气墙的修仙世界', N'<p><span style="color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; text-indent: 32px; text-wrap: wrap; background-color: rgb(255, 255, 255);">《仙侠世界2》是巨人网络《仙侠世界》系列的第二部作品。本作采用了著名的HAVOK 引擎，与刺客信条系出同门。游戏画面表现力达到了国产顶尖水平，并且有号称网游竞技小说第一作家“无罪”担任剧情策划，全程参与游戏制作。《仙侠世界2》将在5月12日开启不删档测试，那么这款游戏究竟品质如何，下面我们就通过这次测试来看看吧。</span></p><p><span style="color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; text-indent: 32px; text-wrap: wrap; background-color: rgb(255, 255, 255);"><img src=" /20230614/6382233333834225658917913.jpg" title="2.jpg" alt="2.jpg"/></span></p><p><span style="color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; text-indent: 32px; text-wrap: wrap; background-color: rgb(255, 255, 255);"><span style="color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; text-indent: 32px; text-wrap: wrap; background-color: rgb(255, 255, 255);">《仙侠世界2》经过了数次完善，从上次测试对比最新版本的内容，有了诸多“点”的优化。在福利玩家的同时，也彰显了巨人作为‘大厂’，对游戏负责认真的态度。在新版本给人最大的感官体验，就是画质的提升。</span></span></p><p><span style="color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; text-indent: 32px; text-wrap: wrap; background-color: rgb(255, 255, 255);"><img src=" /20230614/6382233334371409229242487.jpg" title="3.jpg" alt="3.jpg"/></span></p><p><span style="color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; text-indent: 32px; text-wrap: wrap; background-color: rgb(255, 255, 255);"><span style="color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; text-indent: 32px; text-wrap: wrap; background-color: rgb(255, 255, 255);">首先映入眼帘的，就是动态云层变化，把视角切到天空中，动态漂浮的云朵映入眼帘，这一点增强了游戏代入感。本来这种设定，是不容易被发现的，因为我们平时玩游戏，并不会把视角摆到天上。但偶尔一下的视角上移，还是可以感受到这种别具一格的‘匠心’。尤其是当玩家飞天时，满天漂浮的动态云朵，着实给人一种比较震撼的体验。</span></span></p>', CAST(N'2023-06-14T09:54:42.000' AS DateTime), 4)
INSERT [dbo].[forums] ([id], [title], [detail], [createtime], [uid]) VALUES (3, N'《镇魂街：天生为王》游戏评测', N'<p><span style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; font-size: medium; text-indent: 32px; text-wrap: wrap;">在这些年蓬勃发展的国漫当中，《镇魂街》可谓是一面鲜明的旗帜。始于11年前的它，在那个国漫还未流行的时代，就已经打出了响当当的名号，说它是国漫里最早一批的顶流漫画都不为过，笔者当年也曾被它深深的吸引。</span></p><p><span style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; font-size: medium; text-indent: 32px; text-wrap: wrap;"><img src=" /20230614/6382233346064642653585003.png" title="1.png" alt="1.png"/></span></p><p><span style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; font-size: medium; text-indent: 32px; text-wrap: wrap;"><span style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; font-size: medium; text-indent: 32px; text-wrap: wrap;">而如今这部作品将带来一款IP授权的动作手游《镇魂街：天生为王》，在手游的世界中，我们又会看到一个怎样的“镇魂街”呢？</span></span></p><p><span style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; font-size: medium; text-indent: 32px; text-wrap: wrap;"><img src=" /20230614/6382233346545106878551264.png" title="11.png" alt="11.png"/></span></p><p><span style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; font-size: medium; text-indent: 32px; text-wrap: wrap;"><span style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; font-size: medium; text-indent: 32px; text-wrap: wrap;">初入游戏，游戏的UI就带给了我极大的震撼，宛如霓虹灯般的界面UI点亮了整条镇魂街，曹焱兵与守护灵许褚立于屋顶的平台之上，审视着这条街道的一切动向。如此格调的界面组合与色彩搭配给人一种中国风赛博朋克的感觉。</span></span></p>', CAST(N'2023-06-14T09:56:56.000' AS DateTime), 4)
INSERT [dbo].[forums] ([id], [title], [detail], [createtime], [uid]) VALUES (4, N'《地下城与勇士：决斗》鲜游评测8.0分：红狗双刀终于不算无色了', N'<p><span style="color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; text-indent: 32px; text-wrap: wrap; background-color: rgb(255, 255, 255);">《地下城与勇士：决斗》是款很奇怪的游戏。</span></p><p><span style="color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; text-indent: 32px; text-wrap: wrap; background-color: rgb(255, 255, 255);"><br/></span></p><p><span style="color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; text-indent: 32px; text-wrap: wrap; background-color: rgb(255, 255, 255);"><img src=" /20230614/6382233353559722626686172.jpg" title="2.jpg" alt="2.jpg"/></span></p><p><span style="color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; text-indent: 32px; text-wrap: wrap; background-color: rgb(255, 255, 255);"></span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px 0px 15px; text-indent: 2em; color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; text-wrap: wrap; background-color: rgb(255, 255, 255);">从游戏定位和目标受众来看，它瞄准的应该是《地下城与勇士》里喜欢PVP的玩家，但《决斗》的格斗风格，却又和母体有着差异化的表现。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px 0px 15px; text-indent: 2em; color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; text-wrap: wrap; background-color: rgb(255, 255, 255);">如果要比喻的话，《DNF》里的pvp就像是个面向全武林的大会。装备上的差异、大相径庭的出招习惯、不同的加点风格，让这里的战斗呈现出一种八仙过海的样式，可谓各有各的章法，各有各的花招，没什么定式。</p><p><span style="color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; text-indent: 32px; text-wrap: wrap; background-color: rgb(255, 255, 255);"><img src=" /20230614/6382233354377557759023180.png" title="1.png" alt="1.png"/></span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px 0px 15px; text-indent: 2em; color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; text-wrap: wrap; background-color: rgb(255, 255, 255);">但《决斗》呈现的，却更像是官方规格的正式格斗比赛。选手们皆是一样的装备、加点，唯一的区别就是对机制的掌握的深浅和连招的娴熟程度。这令游戏打起来公平、好看，但却少了一丝那种江湖草莽皆可登台的气息。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px 0px 15px; text-indent: 2em; color: rgb(43, 43, 43); font-family: &quot;Microsoft Yahei&quot;; text-wrap: wrap; background-color: rgb(255, 255, 255);">出于这样的原因，广大DNFer，或许只会云一云该作，看看各种大魄力的招式演出，然后回到掉线城的竞技场里奋斗。</p><p><br/></p>', CAST(N'2023-06-14T09:58:16.000' AS DateTime), 5)
SET IDENTITY_INSERT [dbo].[forums] OFF
GO
SET IDENTITY_INSERT [dbo].[message] ON 

INSERT [dbo].[message] ([id], [name], [email], [detail], [createtime]) VALUES (3, N'张三', N'330@qq.com', N'很喜欢这个游戏商城，但是想退款怎么退呢', CAST(N'2023-06-14T08:12:25.000' AS DateTime))
INSERT [dbo].[message] ([id], [name], [email], [detail], [createtime]) VALUES (4, N'张三', N'330111@qq.com', N'吉尔巴德游戏商城请继续做下去哟', CAST(N'2023-06-14T08:14:53.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[message] OFF
GO
SET IDENTITY_INSERT [dbo].[order] ON 

INSERT [dbo].[order] ([id], [uid], [order_num], [sum_price], [mark], [createtime], [is_pay], [state], [pay_way], [address], [name], [phone]) VALUES (1, 1, N'o230614SS031-1040285790', CAST(99.00 AS Decimal(8, 2)), N'很棒的游戏~', CAST(N'2023-06-14' AS Date), 1, 0, N'支付宝', N'', N'妮妮', N'18877881231')
INSERT [dbo].[order] ([id], [uid], [order_num], [sum_price], [mark], [createtime], [is_pay], [state], [pay_way], [address], [name], [phone]) VALUES (2, 3, N'o230614SS041690645442', CAST(99.00 AS Decimal(8, 2)), N'好喜欢这个游戏~', CAST(N'2023-06-14' AS Date), 1, 0, N'支付宝', N'', N'妮妮', N'18877881231')
INSERT [dbo].[order] ([id], [uid], [order_num], [sum_price], [mark], [createtime], [is_pay], [state], [pay_way], [address], [name], [phone]) VALUES (3, 4, N'o230614SS041320825780', CAST(199.00 AS Decimal(8, 2)), N'', CAST(N'2023-06-14' AS Date), 0, 0, N'支付宝', N'', N'妮妮', N'18877881231')
INSERT [dbo].[order] ([id], [uid], [order_num], [sum_price], [mark], [createtime], [is_pay], [state], [pay_way], [address], [name], [phone]) VALUES (4, 1, N'o230615SS0111292666874', CAST(99.00 AS Decimal(8, 2)), N'', CAST(N'2023-06-15' AS Date), 1, 0, N'支付宝', N'', N'妮妮', N'18877881231')
INSERT [dbo].[order] ([id], [uid], [order_num], [sum_price], [mark], [createtime], [is_pay], [state], [pay_way], [address], [name], [phone]) VALUES (5, 1, N'o230615SS011-1509200216', CAST(99.00 AS Decimal(8, 2)), N'', CAST(N'2023-06-15' AS Date), 0, 0, N'支付宝', N'', N'妮妮', N'18877881231')
SET IDENTITY_INSERT [dbo].[order] OFF
GO
SET IDENTITY_INSERT [dbo].[order_detail] ON 

INSERT [dbo].[order_detail] ([id], [order_id], [count], [price], [sum_price], [shop_id], [title]) VALUES (1, 1, 1, CAST(99.00 AS Decimal(8, 2)), CAST(99.00 AS Decimal(8, 2)), 9, N'Age of ampires')
INSERT [dbo].[order_detail] ([id], [order_id], [count], [price], [sum_price], [shop_id], [title]) VALUES (2, 2, 1, CAST(99.00 AS Decimal(8, 2)), CAST(99.00 AS Decimal(8, 2)), 9, N'Age of ampires')
INSERT [dbo].[order_detail] ([id], [order_id], [count], [price], [sum_price], [shop_id], [title]) VALUES (3, 3, 1, CAST(199.00 AS Decimal(8, 2)), CAST(199.00 AS Decimal(8, 2)), 19, N'大话西游')
INSERT [dbo].[order_detail] ([id], [order_id], [count], [price], [sum_price], [shop_id], [title]) VALUES (4, 4, 1, CAST(99.00 AS Decimal(8, 2)), CAST(99.00 AS Decimal(8, 2)), 10, N'angry birds')
INSERT [dbo].[order_detail] ([id], [order_id], [count], [price], [sum_price], [shop_id], [title]) VALUES (5, 5, 1, CAST(99.00 AS Decimal(8, 2)), CAST(99.00 AS Decimal(8, 2)), 15, N'secret group')
SET IDENTITY_INSERT [dbo].[order_detail] OFF
GO
SET IDENTITY_INSERT [dbo].[shopping] ON 

INSERT [dbo].[shopping] ([id], [title], [cid], [price], [sale_price], [number], [detail], [img], [shop_number], [state], [game_download]) VALUES (2, N'Dreamer Game', 3, CAST(22.00 AS Decimal(8, 2)), CAST(29.00 AS Decimal(8, 2)), 10000, N'<p><span style="color: rgb(43, 43, 43); font-family: Arial, 宋体; font-size: 14px; text-indent: 28px; text-wrap: wrap; background-color: rgb(255, 255, 255);">俗话说：工欲善其事必先利其器。为了提升实力，给装备尽可能高的镶嵌宝石，是每位玩家必须要做的事。今天这位小伙伴，就要向18级月亮石发起冲击！</span></p><p><span style="color: rgb(43, 43, 43); font-family: Arial, 宋体; font-size: 14px; text-indent: 28px; text-wrap: wrap; background-color: rgb(255, 255, 255);">一定要玩啊~</span></p><p><span style="color: rgb(43, 43, 43); font-family: Arial, 宋体; font-size: 14px; text-indent: 28px; text-wrap: wrap; background-color: rgb(255, 255, 255);">梦幻西游是一款很好玩的游戏！</span></p><p><span style="color: rgb(43, 43, 43); font-family: Arial, 宋体; font-size: 14px; text-indent: 28px; text-wrap: wrap; background-color: rgb(255, 255, 255);"><img src=" /20230613/6382228648286098899366258.jpg" title="CYMYpibqFuAdDze.jpg" alt="CYMYpibqFuAdDze.jpg"/></span></p>', N'/Content/pic/0613205412.jpg', N'20230613-1992904724', 3, N'打开链接：http://www.game.com后，输入游戏兑换码：QA330128，即可开始游戏。')
INSERT [dbo].[shopping] ([id], [title], [cid], [price], [sale_price], [number], [detail], [img], [shop_number], [state], [game_download]) VALUES (3, N'the witchrer 3 reloded', 1, CAST(89.00 AS Decimal(8, 2)), CAST(99.00 AS Decimal(8, 2)), 1000, N'<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; line-height: 28px; color: rgb(21, 21, 21); font-family: Ubuntu, sans-serif; text-wrap: wrap; background-color: rgb(255, 255, 255);"><span style="box-sizing: border-box; font-weight: bolder;">Need for Sped</span>&nbsp;rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally tances occur in which toil and pain can procure him some great pleasure pleasure rationally encounter sequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain itsuse it is pain, but because occasionally circumstances occur in which toil and pain can procure</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; line-height: 28px; color: rgb(21, 21, 21); font-family: Ubuntu, sans-serif; text-wrap: wrap; background-color: rgb(255, 255, 255);">Rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally tances occur in which toil and pain can procure him some great pleasure pleasure rationally encounte</p><p><img src=" /20230613/6382228675506815285533859.jpg" title="game-large1.jpg" alt="game-large1.jpg"/></p>', N'/Content/pic/0613205847.jpg', N'202306131799664180', 3, N'打开链接：http://www.game.com后，输入游戏兑换码：QA330128，即可开始游戏。')
INSERT [dbo].[shopping] ([id], [title], [cid], [price], [sale_price], [number], [detail], [img], [shop_number], [state], [game_download]) VALUES (4, N'the elder scroll', 1, CAST(89.00 AS Decimal(8, 2)), CAST(99.00 AS Decimal(8, 2)), 1000, N'<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; line-height: 28px; color: rgb(21, 21, 21); font-family: Ubuntu, sans-serif; text-wrap: wrap; background-color: rgb(255, 255, 255);"><span style="box-sizing: border-box; font-weight: bolder;">Need for Sped</span>&nbsp;rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally tances occur in which toil and pain can procure him some great pleasure pleasure rationally encounter sequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain itsuse it is pain, but because occasionally circumstances occur in which toil and pain can procure</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; line-height: 28px; color: rgb(21, 21, 21); font-family: Ubuntu, sans-serif; text-wrap: wrap; background-color: rgb(255, 255, 255);">Rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally tances occur in which toil and pain can procure him some great pleasure pleasure rationally encounte</p><p><img src=" /20230613/6382228675506815285533859.jpg" title="game-large1.jpg" alt="game-large1.jpg"/></p>', N'https://localhost:44366/assets/images/game/game1.jpg', N'20230613179966418024', 3, N'打开链接：http://www.game.com后，输入游戏兑换码：QA330128，即可开始游戏。')
INSERT [dbo].[shopping] ([id], [title], [cid], [price], [sale_price], [number], [detail], [img], [shop_number], [state], [game_download]) VALUES (5, N'Batman return', 1, CAST(89.00 AS Decimal(8, 2)), CAST(99.00 AS Decimal(8, 2)), 1000, N'<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; line-height: 28px; color: rgb(21, 21, 21); font-family: Ubuntu, sans-serif; text-wrap: wrap; background-color: rgb(255, 255, 255);"><span style="box-sizing: border-box; font-weight: bolder;">Need for Sped</span>&nbsp;rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally tances occur in which toil and pain can procure him some great pleasure pleasure rationally encounter sequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain itsuse it is pain, but because occasionally circumstances occur in which toil and pain can procure</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; line-height: 28px; color: rgb(21, 21, 21); font-family: Ubuntu, sans-serif; text-wrap: wrap; background-color: rgb(255, 255, 255);">Rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally tances occur in which toil and pain can procure him some great pleasure pleasure rationally encounte</p><p><img src=" /20230613/6382228675506815285533859.jpg" title="game-large1.jpg" alt="game-large1.jpg"/></p>', N'https://localhost:44366/assets/images/game/game2.jpg', N'20230613179966418023', 1, N'打开链接：http://www.game.com后，输入游戏兑换码：QA330128，即可开始游戏。')
INSERT [dbo].[shopping] ([id], [title], [cid], [price], [sale_price], [number], [detail], [img], [shop_number], [state], [game_download]) VALUES (6, N'Call of duty', 1, CAST(89.00 AS Decimal(8, 2)), CAST(99.00 AS Decimal(8, 2)), 1000, N'<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; line-height: 28px; color: rgb(21, 21, 21); font-family: Ubuntu, sans-serif; text-wrap: wrap; background-color: rgb(255, 255, 255);"><span style="box-sizing: border-box; font-weight: bolder;">Need for Sped</span>&nbsp;rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally tances occur in which toil and pain can procure him some great pleasure pleasure rationally encounter sequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain itsuse it is pain, but because occasionally circumstances occur in which toil and pain can procure</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; line-height: 28px; color: rgb(21, 21, 21); font-family: Ubuntu, sans-serif; text-wrap: wrap; background-color: rgb(255, 255, 255);">Rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally tances occur in which toil and pain can procure him some great pleasure pleasure rationally encounte</p><p><img src=" /20230613/6382228675506815285533859.jpg" title="game-large1.jpg" alt="game-large1.jpg"/></p>', N'https://localhost:44366/assets/images/game/game3.jpg', N'20230613179966418022', 1, N'打开链接：http://www.game.com后，输入游戏兑换码：QA330128，即可开始游戏。')
INSERT [dbo].[shopping] ([id], [title], [cid], [price], [sale_price], [number], [detail], [img], [shop_number], [state], [game_download]) VALUES (7, N'Assassins Cred', 1, CAST(89.00 AS Decimal(8, 2)), CAST(99.00 AS Decimal(8, 2)), 1000, N'<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; line-height: 28px; color: rgb(21, 21, 21); font-family: Ubuntu, sans-serif; text-wrap: wrap; background-color: rgb(255, 255, 255);"><span style="box-sizing: border-box; font-weight: bolder;">Need for Sped</span>&nbsp;rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally tances occur in which toil and pain can procure him some great pleasure pleasure rationally encounter sequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain itsuse it is pain, but because occasionally circumstances occur in which toil and pain can procure</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; line-height: 28px; color: rgb(21, 21, 21); font-family: Ubuntu, sans-serif; text-wrap: wrap; background-color: rgb(255, 255, 255);">Rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally tances occur in which toil and pain can procure him some great pleasure pleasure rationally encounte</p><p><img src=" /20230613/6382228675506815285533859.jpg" title="game-large1.jpg" alt="game-large1.jpg"/></p>', N'https://localhost:44366/assets/images/game/game4.jpg', N'20230613179966418021', 1, N'打开链接：http://www.game.com后，输入游戏兑换码：QA330128，即可开始游戏。')
INSERT [dbo].[shopping] ([id], [title], [cid], [price], [sale_price], [number], [detail], [img], [shop_number], [state], [game_download]) VALUES (8, N'spiderman return', 1, CAST(89.00 AS Decimal(8, 2)), CAST(99.00 AS Decimal(8, 2)), 1000, N'<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; line-height: 28px; color: rgb(21, 21, 21); font-family: Ubuntu, sans-serif; text-wrap: wrap; background-color: rgb(255, 255, 255);"><span style="box-sizing: border-box; font-weight: bolder;">Need for Sped</span>&nbsp;rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally tances occur in which toil and pain can procure him some great pleasure pleasure rationally encounter sequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain itsuse it is pain, but because occasionally circumstances occur in which toil and pain can procure</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; line-height: 28px; color: rgb(21, 21, 21); font-family: Ubuntu, sans-serif; text-wrap: wrap; background-color: rgb(255, 255, 255);">Rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally tances occur in which toil and pain can procure him some great pleasure pleasure rationally encounte</p><p><img src=" /20230613/6382228675506815285533859.jpg" title="game-large1.jpg" alt="game-large1.jpg"/></p>', N'https://localhost:44366/assets/images/game/game5.jpg', N'20230613179966418011', 1, N'打开链接：http://www.game.com后，输入游戏兑换码：QA330128，即可开始游戏。')
INSERT [dbo].[shopping] ([id], [title], [cid], [price], [sale_price], [number], [detail], [img], [shop_number], [state], [game_download]) VALUES (9, N'Age of ampires', 1, CAST(89.00 AS Decimal(8, 2)), CAST(99.00 AS Decimal(8, 2)), 1000, N'<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; line-height: 28px; color: rgb(21, 21, 21); font-family: Ubuntu, sans-serif; text-wrap: wrap; background-color: rgb(255, 255, 255);"><span style="box-sizing: border-box; font-weight: bolder;">Need for Sped</span>&nbsp;rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally tances occur in which toil and pain can procure him some great pleasure pleasure rationally encounter sequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain itsuse it is pain, but because occasionally circumstances occur in which toil and pain can procure</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; line-height: 28px; color: rgb(21, 21, 21); font-family: Ubuntu, sans-serif; text-wrap: wrap; background-color: rgb(255, 255, 255);">Rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally tances occur in which toil and pain can procure him some great pleasure pleasure rationally encounte</p><p><img src=" /20230613/6382228675506815285533859.jpg" title="game-large1.jpg" alt="game-large1.jpg"/></p>', N'https://localhost:44366/assets/images/game/game6.jpg', N'20230613179966418012', 1, N'打开链接：http://www.game.com后，输入游戏兑换码：QA330128，即可开始游戏。')
INSERT [dbo].[shopping] ([id], [title], [cid], [price], [sale_price], [number], [detail], [img], [shop_number], [state], [game_download]) VALUES (10, N'angry birds', 1, CAST(89.00 AS Decimal(8, 2)), CAST(99.00 AS Decimal(8, 2)), 1000, N'<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; line-height: 28px; color: rgb(21, 21, 21); font-family: Ubuntu, sans-serif; text-wrap: wrap; background-color: rgb(255, 255, 255);"><span style="box-sizing: border-box; font-weight: bolder;">Need for Sped</span>&nbsp;rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally tances occur in which toil and pain can procure him some great pleasure pleasure rationally encounter sequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain itsuse it is pain, but because occasionally circumstances occur in which toil and pain can procure</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; line-height: 28px; color: rgb(21, 21, 21); font-family: Ubuntu, sans-serif; text-wrap: wrap; background-color: rgb(255, 255, 255);">Rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally tances occur in which toil and pain can procure him some great pleasure pleasure rationally encounte</p><p><img src=" /20230613/6382228675506815285533859.jpg" title="game-large1.jpg" alt="game-large1.jpg"/></p>', N'https://localhost:44366/assets/images/game/game7.jpg', N'2023061317996641809', 1, N'打开链接：http://www.game.com后，输入游戏兑换码：QA330128，即可开始游戏。')
INSERT [dbo].[shopping] ([id], [title], [cid], [price], [sale_price], [number], [detail], [img], [shop_number], [state], [game_download]) VALUES (11, N'need for speed', 1, CAST(89.00 AS Decimal(8, 2)), CAST(99.00 AS Decimal(8, 2)), 1000, N'<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; line-height: 28px; color: rgb(21, 21, 21); font-family: Ubuntu, sans-serif; text-wrap: wrap; background-color: rgb(255, 255, 255);"><span style="box-sizing: border-box; font-weight: bolder;">Need for Sped</span>&nbsp;rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally tances occur in which toil and pain can procure him some great pleasure pleasure rationally encounter sequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain itsuse it is pain, but because occasionally circumstances occur in which toil and pain can procure</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; line-height: 28px; color: rgb(21, 21, 21); font-family: Ubuntu, sans-serif; text-wrap: wrap; background-color: rgb(255, 255, 255);">Rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally tances occur in which toil and pain can procure him some great pleasure pleasure rationally encounte</p><p><img src=" /20230613/6382228675506815285533859.jpg" title="game-large1.jpg" alt="game-large1.jpg"/></p>', N'https://localhost:44366/assets/images/game/game8.jpg', N'2023061317996641808', 2, N'打开链接：http://www.game.com后，输入游戏兑换码：QA330128，即可开始游戏。')
INSERT [dbo].[shopping] ([id], [title], [cid], [price], [sale_price], [number], [detail], [img], [shop_number], [state], [game_download]) VALUES (12, N'the witcher 3', 1, CAST(89.00 AS Decimal(8, 2)), CAST(99.00 AS Decimal(8, 2)), 1000, N'<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; line-height: 28px; color: rgb(21, 21, 21); font-family: Ubuntu, sans-serif; text-wrap: wrap; background-color: rgb(255, 255, 255);"><span style="box-sizing: border-box; font-weight: bolder;">Need for Sped</span>&nbsp;rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally tances occur in which toil and pain can procure him some great pleasure pleasure rationally encounter sequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain itsuse it is pain, but because occasionally circumstances occur in which toil and pain can procure</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; line-height: 28px; color: rgb(21, 21, 21); font-family: Ubuntu, sans-serif; text-wrap: wrap; background-color: rgb(255, 255, 255);">Rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally tances occur in which toil and pain can procure him some great pleasure pleasure rationally encounte</p><p><img src=" /20230613/6382228675506815285533859.jpg" title="game-large1.jpg" alt="game-large1.jpg"/></p>', N'https://localhost:44366/assets/images/game/game9.jpg', N'2023061317996641807', 2, N'打开链接：http://www.game.com后，输入游戏兑换码：QA330128，即可开始游戏。')
INSERT [dbo].[shopping] ([id], [title], [cid], [price], [sale_price], [number], [detail], [img], [shop_number], [state], [game_download]) VALUES (13, N'battle field 4', 1, CAST(89.00 AS Decimal(8, 2)), CAST(99.00 AS Decimal(8, 2)), 1000, N'<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; line-height: 28px; color: rgb(21, 21, 21); font-family: Ubuntu, sans-serif; text-wrap: wrap; background-color: rgb(255, 255, 255);"><span style="box-sizing: border-box; font-weight: bolder;">Need for Sped</span>&nbsp;rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally tances occur in which toil and pain can procure him some great pleasure pleasure rationally encounter sequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain itsuse it is pain, but because occasionally circumstances occur in which toil and pain can procure</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; line-height: 28px; color: rgb(21, 21, 21); font-family: Ubuntu, sans-serif; text-wrap: wrap; background-color: rgb(255, 255, 255);">Rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally tances occur in which toil and pain can procure him some great pleasure pleasure rationally encounte</p><p><img src=" /20230613/6382228675506815285533859.jpg" title="game-large1.jpg" alt="game-large1.jpg"/></p>', N'https://localhost:44366/assets/images/game/game10.jpg', N'2023061317996641806', 2, N'打开链接：http://www.game.com后，输入游戏兑换码：QA330128，即可开始游戏。')
INSERT [dbo].[shopping] ([id], [title], [cid], [price], [sale_price], [number], [detail], [img], [shop_number], [state], [game_download]) VALUES (14, N'the magician', 1, CAST(89.00 AS Decimal(8, 2)), CAST(99.00 AS Decimal(8, 2)), 1000, N'<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; line-height: 28px; color: rgb(21, 21, 21); font-family: Ubuntu, sans-serif; text-wrap: wrap; background-color: rgb(255, 255, 255);"><span style="box-sizing: border-box; font-weight: bolder;">Need for Sped</span>&nbsp;rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally tances occur in which toil and pain can procure him some great pleasure pleasure rationally encounter sequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain itsuse it is pain, but because occasionally circumstances occur in which toil and pain can procure</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; line-height: 28px; color: rgb(21, 21, 21); font-family: Ubuntu, sans-serif; text-wrap: wrap; background-color: rgb(255, 255, 255);">Rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally tances occur in which toil and pain can procure him some great pleasure pleasure rationally encounte</p><p><img src=" /20230613/6382228675506815285533859.jpg" title="game-large1.jpg" alt="game-large1.jpg"/></p>', N'https://localhost:44366/assets/images/game/game11.jpg', N'2023061317996641805', 2, N'打开链接：http://www.game.com后，输入游戏兑换码：QA330128，即可开始游戏。')
INSERT [dbo].[shopping] ([id], [title], [cid], [price], [sale_price], [number], [detail], [img], [shop_number], [state], [game_download]) VALUES (15, N'secret group', 1, CAST(89.00 AS Decimal(8, 2)), CAST(99.00 AS Decimal(8, 2)), 1000, N'<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; line-height: 28px; color: rgb(21, 21, 21); font-family: Ubuntu, sans-serif; text-wrap: wrap; background-color: rgb(255, 255, 255);"><span style="box-sizing: border-box; font-weight: bolder;">Need for Sped</span>&nbsp;rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally tances occur in which toil and pain can procure him some great pleasure pleasure rationally encounter sequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain itsuse it is pain, but because occasionally circumstances occur in which toil and pain can procure</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; line-height: 28px; color: rgb(21, 21, 21); font-family: Ubuntu, sans-serif; text-wrap: wrap; background-color: rgb(255, 255, 255);">Rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally tances occur in which toil and pain can procure him some great pleasure pleasure rationally encounte</p><p><img src=" /20230613/6382228675506815285533859.jpg" title="game-large1.jpg" alt="game-large1.jpg"/></p>', N'https://localhost:44366/assets/images/game/game3-1.jpg', N'2023061317996641804', 2, N'打开链接：http://www.game.com后，输入游戏兑换码：QA330128，即可开始游戏。')
INSERT [dbo].[shopping] ([id], [title], [cid], [price], [sale_price], [number], [detail], [img], [shop_number], [state], [game_download]) VALUES (16, N'Diablo 3', 1, CAST(89.00 AS Decimal(8, 2)), CAST(99.00 AS Decimal(8, 2)), 1000, N'<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; line-height: 28px; color: rgb(21, 21, 21); font-family: Ubuntu, sans-serif; text-wrap: wrap; background-color: rgb(255, 255, 255);"><span style="box-sizing: border-box; font-weight: bolder;">Need for Sped</span>&nbsp;rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally tances occur in which toil and pain can procure him some great pleasure pleasure rationally encounter sequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain itsuse it is pain, but because occasionally circumstances occur in which toil and pain can procure</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; line-height: 28px; color: rgb(21, 21, 21); font-family: Ubuntu, sans-serif; text-wrap: wrap; background-color: rgb(255, 255, 255);">Rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally tances occur in which toil and pain can procure him some great pleasure pleasure rationally encounte</p><p><img src=" /20230613/6382228675506815285533859.jpg" title="game-large1.jpg" alt="game-large1.jpg"/></p>', N'https://localhost:44366/assets/images/game/game3-2.jpg', N'2023061317996641803', 4, N'打开链接：http://www.game.com后，输入游戏兑换码：QA330128，即可开始游戏。')
INSERT [dbo].[shopping] ([id], [title], [cid], [price], [sale_price], [number], [detail], [img], [shop_number], [state], [game_download]) VALUES (17, N'WARCRAFT', 1, CAST(89.00 AS Decimal(8, 2)), CAST(99.00 AS Decimal(8, 2)), 1000, N'<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; line-height: 28px; color: rgb(21, 21, 21); font-family: Ubuntu, sans-serif; text-wrap: wrap; background-color: rgb(255, 255, 255);"><span style="box-sizing: border-box; font-weight: bolder;">Need for Sped</span>&nbsp;rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally tances occur in which toil and pain can procure him some great pleasure pleasure rationally encounter sequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain itsuse it is pain, but because occasionally circumstances occur in which toil and pain can procure</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; line-height: 28px; color: rgb(21, 21, 21); font-family: Ubuntu, sans-serif; text-wrap: wrap; background-color: rgb(255, 255, 255);">Rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally tances occur in which toil and pain can procure him some great pleasure pleasure rationally encounte</p><p><img src=" /20230613/6382228675506815285533859.jpg" title="game-large1.jpg" alt="game-large1.jpg"/></p>', N'https://localhost:44366/assets/images/game/game3-3.jpg', N'2023061317996641802', 4, N'打开链接：http://www.game.com后，输入游戏兑换码：QA330128，即可开始游戏。')
INSERT [dbo].[shopping] ([id], [title], [cid], [price], [sale_price], [number], [detail], [img], [shop_number], [state], [game_download]) VALUES (18, N'League of Legends', 1, CAST(89.00 AS Decimal(8, 2)), CAST(99.00 AS Decimal(8, 2)), 1000, N'<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; line-height: 28px; color: rgb(21, 21, 21); font-family: Ubuntu, sans-serif; text-wrap: wrap; background-color: rgb(255, 255, 255);"><span style="box-sizing: border-box; font-weight: bolder;">Need for Sped</span>&nbsp;rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally tances occur in which toil and pain can procure him some great pleasure pleasure rationally encounter sequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain itsuse it is pain, but because occasionally circumstances occur in which toil and pain can procure</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; line-height: 28px; color: rgb(21, 21, 21); font-family: Ubuntu, sans-serif; text-wrap: wrap; background-color: rgb(255, 255, 255);">Rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally tances occur in which toil and pain can procure him some great pleasure pleasure rationally encounte</p><p><img src=" /20230613/6382228675506815285533859.jpg" title="game-large1.jpg" alt="game-large1.jpg"/></p>', N'https://localhost:44366/assets/images/game/game3-4.jpg', N'2023061317996641801', 4, N'打开链接：http://www.game.com后，输入游戏兑换码：QA330128，即可开始游戏。')
INSERT [dbo].[shopping] ([id], [title], [cid], [price], [sale_price], [number], [detail], [img], [shop_number], [state], [game_download]) VALUES (19, N'A Chinese Odyssey ', 2, CAST(299.00 AS Decimal(8, 2)), CAST(199.00 AS Decimal(8, 2)), 100000, N'<p>大话西游是网易开发的一款非常好玩的游戏！</p><p>我们必须把它玩起来。</p>', N'/Content/pic/0613213231.jpg', N'20230613-946013012', 1, N'打开链接：http://www.game.com后，输入游戏兑换码：QA330128，即可开始游戏。')
SET IDENTITY_INSERT [dbo].[shopping] OFF
GO
SET IDENTITY_INSERT [dbo].[state] ON 

INSERT [dbo].[state] ([id], [statename]) VALUES (1, N'特色游戏')
INSERT [dbo].[state] ([id], [statename]) VALUES (2, N'新游戏')
INSERT [dbo].[state] ([id], [statename]) VALUES (3, N'推荐游戏')
INSERT [dbo].[state] ([id], [statename]) VALUES (4, N'游戏回顾')
SET IDENTITY_INSERT [dbo].[state] OFF
GO
SET IDENTITY_INSERT [dbo].[user] ON 

INSERT [dbo].[user] ([id], [username], [pwd], [nickname], [sex], [introduce], [age], [img]) VALUES (1, N'123', N'123', N'妮妮', 0, N'可爱的妮妮', 22, N'/Content/pic/0615140500.png')
INSERT [dbo].[user] ([id], [username], [pwd], [nickname], [sex], [introduce], [age], [img]) VALUES (3, N'1234', N'1234', N'花花', 0, N'可爱呀', 23, N'/assets/img/head.png')
INSERT [dbo].[user] ([id], [username], [pwd], [nickname], [sex], [introduce], [age], [img]) VALUES (4, N'test', N'test', N'晨晨', 1, N'夸我漂亮啊', 18, N'/assets/img/head.png')
INSERT [dbo].[user] ([id], [username], [pwd], [nickname], [sex], [introduce], [age], [img]) VALUES (5, N'zhangsan', N'123', N'张三', NULL, NULL, NULL, N'/assets/img/head.png')
SET IDENTITY_INSERT [dbo].[user] OFF
GO
SET IDENTITY_INSERT [dbo].[video] ON 

INSERT [dbo].[video] ([id], [title], [rate], [img], [url], [createtime]) VALUES (1, N'Splinter cell', CAST(5.00 AS Decimal(4, 2)), N'/Content/pic/0614142927.png', N'/Content/video/0614142931.mp4', CAST(N'2023-06-14T14:29:21.000' AS DateTime))
INSERT [dbo].[video] ([id], [title], [rate], [img], [url], [createtime]) VALUES (4, N'battle field 4', CAST(9.00 AS Decimal(4, 2)), N'/Content/pic/0614144515.jpg', N'/Content/video/0614142931.mp4', CAST(N'2023-06-14T14:32:49.000' AS DateTime))
INSERT [dbo].[video] ([id], [title], [rate], [img], [url], [createtime]) VALUES (5, N'latest update of the new version', CAST(10.00 AS Decimal(4, 2)), N'/assets/images/video/video3-1.jpg', N'/Content/video/0614142931.mp4', CAST(N'2023-06-14T14:32:49.000' AS DateTime))
INSERT [dbo].[video] ([id], [title], [rate], [img], [url], [createtime]) VALUES (6, N'Crew in the earth get new season', CAST(9.50 AS Decimal(4, 2)), N'/assets/images/video/video3-2.jpg', N'/Content/video/0614142931.mp4', CAST(N'2023-06-14T14:32:49.000' AS DateTime))
INSERT [dbo].[video] ([id], [title], [rate], [img], [url], [createtime]) VALUES (7, N'secrect code for the Mortal Kombat 4', CAST(10.00 AS Decimal(4, 2)), N'/assets/images/video/video3-3.jpg', N'/Content/video/0614142931.mp4', CAST(N'2023-06-14T14:32:49.000' AS DateTime))
INSERT [dbo].[video] ([id], [title], [rate], [img], [url], [createtime]) VALUES (8, N'need for speed have new challenge', CAST(20.00 AS Decimal(4, 2)), N'/assets/images/video/video6-1.jpg', N'/Content/video/0614142931.mp4', CAST(N'2023-06-14T14:32:49.000' AS DateTime))
INSERT [dbo].[video] ([id], [title], [rate], [img], [url], [createtime]) VALUES (9, N'KINGS OF THE
WARRIORS', CAST(8.00 AS Decimal(4, 2)), N'/assets/images/video/video6-2.jpg', N'/Content/video/0614142931.mp4', CAST(N'2023-06-14T14:32:49.000' AS DateTime))
INSERT [dbo].[video] ([id], [title], [rate], [img], [url], [createtime]) VALUES (10, N'the elder scroll', CAST(9.80 AS Decimal(4, 2)), N'/assets/images/video/video6-3.jpg', N'/Content/video/0614142931.mp4', CAST(N'2023-06-14T14:32:49.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[video] OFF
GO
ALTER TABLE [dbo].[shopping] ADD  CONSTRAINT [DF_shopping_state]  DEFAULT ((1)) FOR [state]
GO
ALTER TABLE [dbo].[comment]  WITH CHECK ADD  CONSTRAINT [FK_comment_shopping] FOREIGN KEY([shop_id])
REFERENCES [dbo].[shopping] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[comment] CHECK CONSTRAINT [FK_comment_shopping]
GO
ALTER TABLE [dbo].[comment]  WITH CHECK ADD  CONSTRAINT [FK_comment_user] FOREIGN KEY([uid])
REFERENCES [dbo].[user] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[comment] CHECK CONSTRAINT [FK_comment_user]
GO
ALTER TABLE [dbo].[forums]  WITH CHECK ADD  CONSTRAINT [FK_forums_user] FOREIGN KEY([uid])
REFERENCES [dbo].[user] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[forums] CHECK CONSTRAINT [FK_forums_user]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_user] FOREIGN KEY([uid])
REFERENCES [dbo].[user] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_user]
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [FK_order_detail_order] FOREIGN KEY([order_id])
REFERENCES [dbo].[order] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [FK_order_detail_order]
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [FK_order_detail_shopping] FOREIGN KEY([shop_id])
REFERENCES [dbo].[shopping] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [FK_order_detail_shopping]
GO
ALTER TABLE [dbo].[shopping]  WITH CHECK ADD  CONSTRAINT [FK_shopping_category] FOREIGN KEY([cid])
REFERENCES [dbo].[category] ([id])
ON UPDATE SET NULL
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[shopping] CHECK CONSTRAINT [FK_shopping_category]
GO
ALTER TABLE [dbo].[shopping]  WITH CHECK ADD  CONSTRAINT [FK_shopping_state] FOREIGN KEY([state])
REFERENCES [dbo].[state] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[shopping] CHECK CONSTRAINT [FK_shopping_state]
GO
USE [master]
GO
ALTER DATABASE [GameMall] SET  READ_WRITE 
GO
