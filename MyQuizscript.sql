USE [master]
GO
/****** Object:  Database [MyQuiz]    Script Date: 31/10/2021 11:34:31 ******/
CREATE DATABASE [MyQuiz]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MyQuiz', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\MyQuiz.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MyQuiz_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\MyQuiz_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MyQuiz] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyQuiz].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyQuiz] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyQuiz] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyQuiz] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyQuiz] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyQuiz] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyQuiz] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MyQuiz] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyQuiz] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyQuiz] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyQuiz] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyQuiz] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyQuiz] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyQuiz] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyQuiz] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyQuiz] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MyQuiz] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyQuiz] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyQuiz] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyQuiz] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyQuiz] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyQuiz] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MyQuiz] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyQuiz] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MyQuiz] SET  MULTI_USER 
GO
ALTER DATABASE [MyQuiz] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyQuiz] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MyQuiz] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MyQuiz] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MyQuiz] SET DELAYED_DURABILITY = DISABLED 
GO
USE [MyQuiz]
GO
/****** Object:  Table [dbo].[favorite]    Script Date: 31/10/2021 11:34:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[favorite](
	[setID] [int] NOT NULL,
	[userID] [int] NOT NULL,
 CONSTRAINT [PK_Favorite] PRIMARY KEY CLUSTERED 
(
	[setID] ASC,
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[quiz]    Script Date: 31/10/2021 11:34:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[quiz](
	[quizID] [int] IDENTITY(1,1) NOT NULL,
	[setID] [int] NULL,
	[term] [text] NULL,
	[definition] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[quizID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[quizSet]    Script Date: 31/10/2021 11:34:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[quizSet](
	[setID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NULL,
	[quizName] [varchar](50) NULL,
	[description] [varchar](max) NULL,
	[quizCount] [int] NULL,
	[createdDate] [datetime] NULL,
	[privacy] [bit] NULL,
 CONSTRAINT [PK__quizSet__DA8A697AC60AB4D0] PRIMARY KEY CLUSTERED 
(
	[setID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[user]    Script Date: 31/10/2021 11:34:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[user](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[img] [nvarchar](max) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[createdDate] [date] NOT NULL,
	[role] [int] NULL,
 CONSTRAINT [PK__user__CB9A1CDF84F73870] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[favorite] ([setID], [userID]) VALUES (2, 1)
SET IDENTITY_INSERT [dbo].[quiz] ON 

INSERT [dbo].[quiz] ([quizID], [setID], [term], [definition]) VALUES (1, 1, N'dog', N'animal that go "bow-wow"')
INSERT [dbo].[quiz] ([quizID], [setID], [term], [definition]) VALUES (2, 1, N'cat', N'a sassy lion-like pet')
INSERT [dbo].[quiz] ([quizID], [setID], [term], [definition]) VALUES (3, 1, N'human', N'dominants of Earth')
INSERT [dbo].[quiz] ([quizID], [setID], [term], [definition]) VALUES (4, 2, N'1+1', N'2')
INSERT [dbo].[quiz] ([quizID], [setID], [term], [definition]) VALUES (5, 2, N'8*4', N'32')
SET IDENTITY_INSERT [dbo].[quiz] OFF
SET IDENTITY_INSERT [dbo].[quizSet] ON 

INSERT [dbo].[quizSet] ([setID], [userID], [quizName], [description], [quizCount], [createdDate], [privacy]) VALUES (1, 1, N'English', N'My own new word list', 3, CAST(N'2021-10-14 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[quizSet] ([setID], [userID], [quizName], [description], [quizCount], [createdDate], [privacy]) VALUES (2, 2, N'Math', N'Math Practive', 2, CAST(N'2021-10-11 00:00:00.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[quizSet] OFF
SET IDENTITY_INSERT [dbo].[user] ON 

INSERT [dbo].[user] ([userID], [username], [password], [img], [email], [createdDate], [role]) VALUES (1, N'long', N'123', N'https://i.pinimg.com/736x/64/86/33/648633f8f211524c1e76dd8ebdbac13d--avatar.jpg', N'long@gmail.com', CAST(N'2001-02-05' AS Date), 0)
INSERT [dbo].[user] ([userID], [username], [password], [img], [email], [createdDate], [role]) VALUES (2, N'mai', N'123', N'https://pbs.twimg.com/profile_images/1429741436774359040/HXAnLOwv_400x400.jpg', N'mai@gmail.com', CAST(N'2001-10-13' AS Date), 1)
INSERT [dbo].[user] ([userID], [username], [password], [img], [email], [createdDate], [role]) VALUES (3, N'son', N'123', N'https://photo-cms-kienthuc.zadn.vn/zoom/800/Static/images/contents/phamthuy/20121231/1-tra_kienthuc.jpg', N'son@gmail.com', CAST(N'2001-03-18' AS Date), 1)
INSERT [dbo].[user] ([userID], [username], [password], [img], [email], [createdDate], [role]) VALUES (4, N'hieu', N'123', N'https://farm9.staticflickr.com/8220/8323874341_96692045e3_o.jpg', N'hieu@gmail.com', CAST(N'2021-10-16' AS Date), 1)
SET IDENTITY_INSERT [dbo].[user] OFF
ALTER TABLE [dbo].[favorite]  WITH CHECK ADD  CONSTRAINT [FK__favorite__setID__5535A963] FOREIGN KEY([setID])
REFERENCES [dbo].[quizSet] ([setID])
GO
ALTER TABLE [dbo].[favorite] CHECK CONSTRAINT [FK__favorite__setID__5535A963]
GO
ALTER TABLE [dbo].[favorite]  WITH CHECK ADD  CONSTRAINT [FK__favorite__userID__5629CD9C] FOREIGN KEY([userID])
REFERENCES [dbo].[user] ([userID])
GO
ALTER TABLE [dbo].[favorite] CHECK CONSTRAINT [FK__favorite__userID__5629CD9C]
GO
ALTER TABLE [dbo].[quiz]  WITH CHECK ADD  CONSTRAINT [FK__quiz__setID__4CA06362] FOREIGN KEY([setID])
REFERENCES [dbo].[quizSet] ([setID])
GO
ALTER TABLE [dbo].[quiz] CHECK CONSTRAINT [FK__quiz__setID__4CA06362]
GO
ALTER TABLE [dbo].[quizSet]  WITH CHECK ADD  CONSTRAINT [FK__quizSet__userID__49C3F6B7] FOREIGN KEY([userID])
REFERENCES [dbo].[user] ([userID])
GO
ALTER TABLE [dbo].[quizSet] CHECK CONSTRAINT [FK__quizSet__userID__49C3F6B7]
GO
USE [master]
GO
ALTER DATABASE [MyQuiz] SET  READ_WRITE 
GO
