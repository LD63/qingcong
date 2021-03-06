USE [master]
GO
/****** Object:  Database [PrivateClinic]    Script Date: 2020/7/28 18:58:14 ******/
CREATE DATABASE [PrivateClinic]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PrivateClinic', FILENAME = N'D:\青葱私人诊所\毕业项目源码和数据库\PrivateClinic.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PrivateClinic_log', FILENAME = N'D:\青葱私人诊所\毕业项目源码和数据库\PrivateClinic_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PrivateClinic] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PrivateClinic].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PrivateClinic] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PrivateClinic] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PrivateClinic] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PrivateClinic] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PrivateClinic] SET ARITHABORT OFF 
GO
ALTER DATABASE [PrivateClinic] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PrivateClinic] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [PrivateClinic] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PrivateClinic] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PrivateClinic] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PrivateClinic] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PrivateClinic] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PrivateClinic] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PrivateClinic] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PrivateClinic] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PrivateClinic] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PrivateClinic] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PrivateClinic] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PrivateClinic] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PrivateClinic] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PrivateClinic] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PrivateClinic] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PrivateClinic] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PrivateClinic] SET RECOVERY FULL 
GO
ALTER DATABASE [PrivateClinic] SET  MULTI_USER 
GO
ALTER DATABASE [PrivateClinic] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PrivateClinic] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PrivateClinic] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PrivateClinic] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PrivateClinic', N'ON'
GO
USE [PrivateClinic]
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 2020/7/28 18:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[AppID] [int] IDENTITY(1,1) NOT NULL,
	[AppName] [nvarchar](50) NULL,
	[AppDate] [date] NULL,
	[AppStart] [date] NULL,
	[AppEnd] [date] NULL,
	[AppIsomorphism] [nvarchar](100) NULL,
	[AppDD] [int] NULL,
 CONSTRAINT [PK_Appointment] PRIMARY KEY CLUSTERED 
