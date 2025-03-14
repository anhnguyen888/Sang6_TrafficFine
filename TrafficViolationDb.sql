USE [master]
GO
/****** Object:  Database [TrafficViolationDB]    Script Date: 14/03/2025 8:18:13 SA ******/
CREATE DATABASE [TrafficViolationDB]
 
GO
ALTER DATABASE [TrafficViolationDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TrafficViolationDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TrafficViolationDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TrafficViolationDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TrafficViolationDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TrafficViolationDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TrafficViolationDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TrafficViolationDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TrafficViolationDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TrafficViolationDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TrafficViolationDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TrafficViolationDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TrafficViolationDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TrafficViolationDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TrafficViolationDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TrafficViolationDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TrafficViolationDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TrafficViolationDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TrafficViolationDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TrafficViolationDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TrafficViolationDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TrafficViolationDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TrafficViolationDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [TrafficViolationDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TrafficViolationDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TrafficViolationDB] SET  MULTI_USER 
GO
ALTER DATABASE [TrafficViolationDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TrafficViolationDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TrafficViolationDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TrafficViolationDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TrafficViolationDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TrafficViolationDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TrafficViolationDB] SET QUERY_STORE = OFF
GO
USE [TrafficViolationDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 14/03/2025 8:18:13 SA ******/
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
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 14/03/2025 8:18:13 SA ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 14/03/2025 8:18:13 SA ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 14/03/2025 8:18:13 SA ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 14/03/2025 8:18:13 SA ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 14/03/2025 8:18:13 SA ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 14/03/2025 8:18:13 SA ******/
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
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[RegistrationDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 14/03/2025 8:18:13 SA ******/
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
/****** Object:  Table [dbo].[Vehicles]    Script Date: 14/03/2025 8:18:13 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicles](
	[VehicleID] [int] IDENTITY(1,1) NOT NULL,
	[LicensePlate] [nvarchar](20) NOT NULL,
	[OwnerName] [nvarchar](100) NOT NULL,
	[VehicleType] [nvarchar](50) NOT NULL,
	[RegistrationDate] [date] NOT NULL,
 CONSTRAINT [PK__Vehicles__476B54B23C011882] PRIMARY KEY CLUSTERED 
(
	[VehicleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Violations]    Script Date: 14/03/2025 8:18:13 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Violations](
	[ViolationID] [int] IDENTITY(1,1) NOT NULL,
	[VehicleID] [int] NOT NULL,
	[ViolationDate] [datetime] NOT NULL,
	[Location] [nvarchar](200) NOT NULL,
	[ViolationType] [nvarchar](255) NOT NULL,
	[FineAmount] [decimal](10, 2) NOT NULL,
	[IsPaid] [bit] NULL,
 CONSTRAINT [PK__Violatio__18B6DC289F2CEB85] PRIMARY KEY CLUSTERED 
(
	[ViolationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250307082254_AddIdentity', N'9.0.2')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250307083244_AddCustomUserFields', N'9.0.2')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250307083736_AddUserCustomProperties', N'9.0.2')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'7461d126-323e-4d00-876c-23f8dd9c8666', N'Admin', N'ADMIN', NULL)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'84c726e6-8ec4-4be1-9f42-525af31bae95', N'User', N'USER', NULL)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'ba07a0f5-4d47-466c-9581-26a3263cbd81', N'Manager', N'MANAGER', NULL)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2a8c1212-3637-497b-b04c-31b43fb0197e', N'7461d126-323e-4d00-876c-23f8dd9c8666')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a7eed7f4-073e-43c7-b273-b7642be8210f', N'84c726e6-8ec4-4be1-9f42-525af31bae95')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName], [RegistrationDate]) VALUES (N'2a8c1212-3637-497b-b04c-31b43fb0197e', N'admin@trafficfine.com', N'ADMIN@TRAFFICFINE.COM', N'admin@trafficfine.com', N'ADMIN@TRAFFICFINE.COM', 1, N'AQAAAAIAAYagAAAAEMNkYDGeuYOpSfX9GBmSKbMarWKeJjwRf0jKDKimN/+qBKsWF2YUpzS3nOHQezsvow==', N'RNVMWYKM2WI7ZELHJ2KCOHM6JPFADHBF', N'af8909dc-1104-4ff6-bb44-697f101aa46a', NULL, 0, 0, NULL, 1, 0, N'System', N'Administrator', CAST(N'2025-03-07T15:38:07.6047071' AS DateTime2))
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName], [RegistrationDate]) VALUES (N'a7eed7f4-073e-43c7-b273-b7642be8210f', N'nd.anh@hutech.edu.vn', N'ND.ANH@HUTECH.EDU.VN', N'nd.anh@hutech.edu.vn', N'ND.ANH@HUTECH.EDU.VN', 0, N'AQAAAAIAAYagAAAAEOTrR5MXNGym/SlQSrt3FjfwrBwy4RlsTY88aYDG5l11uOz9tOHdtWUjvEw9e56TXQ==', N'6FSEZMCXTWISEU3XH322T4TCGX3SQ3BJ', N'974a3863-5081-4046-a3cd-8970e5cc27c2', NULL, 0, 0, NULL, 1, 0, N'anhnguyen', N'anhnguyen', CAST(N'2025-03-07T15:38:50.5920302' AS DateTime2))
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 14/03/2025 8:18:13 SA ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 14/03/2025 8:18:13 SA ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 14/03/2025 8:18:13 SA ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 14/03/2025 8:18:13 SA ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 14/03/2025 8:18:13 SA ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 14/03/2025 8:18:13 SA ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 14/03/2025 8:18:13 SA ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Vehicles__026BC15CA00AA89E]    Script Date: 14/03/2025 8:18:13 SA ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ__Vehicles__026BC15CA00AA89E] ON [dbo].[Vehicles]
(
	[LicensePlate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Violations_VehicleID]    Script Date: 14/03/2025 8:18:13 SA ******/
CREATE NONCLUSTERED INDEX [IX_Violations_VehicleID] ON [dbo].[Violations]
(
	[VehicleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT (N'') FOR [FirstName]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT (N'') FOR [LastName]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [RegistrationDate]
GO
ALTER TABLE [dbo].[Violations] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsPaid]
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
ALTER TABLE [dbo].[Violations]  WITH CHECK ADD  CONSTRAINT [FK_Vehicle_Violation] FOREIGN KEY([VehicleID])
REFERENCES [dbo].[Vehicles] ([VehicleID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Violations] CHECK CONSTRAINT [FK_Vehicle_Violation]
GO
USE [master]
GO
ALTER DATABASE [TrafficViolationDB] SET  READ_WRITE 
GO
