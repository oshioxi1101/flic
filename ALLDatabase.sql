USE [master]
GO
/****** Object:  Database [FLIC_190924]    Script Date: 5/22/2025 8:59:16 PM ******/
CREATE DATABASE [FLIC_190924]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FLIC_190924', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\FLIC_190924.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FLIC_190924_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\FLIC_190924_log.ldf' , SIZE = 139264KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [FLIC_190924] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FLIC_190924].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FLIC_190924] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FLIC_190924] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FLIC_190924] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FLIC_190924] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FLIC_190924] SET ARITHABORT OFF 
GO
ALTER DATABASE [FLIC_190924] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FLIC_190924] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FLIC_190924] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FLIC_190924] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FLIC_190924] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FLIC_190924] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FLIC_190924] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FLIC_190924] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FLIC_190924] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FLIC_190924] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FLIC_190924] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FLIC_190924] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FLIC_190924] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FLIC_190924] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FLIC_190924] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FLIC_190924] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FLIC_190924] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FLIC_190924] SET RECOVERY FULL 
GO
ALTER DATABASE [FLIC_190924] SET  MULTI_USER 
GO
ALTER DATABASE [FLIC_190924] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FLIC_190924] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FLIC_190924] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FLIC_190924] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FLIC_190924] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FLIC_190924] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'FLIC_190924', N'ON'
GO
ALTER DATABASE [FLIC_190924] SET QUERY_STORE = ON
GO
ALTER DATABASE [FLIC_190924] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [FLIC_190924]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/22/2025 8:59:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Articles]    Script Date: 5/22/2025 8:59:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NULL,
	[SectionId] [int] NULL,
	[ArticleAbstract] [nvarchar](max) NULL,
	[ImagePath] [nvarchar](500) NULL,
	[ArticleContent] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Articles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 5/22/2025 8:59:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 5/22/2025 8:59:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 5/22/2025 8:59:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 5/22/2025 8:59:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 5/22/2025 8:59:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 5/22/2025 8:59:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 5/22/2025 8:59:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DangkyTH03s]    Script Date: 5/22/2025 8:59:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DangkyTH03s](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[HovaDem] [nvarchar](50) NOT NULL,
	[Ten] [nvarchar](50) NOT NULL,
	[GioiTinh] [int] NOT NULL,
	[NgaySinh] [nvarchar](50) NOT NULL,
	[NoiSinh_Tinh] [int] NOT NULL,
	[DanToc] [int] NOT NULL,
	[CCCD] [varchar](50) NOT NULL,
	[CCCD_NgayCap] [varchar](50) NOT NULL,
	[CCCD_NoiCap] [nvarchar](max) NOT NULL,
	[DienThoai] [varchar](50) NOT NULL,
	[DiaChi] [nvarchar](max) NOT NULL,
	[Email] [varchar](max) NOT NULL,
	[DKOnThi] [int] NULL,
	[LePhiThi] [int] NULL,
	[LePhiOn] [int] NULL,
	[Trangthai] [int] NOT NULL,
	[DiaDiemThi] [nvarchar](50) NULL,
	[DotThi] [nvarchar](50) NULL,
	[MaSinhvien] [varchar](50) NULL,
	[KhoahocID] [varchar](50) NULL,
	[KhoaID] [varchar](50) NULL,
	[NganhID] [varchar](50) NULL,
	[LopID] [varchar](50) NULL,
	[DuDKThi] [bit] NOT NULL,
	[SoBD] [nvarchar](50) NULL,
	[PhongThi] [nvarchar](50) NULL,
	[CaThi] [nvarchar](50) NULL,
	[Taikhoan] [varchar](50) NULL,
	[Matkhau] [varchar](50) NULL,
	[Ghichu] [nvarchar](max) NULL,
	[SoPhach] [nvarchar](50) NULL,
	[DiemLT] [float] NULL,
	[DiemTH] [float] NULL,
	[Ketqua] [nvarchar](50) NULL,
	[NgayTao] [datetime] NULL,
	[NgaySua] [datetime] NULL,
	[PaymentId] [nvarchar](250) NULL,
	[PaymentMethod] [nvarchar](250) NULL,
	[PaymentOrderDescription] [nvarchar](250) NULL,
	[PaymentOrderId] [nvarchar](250) NULL,
	[PaymentSuccess] [bit] NULL,
	[PaymentToken] [nvarchar](250) NULL,
	[PaymentTransactionId] [nvarchar](250) NULL,
	[SoChungChi] [nvarchar](20) NULL,
	[SoVaoSo] [nvarchar](20) NULL,
	[VnPayResponseCode] [nvarchar](250) NULL,
	[guid] [nvarchar](250) NULL,
	[Lock] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Diemthis]    Script Date: 5/22/2025 8:59:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Diemthis](
	[Id] [varchar](50) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Diemthis] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DKHocs]    Script Date: 5/22/2025 8:59:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DKHocs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[HovaDem] [nvarchar](250) NULL,
	[Ten] [nvarchar](250) NULL,
	[GioiTinh] [int] NULL,
	[CCCD] [nvarchar](50) NULL,
	[DienThoai] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](250) NULL,
	[Email] [nvarchar](250) NULL,
	[MaSinhvien] [nvarchar](50) NULL,
	[KhoahocID] [nvarchar](50) NULL,
	[KhoaID] [nvarchar](50) NULL,
	[NganhID] [nvarchar](50) NULL,
	[LopID] [nvarchar](50) NULL,
	[CourseId] [int] NULL,
	[Hocphi] [int] NULL,
	[DaThanhtoan] [int] NULL,
	[NgayThanhtoan] [datetime] NULL,
	[TTGiaodich] [nvarchar](250) NULL,
	[NgayTao] [datetime] NULL,
	[NgaySua] [datetime] NULL,
	[Trangthai] [int] NULL,
	[Ghichu] [nvarchar](250) NULL,
	[guid] [nvarchar](250) NULL,
	[PaymentSuccess] [bit] NULL,
	[PaymentMethod] [nvarchar](250) NULL,
	[PaymentOrderDescription] [nvarchar](250) NULL,
	[PaymentOrderId] [nvarchar](250) NULL,
	[PaymentId] [nvarchar](250) NULL,
	[PaymentTransactionId] [nvarchar](250) NULL,
	[PaymentToken] [nvarchar](250) NULL,
	[VnPayResponseCode] [nvarchar](250) NULL,
 CONSTRAINT [PK_TiengAnh] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DMDantocs]    Script Date: 5/22/2025 8:59:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DMDantocs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_DMDantocs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DMTinhs]    Script Date: 5/22/2025 8:59:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DMTinhs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_DMTinhs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dotthis]    Script Date: 5/22/2025 8:59:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dotthis](
	[Id] [varchar](50) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[NgayThi] [varchar](50) NULL,
	[Phithi] [int] NULL,
	[PhiOn] [int] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Dotthis] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Khoahocs]    Script Date: 5/22/2025 8:59:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Khoahocs](
	[Id] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Khochocs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhoanThus]    Script Date: 5/22/2025 8:59:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhoanThus](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaLoaiKhoanThu] [nvarchar](50) NOT NULL,
	[KhoahocID] [nvarchar](50) NULL,
	[NganhID] [nvarchar](50) NULL,
	[KyThanhToan] [nvarchar](50) NULL,
	[SoTien] [float] NOT NULL,
 CONSTRAINT [PK_KhoanThus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Khoas]    Script Date: 5/22/2025 8:59:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Khoas](
	[Id] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Khoas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KyThanhtoans]    Script Date: 5/22/2025 8:59:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KyThanhtoans](
	[Id] [nvarchar](50) NOT NULL,
	[LoaiKhoanthu] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Trangthai] [int] NULL,
 CONSTRAINT [PK_KyThanhtoans] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiKhoanthus]    Script Date: 5/22/2025 8:59:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiKhoanthus](
	[MaLoaiKhoanThu] [nvarchar](50) NOT NULL,
	[MoTa] [nvarchar](250) NULL,
 CONSTRAINT [PK_LoaiKhoanthus] PRIMARY KEY CLUSTERED 
(
	[MaLoaiKhoanThu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiLophocs]    Script Date: 5/22/2025 8:59:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiLophocs](
	[Id] [nvarchar](50) NOT NULL,
	[TenLop] [nvarchar](250) NOT NULL,
	[Trangthai] [int] NOT NULL,
	[Guid] [nvarchar](250) NULL,
 CONSTRAINT [PK_LoaiLophocs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogModels]    Script Date: 5/22/2025 8:59:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogModels](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[Password] [nvarchar](max) NULL,
 CONSTRAINT [PK_LoginModels] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lophocs]    Script Date: 5/22/2025 8:59:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lophocs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LoaiLop] [nvarchar](50) NOT NULL,
	[TenLop] [nvarchar](50) NOT NULL,
	[Mota] [ntext] NOT NULL,
	[Chitiet] [ntext] NULL,
	[ImagePath] [nvarchar](500) NULL,
	[Hocphi] [int] NULL,
	[Trangthai] [int] NOT NULL,
	[QRActive] [bit] NULL,
	[VNPAYActive] [bit] NULL,
 CONSTRAINT [PK_Lophoc] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lops]    Script Date: 5/22/2025 8:59:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lops](
	[Id] [nvarchar](50) NOT NULL,
	[KhoaID] [nvarchar](50) NOT NULL,
	[KhoahocID] [nvarchar](50) NOT NULL,
	[NganhID] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Trangthai] [int] NULL,
 CONSTRAINT [PK_Lops] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nganhs]    Script Date: 5/22/2025 8:59:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nganhs](
	[Id] [nvarchar](50) NOT NULL,
	[KhoaId] [nvarchar](50) NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Nganhs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhongKTXs]    Script Date: 5/22/2025 8:59:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhongKTXs](
	[Id] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Trangthai] [int] NULL,
 CONSTRAINT [PK_PhongKTXs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RequestGachNos]    Script Date: 5/22/2025 8:59:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestGachNos](
	[requestId] [varchar](50) NOT NULL,
	[providerId] [varchar](50) NULL,
	[merchantId] [varchar](50) NULL,
	[primaryKeyId] [varchar](50) NULL,
	[custCode] [varchar](50) NULL,
	[custType] [varchar](50) NULL,
	[custName] [nvarchar](50) NULL,
	[address] [nvarchar](max) NULL,
	[birthday] [varchar](50) NULL,
	[phoneNo] [varchar](50) NULL,
	[idCard] [varchar](50) NULL,
	[addInfor1] [nvarchar](max) NULL,
	[addInfor2] [nvarchar](max) NULL,
	[addInfor3] [nvarchar](max) NULL,
	[addInfor4] [nvarchar](max) NULL,
	[addInfor5] [nvarchar](max) NULL,
	[bankTransactionId] [varchar](50) NULL,
	[responseCode] [varchar](50) NULL,
	[responseDesc] [nvarchar](max) NULL,
	[transTime] [varchar](50) NULL,
	[channel] [varchar](50) NULL,
	[signature] [varchar](max) NULL,
	[items] [nvarchar](max) NULL,
	[timeUpdate] [datetime] NULL,
 CONSTRAINT [PK_RequestGachNos] PRIMARY KEY CLUSTERED 
(
	[requestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RequestVanTins]    Script Date: 5/22/2025 8:59:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestVanTins](
	[requestId] [varchar](50) NOT NULL,
	[providerId] [varchar](50) NULL,
	[merchantId] [varchar](50) NULL,
	[custType] [varchar](50) NULL,
	[custCode] [varchar](50) NULL,
	[channel] [varchar](50) NULL,
	[signature] [varchar](max) NULL,
	[timeRequest] [varchar](50) NULL,
 CONSTRAINT [PK_RequestVanTins] PRIMARY KEY CLUSTERED 
(
	[requestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResponseGachNos]    Script Date: 5/22/2025 8:59:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResponseGachNos](
	[requestId] [varchar](50) NOT NULL,
	[providerId] [varchar](50) NULL,
	[merchantId] [varchar](50) NULL,
	[confirmTransactionId] [varchar](50) NULL,
	[transTime] [varchar](50) NULL,
	[responseCode] [varchar](50) NULL,
	[responseDesc] [nvarchar](max) NULL,
	[addInfo] [nvarchar](max) NULL,
	[signature] [varchar](max) NULL,
 CONSTRAINT [PK_ResponseGachNos] PRIMARY KEY CLUSTERED 
(
	[requestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResponseVanTins]    Script Date: 5/22/2025 8:59:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResponseVanTins](
	[requestId] [varchar](50) NOT NULL,
	[providerId] [varchar](50) NULL,
	[merchantId] [varchar](50) NULL,
	[transTime] [varchar](50) NULL,
	[custType] [varchar](50) NULL,
	[custCode] [varchar](50) NULL,
	[custName] [nvarchar](50) NULL,
	[address] [nvarchar](max) NULL,
	[birthday] [varchar](50) NULL,
	[addInfor1] [nvarchar](max) NULL,
	[addInfor2] [nvarchar](max) NULL,
	[addInfor3] [nvarchar](max) NULL,
	[responseCode] [varchar](50) NULL,
	[responseDesc] [nvarchar](max) NULL,
	[signature] [varchar](max) NULL,
	[primaryKeyId] [varchar](50) NULL,
	[responseTime] [varchar](50) NULL,
	[items] [nvarchar](max) NULL,
 CONSTRAINT [PK_ResponseVanTins] PRIMARY KEY CLUSTERED 
(
	[requestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sections]    Script Date: 5/22/2025 8:59:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sections](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
 CONSTRAINT [PK_Sections] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SinhvienPhongs]    Script Date: 5/22/2025 8:59:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SinhvienPhongs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PhongId] [varchar](50) NULL,
	[SinhvienId] [int] NULL,
	[Trangthai] [int] NULL,
 CONSTRAINT [PK_SinhvienPhongs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 5/22/2025 8:59:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaSV] [nvarchar](50) NOT NULL,
	[HoDem] [nvarchar](50) NOT NULL,
	[Ten] [nvarchar](50) NULL,
	[Ngaysinh] [nvarchar](50) NOT NULL,
	[KhoahocID] [nvarchar](50) NOT NULL,
	[KhoaID] [nvarchar](50) NOT NULL,
	[NganhID] [nvarchar](50) NOT NULL,
	[LopID] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](250) NULL,
	[DienThoai] [nvarchar](50) NULL,
	[CCCD] [nvarchar](50) NULL,
	[SoNH] [nvarchar](50) NULL,
	[SoTK] [nvarchar](50) NULL,
	[Doituong] [nvarchar](50) NULL,
	[Trangthai] [nvarchar](50) NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentStatuses]    Script Date: 5/22/2025 8:59:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentStatuses](
	[Id] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_StudentStatuses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TAICHINH_DuTruKP]    Script Date: 5/22/2025 8:59:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TAICHINH_DuTruKP](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MaNhom] [nvarchar](50) NULL,
	[MaMucChi] [int] NULL,
	[TenMucChi] [nvarchar](250) NULL,
	[DienGiai] [nvarchar](250) NULL,
	[SoTien] [bigint] NULL,
	[MaDonVi] [nvarchar](50) NULL,
	[Nam] [int] NULL,
	[NgayTao] [datetime] NULL,
	[NgaySua] [datetime] NULL,
 CONSTRAINT [PK_TAICHINH_DuTruKP] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TAICHINH_MucChi]    Script Date: 5/22/2025 8:59:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TAICHINH_MucChi](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenMuc] [nvarchar](250) NOT NULL,
	[NhomMuc] [nvarchar](50) NOT NULL,
	[DoiTuong] [int] NOT NULL,
	[MaTongHop] [int] NULL,
 CONSTRAINT [PK_TAICHINH_MucChi] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TAICHINH_NhomMuc]    Script Date: 5/22/2025 8:59:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TAICHINH_NhomMuc](
	[MaNhom] [nvarchar](50) NOT NULL,
	[TenNhom] [nvarchar](250) NULL,
 CONSTRAINT [PK_TAICHINH_NhomMuc] PRIMARY KEY CLUSTERED 
(
	[MaNhom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThuTiens]    Script Date: 5/22/2025 8:59:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThuTiens](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[SinhVienID] [int] NOT NULL,
	[LoaiKhoanthuID] [nvarchar](50) NULL,
	[KyThanhToan] [nvarchar](50) NULL,
	[SoTien] [float] NOT NULL,
	[NgayTao] [datetime2](7) NULL,
	[NgayThanhToan] [datetime2](7) NULL,
	[TrangThai] [int] NULL,
	[ThanhtoanReqId] [nvarchar](max) NULL,
 CONSTRAINT [PK_ThuTiens] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tin03_Trangthais]    Script Date: 5/22/2025 8:59:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tin03_Trangthais](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Tin03_Trangthais] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInfos]    Script Date: 5/22/2025 8:59:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfos](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[DisplayName] [nvarchar](max) NULL,
	[UserName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[LastLogin] [datetime2](7) NULL,
	[SessionKey] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserInfos] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[DangkyTH03s] ADD  CONSTRAINT [DF_DangkyTH03s_Trangthai]  DEFAULT ((-1)) FOR [Trangthai]
GO
ALTER TABLE [dbo].[DangkyTH03s] ADD  CONSTRAINT [DF_DangkyTH03s_DuDKThi]  DEFAULT ((0)) FOR [DuDKThi]
GO
ALTER TABLE [dbo].[DangkyTH03s] ADD  CONSTRAINT [DF_DangkyTH03s_Lock]  DEFAULT ((0)) FOR [Lock]
GO
ALTER TABLE [dbo].[Lops] ADD  CONSTRAINT [DF_Lops_Trangthai]  DEFAULT ((1)) FOR [Trangthai]
GO
ALTER TABLE [dbo].[TAICHINH_MucChi] ADD  CONSTRAINT [DF_TAICHINH_MucChi_DoiTuong]  DEFAULT ((0)) FOR [DoiTuong]
GO
ALTER TABLE [dbo].[Articles]  WITH CHECK ADD  CONSTRAINT [FK_Articles_Sections] FOREIGN KEY([SectionId])
REFERENCES [dbo].[Sections] ([Id])
GO
ALTER TABLE [dbo].[Articles] CHECK CONSTRAINT [FK_Articles_Sections]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Lophocs]  WITH CHECK ADD  CONSTRAINT [FK_Lophocs_LoaiLophocs] FOREIGN KEY([LoaiLop])
REFERENCES [dbo].[LoaiLophocs] ([Id])
GO
ALTER TABLE [dbo].[Lophocs] CHECK CONSTRAINT [FK_Lophocs_LoaiLophocs]
GO
USE [master]
GO
ALTER DATABASE [FLIC_190924] SET  READ_WRITE 
GO
