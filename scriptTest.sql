USE [master]
GO
/****** Object:  Database [PracticaTest]    Script Date: 22/04/2022 23:26:08 ******/
CREATE DATABASE [PracticaTest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PracticaTest', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PracticaTest.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PracticaTest_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PracticaTest_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PracticaTest] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PracticaTest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PracticaTest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PracticaTest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PracticaTest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PracticaTest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PracticaTest] SET ARITHABORT OFF 
GO
ALTER DATABASE [PracticaTest] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PracticaTest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PracticaTest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PracticaTest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PracticaTest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PracticaTest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PracticaTest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PracticaTest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PracticaTest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PracticaTest] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PracticaTest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PracticaTest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PracticaTest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PracticaTest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PracticaTest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PracticaTest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PracticaTest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PracticaTest] SET RECOVERY FULL 
GO
ALTER DATABASE [PracticaTest] SET  MULTI_USER 
GO
ALTER DATABASE [PracticaTest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PracticaTest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PracticaTest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PracticaTest] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PracticaTest] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PracticaTest] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PracticaTest', N'ON'
GO
ALTER DATABASE [PracticaTest] SET QUERY_STORE = OFF
GO
USE [PracticaTest]
GO
/****** Object:  Table [dbo].[Monto]    Script Date: 22/04/2022 23:26:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Monto](
	[id] [int] NOT NULL,
	[idPago] [float] NOT NULL,
	[MontoCP] [float] NOT NULL,
	[MontoIP] [int] NOT NULL,
	[SaldoIC] [float] NOT NULL,
 CONSTRAINT [PK_Monto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Monto_Pago]    Script Date: 22/04/2022 23:26:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Monto_Pago](
	[id] [int] NOT NULL,
	[idPago] [int] NOT NULL,
	[idPrestamo] [int] NOT NULL,
 CONSTRAINT [PK_Monto_Pago] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pago]    Script Date: 22/04/2022 23:26:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pago](
	[id] [int] NOT NULL,
	[idPrestamo] [int] NOT NULL,
	[TasaIA] [int] NOT NULL,
	[Plazo] [int] NOT NULL,
 CONSTRAINT [PK_Pago] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Monto_Pago]  WITH CHECK ADD  CONSTRAINT [FK_Monto_Pago_Monto] FOREIGN KEY([idPago])
REFERENCES [dbo].[Monto] ([id])
GO
ALTER TABLE [dbo].[Monto_Pago] CHECK CONSTRAINT [FK_Monto_Pago_Monto]
GO
ALTER TABLE [dbo].[Monto_Pago]  WITH CHECK ADD  CONSTRAINT [FK_Monto_Pago_Pago] FOREIGN KEY([idPrestamo])
REFERENCES [dbo].[Pago] ([id])
GO
ALTER TABLE [dbo].[Monto_Pago] CHECK CONSTRAINT [FK_Monto_Pago_Pago]
GO
USE [master]
GO
ALTER DATABASE [PracticaTest] SET  READ_WRITE 
GO
