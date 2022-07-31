----


CREATE TABLE [dbo].[tblRole](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

Insert into tblRole values('Admin')
Insert into tblRole values('Manager')
Insert into tblRole values('Employee')
select * from tblRole
------------------------------------

---------------------------- Admin table for Login process 
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblAdmin](
	[UserName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Pass] [nvarchar](50) NULL,
	[RoleID] [int] NULL
) ON [PRIMARY]

GO
---------------------------------

-------------------------tblUser 

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblUser](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[city] [nvarchar](50) NULL,
	[Dist] [nvarchar](50) NULL,
	[status] [nvarchar](50) NULL,
	[question] [nvarchar](500) NULL,
	[Ans] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-------------------------------------------
--------------------ContactMe table
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblcontactme](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[messagetxt] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
---------

--------------------- Designation
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblDesignation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Designation] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
---------------------




-----------------------stored procedure for Login

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[usp_UsersCheckLoginDetails]
(
@UserName	nvarchar(50),
@Password	nvarchar(50)
)
AS
BEGIN
   SET NOCOUNT ON
   Select a.UserName,a.Email,a.Pass,b.RoleName from tblAdmin a with(nolock)
   inner join tblRole b on a.RoleID=b.RoleID 
    WHERE [Email]=@UserName AND [Pass] = @Password   
   
END
GO

--------

select * from tblAdmin

-----------------

USE [Payroll]
GO

/****** Object:  Table [dbo].[addemployee]    Script Date: 06/16/2021 21:14:34 ******/

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[addemployee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Designation] int NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Fathername] [varchar](50) NOT NULL,
	[DOB] [varchar](50) NOT NULL,
	[Address] [varchar](150) NOT NULL,
	[MobileNo] [numeric](18, 0) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[BasicSalary] decimal(18,2) NOT NULL,
	[DOJ] [varchar](50) NOT NULL,
 CONSTRAINT [PK_add employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


----------------------
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[admin](
	[Username] [nchar](20) NOT NULL,
	[Password] [nchar](20) NOT NULL
) ON [PRIMARY]

GO


-------------------------Create a new table----------

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[DesignationSalaries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Designation] [varchar](20) NOT NULL,
	[BasicSalary] [int] NOT NULL,
	[SalaryPerDay] [int] NOT NULL,
	[HRA] [varchar](20) NOT NULL,
	[DA] [varchar](20) NOT NULL,
	[TA] [varchar](20) NOT NULL,
	[MA] [varchar](20) NOT NULL,
	[ProffesionalFund] [varchar](20) NOT NULL,
	[FoodAllowance] [varchar](20) NOT NULL,
	[NoOfLeaves] [int] NOT NULL,
	[Earnings] [int] NOT NULL,
	[Deductions] [int] NOT NULL,
	[NetSalary] [int] NOT NULL,
 CONSTRAINT [PK_DesignationSalaries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

---------------------

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[payslip](
	[PaySlipId] [int] NOT NULL,
	[EmpId] [int] NOT NULL,
	[Month] [varchar](10) NOT NULL,
	[Year] [varchar](10) NOT NULL,
	[NoOfWorkingDays] [int] NOT NULL,
	[GeneratedDate] [varchar](10) NOT NULL,
	[BasicSalary] [int] NOT NULL,
	[SalaryPerDay] [int] NOT NULL,
	[Earnings] [int] NOT NULL,
	[NoOfLeaves] [int] NOT NULL,
	[Deductions] [int] NOT NULL,
	[NetSalary] [int] NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO



---------------------------
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[registration](
	[Id] [int] NOT NULL,
	[Name] [nchar](30) NOT NULL,
	[Gender] [nchar](10) NOT NULL,
	[DOB] [nchar](20) NOT NULL,
	[Email] [nchar](30) NOT NULL,
	[Mobile] [numeric](18, 0) NOT NULL,
	[Address] [nchar](150) NOT NULL,
	[Password] [nchar](20) NOT NULL,
	[Cpassword] [nchar](20) NOT NULL
) ON [PRIMARY]

GO

------------------


create procedure spInsertEmp
(
@Name varchar(50),
@Designation int,@Username varchar(50),
@Password varchar(50),@Fathername varchar(50),
@DOB varchar(50),@Address varchar(150),@MobileNo numeric(18,0),
@Email varchar(50),@BasicSalary decimal(18,2),@DOJ varchar(50)
)
as
begin


insert into dbo.addemployee(Name,
Designation,
Username,
Password,Fathername,DOB,
Address,MobileNo,Email,
BasicSalary,DOJ)
values(@Name,@Designation,@Username,@Password,@Fathername,@DOB,
@Address,@MobileNo,@Email,@BasicSalary,@DOJ)
end
go
-------------------




-----------------------------------------Create a new table----------


truncate table DesignationSalaries

CREATE TABLE [dbo].[DesignationSalaries]
(
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] int NOT NULL,
	[Designation] [int] NOT NULL,
	[BasicSalary] decimal(18,2) NOT NULL,
	[SalaryPerDay] decimal(18,2) NOT NULL,
	[HRA] decimal(18,2) NOT NULL,
	[DA] decimal(18,2) NOT NULL,
	[TA] decimal(18,2) NOT NULL,
	[MA] decimal(18,2) NOT NULL,
	[ProffesionalFund] decimal(18,2) NOT NULL,
	[FoodAllowance] decimal(18,2) NOT NULL,
	[NoOfLeaves] decimal(18,2) NOT NULL,
	[Earnings] decimal(18,2) NOT NULL,
	[Deductions] decimal(18,2) NOT NULL,
	[NetSalary] decimal(18,2) NOT NULL,
	[Month] nvarchar(20),
	[Year] nvarchar(20),
	CreatedBy nvarchar(50),
	CreatedDate datetime
)
	------------------------------
	select * from tblDesignation
	select * from addemployee
	select BasicSalary from addemployee where Id=@ID
	select * from DesignationSalaries
	select distinct ID,Name from addemployee 
	
	
	insert into DesignationSalaries(Name,Designation,BasicSalary,SalaryPerDay,HRA,DA,TA,MA,ProffesionalFund,FoodAllowance,NoOfLeaves,Earnings,Deductions,NetSalary,CreatedBy,CreatedDate) values(@Name,@Designation,@BasicSalary,@SalaryPerDay,@HRA,@DA,@TA,@MA,@ProffesionalFund,@FoodAllowance,@NoOfLeaves,@Earnings,@Deductions,NetSalary,@CreatedBy,GETDATE())