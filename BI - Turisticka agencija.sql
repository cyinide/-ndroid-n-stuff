USE [master]
GO
/****** Object:  Database [TuristickaAgencija]    Script Date: 20.12.2017. 23:06:53 ******/
CREATE DATABASE [TuristickaAgencija]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TuristickaAgencija', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TuristickaAgencija.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TuristickaAgencija_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TuristickaAgencija_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TuristickaAgencija] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TuristickaAgencija].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TuristickaAgencija] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TuristickaAgencija] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TuristickaAgencija] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TuristickaAgencija] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TuristickaAgencija] SET ARITHABORT OFF 
GO
ALTER DATABASE [TuristickaAgencija] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TuristickaAgencija] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TuristickaAgencija] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TuristickaAgencija] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TuristickaAgencija] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TuristickaAgencija] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TuristickaAgencija] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TuristickaAgencija] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TuristickaAgencija] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TuristickaAgencija] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TuristickaAgencija] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TuristickaAgencija] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TuristickaAgencija] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TuristickaAgencija] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TuristickaAgencija] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TuristickaAgencija] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TuristickaAgencija] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TuristickaAgencija] SET RECOVERY FULL 
GO
ALTER DATABASE [TuristickaAgencija] SET  MULTI_USER 
GO
ALTER DATABASE [TuristickaAgencija] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TuristickaAgencija] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TuristickaAgencija] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TuristickaAgencija] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TuristickaAgencija] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TuristickaAgencija', N'ON'
GO
ALTER DATABASE [TuristickaAgencija] SET QUERY_STORE = OFF
GO
USE [TuristickaAgencija]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [TuristickaAgencija]
GO
/****** Object:  Table [dbo].[Drzave]    Script Date: 20.12.2017. 23:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Drzave](
	[DrzavaID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DrzavaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FakultativniIzleti]    Script Date: 20.12.2017. 23:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FakultativniIzleti](
	[FakultativniIzletiID] [int] IDENTITY(1,1) NOT NULL,
	[Cijena] [decimal](18, 2) NOT NULL,
	[Naziv] [nvarchar](max) NOT NULL,
	[PonudaID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FakultativniIzletiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gradovi]    Script Date: 20.12.2017. 23:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gradovi](
	[GradID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](50) NOT NULL,
	[DrzavaID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GradID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GradoviPonude]    Script Date: 20.12.2017. 23:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GradoviPonude](
	[GradoviPonudeID] [int] IDENTITY(1,1) NOT NULL,
	[GradID] [int] NOT NULL,
	[PonudaID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GradoviPonudeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Klijenti]    Script Date: 20.12.2017. 23:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Klijenti](
	[KlijentID] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [nvarchar](50) NOT NULL,
	[Prezime] [nvarchar](50) NOT NULL,
	[JMBG] [nvarchar](13) NULL,
	[DatumRodjenja] [datetime] NULL,
	[Email] [nvarchar](100) NULL,
	[Telefon] [nvarchar](20) NULL,
	[Adresa] [nvarchar](50) NULL,
	[BrojPasosa] [nvarchar](20) NULL,
	[GradID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[KlijentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NacinPlacanja]    Script Date: 20.12.2017. 23:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NacinPlacanja](
	[NacinPlacanjaID] [int] IDENTITY(1,1) NOT NULL,
	[NacinPlacanja] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NacinPlacanjaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PonudaPrevoz]    Script Date: 20.12.2017. 23:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PonudaPrevoz](
	[PonudaPrevozID] [int] IDENTITY(1,1) NOT NULL,
	[PrevozID] [int] NOT NULL,
	[PonudaID] [int] NOT NULL,
	[Cijena] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PonudaPrevozID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PonudaSmjestaj]    Script Date: 20.12.2017. 23:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PonudaSmjestaj](
	[PonudaSmjestajID] [int] IDENTITY(1,1) NOT NULL,
	[SmjestajID] [int] NOT NULL,
	[PonudaID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PonudaSmjestajID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ponude]    Script Date: 20.12.2017. 23:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ponude](
	[PonudaID] [int] IDENTITY(1,1) NOT NULL,
	[Opis] [nvarchar](max) NULL,
	[DatumKreiranja] [datetime] NOT NULL,
	[PocetakTrajanjaPonude] [datetime] NOT NULL,
	[KrajPonude] [datetime] NOT NULL,
	[Cijena] [decimal](18, 2) NOT NULL,
	[ZaposlenikID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PonudaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prevoz]    Script Date: 20.12.2017. 23:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prevoz](
	[PrevozID] [int] IDENTITY(1,1) NOT NULL,
	[TipPrevoza] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PrevozID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RezervacijaFakultativniIzleti]    Script Date: 20.12.2017. 23:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RezervacijaFakultativniIzleti](
	[RezervacijaFakultativniIzletID] [int] IDENTITY(1,1) NOT NULL,
	[RezervacijaID] [int] NOT NULL,
	[FakultativniIzletiID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RezervacijaFakultativniIzletID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RezervacijaUplate]    Script Date: 20.12.2017. 23:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RezervacijaUplate](
	[RezervacijeUplateID] [int] IDENTITY(1,1) NOT NULL,
	[RezervacijaID] [int] NOT NULL,
	[NacinPlacanjaID] [int] NOT NULL,
	[Cijena] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RezervacijeUplateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rezervacije]    Script Date: 20.12.2017. 23:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rezervacije](
	[RezervacijaID] [int] IDENTITY(1,1) NOT NULL,
	[DatumPolaska] [datetime] NOT NULL,
	[DatumPovratka] [datetime] NOT NULL,
	[DatumRezervisanja] [datetime] NOT NULL,
	[BrojNocenja] [int] NOT NULL,
	[Opis] [text] NULL,
	[KlijentID] [int] NOT NULL,
	[PonudaID] [int] NOT NULL,
	[PonudaPrevozID] [int] NOT NULL,
	[PonudaSmjestajID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RezervacijaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Smjestaj]    Script Date: 20.12.2017. 23:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Smjestaj](
	[SmjestajID] [int] IDENTITY(1,1) NOT NULL,
	[VrstaSmjestajaID] [int] NOT NULL,
	[BrojSoba] [int] NOT NULL,
	[OpisSmjestaja] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[SmjestajID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VrstaSmjestaja]    Script Date: 20.12.2017. 23:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VrstaSmjestaja](
	[VrstaSmjestajaID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[VrstaSmjestajaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zaposlenici]    Script Date: 20.12.2017. 23:06:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zaposlenici](
	[ZaposlenikID] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [nvarchar](50) NOT NULL,
	[Prezime] [nvarchar](50) NOT NULL,
	[DatumRodjenja] [date] NOT NULL,
	[JMBG] [nvarchar](13) NULL,
	[DatumZaposljenja] [date] NOT NULL,
	[Email] [nvarchar](100) NULL,
	[Telefon] [nvarchar](20) NULL,
	[Adresa] [nvarchar](50) NULL,
	[GradID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ZaposlenikID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FakultativniIzleti]  WITH CHECK ADD FOREIGN KEY([PonudaID])
REFERENCES [dbo].[Ponude] ([PonudaID])
GO
ALTER TABLE [dbo].[Gradovi]  WITH CHECK ADD FOREIGN KEY([DrzavaID])
REFERENCES [dbo].[Drzave] ([DrzavaID])
GO
ALTER TABLE [dbo].[GradoviPonude]  WITH CHECK ADD FOREIGN KEY([GradID])
REFERENCES [dbo].[Gradovi] ([GradID])
GO
ALTER TABLE [dbo].[GradoviPonude]  WITH CHECK ADD FOREIGN KEY([PonudaID])
REFERENCES [dbo].[Ponude] ([PonudaID])
GO
ALTER TABLE [dbo].[Klijenti]  WITH CHECK ADD FOREIGN KEY([GradID])
REFERENCES [dbo].[Gradovi] ([GradID])
GO
ALTER TABLE [dbo].[PonudaPrevoz]  WITH CHECK ADD FOREIGN KEY([PonudaID])
REFERENCES [dbo].[Ponude] ([PonudaID])
GO
ALTER TABLE [dbo].[PonudaPrevoz]  WITH CHECK ADD FOREIGN KEY([PrevozID])
REFERENCES [dbo].[Prevoz] ([PrevozID])
GO
ALTER TABLE [dbo].[PonudaSmjestaj]  WITH CHECK ADD FOREIGN KEY([PonudaID])
REFERENCES [dbo].[Ponude] ([PonudaID])
GO
ALTER TABLE [dbo].[PonudaSmjestaj]  WITH CHECK ADD FOREIGN KEY([SmjestajID])
REFERENCES [dbo].[Smjestaj] ([SmjestajID])
GO
ALTER TABLE [dbo].[Ponude]  WITH CHECK ADD FOREIGN KEY([ZaposlenikID])
REFERENCES [dbo].[Zaposlenici] ([ZaposlenikID])
GO
ALTER TABLE [dbo].[RezervacijaFakultativniIzleti]  WITH CHECK ADD FOREIGN KEY([FakultativniIzletiID])
REFERENCES [dbo].[FakultativniIzleti] ([FakultativniIzletiID])
GO
ALTER TABLE [dbo].[RezervacijaFakultativniIzleti]  WITH CHECK ADD FOREIGN KEY([RezervacijaID])
REFERENCES [dbo].[Rezervacije] ([RezervacijaID])
GO
ALTER TABLE [dbo].[RezervacijaUplate]  WITH CHECK ADD FOREIGN KEY([NacinPlacanjaID])
REFERENCES [dbo].[NacinPlacanja] ([NacinPlacanjaID])
GO
ALTER TABLE [dbo].[RezervacijaUplate]  WITH CHECK ADD FOREIGN KEY([RezervacijaID])
REFERENCES [dbo].[Rezervacije] ([RezervacijaID])
GO
ALTER TABLE [dbo].[Rezervacije]  WITH CHECK ADD FOREIGN KEY([KlijentID])
REFERENCES [dbo].[Klijenti] ([KlijentID])
GO
ALTER TABLE [dbo].[Rezervacije]  WITH CHECK ADD FOREIGN KEY([PonudaID])
REFERENCES [dbo].[Ponude] ([PonudaID])
GO
ALTER TABLE [dbo].[Rezervacije]  WITH CHECK ADD FOREIGN KEY([PonudaPrevozID])
REFERENCES [dbo].[PonudaPrevoz] ([PonudaPrevozID])
GO
ALTER TABLE [dbo].[Rezervacije]  WITH CHECK ADD FOREIGN KEY([PonudaSmjestajID])
REFERENCES [dbo].[PonudaSmjestaj] ([PonudaSmjestajID])
GO
ALTER TABLE [dbo].[Smjestaj]  WITH CHECK ADD FOREIGN KEY([VrstaSmjestajaID])
REFERENCES [dbo].[VrstaSmjestaja] ([VrstaSmjestajaID])
GO
ALTER TABLE [dbo].[Zaposlenici]  WITH CHECK ADD FOREIGN KEY([GradID])
REFERENCES [dbo].[Gradovi] ([GradID])
GO
USE [master]
GO
ALTER DATABASE [TuristickaAgencija] SET  READ_WRITE 
GO
