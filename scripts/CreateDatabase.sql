USE [master]
GO
/****** Object:  Database [tvz2]    Script Date: 6.11.2019. 10:13:38 ******/
CREATE DATABASE [tvz2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'tvz2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\tvz2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'tvz2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\tvz2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [tvz2] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [tvz2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [tvz2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [tvz2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [tvz2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [tvz2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [tvz2] SET ARITHABORT OFF 
GO
ALTER DATABASE [tvz2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [tvz2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [tvz2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [tvz2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [tvz2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [tvz2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [tvz2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [tvz2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [tvz2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [tvz2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [tvz2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [tvz2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [tvz2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [tvz2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [tvz2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [tvz2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [tvz2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [tvz2] SET RECOVERY FULL 
GO
ALTER DATABASE [tvz2] SET  MULTI_USER 
GO
ALTER DATABASE [tvz2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [tvz2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [tvz2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [tvz2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [tvz2] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'tvz2', N'ON'
GO
ALTER DATABASE [tvz2] SET QUERY_STORE = OFF
GO
USE [tvz2]
GO
/****** Object:  Table [dbo].[Izvrsitelj]    Script Date: 6.11.2019. 10:13:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Izvrsitelj](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ZaposlenikID] [int] NULL,
	[KolegijID] [int] NULL,
	[UlogaIzvrsiteljaID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kolegij]    Script Date: 6.11.2019. 10:13:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kolegij](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [varchar](255) NULL,
	[ISVU] [varchar](50) NULL,
	[ECTS] [int] NULL,
	[URL] [varchar](255) NULL,
	[AkademskaGodina] [varchar](50) NULL,
	[Status] [varchar](255) NULL,
	[IzvedbaNastave] [varchar](255) NULL,
	[Cilj] [varchar](255) NULL,
	[Ishodi] [varchar](255) NULL,
	[NacinIzvodenjaPredavanja] [varchar](255) NULL,
	[NacinIzvodenjaAuditornih] [varchar](255) NULL,
	[NacinIzvodenjaLaboratorijskih] [varchar](255) NULL,
	[SadrzajPredavanja] [varchar](255) NULL,
	[SadrzajAuditornih] [varchar](255) NULL,
	[SadrzajLaboratorijskih] [varchar](255) NULL,
	[MaterijalniUvjeti] [varchar](255) NULL,
	[Literatura] [varchar](255) NULL,
	[Uvjet] [varchar](255) NULL,
	[ProvjeraZnanja] [varchar](255) NULL,
	[NaciniPolaganja] [varchar](255) NULL,
	[PracenjeRada] [varchar](255) NULL,
	[Napomena] [varchar](255) NULL,
	[Preduvjeti] [varchar](255) NULL,
	[ISVUEkvivalencije] [varchar](255) NULL,
	[IzradioID] [int] NULL,
	[SmjerID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Odjel]    Script Date: 6.11.2019. 10:13:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Odjel](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pretplata]    Script Date: 6.11.2019. 10:13:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pretplata](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NULL,
	[KolegijID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SidebarContent]    Script Date: 6.11.2019. 10:13:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SidebarContent](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Naslov] [varchar](255) NULL,
	[KolegijID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SidebarContentFile]    Script Date: 6.11.2019. 10:13:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SidebarContentFile](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [varchar](255) NULL,
	[Path] [varchar](255) NULL,
	[SidebarContentID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Smjer]    Script Date: 6.11.2019. 10:13:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Smjer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [varchar](255) NULL,
	[SkraceniNaziv] [varchar](20) NULL,
	[Vanredno] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 6.11.2019. 10:13:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[JMBAG] [char](10) NULL,
	[Ime] [varchar](255) NULL,
	[Prezime] [varchar](255) NULL,
	[ImagePath] [varchar](255) NULL,
	[Email] [varchar](255) NULL,
	[SmjerID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentKolegij]    Script Date: 6.11.2019. 10:13:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentKolegij](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NULL,
	[KolegijID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UlogaIzvrsitelja]    Script Date: 6.11.2019. 10:13:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UlogaIzvrsitelja](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vijest]    Script Date: 6.11.2019. 10:13:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vijest](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Naslov] [varchar](255) NULL,
	[Datum] [date] NULL,
	[Opis] [varchar](255) NULL,
	[KolegijID] [int] NULL,
	[ObjavioID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VrstaZaposljenja]    Script Date: 6.11.2019. 10:13:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VrstaZaposljenja](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zaposlenik]    Script Date: 6.11.2019. 10:13:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zaposlenik](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [varchar](255) NULL,
	[Prezime] [varchar](255) NULL,
	[TitulaIspred] [varchar](255) NULL,
	[TitulaIza] [varchar](255) NULL,
	[ImagePath] [varchar](255) NULL,
	[Email] [varchar](255) NULL,
	[VrstaZaposljenjaID] [int] NULL,
	[OdjelID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Smjer] ADD  DEFAULT ((0)) FOR [Vanredno]
GO
ALTER TABLE [dbo].[Izvrsitelj]  WITH CHECK ADD FOREIGN KEY([KolegijID])
REFERENCES [dbo].[Kolegij] ([ID])
GO
ALTER TABLE [dbo].[Izvrsitelj]  WITH CHECK ADD FOREIGN KEY([UlogaIzvrsiteljaID])
REFERENCES [dbo].[UlogaIzvrsitelja] ([ID])
GO
ALTER TABLE [dbo].[Izvrsitelj]  WITH CHECK ADD FOREIGN KEY([ZaposlenikID])
REFERENCES [dbo].[Zaposlenik] ([ID])
GO
ALTER TABLE [dbo].[Kolegij]  WITH CHECK ADD FOREIGN KEY([SmjerID])
REFERENCES [dbo].[Smjer] ([ID])
GO
ALTER TABLE [dbo].[Pretplata]  WITH CHECK ADD FOREIGN KEY([KolegijID])
REFERENCES [dbo].[Kolegij] ([ID])
GO
ALTER TABLE [dbo].[Pretplata]  WITH CHECK ADD FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([ID])
GO
ALTER TABLE [dbo].[SidebarContent]  WITH CHECK ADD FOREIGN KEY([KolegijID])
REFERENCES [dbo].[Kolegij] ([ID])
GO
ALTER TABLE [dbo].[SidebarContentFile]  WITH CHECK ADD FOREIGN KEY([SidebarContentID])
REFERENCES [dbo].[SidebarContent] ([ID])
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD FOREIGN KEY([SmjerID])
REFERENCES [dbo].[Smjer] ([ID])
GO
ALTER TABLE [dbo].[StudentKolegij]  WITH CHECK ADD FOREIGN KEY([KolegijID])
REFERENCES [dbo].[Kolegij] ([ID])
GO
ALTER TABLE [dbo].[StudentKolegij]  WITH CHECK ADD FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([ID])
GO
ALTER TABLE [dbo].[Vijest]  WITH CHECK ADD FOREIGN KEY([KolegijID])
REFERENCES [dbo].[Kolegij] ([ID])
GO
ALTER TABLE [dbo].[Vijest]  WITH CHECK ADD FOREIGN KEY([ObjavioID])
REFERENCES [dbo].[Zaposlenik] ([ID])
GO
ALTER TABLE [dbo].[Zaposlenik]  WITH CHECK ADD FOREIGN KEY([OdjelID])
REFERENCES [dbo].[Odjel] ([ID])
GO
ALTER TABLE [dbo].[Zaposlenik]  WITH CHECK ADD FOREIGN KEY([VrstaZaposljenjaID])
REFERENCES [dbo].[VrstaZaposljenja] ([ID])
GO
USE [master]
GO
ALTER DATABASE [tvz2] SET  READ_WRITE 
GO