(
	[AppID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Conclusion]    Script Date: 2020/7/28 18:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conclusion](
	[ConID] [int] IDENTITY(1,1) NOT NULL,
	[ConConclu] [nvarchar](100) NULL,
	[ConDescribe] [nvarchar](100) NULL,
	[InID] [int] NULL,
 CONSTRAINT [PK_Conclusion] PRIMARY KEY CLUSTERED 
(
	[ConID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Consultation]    Script Date: 2020/7/28 18:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consultation](
	[ConsuID] [int] IDENTITY(1,1) NOT NULL,
	[ConsuName] [nvarchar](50) NULL,
	[ConsuContent] [nvarchar](100) NULL,
	[ConsuProposal] [nvarchar](100) NULL,
	[ConsuTime] [date] NULL,
	[ConsuFill] [nvarchar](50) NULL,
 CONSTRAINT [PK_Consultation] PRIMARY KEY CLUSTERED 
(
	[ConsuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 2020/7/28 18:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CusID] [int] IDENTITY(1,1) NOT NULL,
	[CusName] [nvarchar](50) NULL,
	[CusCard] [nvarchar](50) NULL,
	[CusSex] [nvarchar](10) NULL,
	[CusBirth] [date] NULL,
	[CusMarriage] [nvarchar](50) NULL,
	[CusNation] [nvarchar](50) NULL,
	[CusAddress] [nvarchar](50) NULL,
	[CusTelephone] [nvarchar](11) NULL,
	[CusOccupation] [nvarchar](50) NULL,
	[CusBloodType] [nchar](10) NULL,
	[CusDoctor] [nvarchar](50) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Family]    Script Date: 2020/7/28 18:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Family](
	[FamID] [int] IDENTITY(1,1) NOT NULL,
	[FamCategory] [nvarchar](50) NULL,
	[FamTime] [date] NULL,
	[FamPlace] [nvarchar](50) NULL,
	[FamSurvey] [nvarchar](200) NULL,
	[FCusID] [int] NOT NULL,
 CONSTRAINT [PK_Family] PRIMARY KEY CLUSTERED 
(
	[FamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Inspect]    Script Date: 2020/7/28 18:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inspect](
	[InID] [int] IDENTITY(1,1) NOT NULL,
	[InDoctor] [nvarchar](50) NULL,
	[InName] [nvarchar](50) NULL,
	[InTime] [date] NULL,
	[ConConclu] [nvarchar](500) NULL,
	[ConDescribe] [nvarchar](150) NULL,
 CONSTRAINT [PK_Inspect] PRIMARY KEY CLUSTERED 
(
	[InID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Internal]    Script Date: 2020/7/28 18:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Internal](
	[InterID] [int] IDENTITY(1,1) NOT NULL,
	[InterBlood] [int] NULL,
	[InterPulse] [int] NULL,
	[InterHeart] [nvarchar](50) NULL,
	[InterNerve] [nvarchar](50) NULL,
	[InterLung] [nvarchar](50) NULL,
	[InterAbdomen] [nvarchar](50) NULL,
	[InterLiver] [nvarchar](50) NULL,
	[InterSpleen] [nvarchar](50) NULL,
	[InterChest] [nvarchar](50) NULL,
	[DInID] [int] NOT NULL,
 CONSTRAINT [PK_Internal] PRIMARY KEY CLUSTERED 
(
	[InterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KnowledgeBase]    Script Date: 2020/7/28 18:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KnowledgeBase](
	[KnowID] [int] IDENTITY(1,1) NOT NULL,
	[KnowCommon] [nvarchar](50) NULL,
	[KnowType] [nvarchar](50) NULL,
	[KnowAnswer] [nvarchar](50) NULL,
	[KnowAdd] [date] NULL,
	[KnowPeople] [nvarchar](50) NULL,
 CONSTRAINT [PK_KnowledgeBase] PRIMARY KEY CLUSTERED 
(
	[KnowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Marriage]    Script Date: 2020/7/28 18:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marriage](
	[MarID] [int] IDENTITY(1,1) NOT NULL,
	[MarCategory] [nvarchar](50) NULL,
	[MarTime] [date] NULL,
	[MarPlace] [nvarchar](50) NULL,
	[MarSurvey] [nvarchar](200) NULL,
	[RCusID] [int] NOT NULL,
 CONSTRAINT [PK_Marriage] PRIMARY KEY CLUSTERED 
(
	[MarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MedicalHistory]    Script Date: 2020/7/28 18:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalHistory](
	[MedID] [int] IDENTITY(1,1) NOT NULL,
	[MedCategory] [nvarchar](50) NULL,
	[MedTime] [date] NULL,
	[MedPlace] [nvarchar](50) NULL,
	[MedSurvey] [nvarchar](50) NULL,
	[MCusID] [int] NOT NULL,
 CONSTRAINT [PK_MedicalHistory] PRIMARY KEY CLUSTERED 
(
	[MedID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Menstrual]    Script Date: 2020/7/28 18:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menstrual](
	[MenID] [int] IDENTITY(1,1) NOT NULL,
	[MenCategory] [nvarchar](50) NULL,
	[MenTime] [date] NULL,
	[MenPlace] [nvarchar](50) NULL,
	[MenSurvey] [nvarchar](200) NULL,
	[SCusID] [int] NOT NULL,
 CONSTRAINT [PK_Menstrual] PRIMARY KEY CLUSTERED 
(
	[MenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Present]    Script Date: 2020/7/28 18:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Present](
	[PreID] [int] IDENTITY(1,1) NOT NULL,
	[PreCategory] [nvarchar](50) NULL,
	[PreTime] [date] NULL,
	[PrePlace] [nvarchar](50) NULL,
	[PreSurvey] [nvarchar](200) NULL,
	[PCusID] [int] NOT NULL,
 CONSTRAINT [PK_Present] PRIMARY KEY CLUSTERED 
(
	[PreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ReturnVisit]    Script Date: 2020/7/28 18:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReturnVisit](
	[RetID] [int] IDENTITY(1,1) NOT NULL,
	[RetName] [nvarchar](50) NULL,
	[RetType] [nvarchar](50) NULL,
	[RetIsomorphism] [nvarchar](50) NULL,
	[Resul] [nvarchar](50) NULL,
	[RetTime] [date] NULL,
	[RetPeople] [nvarchar](50) NULL,
 CONSTRAINT [PK_ReturnVisit] PRIMARY KEY CLUSTERED 
(
	[RetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Surgery]    Script Date: 2020/7/28 18:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Surgery](
	[SurID] [int] IDENTITY(1,1) NOT NULL,
	[SurHeight] [int] NULL,
	[SurBust] [int] NULL,
	[SurWeight] [int] NULL,
	[SurFace] [nvarchar](50) NULL,
	[SurNeck] [nvarchar](50) NULL,
	[SurSpine] [nvarchar](50) NULL,
	[SurLimb] [nvarchar](50) NULL,
	[SurJoint] [nvarchar](50) NULL,
	[SurOther] [nvarchar](50) NULL,
	[SInID] [int] NOT NULL,
 CONSTRAINT [PK_Surgery] PRIMARY KEY CLUSTERED 
(
	[SurID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 2020/7/28 18:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfo](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[UserPicture] [nvarchar](50) NULL,
	[UserLogin] [nvarchar](50) NULL,
	[UserPwd] [nvarchar](50) NULL,
	[UserBirth] [date] NULL,
	[UserSex] [nvarchar](10) NULL,
	[UserQua] [nvarchar](200) NULL,
	[UserRole] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserInfo] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Appointment] ON 

INSERT [dbo].[Appointment] ([AppID], [AppName], [AppDate], [AppStart], [AppEnd], [AppIsomorphism], [AppDD]) VALUES (1, N'张三', CAST(0x11410B00 AS Date), CAST(0x14410B00 AS Date), CAST(0x44410B00 AS Date), N'全身检查', 1)
INSERT [dbo].[Appointment] ([AppID], [AppName], [AppDate], [AppStart], [AppEnd], [AppIsomorphism], [AppDD]) VALUES (2, N'李四', NULL, CAST(0x14410B00 AS Date), CAST(0x44410B00 AS Date), N'全身检查', 1)
INSERT [dbo].[Appointment] ([AppID], [AppName], [AppDate], [AppStart], [AppEnd], [AppIsomorphism], [AppDD]) VALUES (3, N'牛一', NULL, CAST(0xF6400B00 AS Date), CAST(0x45410B00 AS Date), N'全身检查', 1)
INSERT [dbo].[Appointment] ([AppID], [AppName], [AppDate], [AppStart], [AppEnd], [AppIsomorphism], [AppDD]) VALUES (4, N'牛儿', NULL, CAST(0x15410B00 AS Date), CAST(0x45410B00 AS Date), N'全身检查', 1)
INSERT [dbo].[Appointment] ([AppID], [AppName], [AppDate], [AppStart], [AppEnd], [AppIsomorphism], [AppDD]) VALUES (5, N'牛三', NULL, CAST(0xD0400B00 AS Date), CAST(0x47410B00 AS Date), N'全身检查', 1)
INSERT [dbo].[Appointment] ([AppID], [AppName], [AppDate], [AppStart], [AppEnd], [AppIsomorphism], [AppDD]) VALUES (14, N'李大海', NULL, CAST(0xD0400B00 AS Date), CAST(0x4A410B00 AS Date), N'全身体检', 1)
INSERT [dbo].[Appointment] ([AppID], [AppName], [AppDate], [AppStart], [AppEnd], [AppIsomorphism], [AppDD]) VALUES (17, N'爱丽丝', NULL, CAST(0x0E410B00 AS Date), NULL, N'全身检查', 0)
INSERT [dbo].[Appointment] ([AppID], [AppName], [AppDate], [AppStart], [AppEnd], [AppIsomorphism], [AppDD]) VALUES (18, N'刘某', NULL, CAST(0x4D410B00 AS Date), NULL, N'全身检查', 0)
INSERT [dbo].[Appointment] ([AppID], [AppName], [AppDate], [AppStart], [AppEnd], [AppIsomorphism], [AppDD]) VALUES (19, N'张某', NULL, CAST(0x4D410B00 AS Date), CAST(0x4E410B00 AS Date), N'全身检查', 1)
INSERT [dbo].[Appointment] ([AppID], [AppName], [AppDate], [AppStart], [AppEnd], [AppIsomorphism], [AppDD]) VALUES (20, N'张某', NULL, CAST(0x4E410B00 AS Date), CAST(0x4E410B00 AS Date), N'全身检查', 1)
SET IDENTITY_INSERT [dbo].[Appointment] OFF
SET IDENTITY_INSERT [dbo].[Consultation] ON 

INSERT [dbo].[Consultation] ([ConsuID], [ConsuName], [ConsuContent], [ConsuProposal], [ConsuTime], [ConsuFill]) VALUES (1, N'张毅', N'请问脸上长痘痘怎么办', N'多喝如水、少熬夜', CAST(0x0D410B00 AS Date), N'张三')
INSERT [dbo].[Consultation] ([ConsuID], [ConsuName], [ConsuContent], [ConsuProposal], [ConsuTime], [ConsuFill]) VALUES (2, N'王长久', N'空腹可以吃饭吗？', N'一般不建议', CAST(0x4D410B00 AS Date), N'刘冬')
INSERT [dbo].[Consultation] ([ConsuID], [ConsuName], [ConsuContent], [ConsuProposal], [ConsuTime], [ConsuFill]) VALUES (4, N'周某', N'食物中毒怎么办？', N'及时去医院洗胃', CAST(0x4D410B00 AS Date), N'张三')
INSERT [dbo].[Consultation] ([ConsuID], [ConsuName], [ConsuContent], [ConsuProposal], [ConsuTime], [ConsuFill]) VALUES (5, N'杨某', N'风湿关节炎咋么办？', N'万通胫骨贴', CAST(0x4D410B00 AS Date), N'张三')
INSERT [dbo].[Consultation] ([ConsuID], [ConsuName], [ConsuContent], [ConsuProposal], [ConsuTime], [ConsuFill]) VALUES (6, N'王上', N'空腹可以吃饭吗？', N'一般不建议', CAST(0x4E410B00 AS Date), N'张三')
SET IDENTITY_INSERT [dbo].[Consultation] OFF
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CusID], [CusName], [CusCard], [CusSex], [CusBirth], [CusMarriage], [CusNation], [CusAddress], [CusTelephone], [CusOccupation], [CusBloodType], [CusDoctor]) VALUES (3, N'李白', N'110101199003078558', N'男', CAST(0x58230B00 AS Date), N'已婚', N'汉', N'湖南永州11', N'15234812685', N'网红', N'O         ', N'赵六')
INSERT [dbo].[Customer] ([CusID], [CusName], [CusCard], [CusSex], [CusBirth], [CusMarriage], [CusNation], [CusAddress], [CusTelephone], [CusOccupation], [CusBloodType], [CusDoctor]) VALUES (6, N'王五', N'110101199003078558', N'男', CAST(0x72230B00 AS Date), N'已婚', N'汉', N'湖南常德', N'15246255614', N'建筑师', N'O         ', N'张三')
INSERT [dbo].[Customer] ([CusID], [CusName], [CusCard], [CusSex], [CusBirth], [CusMarriage], [CusNation], [CusAddress], [CusTelephone], [CusOccupation], [CusBloodType], [CusDoctor]) VALUES (7, N'张润发', N'110101199003073335', N'女', CAST(0x620F0B00 AS Date), N'已婚', N'汉', N'广州佛山', N'13838384384', N'电竞', N'AB        ', N'张三')
INSERT [dbo].[Customer] ([CusID], [CusName], [CusCard], [CusSex], [CusBirth], [CusMarriage], [CusNation], [CusAddress], [CusTelephone], [CusOccupation], [CusBloodType], [CusDoctor]) VALUES (8, N'张某某', N'110101199003077854', N'男', CAST(0x80310B00 AS Date), N'已婚', N'土家族', N'湖南常德', N'16858685855', N'球员', N'O         ', N'张三')
INSERT [dbo].[Customer] ([CusID], [CusName], [CusCard], [CusSex], [CusBirth], [CusMarriage], [CusNation], [CusAddress], [CusTelephone], [CusOccupation], [CusBloodType], [CusDoctor]) VALUES (9, N'打的', N'123456789012345678', N'男', CAST(0x7B340B00 AS Date), N'已婚', N'汉', N'湖南长沙', N'12345677891', N'无业', N'O         ', N'张三')
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[Family] ON 

INSERT [dbo].[Family] ([FamID], [FamCategory], [FamTime], [FamPlace], [FamSurvey], [FCusID]) VALUES (1, N'脚臭111', CAST(0x7B220B00 AS Date), N'湖南长沙', N'好丑', 3)
INSERT [dbo].[Family] ([FamID], [FamCategory], [FamTime], [FamPlace], [FamSurvey], [FCusID]) VALUES (4, N'白化病', CAST(0x7C380B00 AS Date), N'表达式', N'放散阀', 6)
INSERT [dbo].[Family] ([FamID], [FamCategory], [FamTime], [FamPlace], [FamSurvey], [FCusID]) VALUES (6, N'撒大大', CAST(0x48410B00 AS Date), N'湖南长沙', N'四大', 7)
INSERT [dbo].[Family] ([FamID], [FamCategory], [FamTime], [FamPlace], [FamSurvey], [FCusID]) VALUES (7, N'无', CAST(0x4D410B00 AS Date), N'无', N'dfs', 8)
INSERT [dbo].[Family] ([FamID], [FamCategory], [FamTime], [FamPlace], [FamSurvey], [FCusID]) VALUES (8, N'无', CAST(0x4B410B00 AS Date), N'湖南', NULL, 9)
SET IDENTITY_INSERT [dbo].[Family] OFF
SET IDENTITY_INSERT [dbo].[Inspect] ON 

INSERT [dbo].[Inspect] ([InID], [InDoctor], [InName], [InTime], [ConConclu], [ConDescribe]) VALUES (1, N'牛一', N'张四', CAST(0xC5410B00 AS Date), N'身体正常', N'全身检查')
INSERT [dbo].[Inspect] ([InID], [InDoctor], [InName], [InTime], [ConConclu], [ConDescribe]) VALUES (2, N'牛儿', N'李四', CAST(0xA5410B00 AS Date), N'肝部正常', N'肝部检查')
INSERT [dbo].[Inspect] ([InID], [InDoctor], [InName], [InTime], [ConConclu], [ConDescribe]) VALUES (3, N'李四', N'张三', CAST(0x44410B00 AS Date), N'正常', N'全身体检')
INSERT [dbo].[Inspect] ([InID], [InDoctor], [InName], [InTime], [ConConclu], [ConDescribe]) VALUES (6, N'赵六', N'牛一', CAST(0x45410B00 AS Date), N'正常', N'正常')
INSERT [dbo].[Inspect] ([InID], [InDoctor], [InName], [InTime], [ConConclu], [ConDescribe]) VALUES (8, N'王五', N'账单', CAST(0xB0400B00 AS Date), N'正常', N'正常')
INSERT [dbo].[Inspect] ([InID], [InDoctor], [InName], [InTime], [ConConclu], [ConDescribe]) VALUES (12, N'张三', N'翠花', CAST(0x4A410B00 AS Date), N'正常', N'全身检查')
INSERT [dbo].[Inspect] ([InID], [InDoctor], [InName], [InTime], [ConConclu], [ConDescribe]) VALUES (17, N'张三', N'张某', CAST(0x4E410B00 AS Date), N'正常', N'全身检查')
INSERT [dbo].[Inspect] ([InID], [InDoctor], [InName], [InTime], [ConConclu], [ConDescribe]) VALUES (18, N'张三', N'张某', CAST(0x4E410B00 AS Date), N'正常', N'全身检查')
SET IDENTITY_INSERT [dbo].[Inspect] OFF
SET IDENTITY_INSERT [dbo].[Internal] ON 

INSERT [dbo].[Internal] ([InterID], [InterBlood], [InterPulse], [InterHeart], [InterNerve], [InterLung], [InterAbdomen], [InterLiver], [InterSpleen], [InterChest], [DInID]) VALUES (1, 120, 100, N'正常', N'正常', N'正常', N'正常', N'正常', N'正常', N'正常', 1)
INSERT [dbo].[Internal] ([InterID], [InterBlood], [InterPulse], [InterHeart], [InterNerve], [InterLung], [InterAbdomen], [InterLiver], [InterSpleen], [InterChest], [DInID]) VALUES (2, 110, 110, N'正常', N'正常', N'正常', N'正常', N'正常', N'正常', N'正常', 2)
INSERT [dbo].[Internal] ([InterID], [InterBlood], [InterPulse], [InterHeart], [InterNerve], [InterLung], [InterAbdomen], [InterLiver], [InterSpleen], [InterChest], [DInID]) VALUES (3, 110, 110, N'正常', N'正常', N'正常', N'正常', N'正常', N'正常', N'正常', 3)
INSERT [dbo].[Internal] ([InterID], [InterBlood], [InterPulse], [InterHeart], [InterNerve], [InterLung], [InterAbdomen], [InterLiver], [InterSpleen], [InterChest], [DInID]) VALUES (6, 110, 120, N'正常', N'正常', N'正常', N'正常', N'正常', N'正常', N'正常', 6)
INSERT [dbo].[Internal] ([InterID], [InterBlood], [InterPulse], [InterHeart], [InterNerve], [InterLung], [InterAbdomen], [InterLiver], [InterSpleen], [InterChest], [DInID]) VALUES (8, 56, 45, N'正常', N'正常', N'正常', N'正常', N'正常', N'正常', N'正常', 8)
INSERT [dbo].[Internal] ([InterID], [InterBlood], [InterPulse], [InterHeart], [InterNerve], [InterLung], [InterAbdomen], [InterLiver], [InterSpleen], [InterChest], [DInID]) VALUES (12, NULL, NULL, N'正常', N'正常', N'正常', N'正常', N'正常', N'正常', N'正常', 12)
INSERT [dbo].[Internal] ([InterID], [InterBlood], [InterPulse], [InterHeart], [InterNerve], [InterLung], [InterAbdomen], [InterLiver], [InterSpleen], [InterChest], [DInID]) VALUES (17, 175, 165, N'正常', N'正常', N'正常', N'正常', N'正常', N'正常', N'正常', 17)
INSERT [dbo].[Internal] ([InterID], [InterBlood], [InterPulse], [InterHeart], [InterNerve], [InterLung], [InterAbdomen], [InterLiver], [InterSpleen], [InterChest], [DInID]) VALUES (18, 155, 155, N'正常', N'正常', N'正常', N'正常', N'正常', N'正常', N'正常', 18)
SET IDENTITY_INSERT [dbo].[Internal] OFF
SET IDENTITY_INSERT [dbo].[KnowledgeBase] ON 

INSERT [dbo].[KnowledgeBase] ([KnowID], [KnowCommon], [KnowType], [KnowAnswer], [KnowAdd], [KnowPeople]) VALUES (3, N'感冒了怎么办？？？', N'内科', N'多喝热水，多休息', CAST(0x1C410B00 AS Date), N'张三')
INSERT [dbo].[KnowledgeBase] ([KnowID], [KnowCommon], [KnowType], [KnowAnswer], [KnowAdd], [KnowPeople]) VALUES (4, N'拉肚子怎么办？', N'内科', N'吃药', CAST(0x21410B00 AS Date), N'张三')
INSERT [dbo].[KnowledgeBase] ([KnowID], [KnowCommon], [KnowType], [KnowAnswer], [KnowAdd], [KnowPeople]) VALUES (5, N'一般在服毒后几小时内洗胃最有效？', N'内科', N'4～6小时内', CAST(0x22410B00 AS Date), N'张三')
INSERT [dbo].[KnowledgeBase] ([KnowID], [KnowCommon], [KnowType], [KnowAnswer], [KnowAdd], [KnowPeople]) VALUES (6, N'重金属中毒时用下列哪一种解毒药效果最好？？', N'内科', N'二巯丁二钠', CAST(0x29410B00 AS Date), N'张三')
INSERT [dbo].[KnowledgeBase] ([KnowID], [KnowCommon], [KnowType], [KnowAnswer], [KnowAdd], [KnowPeople]) VALUES (11, N'手檫伤怎么办？', N'外科', N'涂碘酒消毒', CAST(0x4D410B00 AS Date), N'刘冬')
SET IDENTITY_INSERT [dbo].[KnowledgeBase] OFF
SET IDENTITY_INSERT [dbo].[Marriage] ON 

INSERT [dbo].[Marriage] ([MarID], [MarCategory], [MarTime], [MarPlace], [MarSurvey], [RCusID]) VALUES (1, N'无111', CAST(0xBC3A0B00 AS Date), N'湖南岳阳', NULL, 3)
INSERT [dbo].[Marriage] ([MarID], [MarCategory], [MarTime], [MarPlace], [MarSurvey], [RCusID]) VALUES (4, N'无', CAST(0xB9330B00 AS Date), N'无', N'无', 6)
INSERT [dbo].[Marriage] ([MarID], [MarCategory], [MarTime], [MarPlace], [MarSurvey], [RCusID]) VALUES (6, N'五', CAST(0x4D410B00 AS Date), N'五', N'五', 7)
INSERT [dbo].[Marriage] ([MarID], [MarCategory], [MarTime], [MarPlace], [MarSurvey], [RCusID]) VALUES (7, N'无', CAST(0x4D410B00 AS Date), N'无', N'东方闪电功夫', 8)
INSERT [dbo].[Marriage] ([MarID], [MarCategory], [MarTime], [MarPlace], [MarSurvey], [RCusID]) VALUES (8, N'无', NULL, NULL, NULL, 9)
SET IDENTITY_INSERT [dbo].[Marriage] OFF
SET IDENTITY_INSERT [dbo].[MedicalHistory] ON 

INSERT [dbo].[MedicalHistory] ([MedID], [MedCategory], [MedTime], [MedPlace], [MedSurvey], [MCusID]) VALUES (1, N'肚子痛111', CAST(0xFA390B00 AS Date), N'湖南岳阳', N'好痛', 3)
INSERT [dbo].[MedicalHistory] ([MedID], [MedCategory], [MedTime], [MedPlace], [MedSurvey], [MCusID]) VALUES (4, N'毛女士来地方', CAST(0xB9330B00 AS Date), N'沙河顶', N'珍惜爱', 6)
INSERT [dbo].[MedicalHistory] ([MedID], [MedCategory], [MedTime], [MedPlace], [MedSurvey], [MCusID]) VALUES (6, N'睡大觉，获得', CAST(0x45410B00 AS Date), N'湖南长沙', N'打的', 7)
INSERT [dbo].[MedicalHistory] ([MedID], [MedCategory], [MedTime], [MedPlace], [MedSurvey], [MCusID]) VALUES (7, N'五', CAST(0x4D410B00 AS Date), N'五', N'无', 8)
INSERT [dbo].[MedicalHistory] ([MedID], [MedCategory], [MedTime], [MedPlace], [MedSurvey], [MCusID]) VALUES (8, N'阿萨', CAST(0x50410B00 AS Date), N'混那岳阳', N'打算', 9)
SET IDENTITY_INSERT [dbo].[MedicalHistory] OFF
SET IDENTITY_INSERT [dbo].[Menstrual] ON 

INSERT [dbo].[Menstrual] ([MenID], [MenCategory], [MenTime], [MenPlace], [MenSurvey], [SCusID]) VALUES (1, N'无111', CAST(0xBC3A0B00 AS Date), N'湖南岳阳', NULL, 3)
INSERT [dbo].[Menstrual] ([MenID], [MenCategory], [MenTime], [MenPlace], [MenSurvey], [SCusID]) VALUES (4, N'无', CAST(0xB9330B00 AS Date), N'用户是滴啊', N'发斯蒂芬', 6)
INSERT [dbo].[Menstrual] ([MenID], [MenCategory], [MenTime], [MenPlace], [MenSurvey], [SCusID]) VALUES (6, N'无', CAST(0x4D410B00 AS Date), N'无', N'无', 7)
INSERT [dbo].[Menstrual] ([MenID], [MenCategory], [MenTime], [MenPlace], [MenSurvey], [SCusID]) VALUES (7, N'无', CAST(0x4D410B00 AS Date), N'无', N'dfs', 8)
INSERT [dbo].[Menstrual] ([MenID], [MenCategory], [MenTime], [MenPlace], [MenSurvey], [SCusID]) VALUES (8, N'无', NULL, N'湖南', NULL, 9)
SET IDENTITY_INSERT [dbo].[Menstrual] OFF
SET IDENTITY_INSERT [dbo].[Present] ON 

INSERT [dbo].[Present] ([PreID], [PreCategory], [PreTime], [PrePlace], [PreSurvey], [PCusID]) VALUES (1, N'大病111', CAST(0xC5410B00 AS Date), N'湖南长沙', N'椅子料号', 3)
INSERT [dbo].[Present] ([PreID], [PreCategory], [PreTime], [PrePlace], [PreSurvey], [PCusID]) VALUES (4, N'神志不清', CAST(0xEA3E0B00 AS Date), N'湖南长沙', N'哈哈', 6)
INSERT [dbo].[Present] ([PreID], [PreCategory], [PreTime], [PrePlace], [PreSurvey], [PCusID]) VALUES (6, N'石达开', CAST(0x4E410B00 AS Date), N'长沙', N'通', 7)
INSERT [dbo].[Present] ([PreID], [PreCategory], [PreTime], [PrePlace], [PreSurvey], [PCusID]) VALUES (7, N'打的', CAST(0x46410B00 AS Date), N'湖南岳阳', N'dfs', 8)
INSERT [dbo].[Present] ([PreID], [PreCategory], [PreTime], [PrePlace], [PreSurvey], [PCusID]) VALUES (8, N'法规对待', CAST(0xB7400B00 AS Date), N'湖南长沙', N'we打色', 9)
SET IDENTITY_INSERT [dbo].[Present] OFF
SET IDENTITY_INSERT [dbo].[ReturnVisit] ON 

INSERT [dbo].[ReturnVisit] ([RetID], [RetName], [RetType], [RetIsomorphism], [Resul], [RetTime], [RetPeople]) VALUES (4, N'李白', N'调查', N'肾还痛吗？', N'还有点痛', CAST(0x4D410B00 AS Date), N'刘冬')
INSERT [dbo].[ReturnVisit] ([RetID], [RetName], [RetType], [RetIsomorphism], [Resul], [RetTime], [RetPeople]) VALUES (5, N'李白', N'调查', N'胃还痛吗', N'还有点痛', CAST(0x4D410B00 AS Date), N'张三')
INSERT [dbo].[ReturnVisit] ([RetID], [RetName], [RetType], [RetIsomorphism], [Resul], [RetTime], [RetPeople]) VALUES (6, N'王五', N'调查', N'还有什么不适合？', N'无', CAST(0x4D410B00 AS Date), N'张三')
INSERT [dbo].[ReturnVisit] ([RetID], [RetName], [RetType], [RetIsomorphism], [Resul], [RetTime], [RetPeople]) VALUES (8, N'张某某', N'调查', N'还有什么不适合？', N'无', CAST(0x4E410B00 AS Date), N'张三')
SET IDENTITY_INSERT [dbo].[ReturnVisit] OFF
SET IDENTITY_INSERT [dbo].[Surgery] ON 

INSERT [dbo].[Surgery] ([SurID], [SurHeight], [SurBust], [SurWeight], [SurFace], [SurNeck], [SurSpine], [SurLimb], [SurJoint], [SurOther], [SInID]) VALUES (1, 178, 48, 65, N'正常', N'正常', N'正常', N'正常', N'正常', N'正常', 1)
INSERT [dbo].[Surgery] ([SurID], [SurHeight], [SurBust], [SurWeight], [SurFace], [SurNeck], [SurSpine], [SurLimb], [SurJoint], [SurOther], [SInID]) VALUES (2, 176, 35, 60, N'正常', N'正常', N'正常', N'正常', N'正常', N'正常', 2)
INSERT [dbo].[Surgery] ([SurID], [SurHeight], [SurBust], [SurWeight], [SurFace], [SurNeck], [SurSpine], [SurLimb], [SurJoint], [SurOther], [SInID]) VALUES (3, 176, 45, 55, N'正常', N'正常', N'正常', N'正常', N'正常', N'正常', 3)
INSERT [dbo].[Surgery] ([SurID], [SurHeight], [SurBust], [SurWeight], [SurFace], [SurNeck], [SurSpine], [SurLimb], [SurJoint], [SurOther], [SInID]) VALUES (5, 185, 35, 65, N'正常', N'正常', N'正常', N'正常', N'正常', N'正常', 6)
INSERT [dbo].[Surgery] ([SurID], [SurHeight], [SurBust], [SurWeight], [SurFace], [SurNeck], [SurSpine], [SurLimb], [SurJoint], [SurOther], [SInID]) VALUES (7, 175, 55, 55, N'正常', N'正常', N'正常', N'正常', N'正常', N'正常', 8)
INSERT [dbo].[Surgery] ([SurID], [SurHeight], [SurBust], [SurWeight], [SurFace], [SurNeck], [SurSpine], [SurLimb], [SurJoint], [SurOther], [SInID]) VALUES (11, 155, 135, 45, N'正常', N'正常', N'正常', N'正常', N'正常', N'正常', 12)
INSERT [dbo].[Surgery] ([SurID], [SurHeight], [SurBust], [SurWeight], [SurFace], [SurNeck], [SurSpine], [SurLimb], [SurJoint], [SurOther], [SInID]) VALUES (16, 175, 45, 45, N'正常', N'正常', N'正常', N'正常', N'正常', N'正常', 17)
INSERT [dbo].[Surgery] ([SurID], [SurHeight], [SurBust], [SurWeight], [SurFace], [SurNeck], [SurSpine], [SurLimb], [SurJoint], [SurOther], [SInID]) VALUES (17, 175, 45, 55, N'正常', N'正常', N'正常', N'正常', N'正常', N'正常', 18)
SET IDENTITY_INSERT [dbo].[Surgery] OFF
SET IDENTITY_INSERT [dbo].[UserInfo] ON 

INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserPicture], [UserLogin], [UserPwd], [UserBirth], [UserSex], [UserQua], [UserRole]) VALUES (1, N'张三', N'f.jpg', N'zs', N'123456', CAST(0x8E060B00 AS Date), N'男', NULL, N'主治医生')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserPicture], [UserLogin], [UserPwd], [UserBirth], [UserSex], [UserQua], [UserRole]) VALUES (2, N'李四', N'bg.jpg', N'ls', N'123456', CAST(0x54170B00 AS Date), N'男', N'擅长骨科', N'主治医生')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserPicture], [UserLogin], [UserPwd], [UserBirth], [UserSex], [UserQua], [UserRole]) VALUES (3, N'刘冬', N'g.jpg', N'ld', N'111111', CAST(0x21140B00 AS Date), N'男', N'擅长脑科', N'主任医生')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserPicture], [UserLogin], [UserPwd], [UserBirth], [UserSex], [UserQua], [UserRole]) VALUES (4, N'赵六', N'1.jpg', N'zl', N'123456', CAST(0xD50F0B00 AS Date), N'男', N'擅长外科', N'主治医生')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserPicture], [UserLogin], [UserPwd], [UserBirth], [UserSex], [UserQua], [UserRole]) VALUES (10, N'王五', N'e.jpg', N'ww', N'123456', CAST(0x5F410B00 AS Date), N'男', N'骨科', N'主治医生')
SET IDENTITY_INSERT [dbo].[UserInfo] OFF
ALTER TABLE [dbo].[Conclusion]  WITH CHECK ADD  CONSTRAINT [FK_Conclusion_Inspect] FOREIGN KEY([InID])
REFERENCES [dbo].[Inspect] ([InID])
GO
ALTER TABLE [dbo].[Conclusion] CHECK CONSTRAINT [FK_Conclusion_Inspect]
GO
ALTER TABLE [dbo].[Family]  WITH CHECK ADD  CONSTRAINT [FK_Family_Customer] FOREIGN KEY([FCusID])
REFERENCES [dbo].[Customer] ([CusID])
GO
ALTER TABLE [dbo].[Family] CHECK CONSTRAINT [FK_Family_Customer]
GO
ALTER TABLE [dbo].[Internal]  WITH CHECK ADD  CONSTRAINT [FK_Internal_Inspect] FOREIGN KEY([DInID])
REFERENCES [dbo].[Inspect] ([InID])
GO
ALTER TABLE [dbo].[Internal] CHECK CONSTRAINT [FK_Internal_Inspect]
GO
ALTER TABLE [dbo].[Marriage]  WITH CHECK ADD  CONSTRAINT [FK_Marriage_Customer] FOREIGN KEY([RCusID])
REFERENCES [dbo].[Customer] ([CusID])
GO
ALTER TABLE [dbo].[Marriage] CHECK CONSTRAINT [FK_Marriage_Customer]
GO
ALTER TABLE [dbo].[MedicalHistory]  WITH CHECK ADD  CONSTRAINT [FK_MedicalHistory_Customer] FOREIGN KEY([MCusID])
REFERENCES [dbo].[Customer] ([CusID])
GO
ALTER TABLE [dbo].[MedicalHistory] CHECK CONSTRAINT [FK_MedicalHistory_Customer]
GO
ALTER TABLE [dbo].[Menstrual]  WITH CHECK ADD  CONSTRAINT [FK_Menstrual_Customer] FOREIGN KEY([SCusID])
REFERENCES [dbo].[Customer] ([CusID])
GO
ALTER TABLE [dbo].[Menstrual] CHECK CONSTRAINT [FK_Menstrual_Customer]
GO
ALTER TABLE [dbo].[Present]  WITH CHECK ADD  CONSTRAINT [FK_Present_Customer] FOREIGN KEY([PCusID])
REFERENCES [dbo].[Customer] ([CusID])
GO
ALTER TABLE [dbo].[Present] CHECK CONSTRAINT [FK_Present_Customer]
GO
ALTER TABLE [dbo].[Surgery]  WITH CHECK ADD  CONSTRAINT [FK_Surgery_Inspect] FOREIGN KEY([SInID])
REFERENCES [dbo].[Inspect] ([InID])
GO
ALTER TABLE [dbo].[Surgery] CHECK CONSTRAINT [FK_Surgery_Inspect]
GO
USE [master]
GO
ALTER DATABASE [PrivateClinic] SET  READ_WRITE 
GO
